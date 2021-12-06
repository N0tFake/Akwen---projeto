import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_akwen/app/modulos/desafio_2/desafio2_store.dart';
 
void main() {
  late Desafio2Store store;

  setUpAll(() {
    store = Desafio2Store();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}