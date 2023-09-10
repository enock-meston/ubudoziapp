class SubScriptionModel {
  String? subId;
  String? title;
  String? amount;
  String? duration;
  String? status;
  String? dateOn;

  SubScriptionModel(
      {this.subId,
      this.title,
      this.amount,
      this.duration,
      this.status,
      this.dateOn});

  SubScriptionModel.fromJson(Map<String, dynamic> json) {
    subId = json['sub_id'];
    title = json['title'];
    amount = json['amount'];
    duration = json['duration'];
    status = json['status'];
    dateOn = json['dateOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_id'] = this.subId;
    data['title'] = this.title;
    data['amount'] = this.amount;
    data['duration'] = this.duration;
    data['status'] = this.status;
    data['dateOn'] = this.dateOn;
    return data;
  }
}