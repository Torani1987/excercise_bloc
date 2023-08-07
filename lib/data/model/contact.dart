class ContactModel {
  int? id;
  final String name;
  final String phone;

  ContactModel({this.id, required this.name, required this.phone});

  factory ContactModel.fromJson(Map<String, dynamic> map) =>
      ContactModel(id: map['id'], name: map['name'], phone: map['phone']);

  Map<String, dynamic> toJson() => {"name": name, "phone": phone};
}
