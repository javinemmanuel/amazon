import 'package:amazon_project/screens/login_screen.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Amazon Shopping',
                style: TextStyle(
                  color: Colors.black,
                )),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.white,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.logout_rounded,
                    color: Colors.blue,
                  ),
                  onPressed: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setBool('userstate', false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login_screen()),
                    );
                  })
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search Something',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 15),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 1,
                    child: Carousel(
                      images: [
                        Image(
                            image: NetworkImage(
                                'https://www.appier.com/hubfs/Imported_Blog_Media/black-friday-fashion-friends-1345082.jpg')),
                        Image(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')),
                        Image(
                            image: NetworkImage(
                                'https://www.callcentrehelper.com/images/stories/2022/04/shopping-320686681-760.jpg')),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categorie',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            maxRadius: 25,
                            backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1483181957632-8bda974cbc91?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
                          ),
                          CircleAvatar(
                            maxRadius: 25,
                            backgroundImage: NetworkImage(
                                'https://sasshoes-com.s3-us-west-2.amazonaws.com/img/SAS23-Sporty-Banner-feb23-mobile.jpg'),
                          ),
                          CircleAvatar(
                            maxRadius: 25,
                            backgroundImage: NetworkImage(
                                'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/71yPmhBDu+L._UX385_.jpg'),
                          ),
                          CircleAvatar(
                            maxRadius: 25,
                            backgroundImage: NetworkImage(
                                'https://cdn.cafecoton.com/delivery/public/image/750x-1/pr-33ls-slim-alvin-5-h22_2.jpeg?quality=75'),
                          ),
                          CircleAvatar(
                            maxRadius: 25,
                            backgroundImage: NetworkImage(
                                'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/71UXbfMHImS._UY445_.jpg'),
                          ),
                          CircleAvatar(
                            maxRadius: 25,
                            backgroundImage: NetworkImage(
                                'https://thumbs.dreamstime.com/b/handbags-colored-genuine-leather-44837875.jpg'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Card(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 3,
                                width: MediaQuery.of(context).size.width / 3,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4,
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      color: Colors.white,
                                      child: Image.network(
                                        'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F0a%2F0b%2F0a0badc54e57b7b408e22fcd924ee25c0ecc428b.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text(
                                      '₹-1600',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      'Mens-Shirt',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(37.0),
                              child: Card(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  width: MediaQuery.of(context).size.width / 3,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        color: Colors.white,
                                        child: Image.network(
                                          'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F0a%2F0b%2F0a0badc54e57b7b408e22fcd924ee25c0ecc428b.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        '₹-1200',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        'Mens-Shirt',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Card(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 3,
                                width: MediaQuery.of(context).size.width / 3,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4,
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      color: Colors.white,
                                      child: Image.network(
                                        'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F0a%2F0b%2F0a0badc54e57b7b408e22fcd924ee25c0ecc428b.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text(
                                      '₹-999',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      'Mens-Shirt',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
