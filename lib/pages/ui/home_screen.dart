import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hello_world_flutter/style/theme.dart' as theme;
import 'package:hello_world_flutter/iconfont/icon_font.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle titleTextStyle = TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    );

    List<String> bannerList = [
      'assets/banner/CMIYLDYSK.jpg',
      'assets/banner/CMIYLDYSK1.jpg',
      'assets/banner/CMIYLDYSK2.jpg',
      'assets/banner/CMIYLDYSK3.jpg',
    ];

    final List navList = [
      {
        'id': 1,
        'name': '乡村游',
        'icon': Icons.nature_people,
        'color': Colors.orange[300]
      },
      {
        'id': 2,
        'name': '景区景点',
        'icon': Icons.filter_hdr,
        'color': Colors.blue[300]
      },
      {
        'id': 3,
        'name': '酒店住宿',
        'icon': Icons.local_hotel,
        'color': Colors.red[300]
      },
      {
        'id': 4,
        'name': '特色美食',
        'icon': Icons.local_dining,
        'color': Colors.orange[300]
      },
      {
        'id': 5,
        'name': '特色购物',
        'icon': Icons.shopping_cart,
        'color': Colors.orange[300]
      },
      {
        'id': 6,
        'name': '休闲娱乐',
        'icon': Icons.rowing,
        'color': Colors.green[300]
      },
      {
        'id': 7,
        'name': '推荐线路',
        'icon': Icons.call_split,
        'color': Colors.lightGreenAccent[300]
      },
      {
        'id': 8,
        'name': '旅游攻略',
        'icon': Icons.border_color,
        'color': Colors.red[300]
      },
    ];

    final titleDom = new Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(color: theme.Theme.themeBlue),
      child: new Column(
        children: [
          new Padding(padding: new EdgeInsets.only(top: 26.0)),
          new Text(
            "安全生产管理系统",
            style: titleTextStyle,
            textAlign: TextAlign.center,
          )
        ],
      ),
      // child: bannerContainer,
    );

    final bannerContainer = new Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          color: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(10),
          ),
          clipBehavior: Clip.antiAlias,
          // child: new Image.asset(
          //   bannerList[index],
          //   // width: MediaQuery.of(context).size.width * 0.8,
          //   fit: BoxFit.fill,
          // ),
        );
      },
      itemCount: bannerList.length,
      itemWidth: 150,
      loop: true,
      autoplay: false,
      autoplayDelay: 5000,
      duration: 2000,
      pagination: new SwiperPagination(
        margin: new EdgeInsets.all(5),
      ), //如果不填则不显示指示点
      // control: new SwiperControl(), //如果不填则不显示左右按钮
    );

    final swiperDom = new Positioned(
      top: MediaQuery.of(context).size.height * 0.06,
      left: MediaQuery.of(context).size.width * 0.015,
      child: new Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.97,
        padding: new EdgeInsets.all(0),
        decoration: ShapeDecoration(
          color: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.all(
              Radius.circular(10),
            ),
          ),
        ),
        child: bannerContainer,
      ),
    );

    final menuDom = new Column(
      children: [
        // IconFont()
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: new Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
            // color: theme.Theme.themeBackGray,
            color: Colors.orange[300],
          ),
          child: new Stack(
            children: <Widget>[
              titleDom,
              swiperDom,

              // Container(child: headerSection),
              // Container(child: iconSection),
              // Container(child: textSection),
            ],
          ),
        ),
      ),
    );
  }
}
