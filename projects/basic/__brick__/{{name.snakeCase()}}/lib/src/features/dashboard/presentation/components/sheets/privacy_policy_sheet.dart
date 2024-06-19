import 'package:{{name.snakeCase()}}/imports_bindings.dart';

class PrivacyPolicySheet extends StatelessWidget {
  const PrivacyPolicySheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: AppStyles.text16Px.interSemiBold,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          Text(
            'This privacy policy applies to the {{name.titleCase()}}! app (hereby referred to as "Application") for mobile devices that was created by Fegno (hereby referred to as "Service Provider") as a Free service. This service is intended for use "AS IS".',
            style: AppStyles.text12Px.interRegular,
          ),
          ...[
            (
              heading: 'Information Collection and Use',
              content: '''
The Application collects information when you download and use it. This information may include information such as

The Service Provider may use the information you provided to contact you from time to time to provide you with important information, required notices and marketing promotions.

For a better experience, while using the Application, the Service Provider may require you to provide us with certain personally identifiable information. The information that the Service Provider request will be retained by them and used as described in this privacy policy.'''
            ),
            (
              heading: 'Third Party Access',
              content: '''
Only aggregated, anonymized data is periodically transmitted to external services to aid the Service Provider in improving the Application and their service. The Service Provider may share your information with third parties in the ways that are described in this privacy statement.

Please note that the Application utilizes third-party services that have their own Privacy Policy about handling data. Below are the links to the Privacy Policy of the third-party service providers used by the Application:'''
            ),
            (
              heading: 'Opt-Out Rights',
              content:
                  'You can stop all collection of information by the Application easily by uninstalling it. You may use the standard uninstall processes as may be available as part of your mobile device or via the mobile application marketplace or network.'
            ),
            (heading: 'Data Retention Policy', content: ''),
            (
              heading: 'Children',
              content: '''
The Service Provider does not use the Application to knowingly solicit data from or market to children under the age of 13.

The Application does not address anyone under the age of 13. The Service Provider does not knowingly collect personally identifiable information from children under 13 years of age. In the case the Service Provider discover that a child under 13 has provided personal information, the Service Provider will immediately delete this from their servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact the Service Provider (hr@fegno@gmail.com) so that they will be able to take the necessary actions.
'''
            ),
            (
              heading: 'Security',
              content:
                  'The Service Provider is concerned about safeguarding the confidentiality of your information. The Service Provider provides physical, electronic, and procedural safeguards to protect information the Service Provider processes and maintains.'
            ),
            (
              heading: 'Changes',
              content: '''
This Privacy Policy may be updated from time to time for any reason. The Service Provider will notify you of any changes to the Privacy Policy by updating this page with the new Privacy Policy. You are advised to consult this Privacy Policy regularly for any changes, as continued use is deemed approval of all changes.

This privacy policy is effective as of 2024-03-18
'''
            ),
            (heading: 'Your Consent', content: 'By using the Application, you are consenting to the processing of your information as set forth in this Privacy Policy now and as amended by us.'),
            (
              heading: 'Contact Us',
              content:
                  'If you have any questions regarding privacy while using the Application, or have questions about the practices, please contact the Service Provider via email at hr@fegno@gmail.com.'
            ),
          ].map(
            (e) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.heading,
                    style: AppStyles.text14Px.interSemiBold,
                  ).pOnly(top: 8.r, bottom: 4.r),
                  Text(
                    e.content,
                    style: AppStyles.text12Px.interRegular,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
