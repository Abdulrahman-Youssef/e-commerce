class UserModel {
  int? usersId;
  String? usersName;
  String? usersEmail;
  String? usersPhone;
  int? usersVerifycode;
  int? usersApprove;
  String? usersCreate;
  String? usersPassword;

  UserModel(
      {this.usersId,
        this.usersName,
        this.usersEmail,
        this.usersPhone,
        this.usersVerifycode,
        this.usersApprove,
        this.usersCreate,
        this.usersPassword});

  UserModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersVerifycode = json['users_verifycode'];
    usersApprove = json['users_approve'];
    usersCreate = json['users_create'];
    usersPassword = json['users_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_email'] = this.usersEmail;
    data['users_phone'] = this.usersPhone;
    data['users_verifycode'] = this.usersVerifycode;
    data['users_approve'] = this.usersApprove;
    data['users_create'] = this.usersCreate;
    data['users_password'] = this.usersPassword;
    return data;
  }


}