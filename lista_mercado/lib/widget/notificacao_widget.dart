import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

class NotificacaoWidget extends ChangeNotifier {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  NotificacaoWidget(this.flutterLocalNotificationsPlugin);

  Future<void> mostrarNotificacaoDeItemPendente(String nomeItem) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'com.example.lista_compras', // ID do canal
      'Lista de Compras', // Nome do canal 
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails plataformaChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // ID da notificação, pode ser qualquer valor único
      'Item Pendente',
      'Não se esqueça de comprar $nomeItem!',
      plataformaChannelSpecifics,
      payload: 'item x',
    );
  }
}
