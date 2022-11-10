class Weather {
  final double temp;
  final String icon;
  final String condition;

  Weather({
    this.temp = 0,
    this.icon = '',
    this.condition = 'Sunny'
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['current']['temp_c'],
      icon: json['current']['condition']['icon'],
      condition: json['current']['condition']['text']
      );
  }
}