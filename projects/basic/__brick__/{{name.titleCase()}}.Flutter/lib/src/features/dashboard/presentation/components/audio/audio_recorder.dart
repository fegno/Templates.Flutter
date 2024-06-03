import 'package:{{name.snakeCase()}}/imports_bindings.dart';

class Recorder extends StatefulWidget {
  const Recorder({super.key, required this.onStop});
  final void Function(String path) onStop;

  @override
  State<Recorder> createState() => _RecorderState();
}

class _RecorderState extends State<Recorder> with AudioRecorderMixin {
  int _recordDuration = 0;
  Timer? _timer;
  late final AudioRecorder _audioRecorder;
  StreamSubscription<RecordState>? _recordSub;
  RecordState _recordState = RecordState.stop;
  StreamSubscription<Amplitude>? _amplitudeSub;

  @override
  void initState() {
    _audioRecorder = AudioRecorder();

    _recordSub = _audioRecorder.onStateChanged().listen(_updateRecordState);

    _amplitudeSub = _audioRecorder.onAmplitudeChanged(const Duration(milliseconds: 300)).listen((amp) {});

    super.initState();
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        const encoder = AudioEncoder.aacLc;

        if (!await _isEncoderSupported(encoder)) {
          return;
        }

        final devs = await _audioRecorder.listInputDevices();
        write(devs.toString());

        const config = RecordConfig(numChannels: 1);

        // Record to file
        await recordFile(_audioRecorder, config);

        // Record to stream
        // await recordStream(_audioRecorder, config);

        _recordDuration = 0;

        _startTimer();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _stop() async {
    final path = await _audioRecorder.stop();

    if (path != null) {
      widget.onStop(path);

      downloadWebData(path);
    }
  }

  Future<void> _pause() => _audioRecorder.pause();

  Future<void> _resume() => _audioRecorder.resume();

  void _updateRecordState(RecordState recordState) {
    setState(() => _recordState = recordState);

    switch (recordState) {
      case RecordState.pause:
        _timer?.cancel();
      case RecordState.record:
        _startTimer();
      case RecordState.stop:
        _timer?.cancel();
        _recordDuration = 0;
    }
  }

  Future<bool> _isEncoderSupported(AudioEncoder encoder) async {
    final isSupported = await _audioRecorder.isEncoderSupported(
      encoder,
    );

    if (!isSupported) {
      write('${encoder.name} is not supported on this platform.');
      write('Supported encoders are:');

      for (final e in AudioEncoder.values) {
        if (await _audioRecorder.isEncoderSupported(e)) {
          write('- ${encoder.name}');
        }
      }
    }

    return isSupported;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildText(),
        const Spacer(),
        _buildRecordStopControl(),
        _buildPauseResumeControl(),
      ],
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _recordSub?.cancel();
    _amplitudeSub?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  Widget _buildRecordStopControl() {
    late final IconData icon;

    if (_recordState != RecordState.stop) {
      icon = Icons.stop;
    } else {
      icon = Icons.mic;
    }

    return IconButton.filled(
      icon: Icon(icon),
      onPressed: () {
        (_recordState != RecordState.stop) ? _stop() : _start();
      },
    );
  }

  Widget _buildPauseResumeControl() {
    if (_recordState == RecordState.stop) {
      return const SizedBox.shrink();
    }

    late IconData icon;

    if (_recordState == RecordState.record) {
      icon = Icons.pause;
    } else {
      icon = Icons.play_arrow;
    }

    return IconButton.filled(
      onPressed: () {
        (_recordState == RecordState.pause) ? _resume() : _pause();
      },
      icon: Icon(icon),
    ).pOnly(left: 8);
  }

  Widget _buildText() {
    if (_recordState != RecordState.stop) {
      return _buildTimer();
    }
    return const Text('Please record');
  }

  Widget _buildTimer() {
    final minutes = _formatNumber(_recordDuration ~/ 60);
    final seconds = _formatNumber(_recordDuration % 60);

    return Text(
      '$minutes : $seconds',
    ).pOnly(left: 8, right: 8);
  }

  String _formatNumber(int number) {
    var numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });
  }
}
