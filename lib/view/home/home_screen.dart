import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whether_app/controller/weather_provider.dart';
import 'package:whether_app/model/weather_model.dart';
import 'package:whether_app/services/weather_api_client.dart';
import 'package:whether_app/view/widgets/additional_information.dart';
import 'package:whether_app/view/widgets/current_weather.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  //call the api in the init state function
  WeatherApiClient client = WeatherApiClient();

  Weather? data;

  Future<void> getData() async {
    //let's try changing the city name
    data = await client.getCurrentWeather("London");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, value, child) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          // backgroundColor: Colors.grey[300],
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: const Text(
            "Weather App",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    currentWeather(Icons.wb_sunny_rounded, "${data!.temp}°",
                        "${data!.cityName}"),
                    const SizedBox(
                      height: 60.0,
                    ),
                    const Center(
                      child: Text(
                        "Additional Information",
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Color(0xdd212121),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    additionalInformation("${data!.wind}", "${data!.humidity}",
                        "${data!.pressure}", "${data!.feels_like}"),
                  ],
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container();
            }),
      );
    });
  }
}
