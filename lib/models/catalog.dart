// ignore_for_file: public_member_api_docs, sort_constructors_first, null_closures
import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class CatalogModel {
  static List<Items> items = [];

  // Get item by ID
  Items getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);
  // Get item by position
  Items getByPosition(int pos) => items[pos];
}

class Items {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  // Normal constructor, we can create our own named constructor by adding name after "."
  Items(
    this.id,
    this.name,
    this.desc,
    this.price,
    this.color,
    this.image,
  );

  // Our own named constructor, which will be creating objects based on the Map type value we were
  // getting from the decodedJson

  // factory: If we want to initialise the objects on the basis of some logic. Means does not
  // necessarily creates a new instance. It also helps us to choose which constructor has to be
  // executed. This factory constructor returns an Items object whose value has been initialised
  // from the map

  /*GENERATED FROM DART DATA CLASS GENERATOR EXTENSION*/
  Items copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
  }) {
    return Items(
      id ?? this.id,
      name ?? this.name,
      desc ?? this.desc,
      price ?? this.price,
      color ?? this.color,
      image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      map['id'] as int,
      map['name'] as String,
      map['desc'] as String,
      map['price'] as num,
      map['color'] as String,
      map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) =>
      Items.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Items(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant Items other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
