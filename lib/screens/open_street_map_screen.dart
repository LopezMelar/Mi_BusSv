import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OpenStreetMapScreen extends StatefulWidget {
  final double latitude;
  final double longitude;

  const OpenStreetMapScreen({
    required this.latitude,
    required this.longitude,
    super.key,
  });

  @override
  _OpenStreetMapScreenState createState() => _OpenStreetMapScreenState();
}

class _OpenStreetMapScreenState extends State<OpenStreetMapScreen> {
  final MapController _mapController = MapController();
  LocationData? currentLocation;
  List<LatLng> routePoints = [];
  List<Marker> markers = [];
  final String orsApiKey = '5b3ce3597851110001cf62482a3bbccce840449baea616641f870310';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    var location = Location();

    try {
      var userLocation = await location.getLocation();
      setState(() {
        currentLocation = userLocation;
        markers.add(
          Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(userLocation.latitude!, userLocation.longitude!),
            child: const Icon(Icons.my_location, color: Colors.blue, size: 40.0),
          ),
        );
      });
    } on Exception {
      currentLocation = null;
    }

    location.onLocationChanged.listen((LocationData newLocation) {
      setState(() {
        currentLocation = newLocation;
      });
    });
  }

  Future<void> _getRoute(LatLng destination) async {
    if (currentLocation == null) return;

    final start = LatLng(currentLocation!.latitude!, currentLocation!.longitude!);
    final response = await http.get(
      Uri.parse('https://api.openrouteservice.org/v2/directions/driving-car?api_key=$orsApiKey&start=${start.longitude},${start.latitude}&end=${destination.longitude},${destination.latitude}'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> coords = data['features'][0]['geometry']['coordinates'];
      setState(() {
        routePoints = coords.map((coord) => LatLng(coord[1], coord[0])).toList();
        markers.add(
          Marker(
            width: 80.0,
            height: 80.0,
            point: destination,
            child: const Icon(Icons.location_on, color: Colors.red, size: 40.0),
          ),
        );
      });
    } else {
      // Manejo de errores
      print('Failed to fetch route');
    }
  }

  void _addDestinationMarker(LatLng point) {
    setState(() {
      markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: point,
          child: const Icon(Icons.location_on, color: Colors.red, size: 40.0),
        ),
      );
    });
    _getRoute(point);
  }

  @override
  Widget build(BuildContext context) {
    final initialPosition = LatLng(widget.latitude, widget.longitude);

    return Scaffold(
      appBar: AppBar(
        title: const Text('OpenStreetMap with Flutter'),
      ),
      body: currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: initialPosition,
          initialZoom: 17,
          onTap: (tapPosition, point) => _addDestinationMarker(point),
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: markers,
          ),
          PolylineLayer(
            polylines: [
              Polyline(
                points: routePoints,
                strokeWidth: 4.0,
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (currentLocation != null) {
            _mapController.move(
              LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
              15.0,
            );
          }
        },
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
