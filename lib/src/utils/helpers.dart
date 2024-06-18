import 'package:gal/gal.dart';

Future<void> saveImageInGallery(String imagePath) async {
  await Gal.putImage(imagePath);
}