
<div align="center">
    <img src="https://img.icons8.com/fluency/240/000000/mind-map.png">
    <h2><strong>DynoJsonStore</strong></h2>
    <h4>A tiny, fully code integrated, dynamic NOSQL database management system that uses JSON.</h4>
</div>

## Reading and Writing Data
Easiest and the Quickest way to save app data using the legendary JSON format.
All you need is a `DynoJsonStore` object.


### Writing
```dart

import 'package:dynojsonstore/dynojsonstore.dart';

void main() async {
  DynoJsonStore store = DynoJsonStore(storePath: 'settings.json');
  await store.put('author', 'omegaui');
}
```
Or write data without `async`
```dart

import 'package:dynojsonstore/dynojsonstore.dart';

void main() {
  DynoJsonStore store = DynoJsonStore(storePath: 'settings.json');
  store.putSync('author', 'omegaui');
}
```

### Reading
```dart

import 'package:dynojsonstore/dynojsonstore.dart';

void main() {
  DynoJsonStore store = DynoJsonStore(storePath: 'settings.json');
  print(store.get('author'));
}
```

## Automatic management for key<->iterable data pair
```dart

import 'package:dynojsonstore/dynojsonstore.dart';

void main() {
  DynoJsonStore store = DynoJsonStore(storePath: 'settings.json');
  List<dynamic> list = ['{"items": 2}', '{"items": 1}', '{"items": 3}'];
  store.putSync('iterable-data', list);
  List<dynamic> listOut = store.get('iterable-data');
  for(var itemData in listOut){
    print(itemData['items']);
  }
}
```

## Getting started

Run

`flutter pub add dynojsonstore`

and you are ready to **rock**.

## Usage

```dart

import 'package:dynojsonstore/dynojsonstore.dart';

void main() {
  DynoJsonStore store = DynoJsonStore(storePath: 'settings.json');
  store.putSync('author', 'omegaui');
}
```

## Next Steps

What's planned for next version?

```dart
await your.ideas();
```


