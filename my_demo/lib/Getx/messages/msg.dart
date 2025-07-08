import 'package:get/get.dart';


//定义一个语言包
class Msg extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'zh_CN': {'hello': '你好 世界'},
    'de_DE': {'hello': 'Hallo Welt'},
  };
}
