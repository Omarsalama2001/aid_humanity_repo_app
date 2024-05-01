import 'package:aid_repository/entities/item_entity.dart';
import 'package:aid_repository/models/item_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) async {
      if (event is GetRequestEvent) {
        emit(GetRequestloadingState());
        try {
          final reqItems = await _getRequestById(event.id);
          emit(GetRequestSuccessState(requestItems: reqItems));
        } catch (e) {
          emit(GetRequestErrorState());
        }
      }
    });
  }

  Future<List<ItemEntity>> _getRequestById(String id) async {
    List<ItemModel> requestItems;
    final itemsSnapshot = await FirebaseFirestore.instance.collection('request').doc(id).collection('items').get();
    requestItems = itemsSnapshot.docs.map((doc) => ItemModel.fromJson(doc.data())).toList();
    FirebaseFirestore.instance.collection('request').doc(id).update({
      'qrScanned': true,
      'status': 'done',
    });
    return requestItems;
  }
}
