import 'package:weather/Models/CloudModel.dart';
import 'package:weather/Models/CoordModel.dart';
import 'package:weather/Models/MainWeatherModel.dart';
import 'package:weather/Models/SysModel.dart';
import 'package:weather/Models/WeatherModel.dart';

class CurrentWeatherModel {
  Coord? coord;
  List<WeatherModel>? weather;
  String? base;
  MainWeatherModel? mainWeather;
  int? visibility;
  CloudModel? cloud;
  int? dt;
  SysModel? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  CurrentWeatherModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.mainWeather,
    required this.visibility,
    required this.cloud,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod
});

  CurrentWeatherModel.fromJson(Map<String, dynamic> json){
    coord = json['coord'];
    weather = json['weather'];
    base = json['base'];
    mainWeather = json['mainWeather'];
    visibility = json['visibility'];
    cloud = json['cloud'];
    dt = json['dt'];
    sys = json['sys'];
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toMap(){
    return {
      'coord' : coord,
      'weather' : weather,
      'base' : base,
      'mainWeather' : mainWeather,
      'visibility' : visibility,
      'cloud' : cloud,
      'dt' : dt,
      'sys' : sys,
      'timezone' : timezone,
      'id' : id,
      'name' : name,
      'cod' : cod,
    };
  }
}