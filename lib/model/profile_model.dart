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
    name = '${json['data']['first_name']} ${json['data']['last_name']}';
    email = json['data']['email'];
    photo = json['customer_data']['photo'];
  }

}