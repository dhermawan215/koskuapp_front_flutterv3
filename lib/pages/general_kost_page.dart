import 'package:Koskuappfront/providers/general_kost_provider.dart';
import 'package:Koskuappfront/widget/general_kost_card.dart';
import 'package:flutter/material.dart';
import 'package:Koskuappfront/theme.dart';
import 'package:provider/provider.dart';

class GeneralKostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GeneralKostProvider generalKostProvider =
        Provider.of<GeneralKostProvider>(context);
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
                      'Kontrakan Umum',
                      style: primaryTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 22),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'general kost category',
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
                      children: generalKostProvider.kosts
                          .map((kost) => GeneralKostCard(kost))
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
