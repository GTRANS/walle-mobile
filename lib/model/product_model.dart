class Product {
  int? id;
  String? name;
  int? balance;
  int? price;
  String? description;
  bool? available;

  Product(
      {this.id,
      this.name,
      this.balance,
      this.price,
      this.description,
      this.available});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['nama'];
    balance = json['nominal'];
    price = json['harga'];
    description = json['deskripsi'];
    available = json['tersedia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = name;
    data['nominal'] = balance;
    data['harga'] = price;
    data['deskripsi'] = description;
    data['tersedia'] = available;
    return data;
  }
}
