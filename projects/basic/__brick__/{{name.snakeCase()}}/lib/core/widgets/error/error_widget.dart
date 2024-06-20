// ignore_for_file: public_member_api_docs

import 'package:{{name.snakeCase()}}/imports_bindings.dart';

@immutable
class ErrorUi extends StatefulWidget {
  ///* For using 500 Server Error Widget
  factory ErrorUi.server({CallVoid? onTap, bool showButton = true}) {
    return ErrorUi._(
      subtitle: "Oops! Something went wrong. We're on it. Please try again later.",
      img: 'assets/images/svg/server_error_img.svg',
      title: 'Internal server error',
      buttonTitle: showButton ? 'Retry' : '',
      onTap: onTap,
    );
  }

  ///* For using 404 Client Error Widget
  factory ErrorUi.notFound({CallVoid? onTap, bool showButton = true, String? text}) {
    return ErrorUi._(
      subtitle: 'We’re sorry, the page you requested could not be found. Please go back to the homepage!',
      img: 'assets/images/svg/not_found_img.svg',
      title: 'Page not found!',
      buttonTitle: text ?? (!showButton ? '' : 'Continue shopping'),
      onTap: onTap,
    );
  }

  ///* For using Empty order history Widget
  factory ErrorUi.emptyOrderHistory() {
    return ErrorUi._(
      subtitle: 'Check back after your next order!!',
      img: 'assets/images/svg/order_empty.svg',
      title: 'No order history',
      buttonTitle: 'Continue shopping',
      onTap: () {},
    );
  }

  ///* For using Network Error Widget
  factory ErrorUi.network({CallVoid? onTap, bool showButton = true}) {
    return ErrorUi._(
      subtitle: 'Could not connect to the network. Please check your internet',
      img: 'assets/images/svg/internet_img.svg',
      buttonTitle: !showButton ? '' : 'Retry',
      onTap: onTap,
    );
  }

  ///* For using Empty notification widget
  factory ErrorUi.noNotification() {
    return ErrorUi._(
      subtitle: 'You have no notifications right now. Come back later',
      img: 'assets/images/svg/no_notification.svg',
      title: 'No Notifications Yet',
      imageHeight: 140.h,
    );
  }

  ///* For using Location not found widget
  factory ErrorUi.locationNotFound() {
    return ErrorUi._(
      subtitle: 'Please search for a different location',
      img: 'assets/images/svg/location_not_found.svg',
      title: 'Location not found',
      imageHeight: 140.h,
    );
  }

  ///* For using Empty cart widget
  factory ErrorUi.emptyCart() {
    return ErrorUi._(
      subtitle: 'Explore, Discover, and Delight in Every Click!',
      img: 'assets/images/svg/empty_cart.svg',
      title: 'Your cart is empty',
      buttonTitle: 'Start shopping',
      onTap: App.navKey.currentContext?.pop,
    );
  }

  const ErrorUi._({
    this.title,
    this.subtitle,
    this.img,
    this.buttonTitle,
    this.onTap,
    this.imageHeight,
  });
  final String? title;
  final String? subtitle;
  final String? img;
  final String? buttonTitle;
  final CallVoid? onTap;
  final double? imageHeight;

  @override
  State<ErrorUi> createState() => _ErrorUiState();
}

class _ErrorUiState extends State<ErrorUi> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                widget.img ?? '',
                fit: BoxFit.cover,
                height: widget.imageHeight ?? constraints.maxHeight * 0.3,
                width: constraints.maxWidth * 0.4,
              ),
              22.verticalSpace,
              if (widget.title != null)
                Text(
                  widget.title ?? '',
                  style: AppStyles.text16Px.interBold.dark,
                ),
              if (widget.title != null) 10.verticalSpace,
              Text(
                widget.subtitle ?? '',
                textAlign: TextAlign.center,
                style: AppStyles.text12Px.interRegular.copyWith(
                  color: AppColors.error,
                ),
              ).pxy(x: constraints.maxWidth * 0.15),
              18.verticalSpace,
              if (widget.buttonTitle?.isNotEmpty ?? false)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: InkWell(
                    overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                    onTap: widget.onTap,
                    child: ColoredBox(
                      color: AppColors.error,
                      child: Text(
                        widget.buttonTitle ?? '',
                        style: AppStyles.text12Px.interSemiBold.light,
                      ).pxy(x: 24.r, y: 10.r),
                    ),
                  ),
                ).center,
            ],
          ),
        );
      },
    );
  }
}
