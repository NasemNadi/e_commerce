class ApiErrors {
  final String message;
  final int? statuscode;
  ApiErrors({required this.message,this.statuscode});

  String toStrin(){
    return "error is $message(statuscode IS $statuscode)";

}
}