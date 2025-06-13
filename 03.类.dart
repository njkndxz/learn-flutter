class Person {
  String? name;
  // late关键字可以延迟初始化
  late int age;
  // 变量或方法前面加下划线就是私有化
  int _agex = 123;

  // 静态变量，静态成员不能访问非静态成员，非静态成员可以访问静态成员
  static String sex = 'man';

  //构造函数
  // Person(String name, int age) {
  //   this.name = name;
  //   this.age = age;
  // }

  //构造函数简写
  Person({ this.name, required this.age}); // 表示必须传入

  //命名构造函数，可以写多个
  Person.now() {
    var t = DateTime.now();
    print(t);
  }

  //计算属性
  get info {
    return "${this.name}---${this.age}";
  }
  // 设置属性
  set setAge(value) {
    this.age = value;
  }

  void printInfo() {
    print("${this.name}---${this.age}");
  }
}

// 继承，super可以调用父类方法，只能继承一个父类
class Web extends Person {
  Web(String name, int age) : super(name, age);
}

//抽象类
abstract class Animal {
  eat();
}


class Cat extends Animal {
  @override
  eat() {
    // TODO: implement eat
    print("Cat is eating");
  }
}

// 继承接口，可以继承多个
class Dog implements Animal {
  @override
  eat() {
    // TODO: implement eat
    print("Dog is eating");
  }
}

class Monkey extends Animal with Cat, Dog {
  @override
  eat() {
    // TODO: implement eat
    return super.eat();
  }
}

void main() {
  Person p = new Person("张三", 24);
  p.printInfo();
  print(p.info);
  p.setAge = 22;
  Person p1 = Person.now();
}