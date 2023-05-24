import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_list/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpences = [
    Expense(
        title: 'flutter',
        amount: 199.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'chocolate',
        amount: 25.32,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'milk',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'japen',
        amount: 2010.62,
        date: DateTime.now(),
        category: Category.travel),
  ];

  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Expense"),
          const Text("list"),
          Expanded(child: ExpensesList(expenses: _registeredExpences,),),
        ],
      ),
    );
  }
}
