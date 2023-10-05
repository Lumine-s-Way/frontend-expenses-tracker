

import 'package:frontend_expenses_tracker/shared/models/pagination.model.dart';

class Response<T>{
  final T data;
  final String message;
  final String title;
  final Pagination pagination;

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
      pagination: Pagination.fromJson(json['pagination']),
    );
  }

}