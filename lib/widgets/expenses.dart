import 'package:flutter/material.dart';

import '../models/expense.dart';
import 'chart/chart.dart';
import 'expanses_list/expanses_list.dart';
import 'expanses_list/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      category: Category.work,
      title: 'Flutter Course',
      amount: 29.98888888888888888,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.leisure,
      title: 'Cinema',
      amount: 17.7,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.food,
      title: 'Breakfast',
      amount: 10.5,
      date: DateTime.now(),
    ),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter ExpenseTracker'),
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) => NewExpense(
                          onAddExpense: _addExpense,
                        ));
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: Center(
          child: width < 600
              ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(child: Chart(expenses: _registeredExpenses)),
                  Expanded(
                    child: ExpensesList(
                      expenses: _registeredExpenses,
                      onRemoveExpense: _removeExpense,
                    ),
                  )
                ])
              : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(child: Chart(expenses: _registeredExpenses)),
                  Expanded(
                    child: ExpensesList(
                      expenses: _registeredExpenses,
                      onRemoveExpense: _removeExpense,
                    ),
                  )
                ]),
        ));
  }
}
