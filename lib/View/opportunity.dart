import 'package:flutter/material.dart';
import 'package:parasut_ziddioglu/Provider/opportunitySpecs.dart';
import 'package:parasut_ziddioglu/Provider/pictures.dart';
import 'package:provider/provider.dart';
import 'Custom_Widgets/appBar.dart';
import 'Custom_Widgets/opportunity_app_drawer.dart';
import 'Custom_Widgets/picture_card.dart';

class Opportunity extends StatelessWidget {
  const Opportunity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OpportunityAppDrawer(roverType: "Opportunity"),
      appBar: MyAppBar(pageName: "Opportunity"),
      body: FutureBuilder(
        future: Provider.of<Pictures>(context, listen: false)
            .fetchPics(Provider.of<OpportunitySpecs>(context).getHtml()),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              //error handling stuff goes here
              return Center(
                child: Text('An error occured!'),
              );
            } else {
              return Consumer<Pictures>(
                builder: (ctx, picData, child) => (picData.allPics.length == 0)
                    ? Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/crash.jpg"),
                              fit: BoxFit.fitHeight),
                        ),
                        child: Center(
                          child: Text(
                            "Nothing to show",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                          ),
                        ),
                      )
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 1,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: picData.allPics.length,
                        itemBuilder: (ctx, i) {
                          return MyCard(url: picData.allPics[i].urlString);
                        },
                      ),
              );
            }
          }
        },
      ),
    );
  }
}
