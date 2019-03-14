import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Notation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Color border = Colors.black38;
  Color fill;
  List<double> lineNote = [1.0, 1.0, 1.0, 1.0, 1.0];

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Container(
                height: deviceHeight * 0.4,
                width: deviceWidth * 0.8,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, i) {
                        switch(i) {
                          case 0:
                            fill = Color(0xffffb06c);
                            break;
                          case 1:
                            fill = Colors.deepOrange[200];
                            break;
                          case 2:
                            fill = Colors.pink[200];
                            break;
                          case 3:
                            fill = Colors.amber[200];
                            break;
                            case 4:
                              fill = Colors.lightBlue[200];
                          break;
                        }
                      return ListTile(
                        enabled: false,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(lineNote[i].toInt().toString()),
                            ),
                            Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width * 0.6,
                                      child: GridView.builder(
                                          physics: NeverScrollableScrollPhysics(),
                                          itemCount: 5,
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 5
                                          ),
                                          itemBuilder: (context, j) {
                                            return Align(
                                              alignment: Alignment.topCenter,
                                              child: lineNote[i] > j
                                                  ? Icon(Icons.star, color: fill, size: 30,)
                                                  : Icon(Icons.star_border, color: border, size: 30,),
                                            ) ;
                                          })
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.6,
                                    child: Slider(
                                        activeColor: Colors.transparent,
                                        inactiveColor: Colors.transparent,
                                        value: lineNote[i].toDouble(),
                                        min: 1.0,
                                        max: 5.0,
                                        divisions: 4,
                                        onChanged: (double d) {
                                          setState(() {
                                            lineNote[i] = d;
                                          });
                                          print(lineNote[i]);
                                          setState(() {
                                              lineNote[i] = d;
                                          });
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
