import 'package:flutter/material.dart';
import 'package:flutter_dat_table_all_features/paginated_data_table/only_paginated_data_table_using_map.dart';
import 'package:flutter_dat_table_all_features/paginated_data_table/paginated_data_table_with_sort.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PaginatedDataTableWithSort(),
    );
  }
}