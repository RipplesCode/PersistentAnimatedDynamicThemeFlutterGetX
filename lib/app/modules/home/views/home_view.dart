import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_dyanamic_theme_animation_flutter_getx/app/general/appColors.dart';
import 'package:persistent_dyanamic_theme_animation_flutter_getx/app/general/appTextStyles.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          actions: [
            ThemeSwitcher(
                builder: (context) => Obx(() => IconButton(
                      icon: controller.isDarkMode.value
                          ? Icon(CupertinoIcons.brightness)
                          : Icon(
                              CupertinoIcons.moon_stars,
                              color: AppColors().kBlackColor,
                            ),
                      onPressed: () {
                        controller.changeTheme(context);
                      },
                    )))
          ],
        ),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildTopImage(),
                    SizedBox(
                      height: 20,
                    ),
                    _buildText(
                        data: "Enter Mobile Number to Register/Login",
                        textStyle:
                            AppTextStyles().kTextStyleFourteenWithThemeColor),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          _buildTextFormField(),
                          SizedBox(
                            height: 16,
                          ),
                          _buildElevatedButton(context),
                          SizedBox(
                            height: 16,
                          ),
                          _buildText(
                              data:
                                  "We will send OTP message for unregistered user",
                              textStyle: AppTextStyles()
                                  .kTextStyleTwelveWithGreyColor),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: _buildFooter(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTopImage() {
    return Image.asset(
      'images/logo.png',
      height: 150,
      width: 150,
    );
  }

  Widget _buildText({required String data, required TextStyle textStyle}) {
    return Text(
      data,
      style: textStyle,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (val) {
        controller.validateAndCheckMobileNumber(val);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller.mobileNumberEditingController,
      style: AppTextStyles().kTextStyleWithFont,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: "Mobile Number",
        hintStyle: AppTextStyles().kTextStyleWithFont,
        labelText: "Mobile Number",
        labelStyle: AppTextStyles().kTextStyleWithFont,
        prefixIcon: Icon(Icons.phone),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        isDense: true,
        errorStyle: AppTextStyles().kTextStyleWithFont,
      ),
      maxLength: 10,
      validator: (value) {
        return controller.validateMobile(value!);
      },
    );
  }

  Widget _buildElevatedButton(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: context.width),
      child: ElevatedButton(
        onPressed: () {
          controller.validateAndCheckMobileNumber(
              controller.mobileNumberEditingController.text);
        },
        child: Text(
          "Continue",
          style: AppTextStyles().kTextStyleWithFont,
        ),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            elevation: 10,
            padding: EdgeInsets.all(14)),
      ),
    );
  }
}

Widget _buildFooter() {
  return ClipPath(
    clipper: FooterWaveClipper(),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: AppColors().bottomFooterGradient,
            begin: Alignment.center,
            end: Alignment.bottomRight),
      ),
      height: Get.height / 3,
    ),
  );
}

class FooterWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height - 60);
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
