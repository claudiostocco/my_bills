class BillsData {
  const BillsData(this.id, this.description, this.whereSpend, this.paid, this.amount);

  final String id;
  final String description;
  final String whereSpend;
  final bool paid;
  final double amount;
}
