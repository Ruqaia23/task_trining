import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_app/data/hive_dataStore.dart';
import 'package:task_app/home.dart';
import 'package:task_app/models/task.dart';

Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapter<Task>(TaskAdapter());

//open Box
  var box = await Hive.openBox<Task>(HiveDatastore.boxName);

  runApp(BaseWidget(
    child: const MyApp(),
  ));
}

class BaseWidget extends InheritedWidget {
  BaseWidget({Key? Key, required this.child}) : super(key: Key, child: child);
  final HiveDatastore datastore = HiveDatastore();
  final Widget child;

  static BaseWidget of(BuildContext context) {
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();
    if (base != null) {
      return base;
    } else {
      throw StateError('could not find ancestor widget of type BaseWidget ');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
