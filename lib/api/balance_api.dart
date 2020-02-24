part of openapi.api;



class BalanceApi {
  final ApiClient apiClient;

  BalanceApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  ///  with HTTP info returned
  ///
  /// The Balance API provides a count of request credits left in the user&#39;s account for the day. Balance is reset at midnight UTC everyday (00:00 UTC).
  Future<Response> balanceWithHttpInfo() async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/balance.php".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType = contentTypes.isNotEmpty ? contentTypes[0] : "application/json";
    List<String> authNames = ["key"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);
    return response;
  }

  /// 
  ///
  /// The Balance API provides a count of request credits left in the user&#39;s account for the day. Balance is reset at midnight UTC everyday (00:00 UTC).
  Future<Balance> balance() async {
    Response response = await balanceWithHttpInfo();
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'Balance') as Balance;
    } else {
      return null;
    }
  }

}
