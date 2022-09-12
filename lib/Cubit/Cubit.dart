import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/Cubit/States.dart';
import 'package:weather/Models/CurrentWeatherModel.dart';
import 'package:weather/Models/FiveDaysModel.dart';
import 'package:weather/Shared/Constants/Constants.dart';
import 'package:weather/Shared/Network/Remote/DioHelper.dart';
import 'package:weather/Shared/Network/Remote/EndPoint.dart';
import 'package:weather/Models/FiveDaysDataModel.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());

  static WeatherCubit get(context) => BlocProvider.of(context);

  CurrentWeatherModel? currentWeatherModel;
  String city = 'alexandria';

  void getWeatherData() async {
    emit(WeatherGetCurrentWeatherLoadingState());
    await DioHelper.getData(url: WEATHER, query: {'appid': APIKey, 'q': city})
        .then((value) {
      currentWeatherModel = CurrentWeatherModel.fromJson(value.data);
      getFiveDaysData();
    }).catchError((error) {
      print('error >>>>= ${error.toString()}');
      emit(WeatherGetCurrentWeatherErrorState());
    });
  }

  FiveDaysModel? fiveDaysModel;
  List<FiveDaysDataModel> fiveDaysDataModel = [];

  void getFiveDaysData() async {
    await DioHelper.getData(url: FORECAST, query: {'appid': APIKey, 'q': city})
        .then((value) {
      fiveDaysModel = FiveDaysModel.fromJson(value.data);
      for (int i = 0; i < fiveDaysModel!.weatherList.length; i++) {
        if (i == 0) {
          fiveDaysDataModel.add(FiveDaysDataModel(
              temp: fiveDaysModel!.weatherList[i].mainModel!.temp,
              dateTime: fiveDaysModel!.weatherList[i].dt_txt));
        } else if (i == 12) {
          fiveDaysDataModel.add(FiveDaysDataModel(
              temp: fiveDaysModel!.weatherList[i].mainModel!.temp,
              dateTime: fiveDaysModel!.weatherList[i].dt_txt));
        } else if (i == 25) {
          fiveDaysDataModel.add(FiveDaysDataModel(
              temp: fiveDaysModel!.weatherList[i].mainModel!.temp,
              dateTime: fiveDaysModel!.weatherList[i].dt_txt));
        }
        if (i == 39) {
          fiveDaysDataModel.add(FiveDaysDataModel(
              temp: fiveDaysModel!.weatherList[i].mainModel!.temp,
              dateTime: fiveDaysModel!.weatherList[i].dt_txt));
        }
      }
      emit(WeatherGetCurrentWeatherSuccessState());
    }).catchError((error) {
      print('Error in five days data ===> ${error.toString()}');
    });
  }
}
