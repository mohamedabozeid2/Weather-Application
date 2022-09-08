class SysModel{
  // "type": 1,
  // "id": 2514,
  // "country": "EG",
  // "sunrise": 1662521713,
  // "sunset": 1662567085
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  SysModel({
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
    required this.type
});

  SysModel.fromJson(Map<String, dynamic> json){
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toMap(){
    return {
      'type' : type,
      'id' : id,
      'country' : country,
      'sunrise' : sunrise,
      'sunset' : sunset,
    };
  }

}