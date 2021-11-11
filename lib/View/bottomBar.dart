import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parasut_ziddioglu/Provider/pageIndex.dart';
import 'package:parasut_ziddioglu/View/profile.dart';
import 'package:parasut_ziddioglu/View/spirit.dart';
import 'package:provider/provider.dart';

import 'Custom_Widgets/picture_card.dart';
import 'curiosity.dart';
import 'landing_page.dart';
import 'opportunity.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      {'page': Curiosity(), 'title': "Curiosity"},
      {'page': Opportunity(), 'title': "Opportunity"},
      {'page': Spirit(), 'title': "Spirit"},
      {'page': Profile(), 'title': "Profile"}, //was Profile()
    ];
  }

  @override
  Widget build(BuildContext context) {
    PageIndex pageIndex = Provider.of<PageIndex>(context);
    int myPageIndex = pageIndex.myPageIndex;

    return SafeArea(
        child: Scaffold(
      body: Center(child: _pages[myPageIndex]["page"]),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xF4F4F4),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: pageIndex.setPageIndex,
          backgroundColor: Colors.deepOrange, //Theme.of(context).primaryColor,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.white,
          currentIndex: myPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.space_dashboard),
              tooltip:
                  'Curiosity', //tooltip is the text which hovers above the icon
              label: 'Curiosity',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_repair_rounded),
              tooltip: 'Opportunity',
              label: 'Opportunity',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm_add_sharp),
              tooltip: 'Spirit',
              label: 'Spirit',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              tooltip: 'Profile',
              label: "Profile",
            ),
          ],
        ),
      ),
    ));
  }
}
