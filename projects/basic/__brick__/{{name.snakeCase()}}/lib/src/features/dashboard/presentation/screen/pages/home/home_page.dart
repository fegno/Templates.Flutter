import 'package:{{name.snakeCase()}}/core/widgets/error/error_widget.dart';
import 'package:{{name.snakeCase()}}/imports_bindings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    fetch();
    super.initState();
  }

  Future<void> fetch() async => context.read<HomeCubit>().fetchHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (p, c) => p.data != c.data,
        builder: (context, state) {
          return state.data.fold(
            () => Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: context.color,
              ),
            ),
            (t) => t.fold(
              (l) => l.maybeWhen(
                network: (_) => ErrorUi.network(onTap: fetch),
                notFound: (_) => ErrorUi.notFound(onTap: fetch),
                orElse: () => ErrorUi.server(onTap: fetch),
              ),
              (r) => ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ...?r.content?.map(
                    (e) {
                      if (e.content?.isEmpty ?? true) {
                        return const SizedBox.shrink();
                      }
                      return switch (e.model) {
                        'icons' => _icon(e),
                        'banner_tiles' => _banner(e),
                        'rectangle_tiles' => _nearestPopularFitnessCentres(e),
                        _ => const SizedBox.shrink(),
                      };
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ).pad(16),
    );
  }

  SizedBox _banner(HomeEntityContent e) {
    return SizedBox(
      height: 300,
      width: double.maxFinite,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: e.content?.length ?? 0,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (__, _) {
          return SizedBox(
            height: 300,
            width: context.width * 0.8,
            child: Column(
              children: [
                ImageNetwork(e.content?[_].logo ?? '').pOnly(bottom: 8),
                Text(
                  e.content?[_].name ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.text12Px.interMedium,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _nearestPopularFitnessCentres(HomeEntityContent e) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: SizedBox(
                width: double.maxFinite,
                child: Text(
                  'Popular fitness centres near you',
                  style: AppStyles.text16Px.interSemiBold,
                ),
              ),
            ),
            Text(
              'View All',
              style: AppStyles.text12Px.interMedium.error,
            ).pOnly(left: 8),
          ],
        ).pOnly(bottom: 12),
        SizedBox(
          height: 300,
          width: double.maxFinite,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: e.content?.length ?? 0,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (__, _) {
              return SizedBox(
                height: 300,
                width: context.width * 0.8,
                child: Column(
                  children: [
                    ImageNetwork(e.content?[_].logo ?? '').pOnly(bottom: 8),
                    Text(
                      e.content?[_].name ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.text12Px.interMedium,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ).pOnly(bottom: 16);
  }

  Widget _icon(HomeEntityContent e) {
    return SizedBox(
      height: 72,
      width: double.maxFinite,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: e.content?.length ?? 0,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (__, _) {
          return SizedBox.square(
            dimension: 48,
            child: Column(
              children: [
                ImageNetwork(e.content?[_].logo ?? '').pOnly(bottom: 8),
                Text(
                  e.content?[_].name ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.text12Px.interMedium,
                ),
              ],
            ),
          );
        },
      ),
    ).pOnly(bottom: 16);
  }
}
