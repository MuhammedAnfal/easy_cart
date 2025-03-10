import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';

var height;
var width;
Future<void> main() async {
  //-- widgets binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //-- initialize getStorage
  await GetStorage.init();

  //--await until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //-- initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  runApp(const App());
}
