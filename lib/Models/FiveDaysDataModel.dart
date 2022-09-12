class FiveDaysDataModel{
  String? dateTime;
  dynamic temp;

  FiveDaysDataModel({
    required this.temp,
    required this.dateTime
});
  FiveDaysDataModel.fromJson(Map<String, dynamic> json){
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