import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';
import './screens/login.dart';
import './screens/home.dart';
import './screens/profile.dart';
import './screens/savedforms.dart';
import './screens/fillform.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value:Auth(),
        child: Consumer<Auth>(
        builder: (ctx, auth, ch) => MaterialApp(
      title: 'cfg',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
      home: auth.currentUser=="" ? AuthScreen() : Home(),
      routes: {
            AuthScreen.routeName: (ctx) => AuthScreen(),
            Home.routeName: (ctx) => Home(),
            Profile.routeName: (ctx) => Profile(),
            FillForm.routeName: (ctx) => FillForm(),
            SavedForms.routeName: (ctx)=> SavedForms()

      }
    )));
  }
}
