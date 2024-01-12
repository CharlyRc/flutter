import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AboutUsPage extends StatelessWidget {
  AboutUsPage({super.key});
  final _controller = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: _controller,
        options: const MapOptions(
          initialCenter: LatLng(45.78, -0.13),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          const MarkerLayer(
            markers: [
              Marker(
                  alignment: Alignment.center,
                  point: LatLng(47.2061667, -1.54196),
                  child: Icon(
                    Icons.school,
                    size: 35,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
