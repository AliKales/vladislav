part of '../main_page_view.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Divider(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 14),
          margin: EdgeInsets.only(bottom: 7),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.blue, width: 2.5),
            ),
          ),
          child: Text(
            'Default Room',
            style: context.textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}

