import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Cubit/Cubit.dart';
import 'package:weather/Cubit/States.dart';
import 'package:weather/Shared/Components/Components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherCubit()..getWeatherData(),
      child: BlocConsumer<WeatherCubit, WeatherStates>(
        listener: (context, state){},
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              title: Text("Hello Weather"),
            ),
            body: Column(
              children: [
                defaultButton(text: 'TEST', fun: (){
                  print(WeatherCubit.get(context).currentWeatherModel!.weather[0].description);
                })
              ],
            ),
          );
        },
      ),
    );
  }
}
