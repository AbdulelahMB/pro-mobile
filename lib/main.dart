import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobilepro/view/forget.dart';
import 'firebase_options.dart';

import 'view/login.dart';
import 'view/register.dart';

// import 'package:loginuicolors/view/register.dart';
// import 'package:loginuicolors/view/login.dart';
// import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'forget': (context) => forget(),
    },
  ));
}
