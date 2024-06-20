import 'package:{{name.snakeCase()}}/imports_bindings.dart';

///
class EmptyState extends StatelessWidget {
  ///
  const EmptyState({
    super.key,
    this.query = '',
    this.text = '',
  });

  ///
  final String query;

  ///
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/svg/could_not_find_product.svg',
          height: 100.h,
          fit: BoxFit.cover,
        ),
        18.verticalSpace,
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Oops! We couldn’t find ${text.isEmpty ? 'products matching ' : text}',
                style: AppStyles.text16Px.dark.interSemiBold,
              ),
              TextSpan(
                text: text.isEmpty ? query : '',
                style: AppStyles.text16Px.dark.interBold,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ).center.pxy(x: 48.r);
  }
}
