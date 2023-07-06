import 'package:Koskuappfront/pages/home/home_page.dart';
import 'package:Koskuappfront/pages/home/profile_page.dart';
import 'package:Koskuappfront/pages/home/search_page.dart';
import 'package:Koskuappfront/pages/home/wishlist_page.dart';
import 'package:Koskuappfront/pages/order_page.dart';
import 'package:Koskuappfront/providers/auth_provider.dart';
import 'package:Koskuappfront/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    String? token = authProvider.user?.token;
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          if (token != null && token.isNotEmpty) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OrderPage(token)));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(token.toString()),
            ));
          }
        },
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/cart_icon.png',
          width: 20,
        ),
      );
    }

    Widget customButtonNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              backgroundColor: bgButton,
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        bottom: 10,
                      ),
                      child: Image.asset(
                        'assets/account_balance.png',
                        width: 21,
                        color: currentIndex == 0
                            ? secondaryColor
                            : Color(0xff808191),
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        bottom: 10,
                        right: 10,
                      ),
                      child: Image.asset(
                        'assets/explore.png',
                        width: 21,
                        color: currentIndex == 1
                            ? secondaryColor
                            : Color(0xff808191),
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        bottom: 10,
                      ),
                      child: Image.asset(
                        'assets/account_circle.png',
                        width: 21,
                        color: currentIndex == 3
                            ? secondaryColor
                            : Color(0xff808191),
                      ),
                    ),
                    label: ''),
              ]),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return SearchPage();
        case 2:
          return WishlistPage();
        case 3:
          return ProfilePage();
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customButtonNav(),
      body: body(),
    );
  }
}
