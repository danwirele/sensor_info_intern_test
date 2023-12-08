import 'package:flutter/material.dart';
import 'package:sensor_info_intern_test/core/services/services.dart';
import 'package:sensor_info_intern_test/src/presentation/widgets/list_item.dart';

class MyAnimatedList extends StatefulWidget {
  const MyAnimatedList({super.key});

  @override
  MyAnimatedListState createState() => MyAnimatedListState();
}

class MyAnimatedListState extends State<MyAnimatedList> {
  final _sensorEventsMap = services<DataClass>().sensorEventsMap;
  final _listItems = <Widget>[];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _loadItems();
  }

  void _loadItems() {
    // fetching data from Map
    final fetchedList = <Widget>[];
    Color color;
    _sensorEventsMap.forEach((key, value) {
      switch (value.status) {
        case 1 || 5:
          color = Colors.green;
        case 2 || 3:
          color = Colors.red;
        case 4 || 7 || 8 || 9:
          color = Colors.yellow;
        default:
          color = Colors.grey;
      }
      fetchedList.add(ListItem(
        sensorEvent: value,
        color: color,
      ));
    });

    var future = Future(() {});
    for (var i = 0; i < fetchedList.length; i++) {
      future = future.then(
        (_) {
          return Future.delayed(
            const Duration(milliseconds: 60),
            () {
              _listItems.add(fetchedList[i]);
              _listKey.currentState?.insertItem(_listItems.length - 1);
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      padding: const EdgeInsets.only(top: 10),
      initialItemCount: _listItems.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: CurvedAnimation(
            curve: Curves.easeOut,
            parent: animation,
          ).drive((Tween<Offset>(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ))),
          child: _listItems[index],
        );
      },
    );
  }
}
