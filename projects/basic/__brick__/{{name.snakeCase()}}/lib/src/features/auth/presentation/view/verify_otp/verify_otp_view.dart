//* This screen is using for verify otp, User will get otp from mobile throug or email asper login screen.

import 'package:{{name.snakeCase()}}/imports_bindings.dart';

class VerifyOtpView extends StatefulWidget {
  const VerifyOtpView({
    required this.phoneNumber,
    super.key,
  });

  final String phoneNumber;

  @override
  State<VerifyOtpView> createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
  late Timer timer;
  late TextEditingController _otpCtrl;
  late final ValueNotifier<int> secondsRemaining;
  late String currentText;

  final FocusNode focus = FocusNode();
  final ScrollController controller = ScrollController();
  late final GlobalKey<FormState> _formKey;

  late PinTheme focusedPinTheme;
  late PinTheme submittedPinTheme;
  late PinTheme errorTheme;

  final defaultPinTheme = PinTheme(
    // margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 5),
    // width: SizeConfig.blockSizeHorizontal * 14.49,
    // height: SizeConfig.blockSizeHorizontal * 14.49,
    textStyle: const TextStyle(
      fontSize: 20,
      // fontFamily: Constants.fontSemiBold,
      color: Colors.black,
    ),
    padding: EdgeInsets.symmetric(horizontal: 16.r),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  void _onFocusChange() {
    controller.jumpTo(controller.position.maxScrollExtent);
  }

  @override
  void initState() {
    _otpCtrl = TextEditingController();
    _formKey = GlobalKey<FormState>();

    secondsRemaining = ValueNotifier(60);
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining.value != 1) {
        secondsRemaining.value--;
      }
    });

    focusedPinTheme = defaultPinTheme.copyDecorationWith(
      // border: Border.all(color: AppColors.secondaryColor),
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
    );
    submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        // border: Border.all(color: AppColors.secondaryColor),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
    );
    errorTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    secondsRemaining.dispose();
    focus.removeListener(_onFocusChange);
    _otpCtrl.dispose();
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }

  //Create body :- This is the body part of this screen, It will call in Scaffold(body).
  Widget _createBody(bool isKeyboardVisible) {
    return Column(
      children: [
        const Spacer(),
        _verificationTextWidget(),
        const Spacer(),
        Visibility(
          visible: !isKeyboardVisible,
          child: _imageWidget(),
        ),
        const Spacer(flex: 2),
        _pleaseEnterOtpSection(),
        _buildPin('', false).pxy(y: 16.r),
        _verifyButton(),
        const Spacer(flex: 5),
        _resendOtp(),
      ],
    ).pad(16.r);
  }

  //* Verification text widget
  Widget _verificationTextWidget() {
    return Center(
      child: Text(
        context.lang.verification,
        style: AppStyles.text24Px.interMedium,
      ),
    );
  }

  //* Image widget :- This image is using in this screen.
  Widget _imageWidget() {
    return Center(
      child: SvgPicture.asset(
        AssetHelpers.verifyOtpImg,
        width: 256.w,
        height: 200.h,
      ),
    );
  }

  //* Please enter otp text widget phone number also show here and Edit button has used here
  Widget _pleaseEnterOtpSection() {
    return Column(
      children: [
        Text(
          context.lang.verifyOtpSubTitle1,
          style: AppStyles.text14Px.interRegular,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.phoneNumber} ',
              style: AppStyles.text14Px.interMedium,
            ),
            InkWell(
              onTap: () {
                context.pop();
              },
              child: Text(
                context.lang.edit,
                style: AppStyles.text14Px.interMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }

  //* Otp Field :- This widget is using for enter otp
  Widget _buildPin(String? errorText, bool? hasError) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _formKey,
            child: Pinput(
              animationDuration: const Duration(milliseconds: 300),
              controller: _otpCtrl,
              onSubmitted: (String pin) {
                if (_formKey.currentState?.validate() ?? false) {
                  context.read<AuthBloc>().add(AuthEvent.verifyOtp(phone: widget.phoneNumber, otp: _otpCtrl.text));
                }
              },
              focusNode: focus,
              textInputAction: TextInputAction.go,
              onChanged: (value) {
                currentText = value;
              },
              validator: (text) {
                if (text?.length != 4) {
                  return 'Please enter valid phone!';
                }
                return null;
              },
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
            ),
          ),
        ),
      ],
    );
  }

  //* Verify Button :- This button using for verify the otp.
  Widget _verifyButton() {
    return ValueListenableBuilder(
      valueListenable: _otpCtrl,
      builder: (context, value, child) {
        return BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (p, c) => p.isLoading != c.isLoading,
          builder: (context, state) {
            return Button.filled(
              isLoading: state.isLoading,
              isDisabled: value.text.length < 4,
              title: 'Verify',
              ontap: () {
                write('_otpKey.currentState?.validate() : ${_formKey.currentState?.validate()}');
                if (_formKey.currentState?.validate() ?? false) {
                  context.read<AuthBloc>().add(AuthEvent.verifyOtp(phone: widget.phoneNumber, otp: _otpCtrl.text));
                }
              },
            );
          },
        );
      },
    );
  }

  //Resend otp - using for resend otp time and resend otp button for call resend otp api.
  Widget _resendOtp() {
    return ValueListenableBuilder(
      valueListenable: secondsRemaining,
      builder: (context, seconds, child) {
        final enableResend = seconds == 1;
        return InkWell(
          onTap: () {
            if (enableResend) {
              secondsRemaining.value = 60;
            }
          },
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Didn’t receive the code? ',
              style: AppStyles.text16Px.interSemiBold.copyWith(
                color: IconTheme.of(context).color,
              ),
              children: <TextSpan>[
                if (!enableResend)
                  TextSpan(
                    text: 'Resend OTP in ${secondsRemaining.value}s ',
                  )
                else
                  TextSpan(
                    text: 'Resend',
                    style: AppStyles.text16Px.interSemiBold.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
