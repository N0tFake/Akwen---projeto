import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_akwen/app/modulos/desafio_3/desafio3_store.dart';
 
void main() {
  late Desafio3Store store;

  setUpAll(() {
    store = Desafio3Store();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}