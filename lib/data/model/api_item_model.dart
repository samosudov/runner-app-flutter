class ApiItemModel {
  final String id;
  final String name;
  final String password;

  const ApiItemModel({
    required this.id,
    required this.name,
    required this.password,
  });

  factory ApiItemModel.fromJson(Map<String, dynamic> json) {
    return ApiItemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      password: json['password'] as String,
    );
  }
}
