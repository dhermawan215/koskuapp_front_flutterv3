import 'package:Koskuappfront/models/models.dart';
import 'package:flutter/material.dart';
import 'package:Koskuappfront/theme.dart';

class OrderListCard extends StatelessWidget {
  final Transaction transaction;

  OrderListCard(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
              transaction.kost?.picture ?? '',
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
                  transaction.transactionNumber ?? '',
                  style: subTextStyle.copyWith(fontWeight: medium),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  transaction.kost?.name ?? '',
                  style: primaryTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Rp.' + transaction.total.toString(),
                  style: priceTextStyle2.copyWith(
                      fontWeight: reguler, fontSize: 16),
                ),
                Text(
                  transaction.createdAt.toString(),
                  style:
                      subTextStyle.copyWith(fontWeight: reguler, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
