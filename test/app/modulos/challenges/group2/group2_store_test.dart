import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_akwen/app/modulos/challenges/group2/group2_store.dart';
 
void main() {
  late Group2Store store;

  setUpAll(() {
    store = Group2Store();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}