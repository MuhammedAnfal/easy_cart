import 'package:e_commerce/bindings/general_biniding.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/utils/theme/theme.dart';

var height;
var width;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darktTheme,
        initialBinding: GeneralBiniding(),
        // adding loader to go to relevant screen decided by authentication repository
        home: const Scaffold(backgroundColor: AppColors.primary, body: Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
