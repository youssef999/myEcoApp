


// ignore_for_file: unused_import
import 'package:ecommerce/helper/local_storage_data.dart';
import 'package:ecommerce/view/splash.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:ecommerce/viewmodel/control_view_model.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sqflite/sqflite.dart';
import 'package:video_player/video_player.dart';
import 'notification/test_notofication.dart';
import 'viewmodel/cart_viewmodel.dart';
import 'view/home/controll_view.dart';
import 'helper/binding.dart';

Future<void> main() async {




  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 // Get.put(CartViewModel());
  Get.put(ControlViewModel());
  Get.put(CartViewModel());
  // Get.put(AuthViewModel());
  // Get.put(HomeViewModel());
  // Get.put(LocalStorageData());
  await GetStorage.init();
  runApp(MyApp());


}


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/Luban9.mp4')
      ..initialize().then((_) {
        _controller.play();
        print("doooone");
        new Future.delayed(new Duration(seconds:5), ()
        {
          print("xxxx");
          Get.off(ControlView());

        });

        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.

      });
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding:Binding(),
  debugShowCheckedModeBanner:false,
      home:
      Scaffold(
        backgroundColor:  HexColor("#ffE6E3E3"),
          body:Container(
            height:1000,
           // padding:EdgeInsets.only(top:260),
          color: HexColor("#ffE6E3E3"),
            //    height:510,
           //   width:900,
           // height:700,
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller,
                  ),
                  //ControlsOverlay(controller: _controller),
                  //  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          )
      )

      // Scaffold(
      //   body:SplashScreen()
      //  // ControlView(),
      //   //notification_test(),
      //   //
      // ),
   //   theme:ThemeData()
    );
  }
}
//mvvm ----> model View viewModel

