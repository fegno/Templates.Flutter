import 'package:{{name.snakeCase()}}/imports_bindings.dart';

///* This is the login screen, We can login with email or mobile number and password
class LoginView extends StatefulWidget {
  ///*
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController _phoneController;
  late final GlobalKey<FormFieldState<String?>> _phoneKey;

  @override
  void initState() {
    _phoneController = TextEditingController();
    _phoneKey = GlobalKey<FormFieldState<String?>>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: KeyboardVisibilityBuilder(
            builder: (context, isKeyboardVisible) {
              return _createBody(isKeyboardVisible);
            },
          ),
        ),
      ),
    );
  }

  //Create body :- This is the body part of this screen, It will call in Scaffold(body).
  Widget _createBody(bool isKeyboardVisible) {
    return Column(
      children: [
        const Spacer(),
        _welcomeTextWidget(),
        const Spacer(),
        Visibility(
          visible: !isKeyboardVisible,
          child: _imageWidget(),
        ),
        const Spacer(),
        _loginOrRegisterWidget(),
        const Spacer(),
        _phoneField().pOnly(bottom: 16.r),
        _loginButton(),
        const Spacer(flex: 6),
        _privacyPolicyTermsAndCondionText(),
      ],
    ).pad(16.r);
  }

  //* Welcome text widget
  Widget _welcomeTextWidget() {
    return Center(
      child: Text(
        context.lang.welcome,
        style: AppStyles.text24Px.interMedium,
      ),
    );
  }

  //* Image widget :- This image is using in this screen.
  Widget _imageWidget() {
    return Center(
      child: SvgPicture.asset(
        AssetHelpers.loginImg,
        width: 256.w,
        height: 200.h,
      ),
    );
  }

  //* Login or Register widget :- This widget is used bottom of the image
  Widget _loginOrRegisterWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: SizedBox(
            height: .5,
            width: double.maxFinite,
            child: ColoredBox(
              color: Theme.of(context).iconTheme.color!,
            ),
          ),
        ),
        Text(
          context.lang.loginOrRegister,
          style: AppStyles.text14Px.interRegular,
        ).pxy(x: 8.r),
        Flexible(
          child: SizedBox(
            height: .5,
            width: double.maxFinite,
            child: ColoredBox(
              color: Theme.of(context).iconTheme.color!,
            ),
          ),
        ),
      ],
    );
  }

  //* Phonenumber text field widget.
  Widget _phoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.lang.phoneNumber,
          style: AppStyles.text14Px.interMedium,
        ).pOnly(bottom: 8.r),
        KField(
          fieldKey: _phoneKey,
          controller: _phoneController,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
            // PhoneNumberFormatter(),
          ],
          keyboardType: TextInputType.number,
          validator: (text) {
            if (text?.length != 10) {
              return 'Please enter valid phone!';
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
            hintText: 'Please enter phone number',
          ),
        ),
      ],
    );
  }

  //* Login button  in Login view
  Widget _loginButton() {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (p, c) => p.isLoading != c.isLoading,
      builder: (context, state) {
        return Button.filled(
          isLoading: state.isLoading,
          title: 'Continue',
          ontap: () {
            if (_phoneKey.currentState?.validate() ?? false) {
              context.read<AuthBloc>().add(AuthEvent.login(phone: _phoneController.text));
            }
          },
        );
      },
    );
  }

  //* Privacy Policy & Terms and Condition Widget
  Widget _privacyPolicyTermsAndCondionText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'By clicking Continue, you agree with our ',
        style: Theme.of(context).textTheme.displaySmall?.opacity(0.5),
        children: <TextSpan>[
          TextSpan(
            text: 'Privacy Policy ',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          TextSpan(
            text: 'and ',
            style: Theme.of(context).textTheme.displaySmall?.opacity(0.5),
          ),
          TextSpan(
            text: 'Terms & Conditions ',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}
