class FiveDaysModel{
  String? dateTime;
  int? temp;

  FiveDaysModel({
    required this.temp,
    required this.dateTime
});
  FiveDaysModel.fromJson(Map<String, dynamic> json){
    temp = json['temp'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toMap(){
    return {
      'temp' : temp,
      'dateTime' : dateTime,
    };
  }
}