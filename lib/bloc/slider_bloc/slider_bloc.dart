import 'package:bloc/bloc.dart';
import 'package:switch_bloc_test/bloc/slider_bloc/slider_event.dart';
import 'package:switch_bloc_test/bloc/slider_bloc/slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderStates> {
  SliderBloc() : super(const SliderStates()) {
    //

    on<SliderFunction>((event, emit) {
      _slider(event, emit);
    });
  }

  void _slider(SliderFunction event, Emitter<SliderStates> emit) {
    emit(state.copyWith(slider: event.slider));
  }
}
