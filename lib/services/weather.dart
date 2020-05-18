import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const key = '582b9878895368b4e5aff2470321d720';
const apiURL = "https://api.openweathermap.org/data/2.5/weather?";

class WeatherModel {
  Future<dynamic> getDataByCityName
  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.currentLocation();
    NetworkHelper nwHelper = NetworkHelper(
        '$apiURL+lat=${location.Latitude}&lon=${location.Longitude}&appid=$key&units=metric');
    var weatherData = await nwHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
