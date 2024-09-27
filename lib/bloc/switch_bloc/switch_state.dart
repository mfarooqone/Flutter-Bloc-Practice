import 'package:equatable/equatable.dart';

class SwitchStates extends Equatable {
  ///
  final bool isSwitch;

  ///
  const SwitchStates({
    this.isSwitch = false,
  });

  SwitchStates copyWith({bool? isSwitch, double? slider}) {
    return SwitchStates(
      isSwitch: isSwitch ?? this.isSwitch,
    );
  }

  @override
  List<Object?> get props => [isSwitch];
}
