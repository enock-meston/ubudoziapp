class UserModel {
  String user_fname;
  String user_lname;
  String user_phone;
  String user_password;

  UserModel(
      this.user_fname, this.user_lname, this.user_phone, this.user_password);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      json['user_fname'] as String,
      json['user_lname'] as String,
      json['user_phone'] as String,
      json['user_password'] as String);
  Map<String, dynamic> toJson() => {
        'user_fname': user_fname.toString(),
        'user_lname': user_lname.toString(),
        'user_phone': user_phone.toString(),
        'user_password': user_password.toString()
      };
}
