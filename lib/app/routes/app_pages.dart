import 'package:get/get.dart';

import '../modules/camera/bindings/camera_binding.dart';
import '../modules/camera/views/camera_view.dart';
import '../modules/change_point/bindings/change_point_binding.dart';
import '../modules/change_point/views/change_point_view.dart';
import '../modules/confirm_report/bindings/confirm_report_binding.dart';
import '../modules/confirm_report/views/confirm_report_view.dart';
import '../modules/current_location/bindings/current_location_binding.dart';
import '../modules/current_location/views/current_location_view.dart';
import '../modules/detail_report/bindings/detail_report_binding.dart';
import '../modules/detail_report/views/detail_report_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/reward/bindings/reward_binding.dart';
import '../modules/reward/views/reward_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.CAMERA,
      page: () => CameraView(),
      binding: CameraBinding(),
    ),
    GetPage(
      name: _Paths.CONFIRM_REPORT,
      page: () => ConfirmReportView(
        currentLocation: '',
      ),
      binding: ConfirmReportBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => HistoryView(initialTabIndex: 0),
      binding: HistoryBinding(),
    ),
    GetPage(
        name: _Paths.REWARD,
        page: () => const RewardView(),
        binding: RewardBinding()),
    GetPage(
      name: _Paths.DETAIL_REPORT,
      page: () => DetailReportView(),
      binding: DetailReportBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.CURRENT_LOCATION,
      page: () => CurrentLocationScreen(
        onLocationSelected: (LatLng) {},
      ),
      binding: CurrentLocationBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_POINT,
      page: () => ChangePointView(),
      binding: ChangePointBinding(),
    ),
  ];
}
