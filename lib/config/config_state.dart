import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ConfigState extends Equatable {
  ConfigState([List props = const <dynamic>[]]) : super(props);

  ConfigState getStateCopy();
}

class UnConfigState extends ConfigState {

   @override
  String toString() => 'UnConfigEvent';

  @override
  ConfigState getStateCopy() {
    return null;
  }
}

class InConfigState extends ConfigState {

   @override
  String toString() => 'InConfigEvent';
  
  @override
  ConfigState getStateCopy() {
    return null;
  }
}

class ErrorConfigState extends ConfigState {

  final String errorMessage;
  ErrorConfigState(this.errorMessage);

  @override
  String toString() => 'ErrorConfigEvent';
  
  @override
  ConfigState getStateCopy() {
    return ErrorConfigState(this.errorMessage);
  }
}