import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_akwen/app/modulos/resultado/resultado_store.dart';
 
void main() {
  late ResultadoStore store;

  setUpAll(() {
    store = ResultadoStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}