import 'package:{{name.snakeCase()}}/imports_bindings.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork(
    this.imageUrl, {
    super.key,
    this.placeholderWidget,
    this.errorWidget,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  //image url to load image
  final String? imageUrl;

  //loading widget while image is loading
  final Widget? placeholderWidget;

  //error widget to show error when image loading failed or invalid image url
  final Widget? errorWidget;

  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (imageUrl?.isEmpty ?? true) {
      return empty;
    }
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      width: width,
      height: height,
      fit: fit,
      placeholder: (_, __) {
        return placeholderWidget ??
            Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.grey[300]!,
              child: ColoredBox(
                color: Colors.grey[300]!,
                child: SizedBox(width: width, height: height),
              ),
            );
      },
      errorWidget: (_, __, error) {
        return errorWidget ?? Center(child: empty);
      },
    );
  }

  Widget get empty => SizedBox(
        height: height,
        width: width,
        child: Image.asset(
          'assets/images/palceholder-1.jpg',
          height: height,
          width: width,
          fit: fit,
        ),
      );
}
