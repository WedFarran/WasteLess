part of 'driver_bloc.dart';

abstract class DriverState extends Equatable {
  const DriverState();  

  @override
  List<Object> get props => [];
}
class DriverInitial extends DriverState {}
