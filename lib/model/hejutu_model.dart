// To parse this JSON data, do
//
//     final hejuruModel = hejuruModelFromJson(jsonString);

import 'dart:convert';
List<HejuruModel> hejuruModelsFromJson(String str) => List<HejuruModel>.from(json.decode(str).map((x) => HejuruModel.fromJson(x)));

String hejuruModelsToJson(List<HejuruModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


HejuruModel hejuruModelFromJson(String str) => HejuruModel.fromJson(json.decode(str));

String hejuruModelToJson(HejuruModel data) => json.encode(data.toJson());

class HejuruModel {
    String? id;
    String? clientNames;
    String? phoneNumber;
    String? epIbitugu;
    String? lpIgituza;
    String? ltUburebure;
    String? lmAmaboko;
    String? cmIgikonjo;
    String? ctMunda;
    String? cbChAmatako;
    String? activeStatus;
    String? ubudoziId;

    HejuruModel({
        this.id,
        this.clientNames,
        this.phoneNumber,
        this.epIbitugu,
        this.lpIgituza,
        this.ltUburebure,
        this.lmAmaboko,
        this.cmIgikonjo,
        this.ctMunda,
        this.cbChAmatako,
        this.activeStatus,
        this.ubudoziId,
    });

    factory HejuruModel.fromJson(Map<String, dynamic> json) => HejuruModel(
        id: json["id"],
        clientNames: json["clientNames"],
        phoneNumber: json["phoneNumber"],
        epIbitugu: json["EP_ibitugu"],
        lpIgituza: json["LP_igituza"],
        ltUburebure: json["LT_uburebure"],
        lmAmaboko: json["LM_amaboko"],
        cmIgikonjo: json["CM_Igikonjo"],
        ctMunda: json["CT_munda"],
        cbChAmatako: json["CB_CH_Amatako"],
        activeStatus: json["activeStatus"],
        ubudoziId: json["ubudoziID"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "clientNames": clientNames,
        "phoneNumber": phoneNumber,
        "EP_ibitugu": epIbitugu,
        "LP_igituza": lpIgituza,
        "LT_uburebure": ltUburebure,
        "LM_amaboko": lmAmaboko,
        "CM_Igikonjo": cmIgikonjo,
        "CT_munda": ctMunda,
        "CB_CH_Amatako": cbChAmatako,
        "activeStatus": activeStatus,
        "ubudoziID": ubudoziId,
    };
}
