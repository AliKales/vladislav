import 'package:caroby/caroby.dart';
import 'package:flutter/material.dart';
import 'package:vladislav/models/m_meal.dart';
import 'package:vladislav/pages/table_page/mixin_table_page.dart';
import 'package:vladislav/widgets/rounded_text.dart';

part 'widgets/top_icons.dart';
part 'widgets/meals_table.dart';

class TablePageView extends StatefulWidget {
  const TablePageView({super.key, required this.id});

  final String id;

  @override
  State<TablePageView> createState() => _TablePageViewState();
}

class _TablePageViewState extends State<TablePageView> with MixinTablePage {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: Values.paddingPage(context),
        child: Column(
          children: [
            const Divider(height: 0.5),
            _TopIcons(onSave: save),
            const Divider(height: 0.5),
            SizedBox(
              height: 0.33.toDynamicHeight(context),
              child: _MealsTable(meals: selectedMeals),
            ),
            const _HorizontalLine(),
            Row(
              children: [
                const Icon(Icons.menu),
                const SizedBox(width: 15),
                if (isSelected)
                  IconButton(
                    onPressed: unselect,
                    icon: const Icon(Icons.arrow_back),
                  ),
                Text(
                  selectedList?.key ?? 'Menu',
                  style: context.textTheme.titleMedium!.toBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ).expanded,
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.barcode_reader),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            Expanded(
              child: menusAndMeals(),
            ),
          ],
        ),
      ),
    );
  }

  GridView menusAndMeals() {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 2.8,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: isSelected ? generateMeals() : generateMenus(),
    );
  }

  List<Widget> generateMeals() {
    return List.generate(
      selectedList!.value.length,
      (index) {
        final item = selectedList!.value[index];
        return InkWell(
          onTap: () => addMeal(item),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(6),
            ),
            alignment: Alignment.center,
            child: Row(
              children: [
                Image.network(item.image),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '${item.price} \$',
                        style: context.textTheme.titleSmall!.copyWith(
                          color: Colors.green,
                        ),
                      ).right
                    ],
                  ),
                ).expanded,
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> generateMenus() {
    return List.generate(
      menuList.length,
      (index) {
        final item = menuList[index];
        return InkWell(
          onTap: () => selectList(index),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(6),
            ),
            alignment: Alignment.center,
            child: Text(
              item.key,
              style: context.textTheme.titleMedium,
            ),
          ),
        );
      },
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text('${widget.id}  ${calculateTotal().toStringAsFixed(2)} \$'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}

class _HorizontalLine extends StatelessWidget {
  const _HorizontalLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 5,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
