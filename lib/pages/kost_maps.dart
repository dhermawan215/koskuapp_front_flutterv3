import 'dart:async';
import 'package:Koskuappfront/models/models.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class KostMaps extends StatefulWidget {
  final KostModel kost;

  KostMaps(
    this.kost,
  );

  @override
  State<KostMaps> createState() => KostMapSampleState();
}

class KostMapSampleState extends State<KostMaps> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    _markers.add(
      Marker(
        markerId: MarkerId('markerId'),
        position: LatLng(double.parse(widget.kost.latitude ?? '0'),
            double.parse(widget.kost.longtitude ?? '0')),
      ),
    );
  }

  List<Marker> _markers = <Marker>[];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        markers: Set.from(_markers),
        initialCameraPosition: CameraPosition(
            target: LatLng(double.parse(widget.kost.latitude ?? '0'),
                double.parse(widget.kost.longtitude ?? '0')),
            zoom: 19.151926040649414),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text("Focus Me!"),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(double.parse(widget.kost.latitude ?? '0'),
            double.parse(widget.kost.longtitude ?? '0')),
        zoom: 30)));
  }
}
