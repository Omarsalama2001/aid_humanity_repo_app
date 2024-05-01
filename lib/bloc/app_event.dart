part of 'app_bloc.dart';

@immutable
sealed class AppEvent {}

class GetRequestEvent extends AppEvent {
  String id;
  GetRequestEvent({
    required this.id,
  });
}
