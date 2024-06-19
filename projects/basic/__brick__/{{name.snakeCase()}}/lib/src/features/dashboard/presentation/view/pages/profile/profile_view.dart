import 'package:{{name.snakeCase()}}/imports_bindings.dart';
import 'package:in_app_review/in_app_review.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late final List<({String subTitle, String title})> _accDetails;
  late final List<({IconData icon, String title, void Function() onTap})> _settings;
  late final List<({IconData icon, String title, void Function() onTap})> _others;

  @override
  void initState() {
    _accDetails = [
      (title: '+91 0987654321', subTitle: 'Tap to change number'),
      (title: 'Fegno', subTitle: 'Tap to change company name'),
      (title: 'Busy!', subTitle: 'Tap to change Bio'),
    ];
    _settings = [
      (
        title: 'Notifications',
        icon: Icons.notifications_active_outlined,
        onTap: () {},
      ),
      (
        title: 'Theme',
        icon: Icons.color_lens_outlined,
        onTap: () => showDialog<Widget>(context: context, builder: (_) => const ThemeDialog()),
      ),
      (
        title: 'Language',
        icon: Icons.language_outlined,
        onTap: () => showDialog<Widget>(context: context, builder: (_) => const LanguageDialog()),
      ),
    ];
    _others = [
      (
        title: 'Rate the app',
        icon: Icons.star_border,
        onTap: () {
          InAppReview.instance.isAvailable().then((_) {
            write('can app review : $_');
            if (_) {
              InAppReview.instance.requestReview();
            } else {
              Dialogs.showSnack();
            }
          });
        },
      ),
      (
        title: 'Privacy policy',
        icon: Icons.privacy_tip_outlined,
        onTap: () => context.push(const PrivacyPolicySheet()),
      ),
      (
        title: 'Help & Support',
        icon: Icons.help_outline_rounded,
        onTap: () {},
      ),
      (
        title: 'Terms & Condition',
        icon: Icons.description_outlined,
        onTap: () => context.push(const TermsAndConditionsSheet()),
      ),
      (
        title: 'About us',
        icon: Icons.groups_2_outlined,
        onTap: () => launchUrl(Uri.parse('https://www.fegno.com/about-us/')),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          CircularPercentIndicator(
            radius: 56.r,
            lineWidth: 8.r,
            animation: true,
            percent: 0.1,
            backgroundColor: context.color.withOpacity(0.2),
            center: CircleAvatar(
              backgroundColor: IconTheme.of(context).color,
              radius: 40.r,
              child: Text(
                'F',
                style: AppStyles.text32Px.interBold.copyWith(color: Theme.of(context).scaffoldBackgroundColor),
              ),
            ),
            footer: Text(
              'Fegnite',
              style: AppStyles.text24Px.interBold,
            ).pxy(y: 8.r),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: context.color,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: ColoredBox(
              color: context.color.withOpacity(0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Account',
                        style: AppStyles.text14Px.interBold,
                      ),
                      TextButton(
                        onPressed: () => context.push(const UpdateProfileSheet()),
                        child: Text(
                          'Update',
                          style: AppStyles.text12Px.interRegular,
                        ),
                      ),
                    ],
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: _accDetails.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      final data = _accDetails[index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: () {},
                        title: Text(data.title),
                        titleTextStyle: AppStyles.text14Px.interBold.kcolor(context.color),
                        subtitle: Text(data.subTitle),
                      );
                    },
                  ),
                ],
              ).pad(16.r),
            ),
          ).pxy(y: 16.r),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: ColoredBox(
              color: context.color.withOpacity(0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Settings',
                    style: AppStyles.text14Px.interBold,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: _settings.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      final data = _settings[index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: data.onTap,
                        leading: Icon(data.icon),
                        title: Text(data.title),
                        titleTextStyle: AppStyles.text14Px.interBold.kcolor(context.color),
                      );
                    },
                  ),
                ],
              ).pad(16.r),
            ),
          ).pOnly(bottom: 16.r),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: ColoredBox(
              color: context.color.withOpacity(0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Others',
                    style: AppStyles.text14Px.interBold,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: _others.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      final data = _others[index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: data.onTap,
                        leading: Icon(data.icon),
                        title: Text(data.title),
                        titleTextStyle: AppStyles.text14Px.interBold.kcolor(context.color),
                      );
                    },
                  ),
                ],
              ).pad(16.r),
            ),
          ).pOnly(bottom: 16.r),
        ],
      ),
    );
  }
}
