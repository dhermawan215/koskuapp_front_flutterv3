import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/models.dart';
import 'order_page.dart';
import 'package:Koskuappfront/theme.dart';

class SuccessPage extends StatelessWidget {
  final String paymentUrl;
  final User user;
  SuccessPage({required this.paymentUrl, required this.user});
  @override
  Widget build(BuildContext context) {
    print(paymentUrl);

    Widget content() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/cart_icon.png',
              width: 100,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Transaksi Berhasil, ',
              style:
                  primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'selesaikan pembayaran sekarang ',
              style:
                  primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
            ),
            Container(
              width: 196,
              height: 44,
              margin: EdgeInsets.only(top: 30),
              child: TextButton(
                  onPressed: () async {
                    LaunchMode mode = LaunchMode.externalApplication;
                    await launchUrl(Uri.parse(paymentUrl), mode: mode);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Text('Bayar',
                      style: primaryTextStyle.copyWith(fontWeight: semiBold))),
            ),
            Container(
              width: 196,
              height: 44,
              margin: EdgeInsets.only(top: 12),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderPage(user.token!)));
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: priceColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Text('History',
                      style: primaryTextStyle.copyWith(fontWeight: semiBold))),
            ),
            Container(
              width: 196,
              height: 44,
              margin: EdgeInsets.only(top: 12),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => false);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: secondaryTextColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Text('Home',
                      style: primaryTextStyle.copyWith(fontWeight: semiBold))),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor3,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Success Page',
          style: primaryTextStyle.copyWith(fontWeight: semiBold),
        ),
      ),
      body: content(),
    );
    // return Center(
    //   child: Container(
    //     color: Colors.white,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         DefaultTextStyle(
    //           style: TextStyle(color: Colors.black, fontSize: 16),
    //           child: Text(
    //               'Order Berhasil!\nSilakan klik tombol dibawah untuk melanjutkan pembayaran.',
    //               textAlign: TextAlign.center,
    //               style: TextStyle(color: Colors.black, fontSize: 16)),
    //         ),
    //         SizedBox(height: 10),
    //         Row(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             MaterialButton(
    //                 color: Colors.blue,
    //                 child: Text('Lanjutkan',
    //                     style: TextStyle(color: Colors.white)),
    //                 onPressed: () async {
    //                   LaunchMode mode = LaunchMode.externalApplication;
    //                   await launchUrlString(paymentUrl, mode: mode);
    //                   // await launchUrl(Uri.parse(paymentUrl), mode: mode);
    //                 }),
    //             SizedBox(width: 10),
    //             MaterialButton(
    //                 color: Colors.blue,
    //                 child:
    //                     Text('History', style: TextStyle(color: Colors.white)),
    //                 onPressed: () {
    //                   Navigator.push(
    //                       context,
    //                       MaterialPageRoute(
    //                           builder: (context) => OrderPage(user.token!)));
    //                 }),
    //           ],
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
