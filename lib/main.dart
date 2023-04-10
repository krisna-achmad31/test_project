import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_project/page/ShopPage.dart';
import 'package:test_project/page/SplashPage.dart';

import 'binding/AppBinding.dart';
import 'controller/SplashController.dart';

void main() {
  Get.put(SplashController());
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Testing Flutter',
      initialRoute: SplashScreen.routedName,
      initialBinding: AppBinding(),
      getPages: [
        GetPage(name: SplashScreen.routedName, page: () => SplashScreen()),
        GetPage(name: ShopPage.routedName, page: () => ShopPage()),
      ],
    );
  }

// void registerNotification() async {
//   // 1. Initialize the Firebase app
//   await Firebase.initializeApp();
//
//   // 2. Instantiate Firebase Messaging
//   FirebaseMessaging _messaging = FirebaseMessaging.instance;
//
//   // 3. On iOS, this helps to take the user permissions
//   NotificationSettings settings = await _messaging.requestPermission(
//     alert: true,
//     badge: true,
//     provisional: false,
//     sound: true,
//   );
//
//   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//     print('User granted permission');
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   } else {
//     print('User declined or has not accepted permission');
//   }
// }
}
