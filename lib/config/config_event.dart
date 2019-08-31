import 'package:devfest_demo/utils/devfest.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'index.dart';

@immutable
abstract class ConfigEvent extends Equatable {
  ConfigEvent([List props = const <dynamic>[]]) : super(props);
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc});
}

class DarkModeEvent extends ConfigEvent {
  final bool darkOn;
  DarkModeEvent(this.darkOn);

  @override
  String toString() => 'DarkModeEfent';

  @override
  Future<ConfigState> applyAsync(
      {ConfigState currentState, ConfigBloc bloc}) async {
    try {
      bloc.darkModeOn = darkOn;
      DevFest.pref.setBool(DevFest.darkModePref, darkOn);
    } catch (_, stackTrace) {
      print('$_$stackTrace');
      return ErrorConfigState(_?.toString());
    }
    return InConfigState();
  }
}

class LoadConfigEvent extends ConfigEvent {
  @override
  String toString() => 'LoadConfigEvent';

  @override
  Future<ConfigState> applyAsync(
      {ConfigState currentState, ConfigBloc bloc}) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      return InConfigState();
    } catch (_, stackTrace) {
      print('$_$stackTrace');
      return ErrorConfigState(_?.toString());
    }
  }
}