import 'package:androiditem/core/home/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';

var routes = {
  "home_page":(context) => HomePage(),
};


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'lb home page'),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const[
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: (setting){
        var route = routes[setting.name];
        if(route == null){
          throw new Exception("The current route does not exist");
        }
        return MaterialPageRoute(builder: (BuildContext context) { return route(setting.arguments); });
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        titleTextStyle: TextStyle(),
        centerTitle: true,
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('${S.current.home_page}'),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              title: Text('${S.current.center}'),
              icon: Icon(Icons.add_location_alt_outlined)
          ),
          BottomNavigationBarItem(
              title: Text('${S.current.me}'),
              icon: Icon(Icons.perm_identity)
          ),
        ],
        // onTap: ,
      ),
    );
  }
}

