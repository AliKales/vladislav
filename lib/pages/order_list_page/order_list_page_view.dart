import 'package:caroby/caroby.dart';
import 'package:flutter/material.dart';
import 'package:vladislav/core/db.dart';
import 'package:vladislav/models/m_order.dart';

class OrderListPageView extends StatefulWidget {
  const OrderListPageView({super.key});

  @override
  State<OrderListPageView> createState() => _OrderListPageViewState();
}

class _OrderListPageViewState extends State<OrderListPageView> {
  List<MOrder> orders = [];
  @override
  void initState() {
    super.initState();

    Db.get(Tables.ROrder).then(
      (value) {
        orders = value.map((e) => MOrder.fromJson(e)).toList();

        if (mounted) {
          setState(() {});
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order List'),
      ),
      body: Padding(
        padding: Values.paddingPage(context),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final item = orders[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#${item.id} (quick order)',
                  style: context.textTheme.titleMedium,
                ),
                Text(
                  '${item.total.toStringAsFixed(2)} \$',
                  style: context.textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                Text(
                  '${item.orderAt.hhMM} - ${item.orderAt.toStringFromDate}',
                  style: context.textTheme.titleMedium,
                ),
                const SizedBox(height: 5),
                ...List.generate(
                  item.meals.length,
                  (index) {
                    final meal = item.meals[index];
                    return Container(
                      padding: const EdgeInsets.only(left: 5),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(color: Colors.blue, width: 3),
                        ),
                      ),
                      child: Text(
                        '${meal.count.toInt()}* ${meal.name}',
                        style: context.textTheme.titleMedium,
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _button(text: 'Info'),
                    const SizedBox(width: 5),
                    _button(text: 'Pay'),
                    const SizedBox(width: 5),
                    _button(text: 'Print', color: Colors.green),
                    const SizedBox(width: 5),
                    _button(text: 'Void', color: Colors.grey),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Container _button({required String text, Color? color}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color ?? Colors.blue, width: 2),
      ),
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: context.textTheme.titleMedium,
      ),
    );
  }
}
