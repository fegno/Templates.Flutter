import 'package:{{name.snakeCase()}}/imports_bindings.dart';

///* This screen for controlling onboarding pages
class OnBoardingView extends StatefulWidget {
  ///* This screen for controlling onboarding pages
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final PageController _pageCtrl;
  late final Widgets _pages;
  late final ValueNotifier<int> _currentPage;

  @override
  void initState() {
    _pageCtrl = PageController();
    _currentPage = ValueNotifier(0);
    _pageCtrl.addListener(
      () {
        write(_pageCtrl.page!.toString());
        if (_pageCtrl.page?.toInt() != _currentPage.value) {
          setState(() => _currentPage.value = _pageCtrl.page!.toInt());
        }
      },
    );
    _pages = const <Widget>[
      OnboardingPage1(),
      OnboardingPage2(),
      OnboardingPage3(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageCtrl,
        children: _pages,
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _currentPage,
        builder: (context, page, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: page != 0,
                child: FloatingActionButton.extended(
                  heroTag: 'previous_button',
                  onPressed: () => _pageCtrl.jumpToPage(--_currentPage.value),
                  label: const Text('Previous'),
                ),
              ),
              FloatingActionButton.extended(
                heroTag: 'next_button',
                onPressed: () {
                  if (page != 2) {
                    _pageCtrl.jumpToPage(++_currentPage.value);
                  } else {
                    context.pushAndRemoveUntil(const LoginView());
                  }
                },
                label: Text(
                  switch (page) {
                    2 => 'Start',
                    _ => 'Next',
                  },
                ),
              ),
            ],
          ).pad(16);
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageCtrl.dispose();
    _currentPage.dispose();
    super.dispose();
  }
}
