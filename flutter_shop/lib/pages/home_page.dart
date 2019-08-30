import 'package:flutter/material.dart';
import 'package:dio/dio.dart';





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

  String showText = '欢迎来到天上人间';

  @override 
  Widget build(BuildContext context){
    return Container(
      child: Scaffold(appBar: AppBar(title: Text('天上人间'),),
      body: Container(height: 1000,
      child: Column(children: <Widget>[
        TextField(
          controller: typeController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            labelText: '美女类型',
            helperText: '请输入你喜欢的类型'
          ),
          autofocus: false,
        ),
        RaisedButton(onPressed: _choiceAction,
        child: Text('选择完毕'),),
        Text(
          showText,
          overflow:TextOverflow.ellipsis,
          maxLines:2
        )
      ],),),),

    );
  }

  Future getHttp(String TypeText) async{
    try{
      Response response;
      var data = {'name': TypeText};
      response = await Dio().post(
        "https://www.easy-mock.com/mock/5d68d8206bae0f5e52f6429d/example/getGirls",
        queryParameters: data
      );
      return response.data;
    }catch(e){
      return print(e);
    }
  }

  void _choiceAction(){
    print('...');
    if (typeController.text.toString() == ''){
      showDialog(
        context: context,
        builder: (context)=>AlertDialog(title: Text('类型不能为空'),)
      );
    }else{
      getHttp(typeController.text.toString()).then((val){
        print(val);
        setState((){
          showText = val['data']['name'].toString();
        });
      });
    }
  }
}