import 'package:flutter_test/flutter_test.dart';

import 'package:dynojsonstore/dynojsonstore.dart';

void main() {
  test('writing data to a test file located in the same pwd', () async {
    DynoJsonStore store = DynoJsonStore(storePath: 'package-info.json');
    await store.put('author', 'omegaui');
  });
  test('writing data to a test file with a non-existing path', () async {
    DynoJsonStore store = DynoJsonStore(storePath: 'some-path/package-info.json');
    await store.put('github-profile-url', 'https://github.com/omegaui');
  });
  test('writing list to a test file with a non-existing path', () async {
    DynoJsonStore store = DynoJsonStore(storePath: 'some-path/iterable-test.json');
    List<String> names = ['{"cats": 2}', '{"dogs": 1}', '{"birds": 3}'];
    await store.put('iterable-data', names);
  });
  test('reading a list from a test file', () async {
    DynoJsonStore store = DynoJsonStore(storePath: 'some-path/iterable-test.json');
    List<dynamic> list = store.get('iterable-data');
    for(var value in list){
      print('we have $value');
    }
  });
  test('reading data from a file located in the same pwd', () {
    DynoJsonStore store = DynoJsonStore(storePath: 'package-info.json');
    print(store.get('author'));
  });
  test('reading data from a file located another relative directory', () {
    DynoJsonStore store = DynoJsonStore(storePath: 'some-path/package-info.json');
    print(store.get('github-profile-url'));
  });
}
