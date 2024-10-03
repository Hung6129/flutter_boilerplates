part of 'walkthrough_controller.dart';

class WalkThroughPage extends StatelessWidget {
  const WalkThroughPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppFullScreenLoadingIndicator.configure(context);
    return GetBuilder<WalkThroughController>(
      init: WalkThroughController(),
      builder: (_) => Stack(
        children: [
          Container(
            color: context.theme.colorScheme.background,
            child: Center(
              child: Platform.isAndroid
                  ? Image.asset('assets/images/splash_logo_android.png',
                      width: 145, height: 145)
                  : Image.asset('assets/images/logo.png',
                      width: 120, height: 120),
            ),
          ),
          Positioned(
            bottom: Get.bottomBarHeight + AppUIConstants.defaultPadding,
            left: 0,
            right: 0,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircularProgressIndicator(
                color: context.theme.primaryColor,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
