class HasiModel {
  String? id;
  String? clientNames;
  String? phoneNumber;
  String? cTMunda;
  String? lPMumatako;
  String? cCIbibero;
  String? lTUburebure;
  String? cJMumavi;
  String? tBMukirenge;
  String? updatedOn;
  String? activeStatus;
  String? umudoziID;

  HasiModel({
    this.id,
    this.clientNames,
    this.phoneNumber,
    this.cTMunda,
    this.lPMumatako,
    this.cCIbibero,
    this.lTUburebure,
    this.cJMumavi,
    this.tBMukirenge,
    this.updatedOn,
    this.activeStatus,
    this.umudoziID,
  });

  HasiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientNames = json['clientNames'];
    phoneNumber = json['phoneNumber'];
    cTMunda = json['CT_munda'];
    lPMumatako = json['LP_mumatako'];
    cCIbibero = json['CC_ibibero'];
    lTUburebure = json['LT_uburebure'];
    cJMumavi = json['CJ_mumavi'];
    tBMukirenge = json['TB_mukirenge'];
    updatedOn = json['updatedOn'];
    activeStatus = json['activeStatus'];
    umudoziID = json['umudozi_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['clientNames'] = this.clientNames;
    data['phoneNumber'] = this.phoneNumber;
    data['CT_munda'] = this.cTMunda;
    data['LP_mumatako'] = this.lPMumatako;
    data['CC_ibibero'] = this.cCIbibero;
    data['LT_uburebure'] = this.lTUburebure;
    data['CJ_mumavi'] = this.cJMumavi;
    data['TB_mukirenge'] = this.tBMukirenge;
    data['updatedOn'] = this.updatedOn;
    data['activeStatus'] = this.activeStatus;
    data['umudozi_ID'] = this.umudoziID;
    return data;
  }
}
