import 'package:get/get.dart';

import 'package:persistent_dyanamic_theme_animation_flutter_getx/app/modules/home/bindings/home_binding.dart';
import 'package:persistent_dyanamic_theme_animation_flutter_getx/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
