import 'package:{{name.snakeCase()}}/imports_bindings.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.width * 0.5,
      shape: const RoundedRectangleBorder(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<AppCubit, AppState>(
            buildWhen: (p, c) => p.themeMode != c.themeMode,
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  context.read<AppCubit>().changeThemeMode(
                        switch (state.themeMode) {
                          ThemeMode.dark => ThemeMode.light,
                          _ => ThemeMode.dark,
                        },
                      );
                },
                icon: Icon(
                  switch (state.themeMode) {
                    ThemeMode.dark => Icons.light_mode,
                    _ => Icons.dark_mode,
                  },
                ),
              );
            },
          ).align(Alignment.bottomRight),
          InkWell(
            onTap: () {
              final bloc = context.read<DashboardCubit>();
              if (bloc.state.navIndex != 2) {
                bloc.changeNav(index: 2);
              }
              context.pop();
            },
            child: CircleAvatar(
              backgroundColor: IconTheme.of(context).color,
              radius: 32.r,
              child: Text(
                'F',
                style: AppStyles.text24Px.interBold.copyWith(color: Theme.of(context).scaffoldBackgroundColor),
              ),
            ).pOnly(bottom: 8.r),
          ),
          Text(
            'Fegnite',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.text16Px.interBold,
          ),
          Text(
            '+91 0987654321',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.text12Px.interSemiBold,
          ),
          const Spacer(),
          BlocBuilder<AppCubit, AppState>(
            buildWhen: (p, c) => p.locale != c.locale,
            builder: (context, state) {
              return DropdownButton(
                value: state.locale,
                underline: const SizedBox.shrink(),
                items: [
                  ...AppLocalizations.supportedLocales.map(
                    (i) {
                      return DropdownMenuItem(
                        value: i,
                        child: Text(
                          switch (i.languageCode) {
                            'en' => 'English',
                            'es' => 'Spanish',
                            _ => '',
                          },
                        ),
                      );
                    },
                  ),
                ],
                onChanged: (_) {
                  context.read<AppCubit>().changeLocale(_!);
                },
              );
            },
          ).align(Alignment.bottomLeft),
          IconButton(
            onPressed: context.read<AuthCubit>().logout,
            icon: const Icon(Icons.logout),
          ).align(Alignment.bottomLeft),
          Text(
            '$whichEnv $version',
            style: AppStyles.text12Px.interSemiBold,
          ).pOnly(top: 16).align(Alignment.bottomCenter),
        ],
      ).pad(16),
    );
  }
}
