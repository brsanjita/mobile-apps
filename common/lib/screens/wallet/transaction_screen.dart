import 'package:common/models/wallet/wallet_transcation.dart';
import 'package:common/utils/wallet_controller.dart';
import 'package:common/widgets/wallet/wallet_transaction_widget.dart';
import 'package:flutter/material.dart';

class WalletTransactionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WalletTransactionScreenState();
}

class _WalletTransactionScreenState extends State<WalletTransactionScreen>
    with SingleTickerProviderStateMixin<WalletTransactionScreen> {
  List<WalletTransaction> transactions = [];
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    WalletController.getTransactions().then((transactions){
      if(mounted){
        setState((){
          this.transactions=transactions;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Transcations"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Container(
            alignment: Alignment.bottomCenter,
            color: Color(0xffeeeeee),
            child: TabBar(
                controller: controller,
                indicatorColor: Colors.green,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                labelStyle:
                    TextStyle( fontSize: 18.0),
                tabs: ["All", "Money In", "Money Out"]
                    .map((item) => Tab(
                          text: item,
                        ))
                    .toList()),
          ),
        ),
      ),
      body: TabBarView(controller: controller, children: [
        _buildAllTransactions(),
        _buildCreditTransactions(),
        _buildDebitTransactions()
      ]),
    );
  }

  Widget _buildAllTransactions() {
    return ListView.builder(
      itemBuilder: (context, index) => WalletTransactionWidget(
            transaction: transactions[index],
          ),
      shrinkWrap: true,
      itemCount: transactions.length,
      physics: BouncingScrollPhysics(),
    );
  }

  Widget _buildCreditTransactions() {
    List<WalletTransaction> transactions =  
        this.transactions.where((transaction) => !transaction.debited).toList();
    return ListView.builder(
      itemBuilder: (context, index) => WalletTransactionWidget(
            transaction: transactions[index],
          ),
      shrinkWrap: true,
      itemCount: transactions.length,
      physics: BouncingScrollPhysics(),
    );
  }

  Widget _buildDebitTransactions() {
    List<WalletTransaction> transactions =
        this.transactions.where((transaction) => transaction.debited).toList();
    return ListView.builder(
      itemBuilder: (context, index) => WalletTransactionWidget(
            transaction: transactions[index],
          ),
      shrinkWrap: true,
      itemCount: transactions.length,
      physics: BouncingScrollPhysics(),
    );
  }
}
