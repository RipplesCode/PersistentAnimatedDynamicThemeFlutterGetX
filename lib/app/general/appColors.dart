import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'getStorageKey.dart';

class AppColors {
  var bottomFooterGradient = GetStorage().read(GetStorageKey.IS_DARK_MODE)
      ? [
          Colors.lightBlue,
          Colors.lightBlue.shade100,
        ]
      : [
          Color(0xFF6200EE),
          Colors.deepPurple.shade300,
        ];

  var kPrimaryTextColor = GetStorage().read(GetStorageKey.IS_DARK_MODE)
      ? Color(0xDDFFFFFF)
      : Color(0xDD000000);
  var kSecondaryTextColor = GetStorage().read(GetStorageKey.IS_DARK_MODE)
      ? Color(0x89FFFFFF)
      : Color(0x89000000);
  var kBlackColor = Colors.black;
}
