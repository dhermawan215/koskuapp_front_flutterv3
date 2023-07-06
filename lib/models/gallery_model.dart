part of 'models.dart';

class GalleryModel {
  int? id;
  String? pictureGalleries;

  GalleryModel({this.id, this.pictureGalleries});

  GalleryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pictureGalleries = json['picture_galleries'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pictureGalleries': pictureGalleries,
    };
  }
}
