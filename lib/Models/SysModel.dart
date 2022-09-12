class SysModel{

  dynamic type;
  dynamic id;
  dynamic country;
  dynamic sunrise;
  dynamic sunset;

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