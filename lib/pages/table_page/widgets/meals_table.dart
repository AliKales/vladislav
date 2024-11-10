part of '../table_page_view.dart';

class _MealsTable extends StatelessWidget {
  const _MealsTable({super.key, required this.meals});

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meals.length,
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (context, index) {
        final item = meals[index];
        final isLast = index == meals.count;
        return Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.only(left: 10),
          constraints: const BoxConstraints(
            minHeight: 50,
          ),
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: Colors.blue, width: 5),
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '${item.count}*  ',
                    style: context.textTheme.titleMedium!
                        .copyWith(color: Colors.blue),
                  ),
                  Text(
                    item.name,
                    style: context.textTheme.titleMedium!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ).expanded,
                  Text(
                    '${item.price} \$',
                    style: context.textTheme.titleMedium!
                        .copyWith(color: Colors.blue),
                  ),
                ],
              ),
              if (isLast)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      RoundedText(text: 'Sales TAX +%7.5'),
                      SizedBox(width: 5),
                      RoundedText(text: 'SVC +%4.0'),
                    ],
                  ),
                ),
              if (isLast)
                Row(
                  children: [
                    _customRoundedWidget(
                        const Icon(Icons.local_fire_department)),
                    _customRoundedWidget(const Icon(Icons.pause)),
                    _customRoundedWidget(const Icon(Icons.schedule)),
                    const SizedBox(width: 15),
                    _customRoundedWidget(
                      const Text(
                        '%',
                        style: TextStyle(color: Colors.green),
                      ),
                      color: Colors.green,
                    ),
                    _customRoundedWidget(
                        const Text(
                          'Note',
                        ),
                        color: Colors.blue,
                        width: null),
                    _customRoundedWidget(const Icon(Icons.delete)),
                    Text(' ${item.count}   '),
                    _customRoundedWidget(const Icon(Icons.add)),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  Container _customRoundedWidget(
    Widget child, {
    Color? color,
    double? width = 30,
  }) {
    return Container(
      width: width,
      height: 30,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        border: Border.all(color: color ?? Colors.black),
        borderRadius: BorderRadius.circular(6),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: child,
        ),
      ),
    );
  }
}
