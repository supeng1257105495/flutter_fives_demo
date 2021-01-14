// import 'package:english_words/english_words.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Startup Name Generator',
//       theme: new ThemeData(
//         primaryColor: Colors.blue,
//       ),
//       home: new RandomWords(),
//     );
//   }
// }

// class RandomWords extends StatefulWidget {
//   @override
//   createState() => new RandomWordsState();
// }

// class RandomWordsState extends State<RandomWords> {
//   final _suggestions = <WordPair>[];
//   final _saved = new Set<WordPair>();
//   final _biggerFont = const TextStyle(fontSize: 18.0);

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('Startup Name Generator 名称'),
//         actions: <Widget>[
//           new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
//         ],
//       ),
//       body: _buildSuggestions(),
//     );
//   }

//   Widget _buildSuggestions() {
//     return new ListView.builder(
//         padding: const EdgeInsets.all(16.0),
//         // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
//         // 在偶数行，该函数会为单词对添加一个ListTile row.
//         // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
//         // 注意，在小屏幕上，分割线看起来可能比较吃力。
//         itemBuilder: (context, i) {
//           // 在每一列之前，添加一个1像素高的分隔线widget
//           if (i.isOdd) return new Divider();

//           // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
//           // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
//           final index = i ~/ 2;
//           // 如果是建议列表中最后一个单词对
//           if (index >= _suggestions.length) {
//             // ...接着再生成10个单词对，然后添加到建议列表
//             _suggestions.addAll(generateWordPairs().take(10));
//           }
//           return _buildRow(_suggestions[index]);
//         });
//   }

//   Widget _buildRow(WordPair pair) {
//     final alreadySaved = _saved.contains(pair);
//     return new ListTile(
//       title: new Text(
//         pair.asPascalCase,
//         style: _biggerFont,
//       ),
//       trailing: new Icon(
//         alreadySaved ? Icons.favorite : Icons.favorite_border,
//         color: alreadySaved ? Colors.red : null,
//       ),
//       onTap: () {
//         setState(() {
//           if (alreadySaved) {
//             _saved.remove(pair);
//           } else {
//             _saved.add(pair);
//           }
//         });
//       },
//     );
//   }

//   void _pushSaved() {
//     Navigator.of(context).push(
//       new MaterialPageRoute(
//         builder: (context) {
//           final tiles = _saved.map(
//             (pair) {
//               return new ListTile(
//                 title: new Text(
//                   pair.asPascalCase,
//                   style: _biggerFont,
//                 ),
//               );
//             },
//           );

//           final divided = ListTile.divideTiles(
//             context: context,
//             tiles: tiles,
//           ).toList();

//           return new Scaffold(
//             appBar: new AppBar(
//               title: new Text('Saved Suggestions 收藏'),
//             ),
//             body: new ListView(children: divided),
//           );
//         },
//       ),
//     );
//   }
// }

// text widget
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Text widget',
//       home: Scaffold(
//           // body: ListView(
//           body: Center(
//         child: Text(
//           'hello world You deserve someone who loves you with every beat of his heart.你值得拥有一个全心全意爱你的人。',
//           maxLines: 1,
//           textAlign: TextAlign.left,
//           overflow: TextOverflow.ellipsis,
//           style: TextStyle(
//             fontSize: 25.0,
//             color: Color.fromARGB(255, 255, 150, 150),
//             decoration: TextDecoration.underline,
//             decorationStyle: TextDecorationStyle.solid,
//           ),
//         ),
//       )),
//     );
//   }
// }

// container widget
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Text widget',
//       home: Scaffold(
//         body: Center(
//           child: Container(
//             child: new Text(
//               'Hello World',
//               style: TextStyle(fontSize: 40.0, color: Colors.white),
//             ),
//             alignment: Alignment.center,
//             width: 500.0,
//             height: 400.0,
//             // padding: const EdgeInsets.all(10.0),
//             margin: const EdgeInsets.all(10.0),
//             decoration: new BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Colors.lightBlue, Colors.greenAccent, Colors.purple],
//                 ),
//                 border: Border.all(width: 14.0, color: Colors.blue[100])),
//           ),
//         ),
//       ),
//     );
//   }
// }

// image widget
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Text widget',
//       home: Scaffold(
//         body: Center(
//           child: Container(
//             child: new Image.network(
//               'https://www.baidu.com/img/bd_logo1.png',
//               // 'assets/images/lake.jpg',
//               color: Colors.blue[50],
//               colorBlendMode: BlendMode.darken,
//               scale: 1.0,
//               fit: BoxFit.scaleDown,
//               repeat: ImageRepeat.repeat,
//             ),
//             width: 300.0,
//             height: 200.0,
//             color: Colors.lightBlue,
//           ),
//         ),
//       ),
//     );
//   }
// }

