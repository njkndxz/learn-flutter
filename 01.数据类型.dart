void main() {

    // 结尾要加分号
    var a = '123';
    // 常量，只有final才可以赋值使用函数
    const a1 = 'qwer'; //const在编译时确定, final是运行时
    final a2 = DateTime.now();


    String b = 'abc';
    // 字符串拼接
    print(a + b);
    print("$a $b");
    // int只能是整形
    int c = 111;
    String c2 = c.toString();
    print(c2.isEmpty);
    c = int.parse(c2);
    // double可以是int类型，也可以是浮点
    double c1 = 12.5;
    c1 = 12;
    print(c + c1);

    bool flag = true;
    print(flag);

    // 条件语句
    if(flag) {
        print('真');
    } else {
        print('假');
    }

    // List(数组/集合)
    var l1 = ["张三", 20, true];
    print(l1.length);
    print(l1[0]);
    // 可以使用范型
    var l2 = <String>["aa", "bb"];
    print(l2);
    // 添加数据
    l2.add("cc");

    var l4 = List.filled(2, ""); // 创建固定长度的集合
    List<int> l3 = <int>[1,2,3];
    print(l3);

    //对象
    var p = {
        a: '11',
        b: 22
    };
    print(p['a']);

    // 判断类型
    if(c is int) {
        print(c);
    }

    //关系运算、逻辑运算和js一样，但是没有===

    // 如果b2为空，就把23赋值给b2
    var b2 = null;
    b2 ??= 23;
    // 如果b2为空就赋值33
    var b3 = b2 ?? 33;

    // 复合运算符 += -= *= /= %= ~/=
    // if else switch case
    // 三目运算符
    // 循环和js一样 , 函数和java差不多没返回值就用void
    for (var i = 0; i <=10; i++) {
      print(i);
      if(i == 5) {
        break;
      }

      if(i % 2 == 0) {
        continue;
      }
    }

    var sum = 0;
    while (sum < 5) {
      sum++;
    }

    do {
      sum--;
    } while (sum > 5);

    // 可空类型
    String? username; //表示username是一个可空类型
    List<String>? list1 = [];
    // 可空类型方法
    String? getData() {
      return null;
    }

    //类型断言
    String? str1 = '11';
    print(str1!.length); // 如果等于空会抛出异常(可以用trycatch捕获)
    void getStr(String? str) {
      try {
        print(str!.length);
      } catch (e) {
        print("str is null");
      }
    }

    String printUserInfo(String username, {int age=10, required String sex}) { // 形参给默认值，不给默认值要使用required进行注解表示必要参数
      return "";
    }

    printUserInfo('cat', age: 10, sex: 'man');

    // const关键字在多个地方创建相同的对象时，内存中只保留一个对象
    var o1 = const Object();
    var o2 = const Object();
    //检测是否共用存储空间
    print(identical(o1, o2)); //false

    var c3 = const Container(width: 11, height: 11);
    var c4 = const Container(width: 11, height: 11);
    print(identical(c3, c4)); // true
}

class Container {
  final int width;
  final int height;
  // 常量构造函数的属性必须用final修饰
  const Container({ required this.width, required this.height });
}