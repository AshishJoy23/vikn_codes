class SalesModel {
  String? invoiceNo;
  String? customerName;
  String? status;
  String? total;

  SalesModel(
      {this.invoiceNo,
      
      this.customerName,
      this.status,this.total,
 });

  SalesModel.fromJson(Map<String, dynamic> json) {
    invoiceNo = json['VoucherNo'];
    customerName = json['CustomerName'];
    status = json['Status'];
    total = json['GrandTotal'].toString();
  }


}