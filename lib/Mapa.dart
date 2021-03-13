import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {

  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _marcadores = {};

  _onMapCreated(GoogleMapController controller){

    _controller.complete(controller);

  }

  _exibirMarcador(LatLng latLng){

    Marker marcador = Marker(
      markerId: MarkerId("marcador-${latLng.latitude}-${latLng.longitude}"),
      position: latLng,
      infoWindow: InfoWindow(
        title: "Marcador",
      )
    );

    setState(() {
      _marcadores.add(marcador);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mapa"),),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(-1.404154, -48.465232),
          zoom: 16
        ),
        onMapCreated: _onMapCreated,
        onLongPress: _exibirMarcador,
        markers: _marcadores,
      ),
    );
  }
}
