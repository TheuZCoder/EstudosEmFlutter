class Weather {
  //atributos
  final String description;
  final String main;
  final String name;
  final num temp;
  final num tempMax;
  final num tempMin;

  //construtor
  Weather({
    required this.name,
    required this.temp,
    required this.tempMax,
    required this.tempMin,
    required this.description,
    required this.main,
  });

  //método factory

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json['name'],
      temp: json['main']['temp'],
      tempMax: json['main']['temp_max'],
      tempMin: json['main']['temp_min'],
      description: json['weather'][0]['description'],
      main: json['weather'][0]['main'],
    );
  }

  //método toJson
}