
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:get/get.dart';

enum ToastType { error, success }

customToast({required String type, required String message}) {
  AnimatedSnackBar.material(message,
      desktopSnackBarPosition : DesktopSnackBarPosition.topRight,
      mobilePositionSettings: const MobilePositionSettings(
        topOnAppearance: 40,
        topOnDissapear: -80,
      ),
      type: type == "error"
          ? AnimatedSnackBarType.error
          : type == "info"
          ? AnimatedSnackBarType.info
          : type == "success"
          ? AnimatedSnackBarType.success
          : type == "warning"
          ? AnimatedSnackBarType.warning:
      AnimatedSnackBarType.warning,
      duration: const Duration(seconds: 4))
      .show(Get.context!);
}
