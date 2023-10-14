// To parse this JSON data, do
//
//     final campaignApi = campaignApiFromJson(jsonString);

import 'dart:convert';

CampaignApi campaignApiFromJson(String str) => CampaignApi.fromJson(json.decode(str));

String campaignApiToJson(CampaignApi data) => json.encode(data.toJson());

class CampaignApi {
  List<Datum>? data;
  String? status;

  CampaignApi({
    this.data,
    this.status,
  });

  factory CampaignApi.fromJson(Map<String, dynamic> json) => CampaignApi(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
  };
}

class Datum {
  int? id;
  String? campNo;
  dynamic bhId;
  dynamic bhDateTime;
  int? foId;
  int? stateId;
  int? locationId;
  int? assetId;
  String? foImage;
  String? foVideo;
  DateTime? foDateTime;
  dynamic techId;
  dynamic techImage;
  dynamic techVideo;
  dynamic techDateTime;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? stateName;
  String? locationName;
  String? userName;
  String? assetName;

  Datum({
    this.id,
    this.campNo,
    this.bhId,
    this.bhDateTime,
    this.foId,
    this.stateId,
    this.locationId,
    this.assetId,
    this.foImage,
    this.foVideo,
    this.foDateTime,
    this.techId,
    this.techImage,
    this.techVideo,
    this.techDateTime,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.stateName,
    this.locationName,
    this.userName,
    this.assetName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    campNo: json["camp_no"],
    bhId: json["bh_id"],
    bhDateTime: json["bh_date_time"],
    foId: json["fo_id"],
    stateId: json["state_id"],
    locationId: json["location_id"],
    assetId: json["asset_id"],
    foImage: json["fo_image"],
    foVideo: json["fo_video"],
    foDateTime: json["fo_date_time"] == null ? null : DateTime.parse(json["fo_date_time"]),
    techId: json["tech_id"],
    techImage: json["tech_image"],
    techVideo: json["tech_video"],
    techDateTime: json["tech_date_time"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    stateName: json["state_name"],
    locationName: json["location_name"],
    userName: json["user_name"],
    assetName: json["asset_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "camp_no": campNo,
    "bh_id": bhId,
    "bh_date_time": bhDateTime,
    "fo_id": foId,
    "state_id": stateId,
    "location_id": locationId,
    "asset_id": assetId,
    "fo_image": foImage,
    "fo_video": foVideo,
    "fo_date_time": foDateTime?.toIso8601String(),
    "tech_id": techId,
    "tech_image": techImage,
    "tech_video": techVideo,
    "tech_date_time": techDateTime,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "state_name": stateName,
    "location_name": locationName,
    "user_name": userName,
    "asset_name": assetName,
  };
}
