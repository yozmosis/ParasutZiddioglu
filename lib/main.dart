import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/authStatus.dart';
import 'Provider/curiositySpecs.dart';
import 'Provider/opportunitySpecs.dart';
import 'Provider/spiritSpecs.dart';
import 'Provider/pageIndex.dart';
import 'Provider/pictures.dart';
import 'View/enlargedImage.dart';
import 'View/landing_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthStatus(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CuriositySpecs("1", "1"),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OpportunitySpecs("1", "1"),
        ),
        ChangeNotifierProvider(
          create: (ctx) => SpiritSpecs("1", "1"),
        ),
        ChangeNotifierProvider(
          create: (ctx) => PageIndex(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Pictures(),
        )
      ],
      child: MaterialApp(
        routes: {
          EnlargedImage.routeName: (ctx) => EnlargedImage(),
        },
        title: 'Rover',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LandingPage(),
      ),
    );
  }
}
