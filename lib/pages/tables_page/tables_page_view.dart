import 'package:caroby/caroby.dart';
import 'package:flutter/material.dart';
import 'package:vladislav/core/db.dart';
import 'package:vladislav/extensions/ext_num.dart';
import 'package:vladislav/models/m_table.dart';
import 'package:vladislav/pages/table_page/table_page_view.dart';

part 'widgets/table_widget.dart';

class TablesPageView extends StatefulWidget {
  const TablesPageView({super.key});

  @override
  State<TablesPageView> createState() => _TablesPageViewState();
}

class _TablesPageViewState extends State<TablesPageView> {
  List<MTable> _tables = [];

  @override
  void initState() {
    super.initState();

    Db.get(Tables.RTable).then(
      (value) {
        _tables = value.map((e) => MTable.fromJson(e)).toList();

        if (mounted) {
          setState(() {});
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        padding: const EdgeInsets.all(16),
        children: List.generate(_tables.length, (index) {
          final item = _tables[index];
          return _TableWidget(
            table: item,
          );
        }),
      ),
    );
  }
}
