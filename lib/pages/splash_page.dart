// import 'dart:async';

import 'package:Koskuappfront/providers/general_kost_provider.dart';
import 'package:Koskuappfront/providers/kost_provider.dart';
import 'package:Koskuappfront/providers/new_kost_provider.dart';
import 'package:Koskuappfront/providers/popular_kost_provider.dart';
import 'package:Koskuappfront/providers/recomended_kost_provider.dart';
import 'package:flutter/material.dart';
import 'package:Koskuappfront/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<KostProvider>(context, listen: false).getKost();
    await Provider.of<RecomendedKostProvider>(context, listen: false)
        .getRecomendedKost();
    await Provider.of<PopularKostProvider>(context, listen: false)
        .getPopularKost();
    await Provider.of<NewKostProvider>(context, listen: false).getNewKost();
    await Provider.of<GeneralKostProvider>(context, listen: false)
        .getGeneralKost();
    Navigator.pushNamed(context, '/sign-in');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
          child: Container(
        width: 130,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logo_app.png'),
          ),
        ),
      )),
    );
  }
}
