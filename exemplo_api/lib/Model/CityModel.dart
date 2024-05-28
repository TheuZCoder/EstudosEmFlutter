class City {
  //atributos
  final String cityName;
  final bool favoritescities;

  //construtor
  City({
    required this.cityName,
    required this.favoritescities,
  });

  //método factory

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      cityName: map['cityname'],
      favoritescities: map['favoritescities'],
    );
  }

  //método tomap

  Map<String, dynamic> toMap() {
    return {
      'cityname': cityName,
      'favoritescities': favoritescities,
    };
  }
}