import 'package:{{name.snakeCase()}}/imports_bindings.dart';

class ThemeDialog extends StatefulWidget {
  const ThemeDialog({super.key});

  @override
  State<ThemeDialog> createState() => _ThemeDialogState();
}

class _ThemeDialogState extends State<ThemeDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Themes',
            style: AppStyles.text14Px.interBold,
          ).pOnly(bottom: 16.r),
          BlocBuilder<AppCubit, AppState>(
            buildWhen: (p, c) => p.themeMode != c.themeMode,
            builder: (context, state) {
              return ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemCount: 2,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (BuildContext context, int index) {
                  final data = switch (index) {
                    0 => (title: 'Light', icon: Icons.light_mode, theme: ThemeMode.light),
                    _ => (title: 'Dark', icon: Icons.dark_mode, theme: ThemeMode.dark),
                  };
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () => context.read<AppCubit>().changeThemeMode(data.theme),
                    leading: Icon(data.icon),
                    title: Text(data.title),
                    titleTextStyle: AppStyles.text14Px.interBold.kcolor(context.color),
                    trailing: switch (state.themeMode == data.theme) {
                      true => const Icon(Icons.done),
                      _ => null,
                    },
                  );
                },
              );
            },
          ),
        ],
      ).pxy(x: 28.r, y: 24.r),
    );
  }
}
