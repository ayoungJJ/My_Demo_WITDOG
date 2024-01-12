import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart' as KakaoUser;
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:testing_pet/model/user.dart';
import 'package:testing_pet/provider/auth_provider.dart';
import 'package:testing_pet/screens/auth/login_screen.dart';
import 'package:testing_pet/screens/home_screen.dart';
import 'package:testing_pet/screens/pet_add/pet_info_screen.dart';
import 'package:testing_pet/screens/pet_add/pet_detail_screen.dart';
import 'package:testing_pet/screens/tabScreen/tabLogin.dart';

Future<void> main() async {
  KakaoSdk.init(nativeAppKey: '8af072c461ea48f446fa772d0662a93e');
  var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('ko-KR', null);

  await Supabase.initialize(

      url: 'https://fnjsdxnejydzzlievpie.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZuanNkeG5lanlkenpsaWV2cGllIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDMyMTMwMjgsImV4cCI6MjAxODc4OTAyOH0.YuPhXNFkhfcLtU_NLg3gexiX9FORcQEqmy_BOGZw78Q'
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {},
      home: TabLogin(),
    );
  }
}
