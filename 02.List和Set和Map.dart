void main() {
  // 列表
  List myList = [1,2,3];
  print(myList.length);
  print(myList.reversed);
  print(myList.isEmpty);
  print(myList.isNotEmpty);

  myList.add(4);
  myList.addAll([5,6]);
  print(myList.indexOf(4));
  myList.remove(3);
  myList.removeAt(1);
  myList.fillRange(1, 3, 'aa');
  myList.insert(2, 10);
  myList.insertAll(3, ['bb', 'cc']);
  
  String str = myList.join('|');
  print(str);
  List newList = str.split('|');
  print(newList);

  for (var item in myList) {
    print(item);
  }

  myList.forEach(print);

  var new_myList = myList.map((val) => (val*2));
  print(new_myList.toList());

  var new_mylist_where = myList.where((val) => (val > 3));
  print(new_mylist_where.toList());

  // 和js的some一样
  var new_list_any = myList.any((val) => (val < 3));
  print(new_list_any);

  var new_list_every = myList.every((val) => (val < 5));
  print(new_list_every);

  // 集合，和js一样
  var s = new Set();
  s.addAll([1,1,2,2]);
  s.add('苹果');
  print(s.toList());

  // Map
  Map person = {
    "name": "aa",
    "age": 20
  };
  print(person.keys.toList());
  print(person.values.toList());
  print(person.isEmpty);
  print(person.isNotEmpty);

  var m = new Map();
  m["name"] = "bb";
  
  person.addAll({
    "work": ["敲代码"],
  });

  person.remove("age");

  print(person.containsValue('aa'));
  print(person.containsKey("age"));
}