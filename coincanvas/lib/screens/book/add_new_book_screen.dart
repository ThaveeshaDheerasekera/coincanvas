import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/repositories/book_respository.dart';
import 'package:coincanvas/widgets/global/elevated_button_widget.dart';
import 'package:coincanvas/widgets/global/form_label_widget.dart';
import 'package:coincanvas/widgets/global/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewBookScreen extends StatefulWidget {
  const AddNewBookScreen({super.key});
  @override
  State<AddNewBookScreen> createState() {
    return _AddNewBookScreenState();
  }
}

class _AddNewBookScreenState extends State<AddNewBookScreen>
    with WidgetsBindingObserver {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _currencyController = TextEditingController();

  final GlobalKey<_AddNewBookScreenState> _widgetKey = GlobalKey();

  // selected Currency
  String _selectedCurrency = '';
  // List of currencies
  final List<String> _currencies = [
    'LKR',
    'USD',
    'EUR',
    'AUD',
    'CAD',
    'JPY',
    'INR',
    'NZD',
    'QAR',
    'SGD',
  ];

  // Show error message function
  void _showErrorMessage(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        backgroundColor: CustomColors.oliveColor,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _onSubmit() async {
    final title = _titleController.text.trim();
    final description = _descriptionController.text;
    final currency = _currencyController.text;

    // access the BookRepository
    final book = Provider.of<BookRepository>(context, listen: false);

    if (title.isEmpty) {
      _showErrorMessage(context, 'Title is empty');
      return;
    }

    if (currency.isEmpty) {
      _showErrorMessage(context, 'Select a currency');
      return;
    }

    if (title.isNotEmpty && currency.isNotEmpty) {
      // Run the createBook method
      await book.createBook(
        context: context,
        title: title,
        description: description,
        currency: currency,
      );

      // Navigate back
      Navigator.pop(_widgetKey.currentContext!);
    }

    // Reset the form
    _formKey.currentState?.reset();
  }

  @override
  void initState() {
    super.initState();
    _titleController.text = '';
    _descriptionController.text = '';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Book',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColor: CustomColors.oliveColor,
        foregroundColor: Colors.black,
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(15),
        color: Colors.black,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormLabelWidget(label: 'Title'),
                TextFieldWidget(
                  hintText: 'Title',
                  controller: _titleController,
                  keyboardType: TextInputType.text,
                  maxLength: 50,
                  textCapitalization: TextCapitalization.words,
                ),
                const FormLabelWidget(label: 'Description'),
                TextFieldWidget(
                  hintText: 'Short description of this book (Optional)',
                  controller: _descriptionController,
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                  maxLength: 300,
                  textCapitalization: TextCapitalization.sentences,
                ),
                const FormLabelWidget(label: 'Currency'),
                TextFieldWidget(
                  readOnly: true,
                  hintText: 'Select currency',
                  controller: _currencyController,
                  onTap: () => _showCurrencyPickerDialog(context),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButtonWidget(
                      width: 100,
                      height: 40,
                      borderRadius: 5,
                      backgroundColor:
                          CustomColors.primaryColor.withOpacity(0.5),
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButtonWidget(
                      width: 100,
                      height: 40,
                      borderRadius: 5,
                      onPressed: _onSubmit,
                      child: const Text('Done'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: const BottomNavbarWidget(),
    );
  }

  // Function to show the currency picker dialog
  Future<void> _showCurrencyPickerDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: CustomColors.primaryColor, width: 0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          titlePadding: const EdgeInsets.all(10),
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          actionsPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          backgroundColor: Colors.black,
          // Title of the alert box
          title: Text(
            'Click to select Currency',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: CustomColors.primaryColor,
            ),
          ),
          content: SizedBox(
            width: 250,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: _currencies.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    // Update the selected currency and close the dialog
                    setState(() {
                      _selectedCurrency = _currencies[index];
                      _currencyController.text = _selectedCurrency;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomColors.primaryColor),
                      color: _selectedCurrency == _currencies[index]
                          ? CustomColors.oliveColor
                          : Colors.black,
                    ),
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: Text(
                      _currencies[index],
                      style: TextStyle(
                        color: _selectedCurrency == _currencies[index]
                            ? Colors.black
                            : CustomColors.primaryColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
