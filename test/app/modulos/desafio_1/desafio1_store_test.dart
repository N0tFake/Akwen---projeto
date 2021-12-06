import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_akwen/app/modulos/desafio_1/desafio1_store.dart';
 
void main() {
  late Desafio1Store store;

  setUpAll(() {
    store = Desafio1Store();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}