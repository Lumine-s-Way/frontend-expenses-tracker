final class Pagination {
  final int totalItems;
  final int limit;

  const Pagination({required this.totalItems, required this.limit});

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(totalItems: json["totalItems"], limit: json["limit"]);
  }
}
