// class UserModel {
//   int? id;
//   String? email;
//   String? firstName;
//   String? lastName;
//   String? avatar;

//   UserModel({this.id, this.email, this.firstName, this.lastName, this.avatar});

//   UserModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     email = json['email'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     avatar = json['avatar'];
//   }
// }

class Photo {
  String? title;
  String? imageSmall;
  int? id;

  Photo({
    this.title,
    this.imageSmall,
    this.id,
  });
  Photo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    imageSmall = json['imageSmall'];
    id = json['id'];
  }
}
