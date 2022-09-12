import 'package:weather/Models/CloudModel.dart';
import 'package:weather/Models/CoordModel.dart';
import 'package:weather/Models/WeatherModel.dart';
import 'package:weather/Models/WindModel.dart';

import 'CurrentWeatherModel.dart';

class FiveDaysModel {
  String? cod;
  int? message;
  int? cnt;
  List<WeatherListModel> weatherList = [];
  CityModel? city;


  FiveDaysModel.fromJson(Map<String, dynamic> json){
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    json['list'].forEach((element){
      weatherList.add(WeatherListModel.fromJson(element));
    });
    city = CityModel.fromJson(json['city']);

  }
}

class WeatherListModel{
  dynamic dt;
  MainModel? mainModel;
  List<WeatherModel> weatherModel = [];
  CloudModel? cloudModel;
  WindModel? windModel;
  dynamic visibility;
  dynamic pop;
  String? dt_txt;

  WeatherListModel.fromJson(Map<String, dynamic> json){
    dt = json['dt'];
    mainModel = MainModel.fromJson(json['main']);
    json['weather'].forEach((element){
      weatherModel.add(WeatherModel.fromJson(element));
    });
    cloudModel = CloudModel.fromJson(json['clouds']);
    windModel = WindModel.fromJson(json['wind']);
    visibility = json['visibility'];
    pop = json['pop'];
    dt_txt = json['dt_txt'];
  }

}
class MainModel{
  dynamic temp;
  dynamic feels_like;
  dynamic temp_min;
  dynamic temp_max;
  dynamic pressure;
  dynamic sea_level;
  dynamic grand_level;
  dynamic humidity;
  dynamic temp_kf;

  MainModel.fromJson(Map<String, dynamic> json){
    temp = json['temp'];
    temp_min = json['temp_min'];
    feels_like = json['feels_like'];
    temp_max = json['temp_max'];
    pressure = json['pressure'];
    sea_level = json['sea_level'];
    grand_level = json['grand_level'];
    humidity = json['humidity'];
    temp_kf = json['temp_kf'];
  }

}

class CityModel {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  CityModel({required this.name,
    required this.coord, required this.sunset, required this.sunrise, required this.country, required this.id,
    required this.population, required this.timezone});

  CityModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    coord = Coord.fromJson(json['coord']);
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}


// class FiveDaysModel{
//   String? dateTime;
//   int? temp;
//
//   FiveDaysModel({
//     required this.temp,
//     required this.dateTime
// });
//   FiveDaysModel.fromJson(Map<String, dynamic> json){
//     temp = json['temp'];
//     dateTime = json['dateTime'];
//   }
//
//   Map<String, dynamic> toMap(){
//     return {
//       'temp' : temp,
//       'dateTime' : dateTime,
//     };
//   }
// }