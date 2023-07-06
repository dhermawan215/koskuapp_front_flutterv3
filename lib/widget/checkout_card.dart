import 'package:Koskuappfront/models/models.dart';
import 'package:flutter/material.dart';
import 'package:Koskuappfront/theme.dart';
import 'package:intl/intl.dart';

class CheckoutCard extends StatelessWidget {
  final Transaction transaction;

  CheckoutCard(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: backgroundColor3,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              transaction.kost?.picture ?? '',
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.kost?.name ?? '',
                style: primaryTextStyle.copyWith(fontWeight: semiBold),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                NumberFormat.currency(
                  locale: 'id-ID',
                  symbol: 'IDR ',
                  decimalDigits: 0,
                ).format(transaction.kost?.price ?? 0),
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: semiBold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
