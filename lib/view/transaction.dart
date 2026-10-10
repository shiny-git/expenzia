import 'package:expenzia/utils/appcolors.dart';
import 'package:flutter/material.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  final nameCtr = TextEditingController();
  final amountCtr = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String selectedType = 'Income';
    Future<void> selectDate() async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );

      if (picked != null) {
        setState(() {
          dateController.text =
              '${picked.day.toString().padLeft(2, '0')}/'
              '${picked.month.toString().padLeft(2, '0')}/'
              '${picked.year}';
        });
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Transaction'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          padding: EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('TRANSACTION TYPE'),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: selectedType,
                  decoration: const InputDecoration(
                    // labelText: 'Select Type',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'Income', child: Text('Income')),
                    DropdownMenuItem(value: 'Expense', child: Text('Expense')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedType = value!;
                    });
                  },
                ),
                SizedBox(height: 10),
                Text('NAME'),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter name';
                    }
                    return null;
                  },
                  controller: nameCtr,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                Text('AMOUNT'),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter amount';
                    }
                    return null;
                  },
                  controller: amountCtr,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefix: Text('\$'),
                  ),
                ),
                SizedBox(height: 10),

                Text('DATE'),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'select date';
                    }
                    return null;
                  },
                  controller: dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hint: Text('Select'),
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        selectDate();
                      },
                      icon: Icon(Icons.calendar_month),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
        child: FilledButton(
          onPressed: () {
            if (formkey.currentState!.validate()) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Transaction added')));
            }
          },
          style: FilledButton.styleFrom(backgroundColor: Appcolors.primary),
          child: Text('Save'),
        ),
      ),
    );
  }
}
