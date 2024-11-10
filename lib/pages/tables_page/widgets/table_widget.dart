part of '../tables_page_view.dart';

class _TableWidget extends StatelessWidget {
  const _TableWidget({
    super.key,
    required this.table,
  });

  final MTable table;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.navigatorPush(TablePageView(id: table.name ?? '')),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            const Spacer(),
            Text(table.name ?? ''),
            const Spacer(),
            const Text('User'),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(12)),
                color: table.hasCustomer.isFalse
                    ? Colors.green
                    : Colors.red.shade300,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('1/4'),
                  if (table.hasCustomer.isTrue) Text(table.orderAt?.hhMM ?? ''),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
