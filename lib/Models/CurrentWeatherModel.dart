import 'package:weather/Models/CloudModel.dart';
import 'package:weather/Models/CoordModel.dart';
import 'package:weather/Models/MainWeatherModel.dart';
import 'package:weather/Models/SysModel.dart';
import 'package:weather/Models/WeatherModel.dart';
import 'package:weather/Models/WindModel.dart';

class CurrentWeatherModel {
  Coord? coord;
  List<WeatherModel> weather = [];
  String? base;
  MainWeatherModel? mainWeather;
  int? visibility;
  CloudModel? cloud;
  WindModel? wind;
  int? dt;
  SysModel? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  CurrentWeatherModel(
      {required this.coord,
      required this.weather,
      required this.base,
      required this.mainWeather,
      required this.visibility,
      required this.cloud,
      required this.wind,
      required this.dt,
      required this.sys,
      required this.timezone,
      required this.id,
      required this.name,
      required this.cod});

  CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    coord = Coord.fromJson(json['coord']);
    json['weather'].forEach((element) {
      weather.add(WeatherModel.fromJson(element));
    });
    base = json['base'];
    mainWeather = MainWeatherModel.fromJson(json['main']);
    visibility = json['visibility'];
    wind = WindModel.fromJson(json['wind']);
    cloud = CloudModel.fromJson(json['clouds']);
    dt = json['dt'];
    sys = SysModel.fromJson(json['sys']);
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toMap() {
    return {
      'coord': coord,
      'weather': weather,
      'base': base,
      'main': mainWeather,
      'visibility': visibility,
      'clouds': cloud,
      'wind': wind,
      'dt': dt,
      'sys': sys,
      'timezone': timezone,
      'id': id,
      'name': name,
      'cod': cod,
    };
  }
}
