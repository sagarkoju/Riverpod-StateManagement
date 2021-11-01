import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final stateprovider = StateProvider.autoDispose<int>((ref) => 0);
// autodispose is automatically destroy its state when it is no longer listen

class StateScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final state1 = watch(stateprovider);
    final counter = state1.state.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("State Provider"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          state1.state++;
          // Next Method
          // final  provider = context.read(stateprovider);
          //  provider.state ++;
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          counter,
          textScaleFactor: 2,
        ),
      ),
    );
  }
}