// ListView widget
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'ListView widget Flutter Demo',
//         home: Scaffold(
//           appBar: new AppBar(title: new Text('ListView Widget Flutter Demo')),
//           body: new ListView(
//             children: <Widget>[
//               new ListTile(
//                   leading: new Icon(Icons.access_time),
//                   title: new Text('access_time')),
//               new ListTile(
//                   leading: new Icon(Icons.account_balance),
//                   title: new Text('account_balance')),
//               new Image.network('https://www.baidu.com/img/bd_logo1.png'),
//               new Image.network('https://www.baidu.com/img/bd_logo1.png'),
//               new Image.network('https://www.baidu.com/img/bd_logo1.png'),
//               new Image.network('https://www.baidu.com/img/bd_logo1.png')
//             ],
//           ),
//         ));
//   }
// }

// list ScrollDirection widget
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ListView widget',
//       home: Scaffold(
//         body: Center(
//           child: Container(height: 200.0, child: MyList()),
//         ),
//       ),
//     );
//   }
// }

// class MyList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       scrollDirection: Axis.horizontal,
//       children: <Widget>[
//         new Container(
//           width: 180.0,
//           color: Colors.lightBlue,
//         ),
//         new Container(
//           width: 180.0,
//           color: Colors.amber,
//         ),
//         new Container(
//           width: 180.0,
//           color: Colors.deepOrange,
//         ),
//         new Container(
//           width: 180.0,
//           color: Colors.deepPurpleAccent,
//         ),
//       ],
//     );
//   }
// }

//动态列表 widget
// import 'package:flutter/material.dart';

// void main() =>
//     runApp(MyApp(items: new List<String>.generate(10, (i) => "Item $i")));

// class MyApp extends StatelessWidget {
//   final List<String> items;
//   MyApp({Key key, @required this.items}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ListView widget',
//       home: Scaffold(
//           body: new ListView.builder(
//               itemCount: items.length,
//               itemBuilder: (context, index) {
//                 return new ListTile(
//                   title: new Text('${items[index]}'),
//                 );
//               })),
//     );
//   }
// }

// 布局
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ListView widget',
//       home: Scaffold(
//         appBar: new AppBar(
//           title: new Text('水平方向布局'),
//         ),
//         body: new Row(
//           children: <Widget>[
//             new RaisedButton(
//                 onPressed: () {},
//                 color: Colors.redAccent,
//                 child: new Text('红色按钮')),
//             Expanded(
//                 child: new RaisedButton(
//               onPressed: () {},
//               color: Colors.orangeAccent,
//               child: new Text('黄色按钮'),
//             )),
//             new RaisedButton(
//                 onPressed: () {},
//                 color: Colors.pinkAccent,
//                 child: new Text('粉色按钮'))
//           ],
//         ),
//       ),
//     );
//   }
// }

// 布局2
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ListView widget',
//       home: Scaffold(
//           appBar: new AppBar(
//             title: new Text('垂直方向布局'),
//           ),
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text('I am JSPang'),
//               Text('my website is jspang.com'),
//               Text('I love coding')
//             ],
//           )),
//     );
//   }
// }

