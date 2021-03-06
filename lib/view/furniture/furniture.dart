import 'package:flutter/material.dart';
import '../home_page/home.dart';
import 'shopping.dart';
import 'productdescription.dart';
import 'stats.dart';

class Furniture extends StatelessWidget {
  const Furniture({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => const MyApp(),
          '/shopping': (BuildContext context) => const Shopping(),
          '/productdescription': (BuildContext context) =>
              const ProductDescription(),
          '/stats': (BuildContext context) => const Stats(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw const FormatException(
            "An error occurred when converting a color");
      }
    }
    return val;
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 250.0,
                    width: double.infinity,
                    color: Color(getColorHexFromStr('#FDD148')),
                  ),
                  Positioned(
                    bottom: 50.0,
                    right: 100.0,
                    child: Container(
                      height: 400.0,
                      width: 400.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200.0),
                          color: Color(getColorHexFromStr('#FEE16D'))
                              .withOpacity(0.4)),
                    ),
                  ),
                  Positioned(
                    bottom: 100.0,
                    left: 150.0,
                    child: Container(
                        height: 300.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(150.0),
                            color: Color(getColorHexFromStr('#FEE16D'))
                                .withOpacity(0.5))),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 15.0),
                      Row(
                        children: <Widget>[
                          const SizedBox(width: 15.0),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 2.0),
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/chris.jpg'))),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width - 120.0),
                          Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: const Icon(Icons.home),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/home');
                              },
                              color: Colors.white,
                              iconSize: 38.0,
                            ),
                          ),
                          const SizedBox(height: 15.0),
                        ],
                      ),
                      const SizedBox(height: 50.0),
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Hello , Pino',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'What do you want to buy?',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Material(
                          elevation: 8.0,
                          borderRadius: BorderRadius.circular(5.0),
                          child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Color(getColorHexFromStr('#FEDF62')),
                                    size: 35.0,
                                  ),
                                  contentPadding: const EdgeInsets.only(
                                      left: 15.0, top: 15.0),
                                  hintText: 'Search',
                                  hintStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Quicksand'))),
                        ),
                      ),
                      const SizedBox(height: 10.0)
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              Stack(
                children: <Widget>[
                  const SizedBox(height: 10.0),
                  Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(35),
                      child: Container(height: 75.0, color: Colors.white)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: 80.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/sofas.png'))),
                            ),
                            const Text(
                              'Sofas',
                              style: TextStyle(fontFamily: 'Quicksand'),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/wardrobe.png'))),
                            ),
                            const Text(
                              'Wardrobe',
                              style: TextStyle(fontFamily: 'Quicksand'),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/desks.png'))),
                            ),
                            const Text(
                              'Desk',
                              style: TextStyle(fontFamily: 'Quicksand'),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/dressers.png'))),
                            ),
                            const Text(
                              'Dresser',
                              style: TextStyle(fontFamily: 'Quicksand'),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/productdescription');
                },
                child:
                    itemCard('FinnNavian', 'assets/images/ottoman.jpg', false),
              ),
              itemCard('FinnNavian', 'assets/images/anotherchair.jpg', false),
              itemCard('FinnNavian', 'assets/images/chair.jpg', true)
            ],
          )
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.yellow[700],
        child: TabBar(
          controller: controller,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            const Tab(icon: Icon(Icons.event_seat, color: Colors.white)),
            const Tab(icon: Icon(Icons.timer, color: Colors.grey)),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/shopping');
              },
              child: const Tab(
                  icon: Icon(Icons.shopping_cart, color: Colors.grey)),
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/stats');
                },
                child: const Tab(
                    icon: Icon(Icons.person_outline, color: Colors.grey)))
          ],
        ),
      ),
    );
  }

  Widget itemCard(String title, String imgPath, bool isFavorite) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 25.0),
      child: Container(
        height: 170.0,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              width: 140.0,
              height: 150.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imgPath), fit: BoxFit.cover)),
            ),
            const SizedBox(width: 4.0),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 45.0),
                    Material(
                      elevation: isFavorite ? 2.0 : 2.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: isFavorite
                                ? Colors.grey.withOpacity(0.3)
                                : Colors.white),
                        child: Center(
                          child: isFavorite
                              ? const Icon(Icons.favorite_border)
                              : const Icon(Icons.favorite, color: Colors.red),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5.0),
                const SizedBox(
                  width: 175.0,
                  child: Text(
                    'Scandinavian small sized double sofa imported full leather / Dale Italia oil wax leather black',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        color: Colors.grey,
                        fontSize: 13.0),
                  ),
                ),
                const SizedBox(height: 5.0),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 35.0),
                    Container(
                      height: 40.0,
                      width: 50.0,
                      color: Color(getColorHexFromStr('#F9C335')),
                      child: const Center(
                        child: Text(
                          '\$248',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      height: 40.0,
                      width: 100.0,
                      color: Color(getColorHexFromStr('#FEDD59')),
                      child: const Center(
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 7.0,
                                color: Colors.black,
                                offset: Offset(3.0, 3.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
