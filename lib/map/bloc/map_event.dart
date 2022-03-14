part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {}

class GetLocationRequested extends MapEvent {
  @override
  List<Object> get props => [];
}
