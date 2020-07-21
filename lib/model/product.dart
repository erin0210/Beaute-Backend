
class Product {
  String id;
  String title;
  bool clean;
  bool dirty;

  Product({this.id, this.title, this.clean = true, this.dirty = false});
  Product.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'], title: json['title'], clean: json['clean'], dirty: json['dirty']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'clean': clean, 'dirty': dirty};
}
