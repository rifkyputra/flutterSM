class Users {
  String name;
  String address;
  String contact;
  String photo;

  Users({
    this.name,
    this.address,
    this.contact,
    this.photo,
  });

  factory Users.fromJson(Map<String, dynamic> json){
    return new Users(
        name: json['name'],
        address: json['address'],
        contact: json ['contact'],
        photo: json['photo'],
    );
  }
}