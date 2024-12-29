class BaseResponse<T> {
  BaseResponse({
    required this.data,
    required this.isSuccessed,
    this.message = '',
    this.totalRecord,
    this.totalPage,
  });

  T? data;
  String message;
  bool isSuccessed;
  int? totalPage;
  int? totalRecord;

  factory BaseResponse.fromJson(T? data, {dynamic total, String? header}) {
    int? _totalPage;
    int? _totalRecord;
    if (total != null && total is int) {
      _totalPage = total ~/ 20 + 1;
      _totalRecord = total;
    }
    return BaseResponse(
      data: data,
      isSuccessed: data != null,
      totalPage: _totalPage,
      totalRecord: _totalRecord,
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
        "isSuccessed": isSuccessed,
      };
}
