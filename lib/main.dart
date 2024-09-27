import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_bloc_test/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:switch_bloc_test/bloc/slider_bloc/slider_bloc.dart';
import 'package:switch_bloc_test/bloc/switch_bloc/switch_bloc.dart';
import 'package:switch_bloc_test/utils/image_picker_utils.dart';
import 'package:switch_bloc_test/view/image_picker_screen/image_picker_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => SliderBloc()),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const SwitchWidget(),
        // home: const SliderWidget(),
        home: const ImagePickerScreen(),
      ),
    );
  }
}
