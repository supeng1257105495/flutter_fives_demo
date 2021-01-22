import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hello_world_flutter/style/theme.dart' as theme;

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

    final bannerContainer = Container(
      height: 250,
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(10),
            ),
            clipBehavior: Clip.antiAlias,
            child: new Image.asset(
              bannerList[index],
              // width: MediaQuery.of(context).size.width * 0.8,
              fit: BoxFit.fill,
            ),
          );
        },
        itemCount: bannerList.length,
        itemWidth: 150,
        loop: true,
        autoplay: true,
        autoplayDelay: 5000,
        pagination: new SwiperPagination(
          margin: new EdgeInsets.all(5.0),
        ), //如果不填则不显示指示点
        // control: new SwiperControl(), //如果不填则不显示左右按钮
      ),
    );

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

    final swiperDom = new Positioned(
      top: MediaQuery.of(context).size.height * 0.06,
      left: MediaQuery.of(context).size.width * 0.015,
      child: new Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.97,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: bannerContainer,
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: new Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(color: theme.Theme.themeBackGray),
          child: new Stack(
            children: <Widget>[
              titleDom,
              swiperDom
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
