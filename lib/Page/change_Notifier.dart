import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodapp/utils/counter.dart';

final counterProvider = ChangeNotifierProvider<Counter>((ref) => Counter());

class ChangesNotifierScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final count = watch(counterProvider).count;
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "btm1",
            child: Icon(Icons.add),
            onPressed: () => context.read(counterProvider).increment(),
          ),
          SizedBox(
            width: 30,
          ),
          FloatingActionButton(
              heroTag: "btn2",
              child: Icon(Icons.remove),
              onPressed: () => context.read(counterProvider).subtract()),
        ],
      ),
      body: Center(
        child: Text(
          '${count.toString()}',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Change Notifier"),
      centerTitle: true,
      backgroundColor: Colors.teal,
    );
  }
}
