import 'package:coincanvas/configs/custom_colors.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String title;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final Widget descriptionWidget;
  const ExpandableTextWidget({
    super.key,
    required this.title,
    this.titleFontSize,
    this.titleFontWeight,
    required this.descriptionWidget,
  });

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool _isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          child: Row(
            children: [
              // Title of entry
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: CustomColors.primaryColor,
                    fontWeight: widget.titleFontWeight ?? FontWeight.w600,
                    fontSize: widget.titleFontSize ?? 14.5,
                  ),
                ),
              ),
              // Button to expand and collapse description
              IconButton(
                visualDensity: VisualDensity.compact,
                // If description is empty button is disabled. Otherwise,
                // Used a NOT gate to flip isCollapsed value
                onPressed: () {
                  setState(() {
                    _isCollapsed = !_isCollapsed;
                  });
                },
                icon: Icon(
                  !_isCollapsed
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_right,
                  size: 20,
                  color: CustomColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
        // Description
        // Description can be collapsed and expand. In default it is collapsed.
        Visibility(
          visible: !_isCollapsed,
          child: Container(
            width: double.infinity,
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 0.5,
                      color: CustomColors.primaryColor.withOpacity(0.5))),
            ),
            child: widget.descriptionWidget,
          ),
        ),
      ],
    );
  }
}
