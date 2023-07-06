part of 'models.dart';

// enum KostTags { rekomendasi, popular, new_kost, umum }

class KostModel {
  int? id;
  User? user;
  String? name;
  String? address;
  String? district;
  String? regency;
  String? facility;
  int? price;
  String? status;
  String? room;
  double? ratings;
  String? tags;
  String? whatsappNumber;
  String? gmapUrl;
  String? latitude;
  String? longtitude;
  String? picture;
  List<GalleryModel>? galerries;

  KostModel({
    this.id,
    this.user,
    this.name,
    this.address,
    this.district,
    this.regency,
    this.facility,
    this.price,
    this.status,
    this.room,
    this.ratings,
    this.whatsappNumber,
    this.gmapUrl,
    this.latitude,
    this.longtitude,
    this.picture,
    this.tags,
    this.galerries,
  });

  KostModel.fromJson(Map<String, dynamic> json,
      {Map<String, dynamic>? userData}) {
    // print('from json: $json');

    id = json['id'];
    name = json['name'];
    user = User.fromJson(userData ?? json['user']);
    address = json['address'];
    district = json['district'];
    regency = json['regency'];
    facility = json['facility'];
    price = json['price'];
    status = json['status'];
    room = json['room'];
    ratings = json['ratings'].toDouble();
    whatsappNumber = json['whatsapp_number'];
    gmapUrl = json['gmap_url'];
    tags = json['tags'];
    latitude = json['latitude'];
    longtitude = json['longtitude'];
    picture = json['picture'];
    galerries = json['galerries'] != null
        ? json['galerries']
            .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
            .toList()
        : [];

    //         .toList());
    // id = json['id'];
    // name = json['name'];
    // address = json['address'];
    // district = json['district'];
    // regency = json['regency'];
    // facility = json['facility'];
    // price = json['price'];
    // status = json['price'];
    // ratings = json['ratings'];
    // whatsappNumber = json['whatsapp_number'];
    // gmapUrl = json['gmap_url'];
    // tags = json['tags'];
    // latitude = json['latitude'];
    // longtitude = json['longtitude'];
    // picture = json['picture'];
    // galleries = json['galleries']
    //     .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
    //     .toList();
  }
}
