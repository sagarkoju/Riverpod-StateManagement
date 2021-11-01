import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodapp/Widget/provider.dart';

final stateProvider = StateNotifierProvider((ref) => CounterStateNotifier());

class StateNotifierScreen extends HookWidget {
  @override
  Widget build(
    BuildContext context,
  ) {
    // final count = watch(stateProvider.state);
    final state = useProvider(stateProvider);
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "btm1",
            child: Icon(Icons.add),
            onPressed: () => context.read(stateProvider.notifier).add(),
          ),
          SizedBox(
            width: 30,
          ),
          FloatingActionButton(
              heroTag: "btn2",
              child: Icon(Icons.remove),
              onPressed: () => context.read(stateProvider.notifier).subtract()),
        ],
      ),
      body: Center(
        child: Text(
          '${state.toString()}',
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
