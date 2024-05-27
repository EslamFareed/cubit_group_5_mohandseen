part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}


class AddState extends HomeState{}
class SubState extends HomeState{}