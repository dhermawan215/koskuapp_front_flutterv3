import 'package:Koskuappfront/providers/popular_kost_provider.dart';
import 'package:Koskuappfront/widget/popular_kost_card.dart';
import 'package:flutter/material.dart';
import 'package:Koskuappfront/theme.dart';
import 'package:provider/provider.dart';

class PopularKostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PopularKostProvider popularKostProvider =
        Provider.of<PopularKostProvider>(context);

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
                      'Kontrakan Populer',
                      style: primaryTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 22),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'popular for you',
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
                      children: popularKostProvider.kosts
                          .map((kost) => PopularKostCard(kost))
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
