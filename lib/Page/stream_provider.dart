import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(Duration(seconds: 2), (num) {
    if (num < 5) {
      return num + 1;
    } else {
      return 5;
    }
  });
});

class StreamProviderScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final stream = useProvider(streamProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Provider"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: stream.when(
            data: (data) => Text("Stream Provider   " + data.toString()),
            loading: () => CircularProgressIndicator(),
            error: (err, stack) => Text("An error has been Occur")),
      ),
    );
  }
}
