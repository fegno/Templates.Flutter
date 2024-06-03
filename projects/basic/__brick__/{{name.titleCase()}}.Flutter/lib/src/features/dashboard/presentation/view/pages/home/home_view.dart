import 'package:{{name.snakeCase()}}/core/core.dart';
import 'package:{{name.snakeCase()}}/imports_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<HomeCubit>().fetchHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (p, c) => p.isLoading != c.isLoading,
        builder: (context, state) {
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: context.color,
              ),
            );
          }
          if (!state.isLoading && state.homeEntity == null) {
            return Center(
              child: ElevatedButton(
                onPressed: context.read<HomeCubit>().fetchHome,
                child: const Text('Retry'),
              ),
            );
          }
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ...?state.homeEntity?.content?.map(
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
