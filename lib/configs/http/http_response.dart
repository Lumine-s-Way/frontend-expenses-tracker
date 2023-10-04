

class Response<T>{
  // @IsTest()
  final T data;
  final String message;
  final String title;
  final dynamic pagination;

  const Response(
      {required this.data, required this.message, required this.title, required this.pagination});

  Response.withAssert(
      {required this.data, required this.message, required this.title, required this.pagination})
      : assert(message.isEmpty && title.isEmpty);

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      data: json['data'],
      message: json['message'],
      title: json['title'],
      pagination: json['pagination'],
    );
  }

}