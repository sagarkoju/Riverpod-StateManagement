import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodapp/controller/home_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final data = watch(getDataScreen);
    return Scaffold(
        appBar: AppBar(
          title: Text('Api Call from Riverpod'),
          centerTitle: true,
        ),
        body: data.listData.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey,
                    child: ListTile(
                      leading: Text(data.listData[index].id.toString()),
                      title: Text(data.listData[index].title),
                      subtitle: Text(data.listData[index].body),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: data.listData.length));
  }
}
