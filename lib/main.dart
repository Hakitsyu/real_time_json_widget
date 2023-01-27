import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:real_time_json_widget/cubit/json_cubit.dart';
import 'package:real_time_json_widget/cubit/upgradeable_cubit.dart';
import 'package:real_time_json_widget/json-dynamic/view/json_dynamic_widget.dart';
import 'package:real_time_json_widget/write/view/write_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Json to Widget';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: const Color(0xff2b2b2b),
        ),
        body: Body(create: (_) => JsonCubit())
      )
    );
  }
}

typedef Create<T> = T Function(BuildContext context);

// ignore: must_be_immutable
class Body<TCubit extends UpgradeableCubit<String>> extends StatelessWidget {
  Create<TCubit> create;
  final JsonWidgetRegistry _registry = JsonWidgetRegistry.instance;

  Body({ required this.create, super.key });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: create,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            WriteWidget<TCubit>(),
            JsonDynamicWidget<TCubit>(registry: _registry)
          ],
        ),
      ),
    );
  }

}