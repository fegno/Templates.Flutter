part of '../update_service.dart';

class UpdateDialog extends StatelessWidget {
  const UpdateDialog({
    required this.updateDetails,
    super.key,
  });

  final AppVersionData updateDetails;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: Text('🚀', style: TextStyle(fontSize: 48))).pOnly(top: 16.r),
          Center(
            child: Text(
              updateDetails.storeVersion ?? '',
              style: AppStyles.text24Px.interBold,
            ).pOnly(bottom: 16.r),
          ),
          Text(
            'Please intstall latest version!',
            style: AppStyles.text14Px.interMedium,
          ).pOnly(bottom: 16.r),
          TextButton(
            onPressed: updateDetails.launchStore,
            child: const Text('Update'),
          ).align(Alignment.centerRight),
        ],
      ).pxy(x: 28.r, y: 24.r),
    );
  }
}
