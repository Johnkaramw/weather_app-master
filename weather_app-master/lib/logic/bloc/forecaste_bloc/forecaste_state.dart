part of 'forecaste_bloc.dart';

@immutable
sealed class ForecasteState {}

final class ForecasteInitial extends ForecasteState {}


final class Weatherfail extends ForecasteState {}

final class WeatherForecasteSuccess extends ForecasteState{
    final List<Weather> forecaste;

    WeatherForecasteSuccess(this.forecaste);
}