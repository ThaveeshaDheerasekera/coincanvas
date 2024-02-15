import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/repositories/book_respository.dart';
import 'package:coincanvas/widgets/global/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookWidget extends StatefulWidget {
  final int index;
  const BookWidget({required this.index, super.key});

  @override
  State<BookWidget> createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
  bool _isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<BookRepository>(builder: (context, ref, child) {
      final entry = ref.bookList[widget.index];

      // Main container
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
          // Adding top, left and right border to every list item
          border: Border(
            top: BorderSide(width: 1, color: CustomColors.primaryColor),
            left: BorderSide(width: 1, color: CustomColors.primaryColor),
            right: BorderSide(width: 1, color: CustomColors.primaryColor),
            // Bottom border is only visible on the first item of the list,
            // which is the bottom most item, because the list is reversed
            bottom: BorderSide(
                width: 1,
                color: widget.index == 0
                    ? CustomColors.primaryColor
                    : Colors.transparent),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // This container is used to display the amount
            // If entry is an income, color is green
            // If entry is an expense, color is red
            // If entry is a debt, color is orange
            // If entry is a receivable, color is yellow
            // This container is used to display both title and the icon button to expand the description
            Container(
              decoration: BoxDecoration(
                color: CustomColors.primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                  color: CustomColors.blueColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                // Amount text
                child: Text(
                  '${entry.total} LKR',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                // Bottom border is added to separate the title and the description
                border: Border(
                  bottom: BorderSide(
                      width: 0.5,
                      color: CustomColors.primaryColor.withOpacity(0.5)),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Title of entry
                      Expanded(
                        child: Text(
                          entry.title,
                          style: TextStyle(
                            color: CustomColors.primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      // Button to expand and collapse description
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        // If description is empty button is disabled. Otherwise,
                        // Used a NOT gate to flip isCollapsed value
                        onPressed: entry.description.isNotEmpty
                            ? () {
                                setState(() {
                                  _isCollapsed = !_isCollapsed;
                                });
                              }
                            : null,
                        icon: Icon(
                          !_isCollapsed
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_right,
                          size: 20,
                          color: entry.description == ''
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  // This sizedBox is here to add some space between summery and title
                ],
              ),
            ),
            // Description
            // If description is available it is displayed as an expandable text
            // which can be collapsed and expand. In default it is collapsed.
            // If description is null, to remove the additional space a SizedBox is used
            Visibility(
              visible: !_isCollapsed,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 0.5,
                          color: CustomColors.primaryColor.withOpacity(0.5))),
                ),
                // Description Text
                child: Text(
                  entry.description,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: CustomColors.primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Table(
              border: TableBorder.all(
                  width: 0.5,
                  color: CustomColors.primaryColor.withOpacity(0.5)),
              children: [
                summeryTableRow('Total Incomes', entry.totalIncomes),
                summeryTableRow('Total Expenses', entry.totalExpenses),
                summeryTableRow('Total Debt', entry.totalDebt),
                summeryTableRow('Total Receivables', entry.totalReceivable),
              ],
            ),
            // This sizedBox is here to add some space between description and datetime
            // const SizedBox(height: 10),
            // Formatted DateTime
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  entry.formattedDate,
                  style: TextStyle(
                    color: CustomColors.primaryColor,
                    fontSize: 13.5,
                  ),
                ),
                ElevatedButtonWidget(
                  width: 30,
                  height: 30,
                  borderRadius: 5,
                  onPressed: () {},
                  child: const Text('open'),
                )
              ],
            ),
          ],
        ),
      );
    });
  }

  TableRow summeryTableRow(String header, double value) {
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
          '$value LKR',
          style: TextStyle(
            color: CustomColors.primaryColor,
            fontSize: 13.5,
          ),
        ),
      ),
    ]);
  }
}
