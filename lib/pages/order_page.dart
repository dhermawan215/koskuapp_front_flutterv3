import 'package:Koskuappfront/models/models.dart';
import 'package:Koskuappfront/providers/transaction_provider.dart';
import 'package:Koskuappfront/widget/custom_tab.dart';
// import 'package:Koskuappfront/widget/order_list_card.dart';
import 'package:flutter/material.dart';
import 'package:Koskuappfront/theme.dart';
import 'package:provider/provider.dart';

import '../widget/order_list_card.dart';

class OrderPage extends StatefulWidget {
  final String token;

  OrderPage(this.token);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int selectedIndex = 0;

  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() {
    Provider.of<TransactionProvider>(context, listen: false)
        .getTransaction(widget.token);
    Future.delayed(Duration(seconds: 1), () {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    List<Transaction> transactionSuccess =
        Provider.of<TransactionProvider>(context)
            .transactions
            .where((Transaction element) =>
                element.status == TransactionStatus.success)
            .toList();
    List<Transaction> transactionCancel =
        Provider.of<TransactionProvider>(context)
            .transactions
            .where((Transaction element) =>
                element.status == TransactionStatus.cancel)
            .toList();
    List<Transaction> transactionPending =
        Provider.of<TransactionProvider>(context)
            .transactions
            .where((Transaction element) =>
                element.status == TransactionStatus.pending)
            .toList();

    if (transactionSuccess.length == 0 && transactionCancel.length == 0) {
      return Scaffold(
        backgroundColor: backgroundColor,
        body: ListView(
          children: [
            Column(children: [
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
                      'Order History Kost Kamu',
                      style: primaryTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 22),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Data Kosong',
                      style: primaryTextStyle.copyWith(
                        fontWeight: reguler,
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ],
        ),
      );
    }

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
                      'Order History Kost Kamu',
                      style: primaryTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 22),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'wait for the best Kost',
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
                    CustomTabBar(
                      titles: ['Success', 'Cancel', 'Pending'],
                      selectedIndex: selectedIndex,
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: (selectedIndex == 0
                              ? transactionSuccess
                              : selectedIndex == 1
                                  ? transactionCancel
                                  : transactionPending)
                          .map(
                            (e) => OrderListCard(e),
                          )
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
