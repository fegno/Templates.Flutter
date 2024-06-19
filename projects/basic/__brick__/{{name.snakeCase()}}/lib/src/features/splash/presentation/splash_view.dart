import 'package:{{name.snakeCase()}}/imports_bindings.dart';
import 'package:{{name.snakeCase()}}/src/features/splash/cubit/splash_cubit.dart';

///
class SplashView extends StatefulWidget {
  ///
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late final StreamSubscription<InternetConnectionStatus> _connectionSubscription;
  late final SplashCubit cubit;

  @override
  void initState() {
    cubit = context.read<SplashCubit>();
    cubit.init();
    _connectionSubscription = InternetConnectionChecker().onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.disconnected) {
        return;
      }
      cubit.init();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '{{name.title()}}!',
              style: AppStyles.text24Px.interBold,
            ).pOnly(bottom: 16.r),
            Center(
              child: SizedBox.square(
                dimension: 16,
                child: CircularProgressIndicator(
                  color: context.color,
                  strokeWidth: 1,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: StreamBuilder(
        stream: InternetConnectionChecker().onStatusChange,
        builder: (context, snapshot) {
          if (snapshot.data == InternetConnectionStatus.disconnected) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: ColoredBox(
                color: context.color,
                child: SizedBox(
                  width: double.maxFinite,
                  height: 32,
                  child: Text(
                    'No connection available!',
                    style: AppStyles.text14Px.interMedium.kcolor(AppColors.error),
                  ).pOnly(left: 16.r).align(Alignment.centerLeft),
                ),
              ),
            ).pad(16.r);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  @override
  void dispose() {
    _connectionSubscription.cancel();
    super.dispose();
  }
}
