import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../config/httpHeader.dart';





// class HomePage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Text('商城首页111222'),),
//     );
//   }

//   void getHttp() async{
//     try{
//       Response response;
//       var data={'name': 'jishupang'};
//       response = await Dio().get("https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=大胸美女");
//       return print(response);
//     }catch(e){
//       return print(e);
//     }
//   }
// }

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();

  String showText = '还没有请求数据';

  @override 
  Widget build(BuildContext context){
    return Container(
      child: Scaffold(appBar: AppBar(title: Text('请求远程数据'),),
      body: Container(height: 1000,
      child: Column(children: <Widget>[
        RaisedButton(onPressed: _choiceAction,
        child: Text('请求数据'),),
        Text(
          showText,
          overflow:TextOverflow.ellipsis,
          maxLines:2
        )
      ],),),),

    );
  }

  Future getHttp() async{
    try{
      Response response;

      Dio dio = new Dio();
      dio.options.headers = httpHeaders;
      response = await dio.post(
        "https://time.geekbang.org/serv/v1/column/newAll"
      );
      print(response);
      return response.data;
    }catch(e){
      return print(e);
    }
  }

  void _choiceAction(){
    print('开始向极客时间请求数据..................');
      getHttp().then((val){
        print(val);
        setState((){
          showText = val['data'].toString();
        });
      });
  }
}