import 'package:expenzia/utils/appcolors.dart';
import 'package:expenzia/view/nav/credit.dart';
import 'package:expenzia/view/nav/home.dart';
import 'package:expenzia/view/nav/profile.dart';
import 'package:expenzia/view/nav/transaction_history.dart';
import 'package:expenzia/view/transaction.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;
  List<Widget> pages = [Home(), TransactionHistory(), Credit(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolors.primary,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Transaction()),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(Icons.add),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        padding: EdgeInsets.zero,
        shape: CircularNotchedRectangle(),
        color: Appcolors.primary,
        // color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home, 'Home', 0),
            _navItem(Icons.history, 'Rides', 1),
            const SizedBox(width: 48),
            _navItem(Icons.account_balance_wallet_outlined, 'Credit', 2),
            _navItem(Icons.person, 'Profile', 3),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    final bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.grey.shade700),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: isSelected ? Colors.white : Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
