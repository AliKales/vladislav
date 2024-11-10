import 'package:caroby/caroby.dart';
import 'package:flutter/material.dart';
import 'package:vladislav/pages/order_list_page/order_list_page_view.dart';
import 'package:vladislav/pages/tables_page/tables_page_view.dart';

part 'widgets/custom_tab.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabel service'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text('App Name'),
            ),
            ListTile(
              title: const Text('Order List'),
              leading: const Icon(Icons.list),
              onTap: () {
                Navigator.pop(context);
                context.navigatorPush(const OrderListPageView());
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: context.colorScheme.secondary,
        selectedItemColor: context.colorScheme.primary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Exit'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Order List'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'To Go'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'Quick Order'),
        ],
      ),
      body: Column(
        children: [
          const CustomTab(),
          PageView(
            children: const [
              TablesPageView(),
            ],
          ).expanded,
        ],
      ),
    );
  }
}
