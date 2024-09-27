abstract class SliderEvent {
  SliderEvent();

  List<Object> get props => [];
}

class SliderFunction extends SliderEvent {
  double slider;
  SliderFunction({
    required this.slider,
  });

  @override
  List<Object> get props => [slider];
}
