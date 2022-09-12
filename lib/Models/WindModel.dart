class WindModel{
  dynamic speed;
  dynamic deg;

  WindModel({required this.speed, required this.deg});

  WindModel.fromJson(Map<String, dynamic> json){
    speed = json['speed'];
    deg = json['deg'];
  }

  Map<String, dynamic> toMap(){
    return {
      'speed' : speed,
      'deg' : deg
    };
  }
}