part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}
final class WeatherFail extends WeatherState {}

final class Weathersuccess extends WeatherState {
  final Weather weather;

  Weathersuccess(this.weather);
}


