import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF0C1446),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, color: Colors.white, size: screenWidth * 0.07),
            CircleAvatar(backgroundColor: Colors.blue, radius: screenWidth * 0.05),
          ],
        ),

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05,vertical: screenHeight*0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(screenWidth * 0.05),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back,",
                    style: TextStyle(color: Colors.amber, fontSize: screenWidth * 0.045),
                  ),
                  Text(
                    "John Doe",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("PORTFOLIO VALUE", style: TextStyle(color: Colors.white70)),
                          Text(
                            "\$490,000",
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.amber,
                        width: 1,
                        height: screenHeight * 0.05,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("GOLD VALUE", style: TextStyle(color: Colors.white70)),
                          Text(
                            "\$524,000",
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            // Icons section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: screenWidth * 0.08,
                  child: Icon(Icons.arrow_upward, color: Colors.white, size: screenWidth * 0.06),
                ),
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: screenWidth * 0.08,
                  child: Icon(Icons.arrow_downward, color: Colors.white, size: screenWidth * 0.06),
                ),
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: screenWidth * 0.08,
                  child: Icon(Icons.cloud_download, color: Colors.white, size: screenWidth * 0.06),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            // Transactions section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Transactions", style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05)),
                Text("See All", style: TextStyle(color: Colors.blue, fontSize: screenWidth * 0.04)),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            // Transaction list
            TransactionItem(name: "Apple Store", category: "Electronics", amount: "\$166", screenWidth: screenWidth),
            TransactionItem(name: "Amazon", category: "Shopping", amount: "\$120", screenWidth: screenWidth),
            TransactionItem(name: "Walmart", category: "Groceries", amount: "\$85", screenWidth: screenWidth),
            TransactionItem(name: "Best Buy", category: "Gadgets", amount: "\$220", screenWidth: screenWidth),
          ],
        ),
      ),

    );
  }
}

class TransactionItem extends StatelessWidget {
  final String name;
  final String category;
  final String amount;
  final double screenWidth;

  TransactionItem({required this.name, required this.category, required this.amount, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: screenWidth * 0.05,
              ),
              SizedBox(width: screenWidth * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.045)),
                  Text(category, style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.035)),
                ],
              ),
            ],
          ),
          Text(amount, style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.045)),
        ],
      ),
    );
  }
}
