
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

import '../../../locals/shared.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  String city = Shared.getString(key: "city");
  late Weather updatedDate ;

  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeatherData>((event, emit) async {
      try {
        WeatherFactory wf = WeatherFactory("fd2512873cd195a083421bb63164cbca", language: Language.DANISH);
        Weather w = await wf.currentWeatherByCityName(city);
        emit(Weathersuccess(w));
      } catch (e) {
        print(e);
        emit(WeatherFail());
      }
    });
    on<UpdateForecastData>((event, emit) async {

        emit(Weathersuccess(updatedDate));

    });
  }

  // void updateForecastData(Weather forecast){
    
  //   emit(Weathersuccess(forecast));
  // }

  void getWeatherFromForcast(Weather singleInstance){
    updatedDate =  singleInstance;
  }
}
