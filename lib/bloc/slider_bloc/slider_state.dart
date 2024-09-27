import 'package:equatable/equatable.dart';

class SliderStates extends Equatable {
  ///

  final double slider;

  ///
  const SliderStates({
    this.slider = 1.0,
  });

  SliderStates copyWith({double? slider}) {
    return SliderStates(
      slider: slider ?? this.slider,
    );
  }

  @override
  List<Object?> get props => [slider];
}
