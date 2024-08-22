abstract class BaseUrl{

  Future<dynamic> getApi({required String url, Map<String, String>? header});

  Future<dynamic> postApi({required String url,dynamic body, Map<String,String>? header});

}