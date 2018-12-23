import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'login.dart';

// void main() => runApp(MyApp());

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'T-Travel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;
  List<Widget> _children = [];

  void _onMapCreated(GoogleMapController controller) {
    setState(() { mapController = controller; });
  }

  @protected
  @mustCallSuper
  void initState() {
    _children = [
      LoginPage(title: "LOGIN",),
      Padding(
        padding: EdgeInsets.only(top: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                options: GoogleMapOptions(mapType: MapType.hybrid, cameraPosition: CameraPosition(
                  bearing: 0.0,
                  target: LatLng(40.5160895, -8.1294527),
                  tilt: 0.0,
                  zoom: 6.0,
                ),),
                // mapType: MapType.satellite
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.all(50.0),
        child: Text("POTATO")
      ),
      Padding(
        padding: EdgeInsets.all(50.0),
        child: Text("POTATO")
      ),
    ];
  }

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

  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text('M')),
          BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Map')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Me')),
          BottomNavigationBarItem(icon: Icon(Icons.zoom_out_map), title: Text('Find')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed
      ),
    );

  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}
