class Human {
  BigInt id;
  String name;
  String description;
  String urlIcon;
  Human(this.id, this.name, this.description, this.urlIcon);

  Human.fromList(List<dynamic> list)
      : id = list[0],
        name = list[1],
        description = list[2],
        urlIcon = list[3];

  @override
  String toString() {
    return 'Human{id: $id, name: $name, description: $description, urlIcon: $urlIcon}';
  }
}
