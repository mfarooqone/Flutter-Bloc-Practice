import 'package:bloc/bloc.dart';
import 'package:switch_bloc_test/bloc/switch_bloc/switch_event.dart';
import 'package:switch_bloc_test/bloc/switch_bloc/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchStates> {
  SwitchBloc() : super(const SwitchStates()) {
    on<EnableOrDisableNotification>((event, emit) {
      _enableOrDisableNotifications(event, emit);
    });
  }

  void _enableOrDisableNotifications(
      EnableOrDisableNotification event, Emitter<SwitchStates> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
}
