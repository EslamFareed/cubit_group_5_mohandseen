part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}


class GetProductsLoading extends HomeState{}
class GetProductsSuccess extends HomeState{}
class GetProductsError extends HomeState{}

class FilterProductsState extends HomeState{}