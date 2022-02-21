import 'package:flutter/material.dart';
import '../product.dart';

class OnlyDataTableUsingMapList extends StatefulWidget {
  const OnlyDataTableUsingMapList({Key? key}) : super(key: key);

  @override
  _OnlyDataTableUsingMapListState createState() => _OnlyDataTableUsingMapListState();
}

class _OnlyDataTableUsingMapListState extends State<OnlyDataTableUsingMapList> {
  final List<Product> _products = List.generate(200, (index) => Product('id$index', 'code$index', 'name$index'),);
  final List<String> _tableHeaderTitles = [
    'ID',
    'Code',
    'Name',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: DataTable(
            columns: _tableHeaderTitles.map<DataColumn>((tableHeaderTitle) {
              return DataColumn(
                label: Text(tableHeaderTitle),
              );
            }).toList(),
            rows: _products.map<DataRow>((product) {
              return DataRow(
                cells: <DataCell>[
                  DataCell(Text(product.id,),),
                  DataCell(Text(product.code,),),
                  DataCell(Text(product.name,),),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
