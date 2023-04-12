part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeRequestSuccessState extends HomeState {
  Either<String, List<Banner>> bannerList;

  HomeRequestSuccessState(
    this.bannerList,
  );
}
