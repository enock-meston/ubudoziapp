class UserProfileModel {
  String? id;
  String? fname;
  String? lname;
  String? phoneNumber;
  String? password;
  String? image;
  String? status;
  String? message;

  UserProfileModel(
      {this.id,
      this.fname,
      this.lname,
      this.phoneNumber,
      this.password,
      this.image,
      this.status,
      this.message});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    image = json['image'];
    status = json['status'];
    message = json['message'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['phoneNumber'] = this.phoneNumber;
    data['password'] = this.password;
    data['image'] = this.image;
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
