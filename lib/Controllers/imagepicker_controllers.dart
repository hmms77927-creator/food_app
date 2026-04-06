import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController {
  var imagePath = ''.obs;

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();

    final image = await _picker.pickImage(
      source: ImageSource.camera,
    );

    if (image != null) {
      imagePath.value = image.path;
    }
  }
}