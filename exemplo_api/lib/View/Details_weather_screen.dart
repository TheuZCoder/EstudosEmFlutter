import 'package:exemplo_api/Controller/Weather_Controller.dart';
import 'package:flutter/material.dart';

class DetailsScreenState extends StatefulWidget {
  final String cityName;
  const DetailsScreenState({super.key, required this.cityName});

  @override
  State<DetailsScreenState> createState() => DetailsScreenStateState();
}

class DetailsScreenStateState extends State<DetailsScreenState> {
  final WeatherController _controller = WeatherController();

  @override
  void initState() {
    super.initState();
    _controller.getWeather(widget.cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cityName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
            const Text('Detalhes da cidade'),
            FutureBuilder(
                future: _controller.getWeather(widget.cityName),
                builder: (context, snapshot) {
                  if (_controller.weatherList.isEmpty) {
                    return const CircularProgressIndicator();
                  } else {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'Cidade: ${_controller.weatherList.last.name}'),
                            IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.favorite_border_outlined))
                          ],
                        ),
                        Text('Main: ${_controller.weatherList.last.main}'),
                        Text(
                            'Descrição: ${_controller.weatherList.last.description}'),
                        Text(
                            'Temperatura: ${(_controller.weatherList.last.temp - 273).toString()} °C'),
                        Text(
                            'Temperatura Máxima: ${(_controller.weatherList.last.tempMax - 273).toString()} °C'),
                        Text(
                            'Temperatura Mínima: ${(_controller.weatherList.last.tempMin - 273).toString()} °C'),
                      ],
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
