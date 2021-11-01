import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final futureprovider = FutureProvider<int>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return 5;
});

class FutureProviderScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final number = useProvider(futureprovider);
    return Scaffold(
        appBar: AppBar(
          title: Text("Future Provider"),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Center(
            child: number.when(
                data: (data) {
                  return Text(data.toString());
                },
                loading: () => CircularProgressIndicator(),
                error: (object, stack) => Text("An Error as been occur"))));
  }
}
