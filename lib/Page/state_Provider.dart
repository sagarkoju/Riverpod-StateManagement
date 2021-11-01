import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorPickerProvider = StateProvider<String>((ref) => '');
final colorProvider = Provider<String>((ref) {
  final color = ref.read(colorPickerProvider);

  return color.state = ' Red';
});

class StateProviderScreen extends ConsumerWidget {
  final String title = "State Provider";
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final colors = watch(colorPickerProvider).state;
    return Scaffold(
      backgroundColor: colors == 'Red' ? Colors.red : Colors.green,
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.legend_toggle,
            color: Colors.redAccent,
          ),
          onPressed: () => context.read(colorPickerProvider).state =
              colors == 'Red' ? 'green' : 'Red'),
      body: Container(
        child: Center(
          child: Text(
            "Hello World",
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
