import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/repositories/entry_repository.dart';
import 'package:coincanvas/configs/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenListItemWidget extends StatefulWidget {
  final int index;
  const HomeScreenListItemWidget({required this.index, super.key});

  @override
  State<HomeScreenListItemWidget> createState() =>
      _HomeScreenListItemWidgetState();
}

class _HomeScreenListItemWidgetState extends State<HomeScreenListItemWidget> {
  bool isCollaped = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<EntryRepository>(builder: (context, ref, child) {
      final entry = ref.entiresList[widget.index];

      // Main container
      return Card(
        elevation: 3,
        color: CustomColors.background,
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 0.1, color: Colors.grey),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // This container is used to display the amount
                  // If the entry is an income the container is green
                  // If the entry is an expense it is red
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: entry.type == Type.Income
                          ? Colors.green.withOpacity(0.65)
                          : Colors.red.withOpacity(0.65),
                    ),
                    // Amount text
                    child: Text(
                      '${entry.amount} LKR',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  // A container is used to here to add padding to the items displayed below amount container
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 0.75, color: Colors.grey),
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
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  // Button to expand and collapse decscription
                                  IconButton(
                                    visualDensity: VisualDensity.compact,
                                    // If desciption is empty button is disabled. Otherwise,
                                    // Used a NOT gate to flip isCollaped value
                                    onPressed: entry.description.isNotEmpty
                                        ? () {
                                            setState(() {
                                              isCollaped = !isCollaped;
                                            });
                                          }
                                        : null,
                                    icon: Icon(
                                      !isCollaped
                                          ? Icons.keyboard_arrow_down
                                          : Icons.keyboard_arrow_right,
                                      size: 20,
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
                          visible: !isCollaped,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 0.75, color: Colors.grey)),
                            ),
                            child: Text(
                              entry.description,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        // This sizedbox is here to add some space between datetime and title
                        const SizedBox(height: 10),
                        // Formatted DateTime
                        Text(
                          entry.formattedDate,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
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
}
