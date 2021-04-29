import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future httpGet() async {
  final uri = 'https://api.binance.com/api/v3/ticker/24hr';

  final response = await http.get(
      Uri.parse(uri),);
  var resp = response.body;
  if (response.statusCode == 200) {
    var items = jsonDecode(resp);
    var selected = items.firstWhere((dropdown) => dropdown['symbol'] == 'BTCUSDT');
    var last = selected['lastPrice'];
    print(last);
        return last;
  }else{
    print('Не загрузились данные.');
    return null;
  }
}