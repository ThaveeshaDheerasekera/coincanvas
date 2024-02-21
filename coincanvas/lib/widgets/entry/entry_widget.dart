import 'package:coincanvas/configs/constants.dart';
import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/repositories/entry_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EntryWidget extends StatefulWidget {
  final int index;
  const EntryWidget({required this.index, super.key});

  @override
  State<EntryWidget> createState() => _EntryWidgetState();
}

class _EntryWidgetState extends State<EntryWidget> {
  bool _isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<EntryRepository>(builder: (context, ref, child) {
      final entry = ref.entiresList[widget.index];

      // Main container
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          // Adding top, left and right border to every list item
          border: Border(
            top: BorderSide(
                width: 1, color: CustomColors.primaryColor.withOpacity(0.5)),
            left: BorderSide(
                width: 1, color: CustomColors.primaryColor.withOpacity(0.5)),
            right: BorderSide(
                width: 1, color: CustomColors.primaryColor.withOpacity(0.5)),
            // Bottom border is only visible on the first item of the list,
            // which is the bottom most item, because the list is reversed
            bottom: BorderSide(
                width: 1,
                color: widget.index == 0
                    ? CustomColors.primaryColor.withOpacity(0.5)
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
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: CustomColors.primaryColor),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: entry.type == Type.Income
                        ? CustomColors.greenColor
                        : entry.type == Type.Expense
                            ? CustomColors.redColor
                            : entry.type == Type.Debt
                                ? CustomColors.orangeColor
                                : CustomColors.yellowColor),
                // Amount text
                child: Text(
                  '${entry.amount} LKR',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            // This container is used to display both title and the icon button to expand the description
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
            // This sizedBox is here to add some space between datetime and title
            const SizedBox(height: 10),
            // Summary of the Entry
            // Id, Transaction Type, Category and Payment Method are illustrated in the table
            Table(
              border: TableBorder.all(
                  width: 0.5,
                  color: CustomColors.primaryColor.withOpacity(0.5)),
              children: [
                summeryTableRow('Transaction Type', entry.type.name),
                summeryTableRow('Category', entry.category.name),
                summeryTableRow('Payment Method', entry.paymentMethod.name),
                summeryTableRow('Created DateTime', entry.formattedDate),
              ],
            ),
            // This sizedBox is here to add some space between datetime and summary table
            const SizedBox(height: 10),
            // Formatted DateTime
            SizedBox(
              width: double.infinity,
              child: Text(
                entry.id,
                style: TextStyle(
                  color: CustomColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.5,
                ),
              ),
            ),
          ],
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
            fontWeight: FontWeight.w500,
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
