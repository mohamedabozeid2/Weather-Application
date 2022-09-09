import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Cubit/States.dart';
import 'package:weather/Models/CurrentWeatherModel.dart';
import 'package:weather/Shared/Constants/Constants.dart';
import 'package:weather/Shared/Network/Remote/DioHelper.dart';
import 'package:weather/Shared/Network/Remote/EndPoint.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());

  static WeatherCubit get(context) => BlocProvider.of(context);

  CurrentWeatherModel? currentWeatherModel;
  String city = 'Alexandria';

  void getWeatherData() async {
    await DioHelper.getData(
            url: WEATHER,
            query: {'appid': APIKey, 'q': city})
        .then((value) {
      currentWeatherModel = CurrentWeatherModel.fromJson(value.data);
      print("Success");
    }).catchError((error) {
      print('error >>>>= ${error.toString()}');
    });
  }
}
