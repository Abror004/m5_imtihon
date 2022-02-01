import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  static const String id = "Home_Page";

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  List list = [
    ["Diner Steakhouse", 4, "Sushi • Seattle", "assets/images/image1.jpg"],
    ["Fire Hyper", 4, "Brunch • Springs", "assets/images/image2.jpg"],
    ["Deli Turbo", 3, "Burgers • Omaha", "assets/images/image3.jpg"],
    ["Deli Cious", 3, "Deli • Seattle", "assets/images/image4.jpg"],
    ["Deli Hyper", 3, "Makan • Los Angeles", "assets/images/image5.jpg"],
    ["lavash", 5, "Burgers • Tashkent", "assets/images/image6.jpg"],
    ["Big Burger", 5, "Burgers • Tashkent", "assets/images/image7.jpg"],
    ["Palov", 5, "food • Tashkent", "assets/images/image8.jpg"],
  ];
  List<int> length = [];
  List<int> sortList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < list.length; i++) {
      length.add(i);
    }
    for (int i = 0; i < 5; i++) {
      int num = Random().nextInt(length.length);
      sortList.add(length[num]);
      length.removeAt(num);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "FriendlyEats",
          style: TextStyle(fontSize: 20),
        ),
        leading: Icon(Icons.restaurant),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,
              color: Colors.blue,
              child: Container(
                margin: EdgeInsets.all(10),
                color: Colors.white,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.filter_list),
                    ),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "All Restaurants\n",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "by rating",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 2));
                  setState(() {
                    print(sortList);
                    for (int i = 0; i < list.length; i++) {
                      length.add(i);
                    }
                    for (int i = 0; i < 5; i++) {
                      int num = Random().nextInt(length.length);
                      sortList.add(length[num]);
                      length.removeAt(num);
                    }
                    print(sortList);
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height - 140,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          ((MediaQuery.of(context).size.width / 1080) + 1)
                              .toInt(),
                      childAspectRatio: 1.2,
                    ),
                    itemCount: sortList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            top: 5, left: 20, right: 20, bottom: 20),
                        width: MediaQuery.of(context).size.width,
                        // height: 250,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: Offset(0, 3),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(list[sortList[index]][3]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          list[sortList[index]][0],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "\$\$\$",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: Colors.yellowAccent.shade700,
                                            size: 25),
                                        Icon(Icons.star,
                                            color: Colors.yellowAccent.shade700,
                                            size: 25),
                                        Icon(Icons.star,
                                            color: Colors.yellowAccent.shade700,
                                            size: 25),
                                        Icon(Icons.star,
                                            color: Colors.yellowAccent.shade700,
                                            size: 25),
                                        Icon(Icons.star_half,
                                            color: Colors.yellowAccent.shade700,
                                            size: 25),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      list[sortList[index]][2],
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
