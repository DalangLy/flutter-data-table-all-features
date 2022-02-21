import 'package:flutter/material.dart';

class OnlyDataTable extends StatelessWidget {
  const OnlyDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text('ID'),
              ),
              DataColumn(
                label: Text('Code'),
              ),
              DataColumn(
                label: Text('Name'),
              )
            ],
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('id1',),),
                  DataCell(Text('code1',),),
                  DataCell(Text('name1',),),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('id2',),),
                  DataCell(Text('code2',),),
                  DataCell(Text('name2',),),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('id3',),),
                  DataCell(Text('code3',),),
                  DataCell(Text('name3',),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
