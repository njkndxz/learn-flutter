// import 'dart:io';
// 库的重命名
import 'dart:convert' as convert;
// 部分导入
import 'dart:io' show HttpClient;
// 隐藏不需要的
// import 'dart:io' hide PathAccessException;


void main() async {
  var result = await getDataFromAPI();
  print(result);
}

getDataFromAPI() async {
  // 1.创建HttpClient对象
  var httpClient = new HttpClient();
  // 2.创建Uri对象
  var uri = new Uri.http('域名', '路径', { 'q': 'dart' });
  // 3.发起请求，等待请求
  var request = await httpClient.getUrl(uri);
  // 4.关闭请求，等待响应
  var response = await request.close();
  // 5.解码响应内容
  return await response.transform(convert.utf8.decoder).join();
}