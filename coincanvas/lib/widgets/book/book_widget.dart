import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/models/book.dart';
import 'package:coincanvas/repositories/book_respository.dart';
import 'package:coincanvas/screens/entry/entry_list_screen.dart';
import 'package:coincanvas/widgets/global/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BookWidget extends StatefulWidget {
  final int index;
  final Book book;
  const BookWidget({required this.index, required this.book, super.key});

  @override
  State<BookWidget> createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
  bool _isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<BookRepository>(builder: (context, ref, child) {
      // Main container
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookHomeScreen(book: widget.book),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
            // Adding top, left and right border to every list item
            border: Border(
              top: BorderSide(
                  width: 0.5,
                  color: CustomColors.primaryColor.withOpacity(0.5)),
              left: BorderSide(
                  width: 0.5,
                  color: CustomColors.primaryColor.withOpacity(0.5)),
              right: BorderSide(
                  width: 0.5,
                  color: CustomColors.primaryColor.withOpacity(0.5)),
              // Bottom border is only visible on the first item of the list,
              // which is the bottom most item, because the list is reversed
              bottom: BorderSide(
                  width: 0.5,
                  color: widget.index == 0
                      ? CustomColors.primaryColor.withOpacity(0.5)
                      : Colors.transparent),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // This container is used to display the total
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: CustomColors.primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 15),
                      decoration: BoxDecoration(
                        color: CustomColors.blueColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      // Amount text
                      child: Text(
                        '${widget.book.total} ${widget.book.currency}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ExpandableTextWidget(
                title: widget.book.title,
                titleFontSize: 16,
                descriptionWidget: Text(
                  widget.book.description.isNotEmpty
                      ? widget.book.description
                      : '- No description -',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: CustomColors.primaryColor.withOpacity(0.5),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Table(
                border: TableBorder.all(
                    width: 0.5,
                    color: CustomColors.primaryColor.withOpacity(0.5)),
                children: [
                  summeryTableRow('Total Incomes',
                      '${widget.book.totalIncomes} ${widget.book.currency}'),
                  summeryTableRow('Total Expenses',
                      '${widget.book.totalExpenses} ${widget.book.currency}'),
                  summeryTableRow('Total Debt',
                      '${widget.book.totalDebts} ${widget.book.currency}'),
                  summeryTableRow('Total Receivables',
                      '${widget.book.totalReceivables} ${widget.book.currency}'),
                ],
              ),
              // This sizedBox is here to add some space between description and datetime
              const SizedBox(height: 10),
              // Formatted DateTime and Book ID
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Formatted DateTime
                  Text(
                    DateFormat('dd-MMM-yyyy | HH:mm:ss')
                        .format(widget.book.createdAt),
                    style: TextStyle(
                      color: CustomColors.primaryColor,
                      fontSize: 13.5,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Book ID
                  Text(
                    widget.book.id,
                    style: TextStyle(
                      color: CustomColors.primaryColor.withOpacity(0.5),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  TableRow summeryTableRow(String header, String value) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          header,
          style: TextStyle(
            color: CustomColors.primaryColor,
            fontSize: 13.5,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          value,
          style: TextStyle(
            color: CustomColors.primaryColor,
            fontSize: 13.5,
          ),
        ),
      ),
    ]);
  }
}
