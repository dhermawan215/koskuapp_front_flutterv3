// import 'package:Koskuappfront/pages/checkout_page.dart';
import 'package:Koskuappfront/pages/edit_profile.dart';
import 'package:Koskuappfront/pages/general_kost_page.dart';
import 'package:Koskuappfront/pages/home/main_page.dart';
import 'package:Koskuappfront/pages/new_kost_page.dart';
// import 'package:Koskuappfront/pages/order_page.dart';
import 'package:Koskuappfront/pages/popular_kost_page.dart';
import 'package:Koskuappfront/pages/recomended_kost_page.dart';
import 'package:Koskuappfront/pages/sign_in_page.dart';
import 'package:Koskuappfront/pages/sign_up_page.dart';
import 'package:Koskuappfront/pages/splash_page.dart';
import 'package:Koskuappfront/providers/auth_provider.dart';
import 'package:Koskuappfront/providers/general_kost_provider.dart';
import 'package:Koskuappfront/providers/kost_provider.dart';
import 'package:Koskuappfront/providers/new_kost_provider.dart';
import 'package:Koskuappfront/providers/popular_kost_provider.dart';
import 'package:Koskuappfront/providers/recomended_kost_provider.dart';
import 'package:Koskuappfront/providers/transaction_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => KostProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RecomendedKostProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PopularKostProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewKostProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GeneralKostProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/edit-profile': (context) => EditProfile(),
          // '/kost': (context) => KostPage(),
          // '/checkout': (context) => CheckoutPage(),
          // '/order-history': (context) => OrderPage(),
          '/recomended-kost': (context) => RecomendedKostPage(),
          '/new-kost': (context) => NewKostPage(),
          '/popular-kost': (context) => PopularKostPage(),
          '/general-kost': (context) => GeneralKostPage(),
        },
      ),
    );
  }
}
