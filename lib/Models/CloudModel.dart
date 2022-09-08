class CloudModel{
  int? all;
  CloudModel({required this.all});

  CloudModel.fromJson(Map<String, dynamic> json){
    all = json['all'];
  }

  Map<String, dynamic> toMap(){
    return {
      'all' : all
    };
  }
}