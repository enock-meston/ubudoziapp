class HejuruModel {
  String? id;
  String? clientNames;
  String? phoneNumber;
  String? ePIbitugu;
  String? lPIgituza;
  String? lTUburebure;
  String? lMAmaboko;
  String? cMIgikonjo;
  String? cTMunda;
  String? cBCHAmatako;
  String? activeStatus;
  String? ubudoziID;

  HejuruModel(
      {this.id,
      this.clientNames,
      this.phoneNumber,
      this.ePIbitugu,
      this.lPIgituza,
      this.lTUburebure,
      this.lMAmaboko,
      this.cMIgikonjo,
      this.cTMunda,
      this.cBCHAmatako,
      this.activeStatus,
      this.ubudoziID});

  HejuruModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientNames = json['clientNames'];
    phoneNumber = json['phoneNumber'];
    ePIbitugu = json['EP_ibitugu'];
    lPIgituza = json['LP_igituza'];
    lTUburebure = json['LT_uburebure'];
    lMAmaboko = json['LM_amaboko'];
    cMIgikonjo = json['CM_Igikonjo'];
    cTMunda = json['CT_munda'];
    cBCHAmatako = json['CB_CH_Amatako'];
    activeStatus = json['activeStatus'];
    ubudoziID = json['ubudoziID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['clientNames'] = this.clientNames;
    data['phoneNumber'] = this.phoneNumber;
    data['EP_ibitugu'] = this.ePIbitugu;
    data['LP_igituza'] = this.lPIgituza;
    data['LT_uburebure'] = this.lTUburebure;
    data['LM_amaboko'] = this.lMAmaboko;
    data['CM_Igikonjo'] = this.cMIgikonjo;
    data['CT_munda'] = this.cTMunda;
    data['CB_CH_Amatako'] = this.cBCHAmatako;
    data['activeStatus'] = this.activeStatus;
    data['ubudoziID'] = this.ubudoziID;
    return data;
  }
}