import 'package:Koskuappfront/providers/recomended_kost_provider.dart';
import 'package:Koskuappfront/widget/recomended_kost_card.dart';
import 'package:flutter/material.dart';
import 'package:Koskuappfront/theme.dart';
import 'package:provider/provider.dart';

class RecomendedKostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RecomendedKostProvider recomendedKostProvider =
        Provider.of<RecomendedKostProvider>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Column(
            children: [
              ///header
              Container(
                height: 100,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 30),
                padding: EdgeInsets.symmetric(horizontal: 30),
                color: backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Rekomendasi Kontrakan',
                      style: primaryTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 22),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'recomended for the best Kost',
                      style: primaryTextStyle.copyWith(
                        fontWeight: reguler,
                      ),
                    )
                  ],
                ),
              ),

              ///body
              Container(
                width: double.infinity,
                color: backgroundColor,
                child: Column(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: recomendedKostProvider.kosts
                          .map((kost) => RecomendedKostCard(kost))
                          .toList(),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
