import 'dart:io';
import 'package:care/config/config_export.dart';
import 'package:care/views/views_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  //HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: Splash.id,
      //home: adhome()
    );
  }
}

class Splash extends StatefulWidget {
  static String id = "Splash";
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  checkUserLogged() async {
    var sp = await SharedPreferences.getInstance();
    await ServerInfo.user.retrieveInfoFromSharedPreferences();
    String logged = sp.getString("logged") ?? "";
    if (logged != "") {
      if (ServerInfo.user.userKind == "0") {
        Navigator.pushNamedAndRemoveUntil(context, Home.id, (route) => false);
      } else if (ServerInfo.user.userKind == "1") {
        Navigator.pushNamedAndRemoveUntil(
            context, DoctorHome.id, (route) => false);
      } else if (ServerInfo.user.userKind == "2") {
        //admin
        Navigator.pushNamedAndRemoveUntil(
            context, AdminHome.id, (route) => false);
      }
    } else {
      Navigator.pushNamedAndRemoveUntil(context, Login.id, (route) => false);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 4),
      () {
        checkUserLogged();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Text('24/7 CARE',
                    style: TextStyle(color: Colors.black, fontSize: 55)),
                const SizedBox(
                  width: 35,
                )
              ],
            ),
            const Text(
              '     M E D I C A L   A P P ',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
