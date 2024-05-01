import 'package:aid_repository/entities/item_entity.dart';
import 'package:equatable/equatable.dart';



class RequestEntity extends Equatable {
  final String? id;
  final DateTime time;
  final Map<String, dynamic> address;
  final int numberOfItems;
  final List<ItemEntity>? items;
  final String userId;
  final String status;
  final String? deliveryId;

  const RequestEntity({
    this.id,
    required this.time,
    required this.address,
    required this.numberOfItems,
    this.items,
    required this.userId,
    required this.status,
    this.deliveryId,
  });

  @override
  List<Object?> get props => [time, address, numberOfItems, items, userId];
}
