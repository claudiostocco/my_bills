class ApiResult<T> {
  ApiResult(this.success, this.data);
  bool success;
  T? data;
}
