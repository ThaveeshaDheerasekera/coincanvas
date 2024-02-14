import 'package:coincanvas/repositories/entry_repository.dart';
import 'package:coincanvas/widgets/home/home_screen_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenListWidget extends StatelessWidget {
  const HomeScreenListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<EntryRepository>(
      builder: (context, ref, child) {
        // This is the entries list
        return ListView.builder(
          itemCount: ref.entiresList.length,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            // This is used to display the list items in the reverse order
            // To achieve this, reverseIndex is passed for the index parameter of the HomeScreenListItemWidget
            final reversedIndex = ref.entiresList.length - 1 - index;
            return HomeScreenListItemWidget(index: reversedIndex);
          },
        );
      },
    );
  }
}
