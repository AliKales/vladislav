part of '../table_page_view.dart';

class _TopIcons extends StatelessWidget {
  const _TopIcons({
    super.key,
    required this.onSave,
  });

  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.save),
          onPressed: onSave,
        ),
        IconButton(
          icon: const Icon(Icons.print),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.card_giftcard),
          onPressed: () {},
        ),
      ],
    );
  }
}
