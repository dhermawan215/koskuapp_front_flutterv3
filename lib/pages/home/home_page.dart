import 'package:Koskuappfront/providers/auth_provider.dart';
import 'package:Koskuappfront/providers/kost_provider.dart';
import 'package:Koskuappfront/widget/kost_card.dart';
import 'package:flutter/material.dart';
import 'package:Koskuappfront/theme.dart';
import 'package:Koskuappfront/models/models.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    User user = authProvider.user!;

    KostProvider kostProvider = Provider.of<KostProvider>(context);
    // print(kostProvider.kosts.length);

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${user.name}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 22,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 54,
              width: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/primary_account.png'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transaparentColor,
                  border: Border.all(
                    color: primaryColor,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/recomended-kost');
                  },
                  child: Text(
                    'Recomended',
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transaparentColor,
                  border: Border.all(
                    color: primaryColor,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/popular-kost');
                  },
                  child: Text(
                    'Popular',
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transaparentColor,
                  border: Border.all(
                    color: primaryColor,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/new-kost');
                  },
                  child: Text(
                    'New',
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transaparentColor,
                  border: Border.all(
                    color: primaryColor,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/general-kost');
                  },
                  child: Text(
                    'Umum',
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularKostTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Semua Kost',
          style: primaryTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 22,
          ),
        ),
      );
    }

    Widget popularKost() {
      return Container(
        margin: EdgeInsets.only(top: 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: defaultMargin),
              Row(
                children:
                    kostProvider.kosts.map((kost) => KostCard(kost)).toList(),
              )
            ],
          ),
        ),
      );
    }

    Widget newArrivalsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: 15,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Featured',
          style: primaryTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 22,
          ),
        ),
      );
    }

    // Widget newArrivals() {
    //   return Container(
    //     margin: EdgeInsets.only(top: 10),
    //     child: Column(
    //       children: [
    //         KostTile(),
    //         KostTile(),
    //         KostTile(),
    //         KostTile(),
    //       ],
    //     ),
    //   );
    // }

    return ListView(
      children: [
        header(),
        popularKostTitle(),
        popularKost(),
        newArrivalsTitle(),
        categories(),
        // Container(
        //   margin: EdgeInsets.only(top: 15),
        //   width: double.infinity,
        //   child: Column(
        //     children: [
        //       CustomTabBar(
        //         titles: ['Recommended', 'Popular', 'New', 'Umum'],
        //         selectedIndex: selectedIndex,
        //         onTap: (index) {
        //           setState(() {
        //             selectedIndex = index;
        //           });
        //         },
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       Builder(builder: (_) {
        //         List<KostModel> kosts = (selectedIndex == 0)
        //             ? []
        //             : (selectedIndex == 1)
        //                 ? []
        //                 : (selectedIndex == 2)
        //                     ? []
        //                     : [];
        //         return Column(
        //           children: kosts
        //               .map((e) => KostTile(
        //                     kost: e,
        //                   ))
        //               .toList(),
        //         );
        //       }),
        //       SizedBox(height: 80),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
