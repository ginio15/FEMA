class FormData {
  static final FormData _instance = FormData._internal();
  final Map<String, dynamic> _inputs = {};

  factory FormData() => _instance;
  FormData._internal();

  T? getValue<T>(String key) {
    final value = _inputs[key];
    if (value == null) return null;
    if (value is T) return value;
    try {
      if (T == String) return value.toString() as T;
      if (T == bool) return (value == true || value == 'true') as T;
      if (T == int) return int.parse(value.toString()) as T;
      if (T == double) return double.parse(value.toString()) as T;
    } catch (e) {
      print('Error converting value for key $key: $e');
    }
    return null;
  }

  void setValue<T>(String key, T? value) {
    if (value != null) {
      _inputs[key] = value;
    }
  }

  void addInput(String key, dynamic value) {
    if (value != null) {
      _inputs[key] = value;
    }
  }

  Map<String, dynamic> get inputs => Map.unmodifiable(_inputs);

  void clear() => _inputs.clear();

  @override
  String toString() => _inputs.toString();
}
