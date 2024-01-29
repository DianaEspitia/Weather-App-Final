class CityWeatherModel {
  List<WeatherData>? weather;
  MainData? mainData;
  WindData? wind;
  CloudsData? clouds;
  AdditionalData? additionalData;
  String? cityName;

  CityWeatherModel({
    this.weather,
    this.mainData,
    this.wind,
    this.clouds,
    this.additionalData,
    this.cityName,
  });

  CityWeatherModel copyWith({
    List<WeatherData>? weather,
    MainData? mainData,
    WindData? wind,
    CloudsData? clouds,
    AdditionalData? additionalData,
    String? cityName,
  }) =>
      CityWeatherModel(
        weather: weather ?? this.weather,
        mainData: mainData ?? this.mainData,
        wind: wind ?? this.wind,
        additionalData: additionalData ?? this.additionalData,
        cityName: cityName ?? this.cityName,
      );

  factory CityWeatherModel.fromJson(Map<String, dynamic> json) =>
      CityWeatherModel(
        weather: json["weather"] == null
            ? []
            : List<WeatherData>.from(
                json["weather"]!.map((x) => WeatherData.fromJson(x))),
        mainData: json["main"] == null ? null : MainData.fromJson(json["main"]),
        wind: json["wind"] == null ? null : WindData.fromJson(json["wind"]),
        clouds:
            json["clouds"] == null ? null : CloudsData.fromJson(json["clouds"]),
        additionalData:
            json["sys"] == null ? null : AdditionalData.fromJson(json["sys"]),
        cityName: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "weather": weather == null
            ? []
            : List<dynamic>.from(weather!.map((x) => x.toJson())),
        "main": mainData?.toJson(),
        "wind": wind?.toJson(),
        "clouds": clouds?.toJson(),
        "sys": additionalData?.toJson(),
        "name": cityName,
      };
}

class CloudsData {
  int? all;

  CloudsData({
    this.all,
  });

  CloudsData copyWith({
    int? all,
  }) =>
      CloudsData(
        all: all ?? this.all,
      );

  factory CloudsData.fromJson(Map<String, dynamic> json) => CloudsData(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class MainData {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  MainData({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  MainData copyWith({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
  }) =>
      MainData(
        temp: temp ?? this.temp,
        feelsLike: feelsLike ?? this.feelsLike,
        tempMin: tempMin ?? this.tempMin,
        tempMax: tempMax ?? this.tempMax,
        pressure: pressure ?? this.pressure,
        humidity: humidity ?? this.humidity,
      );

  factory MainData.fromJson(Map<String, dynamic> json) => MainData(
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
      };
}

class AdditionalData {
  String? country;

  AdditionalData({
    this.country,
  });

  AdditionalData copyWith({
    int? type,
    int? id,
    String? country,
    int? sunrise,
    int? sunset,
  }) =>
      AdditionalData(
        country: country ?? this.country,
      );

  factory AdditionalData.fromJson(Map<String, dynamic> json) => AdditionalData(
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
      };
}

class WeatherData {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherData({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  WeatherData copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) =>
      WeatherData(
        id: id ?? this.id,
        main: main ?? this.main,
        description: description ?? this.description,
        icon: icon ?? this.icon,
      );

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class WindData {
  double? speed;

  WindData({
    this.speed,
  });

  WindData copyWith({
    double? speed,
    int? deg,
  }) =>
      WindData(
        speed: speed ?? this.speed,
      );

  factory WindData.fromJson(Map<String, dynamic> json) => WindData(
        speed: json["speed"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
      };
}
