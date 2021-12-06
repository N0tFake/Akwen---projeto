import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/group_store.dart';
 
void main() {
  late GroupStore store;

  setUpAll(() {
    store = GroupStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}