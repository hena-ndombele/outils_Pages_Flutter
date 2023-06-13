import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odc_flutter_features/controllers/app_controller.dart';
import 'package:odc_flutter_features/controllers/gallery_controller.dart';
import 'package:odc_flutter_features/controllers/location_controller.dart';
import 'package:odc_flutter_features/controllers/notification_controller.dart';
import 'package:odc_flutter_features/pages/splash_screen_page.dart';
import 'package:provider/provider.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'utils/const.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );
  AssetPicker.registerObserve();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext ctx) => AppController()),
        ChangeNotifierProvider(
            create: (BuildContext ctx) => GalleryContoller()),
        ChangeNotifierProvider(
            create: (BuildContext ctx) => LocationController()),
        ChangeNotifierProvider(
            create: (BuildContext ctx) => NotificationController())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.orange,
            scaffoldBackgroundColor: Consts.DEFAULT_SCAFFOLD_BG,
            appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.light,
              ),
            )),
        home: SplashScreenPage(),
      ),
    );
  }
}
