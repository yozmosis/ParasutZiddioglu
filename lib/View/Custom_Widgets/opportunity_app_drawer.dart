import 'package:flutter/material.dart';
import 'package:parasut_ziddioglu/Provider/opportunitySpecs.dart';
import 'package:provider/provider.dart';

class OpportunityAppDrawer extends StatelessWidget {
  OpportunityAppDrawer({required this.roverType});

  final String roverType;

  @override
  Widget build(BuildContext context) {
    final specs = Provider.of<OpportunitySpecs>(context);

    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/rover2.png"), fit: BoxFit.contain),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Container(
                  child: Text(
                    "Camera Type:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  margin: EdgeInsets.all(10),
                ),
                Spacer(),
                DropdownButton<String>(
                  items: specs.getCameraList().map(buildMenuItem).toList(),
                  onChanged: (value) {
                    specs.setCamera(value);
                  },
                ),
                SizedBox(width: 40),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: new InputDecoration(labelText: "Enter Page"),
                keyboardType: TextInputType.number,
                onChanged: (s) {
                  specs.setPage(s);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: new InputDecoration(labelText: "Enter sol"),
                keyboardType: TextInputType.number,
                onChanged: (s) {
                  specs.setSol(s);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
}

// Row(
// children: [
// Container(
// child: Text(
// "Page:",
// style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
// ),
// margin: EdgeInsets.all(10),
// ),
// Spacer(),
// DropdownButton<String>(
// items: pages.map(buildMenuItem).toList(),
// onChanged: (value) {
// spiritSpecs.setPage(value);
// },
// ),
// SizedBox(width: 40),
// ],
// ),
