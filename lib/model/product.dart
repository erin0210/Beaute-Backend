
class Product {
  int id;
  String title;
  bool clean;

  Product({this.id, this.title, this.clean = false});

  Product.copy(Product from)
      : this(
            id: from.id,
            title: from.title,
            clean: from.clean
            );

  Product.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'], 
            title: json['title'], 
            clean: json['clean']=='true' ? true:false
            );

  Map<String, dynamic> toJson() =>
      {'id': id, 
      'title': title, 
      'clean': clean, 
      };
}
