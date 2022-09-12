import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather/Cubit/Cubit.dart';
import 'package:weather/Cubit/States.dart';
import 'package:flutter/services.dart';
import 'package:weather/Shared/Components/Components.dart';
import 'package:weather/Shared/Styles/Themes.dart';

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
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: Get.height * 0.15,
              title: state is WeatherGetCurrentWeatherLoadingState
                  ? Container()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat.yMMMd().format(DateTime.now()),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(fontSize: 20),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                WeatherCubit.get(context)
                                    .currentWeatherModel!
                                    .name!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        color: Colors.black, fontSize: 25),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
            body: state is WeatherGetCurrentWeatherLoadingState
                ? const Center(child: CircularProgressIndicator())
                : CustomScrollView(
                    physics: ScrollPhysics(),
                    slivers: [
                      SliverAppBar(
                        pinned: false,
                        snap: false,
                        floating: false,
                        automaticallyImplyLeading: false,
                        expandedHeight: Get.height * 0.4,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Column(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30.0),
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(20.0)
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                '${(WeatherCubit.get(context).currentWeatherModel!.mainWeather!.temp! - 273.15).round().toString()} °C',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2,
                                              ),
                                              Text(
                                                'Min: ${(WeatherCubit.get(context).currentWeatherModel!.mainWeather!.temp_min! - 273.15).round().toString()}°C / Max: ${(WeatherCubit.get(context).currentWeatherModel!.mainWeather!.temp_max! - 273.15).round().toString()}°C',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(
                                                        color: Colors.black,
                                                        fontSize: 16.0),
                                              ),
                                              Text(
                                                'feels like ${(WeatherCubit.get(context).currentWeatherModel!.mainWeather!.feels_like! - 273.15).round().toString()} °C',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(
                                                        color: Colors.black,
                                                        fontSize: 16.0),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            child: LottieBuilder.asset(
                                                height: Get.height * 0.16,
                                                width: Get.width * 0.35,
                                                'assets/anims/cloudy_main.json'),
                                          )
                                          // Image(
                                          //   image: const AssetImage(
                                          //       'assets/images/sun.png'),
                                          //   height: Get.height * 0.16,
                                          //   // width: 300,
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  Container(
                                    width: Get.width * 0.8,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      WeatherCubit.get(context)
                                          .currentWeatherModel!
                                          .weather[0]
                                          .description!
                                          .capitalize!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            fontSize: 40,
                                          ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text('Wind',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2),
                                          Text(
                                              '${WeatherCubit.get(context).currentWeatherModel!.wind!.speed.toString()} m/s')
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Container(
                                          height: 60,
                                          width: 2,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Temp',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          ),
                                          Text(
                                              '${(WeatherCubit.get(context).currentWeatherModel!.mainWeather!.temp!.toInt() - 273.15.toInt()).toString()}°C')
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Container(
                                          height: 60,
                                          width: 2,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text('humidity',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2),
                                          Text(
                                              '${WeatherCubit.get(context).currentWeatherModel!.mainWeather!.humidity.toString()}%')
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        // fillOverscroll: false,
                        child: Container(
                          decoration: BoxDecoration(
                              color: secondDefaultColor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(50.0),
                                  topRight: Radius.circular(50.0))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 20, left: 30, right: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 8,
                                  width: Get.width * 0.4,
                                  margin: EdgeInsets.only(bottom: 20.0),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Forecast next 4 days: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: Get.width * 0.8,
                                            height: Get.height * 0.15,
                                            child: ListView.separated(
                                              itemBuilder: (context, index) {
                                                return buildWeatherItem(
                                                    context: context,
                                                    index: index);
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return const SizedBox(
                                                  width: 10.0,
                                                );
                                              },
                                              itemCount: 4,
                                              scrollDirection: Axis.horizontal,
                                            ),
                                          )
                                        ],
                                      ),

                                      // Container(
                                      //   width: Get.width*0.8,
                                      //   height: 100.0,
                                      //   child: SfCartesianChart(
                                      //     title: ChartTitle(text: 'Chart'),
                                      //     legend: Legend(isVisible: true),
                                      //
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: ListTile(
                                            title: Text('Home',
                                                textAlign: TextAlign.center),
                                          ),
                                        ),
                                        Expanded(
                                          child: ListTile(
                                            title: Text('Home',
                                                textAlign: TextAlign.center),
                                          ),
                                        ),
                                        Expanded(
                                          child: ListTile(
                                            title: Text('Home',
                                                textAlign: TextAlign.center),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}

Widget buildWeatherItem({required BuildContext context, required int index}) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
    padding: EdgeInsets.all(8.0),
    child: Column(
      children: [
        LottieBuilder.asset(
            height: 80, width: Get.width * 0.2, 'assets/anims/cloudy.json'),
        Text(
          '${((WeatherCubit.get(context).fiveDaysDataModel[index].temp) - 273.15).round().toString()}°C',
          style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 18),
        )
      ],
    ),
  );
}
