import 'package:coincanvas/repositories/book_respository.dart';
import 'package:coincanvas/widgets/home_screen/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookListWidget extends StatelessWidget {
  const BookListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BookRepository>(
      builder: (context, ref, child) {
        // This is the entries list
        return ListView.builder(
          itemCount: ref.bookList.length,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            // This is used to display the list items in the reverse order
            // To achieve this, reverseIndex is passed for the index parameter of the HomeScreenListItemWidget
            final reversedIndex = ref.bookList.length - 1 - index;
            return Padding(
              padding: EdgeInsets.only(
                top: index == 0 ? 15 : 0,
                bottom: index == ref.bookList.length ? 15 : 0,
              ),
              child: BookWidget(index: reversedIndex),
            );
          },
        );
      },
    );
  }
}
