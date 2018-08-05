class ItemsList{
  List<Item> items;

  ItemsList({this.items});

  factory ItemsList.fromJson(Map<String, dynamic> json){
    var list = json['items'] as List;
    List<Item> itemsList = list.map((i) => Item.fromJson(i)).toList();
    return new ItemsList(
      items:itemsList
    );
  }
}



class Item{
  String name;
  String description;

  Item({
    this.name,
    this.description
});

  factory Item.fromJson(Map<String, dynamic> json) {

    return new Item(
        name: json['name'],
        description: json['description'],
    );
  }
}

