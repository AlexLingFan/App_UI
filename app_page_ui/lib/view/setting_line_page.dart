import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';


class SettingLinePage extends StatefulWidget {
  const SettingLinePage({Key? key}) : super(key: key);

  @override
  _SettingLinePageState createState() => _SettingLinePageState();
}

class _SettingLinePageState extends State<SettingLinePage> with SingleTickerProviderStateMixin {

  double sliderValue = 0.0;
  double sliderValue2 = 0.0;
  double sliderValue3 = 0.0;

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("当前路段设置", style: TextStyle(color: Colors.black54),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey,),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => HomePage()));
          },
        ),
      ),
      body: getBody(),
    );
  }

 Widget getBody() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 13,),
              Container(
                width: 150,
                // height: 210,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, blurRadius: 3.0)
                    ],
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 3),
                        GestureDetector(
                          onTap: (){},
                          child: Icon(Icons.alarm, color: Color.fromRGBO(30, 100, 120, 1), size: 60,),
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) => HomePage()));
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 6),
                                child: Icon(Icons.chevron_right, color: Color.fromRGBO(30, 100, 120, 1), size: 40,),
                              ),
                            ),
                            SizedBox(height: 3),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) => HomePage()));
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 6),
                                child:  Text("定时设置", style: TextStyle(fontSize: 18, color: Colors.black))
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        SizedBox(width: 7),
                        Text("18:50", style: TextStyle(fontSize: 16, color: Colors.black45)),
                        Spacer(),
                        Text("09:50", style: TextStyle(fontSize: 16, color: Colors.black45)),
                        SizedBox(width: 7),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Text("打", style: TextStyle(fontSize: 16, color: Colors.black12)),
                        Spacer(),
                        Text("关", style: TextStyle(fontSize: 16, color: Colors.black12)),
                        SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(height: 6),
                    Image.network("https://img1.baidu.com/it/u=2025550631,4047872267&fm=26&fmt=auto", fit: BoxFit.cover, width: 150, height: 70,),
                    SizedBox(height: 10),
                    Text("当前设置照明曲线", style: TextStyle(fontSize: 16, color: Colors.black45)),
                    SizedBox(height: 15),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Container(
                    width: 152,
                    height: 80,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey, blurRadius: 3.0)
                        ],
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(5)),
                    child: new FlatButton(
                      minWidth: 150,
                       height: 80,
                       onPressed: (){
                         ///添加点击事件
                         Navigator.push(context,
                             MaterialPageRoute(builder: (_) => HomePage()));
                       },
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Icon(Icons.power_settings_new_rounded, color: Color.fromRGBO(30, 100, 120, 1), size: 36),
                           // Spacer(),
                           Text("点击开启灯光", style: TextStyle(fontSize: 14, color: Colors.grey)),
                           // SizedBox(width: 2),
                         ],
                       ))),
                  SizedBox(height: 10),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey, blurRadius: 3.0)
                        ],
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.lightbulb, color: Colors.lightBlue),
                            Text("在线：238", style: TextStyle(color: Colors.grey)),
                            Spacer(),
                            Icon(Icons.more_vert, color: Colors.grey),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.lightbulb, color: Colors.black12),
                            Text("离线：008", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.warning_amber_outlined, color: Colors.grey),
                            Text("警告：000", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            SizedBox(width: 13),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) => HomePage()));
                              },
                              child: Container(
                                  margin: EdgeInsets.only(right: 6),
                                  child:   Text("异常清除", style: TextStyle(fontSize: 16, color: Colors.black45))
                              ),
                            ),
                            Spacer(),
                            IconButton(onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => HomePage()));
                            },
                                icon: Icon(Icons.assignment_late_outlined, color: Color.fromRGBO(30, 100, 120, 1), size: 40)),
                          ],
                        ),
                        SizedBox(height: 6),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(width: 13,),
            ],
          ),
          SizedBox(height: 15),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 13),
                  Container(
                    width: 290,
                    child: CupertinoSlider(
                      activeColor: CupertinoColors.activeBlue,
                      thumbColor: Colors.white,
                      min: 0.0,
                      max: 100.0,
                      value: sliderValue,
                      onChanged: (val) {
                        // Screen.setBrightness(sliderValue);
                        setState(() {
                          sliderValue = val;
                        });
                      },
                    ),
                  ),
                  Spacer(),
                  Text("全局", style: TextStyle(fontSize: 18, color: Colors.black),),
                  SizedBox(width: 13),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 13),
                  Container(
                    width: 290,
                    child: CupertinoSlider(
                      activeColor: CupertinoColors.activeBlue,
                      thumbColor: Colors.white,
                      min: 0.0,
                      max: 100.0,
                      value: sliderValue2,
                      onChanged: (val) {
                        // Screen.setBrightness(sliderValue);
                        setState(() {
                          sliderValue2 = val;
                        });
                      },
                    ),
                  ),
                  Spacer(),
                  Text("主灯", style: TextStyle(fontSize: 18, color: Colors.black),),
                  SizedBox(width: 13),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 13),
                  Container(
                    width: 290,
                    child: CupertinoSlider(
                      activeColor: CupertinoColors.activeBlue,
                      thumbColor: Colors.white,
                      min: 0.0,
                      max: 100.0,
                      value: sliderValue3,
                      onChanged: (val) {
                        // Screen.setBrightness(sliderValue);
                        setState(() {
                          sliderValue3 = val;
                        });
                      },
                    ),
                  ),
                  Spacer(),
                  Text("辅灯", style: TextStyle(fontSize: 18, color: Colors.black),),
                  SizedBox(width: 13),
                ],
              ),
            ],
          ),
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.only(left: 8, right: 8),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 3.0)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.warning_amber_outlined, color: Colors.grey),
                    SizedBox(width: 15,),
                    Text("古牧地路", style: TextStyle(fontSize: 18, color: Colors.black45))
                  ],
                ),
                Table(
                  columnWidths: const <int, TableColumnWidth>{
                    0: FixedColumnWidth(46.0),
                    1: FixedColumnWidth(100.0),
                    2: FixedColumnWidth(90.0),
                    3: FixedColumnWidth(100.0),
                  },
                  border: TableBorder.all(
                      color: Colors.blueAccent
                  ),
                  children: [
                    TableRow(
                        children: [
                          Text("杆号", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("故障代码", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("报障时间", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("取消时间", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                        ]
                    ),
                    TableRow(
                        children: [
                          Text("001", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("FA 倾倒报警", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("0825-19:23", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("0825-19:28", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                        ]
                    ),
                    TableRow(
                        children: [
                          Text("002", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("FC 高压报警", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("0825-19:23", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("0825-19:28", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                        ]
                    ),
                    TableRow(
                        children: [
                          Text("003", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("FD 欠压报警", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("0825-19:23", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("0825-19:28", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                        ]
                    ),
                    TableRow(
                        children: [
                          Text("004", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("AA 漏电报警", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("0825-19:23", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("0825-19:28", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                        ]
                    ),
                    TableRow(
                        children: [
                          Text("005", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("BC 超载报警", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("0825-19:23", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("0825-19:28", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                        ]
                    ),
                    TableRow(
                        children: [
                          Text("", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                        ]
                    ),
                    TableRow(
                        children: [
                          Text("", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          Text("", style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                        ]
                    )
                  ],
                ),
                SizedBox(height: 6),
            ]),
          ),
         Spacer(),
          Text("中华人民共和国广东省深圳市", style: TextStyle(fontSize: 18, color: Colors.black45)),
          SizedBox(height: 3),
        ],
      ),
    );
 }
}
