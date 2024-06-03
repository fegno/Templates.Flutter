import 'package:{{name.snakeCase()}}/imports_bindings.dart';

class TermsAndConditionsSheet extends StatelessWidget {
  const TermsAndConditionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms and Conditions',
          style: AppStyles.text16Px.interSemiBold,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          Text(
            '''
Welcome to {{name.snakeCase()}}!

These terms and conditions outline the rules and regulations for the use of Fegno's Website, located at www.fegno.com.

By accessing this website we assume you accept these terms and conditions. Do not continue to use {{name.snakeCase()}} if you do not agree to take all of the terms and conditions stated on this page.

The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: "Client", "You" and "Your" refers to you, the person log on this website and compliant to the Company's terms and conditions. "The Company", "Ourselves", "We", "Our" and "Us", refers to our Company. "Party", "Parties", or "Us", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client's needs in respect of provision of the Company's stated services, in accordance with and subject to, prevailing law of af. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.''',
            style: AppStyles.text12Px.interRegular,
          ),
          ...[
            (
              heading: 'Cookies',
              content: '''
We employ the use of cookies. By accessing {{name.snakeCase()}}, you agreed to use cookies in agreement with the Fegno's Privacy Policy. 

Most interactive websites use cookies to let us retrieve the user's details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.'''
            ),
            (
              heading: 'License',
              content: '''
Unless otherwise stated, Fegno and/or its licensors own the intellectual property rights for all material on {{name.snakeCase()}}. All intellectual property rights are reserved. You may access this from {{name.snakeCase()}} for your own personal use subjected to restrictions set in these terms and conditions.

This Agreement shall begin on the date hereof. Our Terms and Conditions were created with the help of the Free Terms and Conditions Generator.

Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. Fegno does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of Fegno,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, Fegno shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.

Fegno reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.

You hereby grant Fegno a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.'''
            ),
            (
              heading: 'Hyperlinking to our Content',
              content: '''
The following organizations may link to our Website without prior written approval:

These organizations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party's site.

We may consider and approve other link requests from the following types of organizations:

We will approve link requests from these organizations if we decide that: (a) the link would not make us look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of Fegno; and (d) the link is in the context of general resource information.

These organizations may link to our home page so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party's site.

If you are one of the organizations listed in paragraph 2 above and are interested in linking to our website, you must inform us by sending an e-mail to Fegno. Please include your name, your organization name, contact information as well as the URL of your site, a list of any URLs from which you intend to link to our Website, and a list of the URLs on our site to which you would like to link. Wait 2-3 weeks for a response.

Approved organizations may hyperlink to our Website as follows:

No use of Fegno's logo or other artwork will be allowed for linking absent a trademark license agreement.'''
            ),
            (
              heading: 'iFrames',
              content: '''
Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.'''
            ),
            (
              heading: 'Content Liability',
              content: '''
We shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.'''
            ),
            (
              heading: 'Reservation of Rights',
              content: '''
We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it's linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.'''
            ),
            (
              heading: 'Removal of links from our website',
              content: '''
If you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.

We do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.'''
            ),
            (
              heading: 'Disclaimer',
              content: '''
To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:

The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.

As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.'''
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
