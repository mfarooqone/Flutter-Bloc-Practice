import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:switch_bloc_test/bloc/image_picker_bloc/image_picker_event.dart';
import 'package:switch_bloc_test/bloc/image_picker_bloc/image_picker_state.dart';
import 'package:switch_bloc_test/utils/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(onCameraCapture);
    on<GalleryImagePicker>(onGallery);
    on<ClearImage>(onClearImage);
  }

  void onCameraCapture(
      CameraCapture event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    if (file != null) {
      emit(state.copyWith(file: file));
    } else {
      emit(state.copyWith(file: null));
    }
  }

  void onGallery(
      GalleryImagePicker event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    if (file != null) {
      emit(state.copyWith(file: file));
    } else {
      emit(state.copyWith(file: null));
    }
  }

  void onClearImage(ClearImage event, Emitter<ImagePickerState> emit) {
    emit(state.copyWith(file: null));
  }
}
