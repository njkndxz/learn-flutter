
// 引入库
import 'dart:math';

class MyList<T> {
  List list = <T>[];

  void add(T val) {
    this.list.add(val);
  }

  List getList() {
    return list;
  }
}

// 范型抽象类
abstract class Cache<T> {
  getByKey(String key);
  void setByKey(String key, T value);
}

void main() {
  T getData<T>(T value) {
    return value;
  }

  print(getData('xxx'));
  print(getData(123));

  getData<String>('aaaa');
  getData<int>(12);

  // 创建固定长度且只接受字符的列表
  List list = List<String>.filled(2, '12');
  // 范型类
  MyList myList = new MyList<String>();
  myList.add('abc');
}
