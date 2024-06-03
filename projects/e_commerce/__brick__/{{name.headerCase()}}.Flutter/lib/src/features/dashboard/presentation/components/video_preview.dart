import 'package:{{name.snakeCase()}}/core/services/files/video_services.dart';
import 'package:{{name.snakeCase()}}/imports_bindings.dart';

class VideoPreview extends StatefulWidget {
  const VideoPreview({
    super.key,
    required this.path,
  });
  final String path;

  @override
  State<VideoPreview> createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  String? thumbnailPath;

  @override
  void initState() {
    VideoServices().getThumbnail(widget.path).then((e) {
      setState(() {
        thumbnailPath = e;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (thumbnailPath == null) {
      return const Icon(Icons.info);
    }
    return Image.file(
      File(thumbnailPath!),
      fit: BoxFit.cover,
      height: 42,
      width: 42,
    );
  }
}
