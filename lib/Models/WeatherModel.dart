class WeatherModel{
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherModel({required this.id, required this.main, required this.description, required this.icon});


  WeatherModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'main' : main,
      'description' : description,
      'icon' : icon,
    };
  }
}