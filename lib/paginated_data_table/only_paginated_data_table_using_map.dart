import 'package:flutter/material.dart';

class OnlyPaginatedDataTableUsingMap extends StatefulWidget {
  const OnlyPaginatedDataTableUsingMap({Key? key}) : super(key: key);

  @override
  _OnlyPaginatedDataTableUsingMapState createState() =>
      _OnlyPaginatedDataTableUsingMapState();
}

class _OnlyPaginatedDataTableUsingMapState extends State<OnlyPaginatedDataTableUsingMap> {

  final List<Map<String, dynamic>> _products = List.generate(
    200,
    (index) => {'id': index, 'code': 'Code $index', 'name': 'Name $index'},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PaginatedDataTable(
          columnSpacing: 10,
          source: MyProduct(_products),
          header: const Text('My Product List'),
          columns: const <DataColumn>[
            DataColumn(
              label: Text('ID'),
            ),
            DataColumn(
              label: Text('Code'),
            ),
            DataColumn(
              label: Text('Name'),
            ),
          ],
          rowsPerPage: 5,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
          showCheckboxColumn: false,
        ),
      ),
    );
  }
}

class MyProduct extends DataTableSource {
  final List<Map<String, dynamic>> _data;

  MyProduct(this._data);

  @override
  DataRow? getRow(int index) {
    return DataRow(
        onSelectChanged: (bool? value) {
          print('select $index $value');
        },
        cells: [
          DataCell(
            Text(
              _data[index]['id'].toString(),
            ),
          ),
          DataCell(
            Text(
              _data[index]['code'].toString(),
            ),
          ),
          DataCell(
            Text(
              _data[index]['name'].toString(),
            ),
          ),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
