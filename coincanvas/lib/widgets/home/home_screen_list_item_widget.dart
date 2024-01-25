import 'package:coincanvas/configs/constants.dart';
import 'package:coincanvas/models/transaction.dart';
import 'package:coincanvas/widgets/global/elevated_button_widget.dart';
import 'package:coincanvas/widgets/global/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenListItemWidget extends StatelessWidget {
  final int index;
  const HomeScreenListItemWidget({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    // return Consumer<Transactions>(builder: (context, transactions, child) {
    //   final transaction = transactions.getTransactionList[index];
    return TitleWidget(
      title: 'transaction.formattedDate',
      actions: [
        ElevatedButtonWidget(
          width: 50,
          height: 30,
          borderRadius: 2,
          onPressed: () {},
          child: const Text('Delete'),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.grey),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.green.withOpacity(0.65),
                  ),
                  child: Text(
                    'LKR',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 'title' attribute of the Entry
                    Expanded(
                      child: Text(
                        'transaction.title',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    // Button to collapse the content
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: () {
                        // model.toggleCollapse(
                        //     noteId: widget.note.note_id,
                        //     isCollapsed: !widget.note.isCollapsed);
                      },
                      icon: const Icon(
                        // !widget.note.isCollapsed
                        //     ? Icons.keyboard_arrow_down
                        //     :
                        Icons.keyboard_arrow_right,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // If collapse button is toggled,
          // this column will not be visible
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Visibility(
              visible: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listItemWidget1(BuildContext context, Flux transaction) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            transaction.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '${transaction.amount.toStringAsFixed(2)} LKR',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(Constants.typeIcons[transaction.type]),
                  Icon(Constants.categoryIcons[transaction.category]),
                  const SizedBox(width: 16),
                  Text(transaction.formattedDate),
                  const SizedBox(width: 16),
                  Icon(
                      transaction.description != ''
                          ? Icons.description
                          : Icons.description_outlined,
                      size: 14,
                      color: Colors.black),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
