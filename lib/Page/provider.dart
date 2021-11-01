import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final provider = Provider<String>((ref) => 'Sagar Koju');
final provider1 = Provider<int>((ref) => 40);

class ProviderScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // final number = watch(provider);
    // final number1 = watch(provider1);
    final number = useProvider(provider);
    final number1 = useProvider(provider1);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Name " + number,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              number1.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
