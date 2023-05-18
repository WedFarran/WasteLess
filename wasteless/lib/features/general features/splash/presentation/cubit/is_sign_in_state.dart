import 'package:equatable/equatable.dart';

abstract class IsSignInState extends Equatable {
  const IsSignInState();
}

class IsSignInInitial extends IsSignInState {
  @override
  List<Object> get props => [];
}

class SignedIn extends IsSignInState {
  final String uid;
  const SignedIn({required this.uid});
  @override
  List<Object> get props => [];
}

class UnAuthenticated extends IsSignInState {
  @override
  List<Object> get props => [];
}

class Failure extends IsSignInState {
  final dynamic e;
  const Failure({required this.e});
  @override
  List<Object> get props => [];
}
