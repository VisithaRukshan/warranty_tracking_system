class Stock{
  String id;
  String? sNo;
  String? stockInDate;

  Stock({
    this.id = '',
    this.sNo,
    this.stockInDate,
  });

  Map<String , dynamic> toJson() => {
    'id' : id,
    'sNo' : sNo,
    'stockInDate' : stockInDate,
  };
}