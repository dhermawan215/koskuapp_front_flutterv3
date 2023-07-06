import 'package:Koskuappfront/models/models.dart';
import 'package:Koskuappfront/pages/success_page.dart';
import 'package:Koskuappfront/providers/transaction_provider.dart';

import 'package:Koskuappfront/widget/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:Koskuappfront/theme.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  //final Transaction transaction;
  final User user;
  final KostModel kost;

  CheckoutPage({required this.user, required this.kost});
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isLoading = false;
  final int fee = 4500;

  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    // Transaction transaction = transactionProvider.transaction;
    int price = widget.kost.price ?? 0;
    int total = fee + price;
    handleChekout() async {
      setState(() {
        isLoading = true;
      });

      await transactionProvider
          .submitTransaction(widget.kost, widget.user, total)
          .then((value) {
        if (value != null && value.isNotEmpty) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SuccessPage(
                        paymentUrl: value,
                        user: widget.user,
                      )));
        } else {
          print('Transaksi gagal');
        }
      });

      // if (await transactionProvider.submitTransaction(
      //     widget.kost, widget.user, total)) {
      // print(transactionProvider.transactions.length);
      // print(transaction.paymentUrl);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => SuccessPage(
      //       paymentUrl: transactionProvider.paymentUrl,
      //     ),
      //   ),
      // );
      setState(() {
        isLoading = false;
      });
    }

    AppBar header() {
      return AppBar(
        backgroundColor: backgroundColor3,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Checkout Details',
          style: primaryTextStyle.copyWith(fontWeight: semiBold),
        ),
      );
    }

    Widget checkoutCard() {
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
                  widget.kost.picture ?? "",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.kost.name ?? "",
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
                    ).format(widget.kost.price),
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          //item
          Container(
            margin: EdgeInsets.only(top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Keterangan Sewa',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                checkoutCard(),
              ],
            ),
          ),

          //payment transfer

          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor3,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Transaksi',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Item: ${widget.kost.name}',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'No Ruangan Kosong: ${widget.kost.room}',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Biaya : ',
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: 'id-ID',
                        symbol: 'IDR ',
                        decimalDigits: 0,
                      ).format(widget.kost.price),
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Biaya Admin:',
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        locale: 'id-ID',
                        decimalDigits: 0,
                      ).format(fee),
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Bayar :',
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        locale: 'id-ID',
                        decimalDigits: 0,
                      ).format(total),
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                  ],
                )
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor3,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Penyewa',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Item: ${widget.kost.name}',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Penyewa :',
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      widget.user.name ?? "",
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Telfon:',
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      '+ ${widget.user.phone}',
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //button checkout
          isLoading
              ? LoadingButton()
              : Container(
                  margin: EdgeInsets.all(30),
                  height: 50,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: handleChekout,
                    elevation: 0,
                    color: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Checkout Now',
                      style: primaryTextStyleWht.copyWith(fontWeight: semiBold),
                    ),
                  ),
                ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header(),
      body: content(),
    );
  }
}
