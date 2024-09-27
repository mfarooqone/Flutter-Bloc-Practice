import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_bloc_test/bloc/slider_bloc/slider_bloc.dart';
import 'package:switch_bloc_test/bloc/slider_bloc/slider_event.dart';
import 'package:switch_bloc_test/bloc/slider_bloc/slider_state.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});
  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              BlocBuilder<SliderBloc, SliderStates>(
                buildWhen: (previous, current) =>
                    previous.slider != current.slider,
                builder: (context, state) {
                  // print("Container");
                  return Container(
                    height: 200,
                    width: 300,
                    color: Colors.red.withOpacity(state.slider),
                  );
                },
              ),

              ///
              ///
              ///
              BlocBuilder<SliderBloc, SliderStates>(
                buildWhen: (previous, current) =>
                    previous.slider != current.slider,
                builder: (context, state) {
                  // print("Slider");
                  return Slider(
                    value: state.slider,
                    onChanged: (value) {
                      context.read<SliderBloc>().add(
                            SliderFunction(slider: value),
                          );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
