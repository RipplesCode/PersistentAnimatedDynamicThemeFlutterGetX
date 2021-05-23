import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persistent_dyanamic_theme_animation_flutter_getx/app/general/appThemes.dart';
import 'package:persistent_dyanamic_theme_animation_flutter_getx/app/general/getStorageKey.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final _getStorage = GetStorage();
  bool isDarkMode = _getStorage.read(GetStorageKey.IS_DARK_MODE) ?? false;
  _getStorage.write(GetStorageKey.IS_DARK_MODE, isDarkMode);
  runApp(
    ThemeProvider(
      initTheme: isDarkMode?AppThemes.darkThemeData:AppThemes.lightThemeData,
        child: Builder(
          builder: (context)=>GetMaterialApp(
            title: "Persistent Theme",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            theme: ThemeProvider.of(context),
            darkTheme: AppThemes.darkThemeData,
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.leftToRightWithFade,
          ),
        ),
    )

  );
}
