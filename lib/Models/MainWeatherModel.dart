class MainWeatherModel {
  double? temp;
  double? feels_like;
  double? temp_min;
  double? temp_max;
  double? pressure;
  double? humidity;

  MainWeatherModel(
      {required this.temp,
      required this.feels_like,
      required this.humidity,
      required this.pressure,
      required this.temp_max,
      required this.temp_min});

  MainWeatherModel.fromJson(Map<String, dynamic> json){
    temp = json['temp'];
    feels_like = json['feels_like'];
    temp_min = json['temp_min'];
    temp_max = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toMap(){
    return {
      'temp' : temp,
      'feels_like' : feels_like,
      'temp_min' : temp_min,
      'temp_max' : temp_max,
      'pressure' : pressure,
      'humidity' : humidity,
    };
  }
}
