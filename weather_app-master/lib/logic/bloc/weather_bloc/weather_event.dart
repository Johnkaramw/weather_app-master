part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}




class FetchWeatherData extends WeatherEvent{
  
}


class UpdateForecastData extends WeatherEvent{

}