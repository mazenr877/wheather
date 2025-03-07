// ignore_for_file: must_be_immutable

part of 'character_cubit.dart';

@immutable
sealed class CharacterState {}
final class CharacterInitial extends CharacterState {}
final class CharacterLodding extends CharacterState {}
final class CharacterSuccessful extends CharacterState {}
final class CharacterError extends CharacterState {
  final String erroMessage;

  CharacterError({required this.erroMessage});

 
}
final class CharacterChangeindex extends CharacterState {}


