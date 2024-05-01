part of 'app_bloc.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}
final class GetRequestSuccessState extends AppState {
  final List<ItemEntity> requestItems;

  GetRequestSuccessState({required this.requestItems});
}
final class GetRequestloadingState extends AppState {}
final class GetRequestErrorState extends AppState {}


