import 'package:Koskuappfront/models/models.dart';
import 'package:Koskuappfront/pages/kost_page.dart';
import 'package:flutter/material.dart';
import 'package:Koskuappfront/theme.dart';
import 'package:intl/intl.dart';

class SearchCard extends StatelessWidget {
  final KostModel kost;
  SearchCard(this.kost);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => KostPage(kost)));
      },
      child: Container(
        margin: EdgeInsets.only(
          right: defaultMargin,
          left: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                kost.picture ?? '',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lokasi: ${kost.district}",
                    style: subTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    kost.name ?? '',
                    style: primaryTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    NumberFormat.currency(
                      symbol: 'IDR ',
                      decimalDigits: 0,
                      locale: 'id-ID',
                    ).format(kost.price),
                    style: priceTextStyle2.copyWith(
                        fontWeight: reguler, fontSize: 16),
                  ),
                  Text(
                    "Status: ${kost.status}",
                    style: subTextStyle.copyWith(
                        fontWeight: reguler, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
