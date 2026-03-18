class ProfileModel {
  String? name;
  String? email;
  String? photo;

  ProfileModel(
      {
      this.name,
      this.email,
      this.photo,});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    name = '${json['first_name']} ${json['last_name']}';
    email = json['email'];
    photo = json['photo'];
  }

}