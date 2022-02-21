import 'package:flutter/material.dart';

class PaginatedDataTableWithSort extends StatefulWidget {
  const PaginatedDataTableWithSort({Key? key}) : super(key: key);

  @override
  _PaginatedDataTableWithSortState createState() => _PaginatedDataTableWithSortState();
}

class _PaginatedDataTableWithSortState extends State<PaginatedDataTableWithSort> {

  final List<Map<String, dynamic>> _products = List.generate(
    200, (index) => {
      'id': index,
      'code': 'Code $index',
      'name': 'Name $index'
    },
  );

  late List<Map<String, dynamic>> _filteredProducts;

  int _currentSortColumn = 0;
  bool _isAscending = true;

  @override
  void initState() {
    super.initState();

    _filteredProducts = _products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: PaginatedDataTable(
            columnSpacing: 10,
            source: MyProduct(_filteredProducts),
            sortColumnIndex: _currentSortColumn,
            sortAscending: _isAscending,
            header: const Text('My Product List'),
            columns: <DataColumn>[
              DataColumn(
                label: const Text('ID'),
                onSort: _sortId,
              ),
              const DataColumn(
                label: Text('Code'),
              ),
              const DataColumn(label: Text('Name'),),
            ],
            rowsPerPage: 5,
            actions: <Widget>[
              SizedBox(
                width: 150,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  onChanged: search,
                ),
              ),
              IconButton(onPressed: (){}, icon: const Icon(Icons.add),),
              IconButton(onPressed: (){}, icon: const Icon(Icons.refresh),),
              IconButton(onPressed: (){}, icon: const Icon(Icons.filter_alt),),
            ],
            showCheckboxColumn: false,
            showFirstLastButtons: true,
          ),
        ),
      ),
    );
  }

  //search
  void search(String? searchKeyWord){
    final List<Map<String, dynamic>> result = _products.where((element) => element['id'].toString().contains(searchKeyWord!)).toList();
    if(result.isEmpty){
      setState(() {
        _filteredProducts = _products;
      });
    }else{
      setState(() {
        _filteredProducts = result;
      });
    }
  }

  void _sortId(int? columnIndex, bool? isAscending){
    setState(() {
      _currentSortColumn = columnIndex!;
      _isAscending = isAscending!;
      if (!isAscending) {
        // sort the product list in Ascending, order by Price
        _filteredProducts.sort((productA, productB) =>
        productB['id'].compareTo(productA['id']));
      } else {
        // sort the product list in Descending, order by Price
        _filteredProducts.sort((productA, productB) =>
        productA['code'].compareTo(productB['code']));
      }
    });
  }
}


class MyProduct extends DataTableSource{
  final List<Map<String, dynamic>> _data;

  MyProduct(this._data);

  @override
  DataRow? getRow(int index) {
    return DataRow(
        onSelectChanged: (bool? value) {
          print('select $index $value');
        },
        cells: [
          DataCell(Text(_data[index]['id'].toString(),),),
          DataCell(Text(_data[index]['code'].toString(),),),
          DataCell(Text(_data[index]['name'].toString(),),),
        ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
