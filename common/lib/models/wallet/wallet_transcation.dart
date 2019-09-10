

class WalletTransaction{

  double amount;
  bool debited;
  bool success;
  DateTime processedAt;
  String orderName;
  String status;
  String transactionId;
  WalletTransaction(this.amount, this.debited, this.processedAt,
      this.orderName);

  WalletTransaction.named({this.amount, this.debited, this.processedAt,
    this.orderName,this.transactionId,this.status,this.success});
}