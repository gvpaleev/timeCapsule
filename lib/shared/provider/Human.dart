class Human {
  BigInt id;
  String name;
  String description;
  String urlIcon;
  List<String> comments;
  Human(this.id, this.name, this.description, this.urlIcon, this.comments);

  Human.fromList(List<dynamic> list)
      : id = list[0],
        name = list[1],
        description = list[2],
        urlIcon = list[3],
        comments = list[4];

  @override
  String toString() {
    return 'Human{id: $id, name: $name, description: $description, urlIcon: $urlIcon}';
  }
}
