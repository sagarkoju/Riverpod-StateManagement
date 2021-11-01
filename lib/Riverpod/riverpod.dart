import 'package:flutter/material.dart';
import 'package:riverpodapp/Page/future_provider.dart';
import 'package:riverpodapp/Page/home.dart';
import 'package:riverpodapp/Page/provider.dart';
import 'package:riverpodapp/Page/silverappbar.dart';
import 'package:riverpodapp/Page/state_Provider.dart';
import 'package:riverpodapp/Page/state_notifier_provider.dart';
import 'package:riverpodapp/Page/state_provider1.dart';
import 'package:riverpodapp/Page/stream_provider.dart';
import 'package:riverpodapp/Widget/button.dart';
import 'package:riverpodapp/Page/change_Notifier.dart';

class RiverPod extends StatefulWidget {
  @override
  _RiverPodState createState() => _RiverPodState();
}

class _RiverPodState extends State<RiverPod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverPod Example"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
            Button(
                text: "Change Notifier",
                onclicked: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ChangesNotifierScreen()));
                }),
            Button(
                text: "Provider",
                onclicked: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ProviderScreen()));
                }),
            Button(
                text: "State Provider",
                onclicked: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => StateProviderScreen()));
                }),
            Button(
                text: "Future Provider",
                onclicked: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => FutureProviderScreen()));
                }),
            Button(
                text: " Stream Provider",
                onclicked: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => StreamProviderScreen()));
                }),
            Button(
                text: " State Provider 1",
                onclicked: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => StateScreen()));
                }),
            Button(
                text: " State Notifier provider",
                onclicked: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => StateNotifierScreen()));
                }),
            Button(
                text: "Sliver App Bar",
                onclicked: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SilverAppBarScreen()));
                }),
            Button(
                text: "Api Call From Riverpod",
                onclicked: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => HomeScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
