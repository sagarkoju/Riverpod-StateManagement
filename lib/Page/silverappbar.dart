
import 'dart:convert';


// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:riverpodapp/model/resturant.dart';

class SilverAppBarScreen extends StatefulWidget {
  const SilverAppBarScreen({
    Key key,
  }) : super(key: key);

  @override
  _SilverAppBarWithTabBarState createState() => _SilverAppBarWithTabBarState();
}

class _SilverAppBarWithTabBarState extends State<SilverAppBarScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  bool isshow = false;
  Autogenerated foodItems;
  List<Widget> tabs = [
    TabViewList(title: 'Tab1'),
    TabViewList(title: 'Tab2'),
    TabViewList(title: 'Tab3'),
  ];

  @override
  void initState() {
    super.initState();
    getFood();
      controller = TabController(
      length: foodItems?.data?.length,
      vsync: this,
    );
    
  }

  getFood() async {
    final response = await http.get(
      Uri.parse(
          'http://backend.quickbites.delivery/api/restaurant_food_list/94?fbclid=IwAR17F2cHG0aMJkuZPuomVdGMfKh_tf6sKatz0i3OkPdpgFdzGASPlIJCucg'),
    );
    Map<String, dynamic> data =
        new Map<String, dynamic>.from(json.decode(response.body));
     foodItems = Autogenerated.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverSafeArea(
                top: false,
                sliver: SliverAppBar(
                  expandedHeight: 400.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text("Collapsing Toolbar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          )),
                      background: Image.network(
                        "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
//
          ];
        },
        body: Container(
          child: Column(
            children: [
              DefaultTabController(
                length: foodItems?.data?.length ,
                child: TabBar(
                  controller: controller,
                  labelColor: Colors.black87,
                  unselectedLabelColor: Colors.grey,
                  tabs: foodItems.data.map((e) {
                          return Tab(
                            child: Container(
                              child: Text("${e.name}"),
                            ),
                          );
                        }).toList()
                      
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabViewList extends StatefulWidget {
  final String title;
  TabViewList({this.title});
  _TabViewListState createState() => _TabViewListState();
}

class _TabViewListState extends State<TabViewList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        primary: true,
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            trailing: Icon(Icons.access_alarm),
            leading: Icon(Icons.accessibility_new),
            title: Text('${widget.title}'),
            subtitle: Text("Flutter Tutorial"),
          );
        },
      ),
    );
  }
}