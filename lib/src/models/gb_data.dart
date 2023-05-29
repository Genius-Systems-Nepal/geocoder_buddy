// Geocoder Buddy Data Model
import 'dart:convert';

import 'package:flutter/material.dart';

GBData gbDataFromJson(String str) => GBData.fromJson(json.decode(str));

String gbDataToJson(GBData data) => json.encode(data.toJson());

class GBData {
  GBData({
    @required this.placeId,
    @required this.osmType,
    @required this.id,
    @required this.lat,
    @required this.lon,
    @required this.placeRank,
    @required this.importance,
    @required this.displayName,
    @required this.address,
    @required this.boundingbox,
  });

  int placeId;
  String osmType;
  int id;
  String lat;
  String lon;
  int placeRank;
  double importance;
  String displayName;
  Address address;
  List<String> boundingbox;

  factory GBData.fromJson(Map<String, dynamic> json) => GBData(
        placeId: json["place_id"],
        osmType: json["osm_type"],
        id: json["osm_id"],
        lat: json["lat"],
        lon: json["lon"],
        placeRank: json["place_rank"],
        importance: json["importance"].toDouble(),
        displayName: json["display_name"],
        address: Address.fromJson(json["address"]),
        boundingbox: List<String>.from(json["boundingbox"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "place_id": placeId,
        "osm_type": osmType,
        "osm_id": id,
        "lat": lat,
        "lon": lon,
        "place_rank": placeRank,
        "importance": importance,
        "display_name": displayName,
        "address": address.toJson(),
        "boundingbox": List<dynamic>.from(boundingbox.map((x) => x)),
      };
}

class Address {
  Address({
    @required this.amenity,
    @required this.road,
    @required this.subUrb,
    @required this.neighbourhood,
    @required this.village,
    @required this.county,
    @required this.stateDistrict,
    @required this.state,
    @required this.region,
    @required this.iso31662Lvl4,
    @required this.postcode,
    @required this.country,
    @required this.countryCode,
    @required this.municipality,
  });

  String amenity;
  String road;
  String subUrb;
  String neighbourhood;
  String village;
  String county;
  String stateDistrict;
  String state;
  String iso31662Lvl4;
  String postcode;
  String country;
  String countryCode;
  String region;
  String municipality;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    amenity: json["amenity"],
        road: json["road"],
        subUrb: json["suburb"],
    neighbourhood: json["neighbourhood"],
        village: json["village"],
        county: json["county"],
        stateDistrict: json["state_district"],
        state: json["state"],
        region: json["region"],
        iso31662Lvl4: json["ISO3166-2-lvl4"],
        postcode: json["postcode"],
        country: json["country"],
        countryCode: json["country_code"],
        municipality: json["municipality"],
      );

  Map<String, dynamic> toJson() => {
        "amenity": amenity,
        "road": road,
        "suburb": subUrb,
        "neighbourhood": neighbourhood,
        "village": village,
        "county": county,
        "state_district": stateDistrict,
        "state": state,
    "region": region,
        "ISO3166-2-lvl4": iso31662Lvl4,
        "postcode": postcode,
        "country": country,
        "country_code": countryCode,
        "municipality": municipality,
      };
}
