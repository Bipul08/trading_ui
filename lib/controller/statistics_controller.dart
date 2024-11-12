import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../model/transaction_model.dart';

class StatisticsController extends ChangeNotifier {
  int selectedMonthIndex = 0;

  // Transaction data that could change based on selected month
  List<TransactionModel> transactions = [
    TransactionModel(title: 'Target', subtitle: 'Department Store', amount: '\$70'),
    TransactionModel(title: 'Costco', subtitle: 'Warehouse Club', amount: '\$90'),
    TransactionModel(title: 'eBay', subtitle: 'Auction', amount: '\$60'),
  ];

  void onMonthTapped(int index) {
    selectedMonthIndex = index;
    updateTransactionsForMonth(index);  // Update transactions or other data as needed
    notifyListeners();
  }

  // Return different data points based on the selected month
  List<FlSpot> getChartSpots() {
    switch (selectedMonthIndex) {
      case 0:
        return [FlSpot(0, 6), FlSpot(1, 4), FlSpot(2, 8), FlSpot(3, 6), FlSpot(4, 7), FlSpot(5, 5)];
      case 1:
        return [FlSpot(0, 7), FlSpot(1, 3), FlSpot(2, 5), FlSpot(3, 4), FlSpot(4, 6), FlSpot(5, 7)];
      case 2:
        return [FlSpot(0, 5), FlSpot(1, 6), FlSpot(2, 4), FlSpot(3, 3), FlSpot(4, 8), FlSpot(5, 6)];
      case 3:
        return [FlSpot(0, 4), FlSpot(1, 7), FlSpot(2, 6), FlSpot(3, 5), FlSpot(4, 3), FlSpot(5, 8)];
      case 4:
        return [FlSpot(0, 6), FlSpot(1, 5), FlSpot(2, 7), FlSpot(3, 8), FlSpot(4, 6), FlSpot(5, 5)];
      case 5:
        return [FlSpot(0, 8), FlSpot(1, 6), FlSpot(2, 4), FlSpot(3, 5), FlSpot(4, 7), FlSpot(5, 3)];
      default:
        return [FlSpot(0, 6), FlSpot(1, 4), FlSpot(2, 8), FlSpot(3, 6), FlSpot(4, 7), FlSpot(5, 5)];
    }
  }

  // Optionally, update the transaction data based on the month
  void updateTransactionsForMonth(int monthIndex) {
    switch (monthIndex) {
      case 0:
        transactions = [
          TransactionModel(title: 'Target', subtitle: 'Department Store', amount: '\$70'),
          TransactionModel(title: 'Costco', subtitle: 'Warehouse Club', amount: '\$90'),
          TransactionModel(title: 'eBay', subtitle: 'Auction', amount: '\$60'),
        ];
        break;
      case 1:
        transactions = [
          TransactionModel(title: 'Amazon', subtitle: 'Online Store', amount: '\$100'),
          TransactionModel(title: 'Walmart', subtitle: 'Retail Store', amount: '\$80'),
          TransactionModel(title: 'Best Buy', subtitle: 'Electronics', amount: '\$120'),
        ];
        break;
      case 1:
        transactions = [
          TransactionModel(title: 'flipkat', subtitle: 'Online Store', amount: '\$100'),
          TransactionModel(title: 'Walmart', subtitle: 'Retail Store', amount: '\$80'),
          TransactionModel(title: 'Best Buy', subtitle: 'Electronics', amount: '\$120'),
        ];
        break;
    // Add more cases for other months as needed
      default:
        transactions = [
          TransactionModel(title: 'Target', subtitle: 'Department Store', amount: '\$70'),
          TransactionModel(title: 'Costco', subtitle: 'Warehouse Club', amount: '\$90'),
          TransactionModel(title: 'eBay', subtitle: 'Auction', amount: '\$60'),
        ];
    }
  }
}
