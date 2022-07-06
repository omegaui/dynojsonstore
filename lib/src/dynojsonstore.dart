
import 'dart:convert';
import 'dart:io';

/*
 * The dead simple logic behind the whole package.
 * @author: omegaui
 * @profile: https://github.com/omegaui
 * @project: https://github.com/omegaui/dynojsonstore
 */

class DynoJsonStore {
  /// The path of the database file
  final String storePath;

  /// The file object on which read/write operations are to be performed
  late File storeFile;

  /// The json object to access/update key - value pairs
  dynamic json;

  /// Accepts file path and auto-constructs the path if it doesn't exists
  /// e.g: var settings = DynoJsonStore(join('.app-data', 'app-settings.json'));
  DynoJsonStore({required this.storePath}){
    _load();
  }

  /// Initializing the Store
  void _load() {
    storeFile = File(storePath);
    if(!storeFile.existsSync()){
      storeFile.parent.createSync(recursive: true);
      storeFile.createSync();
      storeFile.writeAsStringSync('{}', flush: true);
      json = jsonDecode("{}");
    }
    else {
      String text = storeFile.readAsStringSync();
      if(text.isEmpty){
        text = '{}';
      }
      json = jsonDecode(text);
    }
  }

  /// Returns the value at a certain key, Returns null if the key doesn't exists
  /// e.g: settings.get('username')
  dynamic get(dynamic key){
    return json == null ? null : json[key];
  }

  /// Updates/Creates the key value pair (Synchronized)
  /// e.g: settings.putSync('username', 'omegaui')
  void putSync(dynamic key, dynamic value){
    if(value is Iterable){
      value = jsonDecode(value.toString());
    }
    json[key] = value;
    saveSync();
  }

  /// Saves the database (Synchronized)
  void saveSync(){
    storeFile.writeAsStringSync(jsonEncode(json), flush: true);
  }

  /// Updates/Creates the key value pair (ASynchronized)
  /// e.g: settings.put('username', 'omegaui')
  Future<void> put(dynamic key, dynamic value) async {
    if(value is Iterable){
      value = jsonDecode(value.toString());
    }
    json[key] = value;
    await save();
  }

  /// Saves the database (ASynchronized)
  Future<void> save() async {
    await storeFile.writeAsString(jsonEncode(json), flush: true);
  }

}

// That's it, Happy Hacking!
