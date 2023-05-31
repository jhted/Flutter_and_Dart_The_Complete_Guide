import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/Expense_overlay/new_expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
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

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpences.indexOf(expense);

    setState(() {
      _registeredExpences.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text("Expense deleted"),
        action: SnackBarAction(
          label: "UNDO",
          onPressed: () {
            setState(() {
              _registeredExpences.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context) => NewExpense(addNewExpense: _addNewExpense),
    );
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text("No Expense found. Start Adding some!"),
    );

    if (_registeredExpences.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpences,
        removeExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expence Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600 ? Column(
        children: [
          Chart(
            expenses: _registeredExpences,
          ),
          Expanded(
            child: mainContent,
          ),
        ],
      ) : Row(
        children: [
          Expanded(
            child: Chart(
              expenses: _registeredExpences,
            ),
          ),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
