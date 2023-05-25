import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/Expense_overlay/new_expense.dart';
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

  void _addNewExpense(Expense newExpense) {
    setState(() {
      _registeredExpences.add(newExpense);
    });
  }

  void _RemoveExpense(Expense newExpense) {
    setState(() {
      _registeredExpences.remove(newExpense);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => NewExpense(addNewExpense: _addNewExpense),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expence Tracker"),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text("Expense"),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpences,
              removeExpense:_RemoveExpense,
            ),
          ),
        ],
      ),
    );
  }
}
