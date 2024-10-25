// Class representing a generic response
class AppResponse {
  // The data contained in the response, can be of any type
  final dynamic data;

  // Constructor to initialize the response with data
  AppResponse({
    this.data,
  });

  // Factory constructor to create an instance of AppResponse from a JSON map
  factory AppResponse.fromJson(Map<String, dynamic>? json) {
    return AppResponse(
      data: json,
    );
  }

  // Static method to create an instance of AppResponse from a JSON map,
  // ensuring the data is a list if the JSON is null
  static AppResponse fromJsonToList(Map<String, dynamic>? json) {
    return AppResponse(
      data: json ?? [],
    );
  }
}
