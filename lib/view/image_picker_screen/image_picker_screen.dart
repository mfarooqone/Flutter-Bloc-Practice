import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_bloc_test/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:switch_bloc_test/bloc/image_picker_bloc/image_picker_event.dart';
import 'package:switch_bloc_test/bloc/image_picker_bloc/image_picker_state.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ///
            /// Camera picker
            ///
            BlocBuilder<ImagePickerBloc, ImagePickerState>(
              builder: (context, state) {
                if (state.file == null) {
                  return InkWell(
                    onTap: () {
                      print("Camera button pressed");
                      context.read<ImagePickerBloc>().add(CameraCapture());
                    },
                    child: const CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.camera,
                      ),
                    ),
                  );
                } else {
                  return SizedBox(
                    width: 200,
                    height: 200,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: Image.file(
                            File(
                              state.file!.path,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<ImagePickerBloc>().add(ClearImage());
                          },
                          child: const Text("Clear"),
                        )
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