// stack 布局
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var stack = new Stack(
//       alignment: const FractionalOffset(0.5, 0.8),
//       children: <Widget>[
//         new CircleAvatar(
//           backgroundImage: new NetworkImage(
//               'http://jspang.com/static//myimg/blogtouxiang.jpg'),
//           radius: 100.0,
//         ),
//         new Container(
//           decoration: new BoxDecoration(
//             color: Colors.lightBlue,
//           ),
//           padding: EdgeInsets.all(5.0),
//           child: new Text('JSPang 技术胖'),
//         )
//       ],
//     );

//     return MaterialApp(
//       title: 'ListView widget',
//       home: Scaffold(
//         appBar: new AppBar(
//           title: new Text('垂直方向布局'),
//         ),
//         body: Center(child: stack),
//       ),
//     );
//   }
// }

// 布局4

// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var stack = new Stack(
//       children: <Widget>[
//         new CircleAvatar(
//           backgroundImage: new NetworkImage(
//               'http://jspang.com/static//myimg/blogtouxiang.jpg'),
//           radius: 100.0,
//         ),
//         new Positioned(
//           top: 10.0,
//           left: 10.0,
//           child: new Text('JSPang.com'),
//         ),
//         new Positioned(
//           bottom: 10.0,
//           right: 10.0,
//           child: new Text('技术胖'),
//         )
//       ],
//     );

//     return MaterialApp(
//       title: 'ListView widget',
//       home: Scaffold(
//         appBar: new AppBar(
//           title: new Text('层叠布局'),
//         ),
//         body: Center(child: stack),
//       ),
//     );
//   }
// }

// 卡片布局
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var card = new Card(
//       child: Column(
//         children: <Widget>[
//           ListTile(
//             title: new Text(
//               '吉林省吉林市昌邑区',
//               style: TextStyle(fontWeight: FontWeight.w500),
//             ),
//             subtitle: new Text('技术胖:1513938888'),
//             leading: new Icon(
//               Icons.account_box,
//               color: Colors.lightBlue,
//             ),
//           ),
//           new Divider(),
//           ListTile(
//             title: new Text(
//               '北京市海淀区中国科技大学',
//               style: TextStyle(fontWeight: FontWeight.w500),
//             ),
//             subtitle: new Text('胜宏宇:1513938888'),
//             leading: new Icon(
//               Icons.account_box,
//               color: Colors.lightBlue,
//             ),
//           ),
//           new Divider(),
//           ListTile(
//             title: new Text(
//               '河南省濮阳市百姓办公楼',
//               style: TextStyle(fontWeight: FontWeight.w500),
//             ),
//             subtitle: new Text('JSPang:1513938888'),
//             leading: new Icon(
//               Icons.account_box,
//               color: Colors.lightBlue,
//             ),
//           ),
//           new Divider(),
//         ],
//       ),
//     );

//     return MaterialApp(
//       title: 'ListView widget',
//       home: Scaffold(
//         appBar: new AppBar(
//           title: new Text('卡片布局'),
//         ),
//         body: Center(child: card),
//       ),
//     );
//   }
// }

// 跳转
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(title: '导航演示', home: new FirstScreen()));
// }

// class FirstScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         appBar: AppBar(title: Text('导航页面')),
//         body: Center(
//             child: RaisedButton(
//           child: Text('查看商品详情页面'),
//           onPressed: () {
//             Navigator.push(
//                 context,
//                 new MaterialPageRoute(
//                     builder: (context) => new SecondScreen()));
//           },
//         )));
//   }
// }

// 列表 + 详情
// import 'package:flutter/material.dart';

// //传递的数据结构,也可以理解为对商品数据的抽象
// class Product {
//   final String title; //商品标题
//   final String description; //商品描述
//   Product(this.title, this.description);
// }

// void main() {
//   runApp(MaterialApp(
//       title: '数据传递案例',
//       home: ProductList(
//         products: List.generate(20, (i) => Product('商品 $i', '这是一个商品详情，编号为:$i')),
//       )));
// }

// class ProductList extends StatelessWidget {
//   final List<Product> products;
//   ProductList({Key key, @required this.products}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('商品列表')),
//         body: ListView.builder(
//           itemCount: products.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//                 title: Text(products[index].title),
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               new ProductDetail(product: products[index])));
//                 });
//           },
//         ));
//   }
// }

// class ProductDetail extends StatelessWidget {
//   final Product product;
//   ProductDetail({Key key, @required this.product}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         appBar: AppBar(
//           title: Text('${product.title}'),
//         ),
//         body: Center(
//           child: Text('${product.description}'),
//         ));
//   }
// }

// 返回数据携带参数
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(title: '页面跳转返回数据', home: FirstPage()));
// }

// class FirstPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text("商品信息")),
//         body: Center(
//           child: RouteButton(),
//         ));
//   }
// }

// 跳转的Button
// class RouteButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return RaisedButton(
//       onPressed: () {
//         _navigateToXiaoJieJie(context);
//       },
//       child: Text('找商品'),
//       color: Colors.red,
//       textColor: Colors.white,
//       splashColor: Colors.black,
//       highlightColor: Colors.green,
//     );
//   }

//   _navigateToXiaoJieJie(BuildContext context) async {
//     //async是启用异步方法

//     final result = await Navigator.push(
//         //等待
//         context,
//         MaterialPageRoute(builder: (context) => XiaoJieJie()));
//     // print(result);
//     // 底部提示栏
//     // Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
//     // 防止队列一直排列 新消息显示前先清除队列

//     ScaffoldMessenger.of(context).removeCurrentSnackBar();
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Row(
//         children: <Widget>[
//           Icon(
//             Icons.check,
//             color: Colors.green,
//           ),
//           Text('$result')
//         ],
//       ),
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(0))),
//       duration: Duration(seconds: 1),
//       behavior: SnackBarBehavior.floating,
//       action: SnackBarAction(
//         label: '知道了',
//         onPressed: () {},
//       ),
//     ));
//   }
// }

// class XiaoJieJie extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('我是商品')),
//       body: Center(
//           child: Column(
//         children: <Widget>[
//           RaisedButton(
//             child: Text('商品1'),
//             onPressed: () {
//               Navigator.pop(context, '商品1:1511008888');
//             },
//           ),
//           RaisedButton(
//             child: Text('商品2'),
//             onPressed: () {
//               Navigator.pop(context, '商品2:1511009999');
//             },
//           ),
//         ],
//       )),
//     );
//   }
// }
