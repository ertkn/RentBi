import 'package:capstone/screens/home/home_screen.dart';
import 'package:capstone/screens/sign_in/sign_in_screen.dart';
import 'package:capstone/screens/profile/profile_screen.dart';
import 'package:capstone/screens/sign_up/sign_up_screen.dart';
import 'package:capstone/screens/sign_up_post/sign_up_post.dart';
import 'package:capstone/utilities/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
/*      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),*/
      //home: const MyHomePage(title: 'RentBi'),
      // home: LoginScreen(),
      theme: theme(),
      initialRoute: '/home',
      routes: {
        '/' : (context) => LoginScreen(),
        '/home' : (context) => HomeScreen(),
        '/signup' : (contex) => SignupScreen(),
        '/profile' : (contex) => ProfileScreen(),
        '/signuppost' : (contex) => SignUpPost(),

        // '/login' : (contex) => LoginScreen(),
      },
      // home: SignupScreen(),
      // home: HomeScreen(),
    );
  }
}
/*

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Widget _sizedBox (double _height, double _width) => SizedBox(height: _height, width: _width);


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            _sizedBox(50, 0),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            _sizedBox(15,0),
            GestureDetector(
              onTap: _incrementCounter,
              child: Container(
                  color: const Color(0xff9575cd),
                  padding: const EdgeInsets.fromLTRB(30,15,30,15),
                  height: 50,
                  width: 145,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //padding: EdgeInsets.all(0),
                      children: <Widget>[
                        const Icon(Icons.email_rounded),
                        _sizedBox(0,10),
                        Text((_counter%2) > 0 ? 'ODD: ${_counter%2}' : 'EVEN: ${_counter%2}'),
                      ]
                  )
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: const Color(0xff9575cd),
        tooltip: 'Increment',
        child: const Icon(Icons.add),

      ),
    );
  }
}
*/
