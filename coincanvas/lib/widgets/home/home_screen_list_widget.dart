import 'package:coincanvas/widgets/home/home_screen_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenListWidget extends StatelessWidget {
  const HomeScreenListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final reversedIndex = 5 - 1 - index;
        return Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: HomeScreenListItemWidget(index: reversedIndex));
      },
    );
  }
}
