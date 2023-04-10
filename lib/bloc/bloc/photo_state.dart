part of 'photo_bloc.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

class PhotoInitial extends PhotoState {}

class PhotoResponseState extends PhotoState {
  Either<String, List<Photo>> response;
  PhotoResponseState(this.response);
}
