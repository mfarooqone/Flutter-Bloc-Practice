import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_bloc_test/bloc/switch_bloc/switch_bloc.dart';
import 'package:switch_bloc_test/bloc/switch_bloc/switch_event.dart';
import 'package:switch_bloc_test/bloc/switch_bloc/switch_state.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});
  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              BlocBuilder<SwitchBloc, SwitchStates>(
                buildWhen: (previous, current) =>
                    previous.isSwitch != current.isSwitch,
                builder: (context, state) {
                  // print("Notifications");
                  return Switch(
                    value: state.isSwitch,
                    onChanged: (value) {
                      context.read<SwitchBloc>().add(
                            EnableOrDisableNotification(),
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
