import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:weather/weather.dart';
import 'package:weatherapi/locals/shared.dart';

part 'forecaste_event.dart';
part 'forecaste_state.dart';

class ForecasteBloc extends Bloc<ForecasteEvent, ForecasteState> {

    String city = Shared.getString(key: "city");

    ForecasteBloc() : super(ForecasteInitial()) {
      on<FetchWeahterForecaste>((event, emit) async {
        try {
          WeatherFactory wf = WeatherFactory("fd2512873cd195a083421bb63164cbca", language: Language.DANISH);
          List<Weather> forecast = await wf.fiveDayForecastByCityName(city);
          // forecast.forEach((forecaste){
          //   print(forecast);
          // });
          emit(WeatherForecasteSuccess(forecast));
        } catch (e) {
          emit(Weatherfail());
        }
    });
  }
}
