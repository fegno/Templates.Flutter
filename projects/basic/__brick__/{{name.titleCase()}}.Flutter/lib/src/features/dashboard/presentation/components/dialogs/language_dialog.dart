import 'package:{{name.snakeCase()}}/imports_bindings.dart';

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({super.key});

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Languages',
            style: AppStyles.text14Px.interBold,
          ).pOnly(bottom: 16.r),
          BlocBuilder<AppCubit, AppState>(
            buildWhen: (p, c) => p.locale != c.locale,
            builder: (context, state) {
              return ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemCount: AppLocalizations.supportedLocales.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (BuildContext context, int index) {
                  final data = AppLocalizations.supportedLocales[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () => context.read<AppCubit>().changeLocale(data),
                    leading: AbsorbPointer(child: Radio(value: data, groupValue: state.locale, onChanged: (_) {})),
                    title: Text(
                      switch (data.languageCode) {
                        'en' => 'English',
                        'es' => 'Spanish',
                        _ => '',
                      },
                    ),
                    titleTextStyle: AppStyles.text14Px.interBold.kcolor(context.color),
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
