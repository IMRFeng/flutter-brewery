import 'package:appbrewery/clima/services/location.dart';
import 'package:appbrewery/clima/services/networking.dart';

const kApiKey = 'fe9794a48096cbe2109b20eccc1b3b21';
const kOpenWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    String url = '$kOpenWeatherMapURL?q=$cityName&appid=$kApiKey&units=metric';
    NetworkHelper nh = NetworkHelper(url);
    var weatherData = await nh.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentLocation();

    String url =
        '$kOpenWeatherMapURL?lat=${loc.latitude}&lon=${loc.longitude}&appid=$kApiKey&units=metric';
    NetworkHelper nh = NetworkHelper(url);
    var weatherData = await nh.getData();
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
