import 'package:aid_repository/entities/request_entity.dart';
import 'package:aid_repository/models/item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RequestModel extends RequestEntity {
  const RequestModel({required super.time, required super.address, required super.numberOfItems, required super.items, required super.userId, required super.status, super.id});

  factory RequestModel.fromJson(Map<String, dynamic> json, List<ItemModel> items) {
    return RequestModel(time: (json['time'] as Timestamp).toDate(), address: json['address'], numberOfItems: json['numberOfItems'], userId: json['userId'], status: json['status'], items: items, id: json['id']);
  }

  Map<String, dynamic> toJson(RequestModel requestModel) {
    return <String, dynamic>{
      'time': requestModel.time,
      'address': requestModel.address,
      'numberOfItems': requestModel.numberOfItems,
      'userId': requestModel.userId,
      'status': requestModel.status,
    };
  }
}
