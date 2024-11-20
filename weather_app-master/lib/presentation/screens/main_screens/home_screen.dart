import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapi/logic/bloc/forecaste_bloc/forecaste_bloc.dart';
import 'package:weatherapi/logic/bloc/weather_bloc/weather_bloc.dart';
import 'package:weatherapi/logic/utils/functions.dart';
import 'package:weatherapi/main.dart';
import 'package:weatherapi/presentation/screens/main_screens/options.dart';
import 'package:weatherapi/presentation/widgets/bad_response_page.dart';
import 'package:weatherapi/presentation/widgets/custom_list_forecaste.dart';
import 'package:weatherapi/presentation/widgets/custom_row.dart';
import 'package:weatherapi/presentation/widgets/custom_stack.dart';
import 'package:weatherapi/presentation/widgets/custom_text_divider.dart';
import '../../widgets/location_and_date.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: InkWell(
          onTap: () {
            BlocProvider.of<WeatherBloc>(context).add(FetchWeatherData());
          },
          child: Text(
            "Weather App",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 26, color: isDark? Colors.orange[300] : Colors.blue),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Options(),
                  ),
                );
              },
              icon: Icon(Icons.search)),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                height: 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(height: 15,),
                    Text("Khalid A.Elmekhashen",style: textTheme.headlineSmall,),
                    Text("Sr.Flutter Developer",style: textTheme.bodyLarge?.copyWith(
                      color: isDark? Colors.amber : const Color.fromARGB(255, 33, 75, 243)
                    ),),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
              ),
              Card(
                // color: Colors.white.withOpacity(.8),
                child: ListTile(
                  leading: Text("Dark Mode",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  trailing: Switch(
                    value: MyApp.themeManager.themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      MyApp.themeManager.toggleTheme(value);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is Weathersuccess) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LocationAndDate(
                      location: state.weather.areaName.toString(),
                      day: DateFormat("EEEE").format(state.weather.date!),
                      date: DateFormat("dd").format(state.weather.date!),
                      month: DateFormat("MMMM").format(state.weather.date!),
                      time: DateFormat().add_jm().format(state.weather.date!),
                    ),
                    const SizedBox(height: 40),
                    CustomStack(
                      temp: '${state.weather.temperature!.celsius!.round()}',
                      desc: "${state.weather.weatherMain!.toUpperCase()}",
                      icon: getWeatherIcon(state.weather.weatherConditionCode!),
                    ),
                    const SizedBox(height: 40),
                    CustomRow(
                      temp_max: state.weather.tempMax.toString(),
                      temp_min: state.weather.tempMin.toString(),
                      feelLike: state.weather.tempFeelsLike.toString(),
                      sunrise: state.weather.sunrise == null
                          ? "Null"
                          : DateFormat().add_jm().format(state.weather.sunrise!),
                      sunset: state.weather.sunrise == null
                          ? "Null"
                          : DateFormat().add_jm().format(state.weather.sunset!),
                      windSpeed: "${state.weather.windSpeed.toString()} KM/H",
                    ),
                    CustomTextDivider(header: "Forecaste"),
                    BlocProvider(
                      create: (context) =>
                          ForecasteBloc()..add(FetchWeahterForecaste()),
                      child: CustomListForecaste(),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is WeatherFail){
            return BadResponsePage();
          }else {
            return  Center(
                child: CircularProgressIndicator(
              color: isDark? Colors.orange : Colors.blue,
            ));
          }
        },
      ),
    );
  }
}
