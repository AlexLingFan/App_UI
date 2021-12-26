import 'package:app_page_ui/data/all_data.dart';
import 'package:app_page_ui/view/setting_line_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  /// 搜索框输入控制器
  final searchController = TextEditingController();

  /// 搜索输入信息监听key
  final GlobalKey<FormState> inputRoomNumKey = GlobalKey<FormState>();

  /// 输入信息
  String? searchName;

  /// 输入框表单验证输入信息
  bool _validate = false;

  /// 开关按钮布尔值
  bool flag = false;

  bool isSelect = false;

  bool isOK = false;

  /// 分类栏控制器
  TabController? tabController;

  /// 号杆数列，前两个cell不需要标注号杆，故为空
  List<String> numList = [
    "",
    "",
    "110号杆",
    "111号杆",
    "112号杆",
    "113号杆",
    "114号杆",
    "115号杆",
    "116号杆",
    "117号杆",
  ];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text("当前路灯设置", style: TextStyle(color: Colors.black54),
          ),
          // 返回按钮
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomePage()));
              }
          ),
          // 前进按钮
          actions: [
            IconButton(
                onPressed: () {
                  // 跳转至路段设置页面
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SettingLinePage()));
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ))
          ],
        ),
        body: GestureDetector(
          onTap: () {
            // 触摸收起键盘,撤销编辑聚焦
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: getBody(),
        )
    );
  }

  /// 主体UI部分
  Widget getBody() {
    return Container(
        child: GestureDetector(
            onTap: () {
              // 触摸收起键盘,撤销编辑聚焦
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black12),
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(3)),
                        // 左边方框按钮
                        child: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          icon: Icon(
                            Icons.texture,
                            color: Colors.black12,
                          ),
                          onPressed: () {},
                        )),
                    // 设置搜索框
                    Stack(
                      children: [
                        Container(
                            width: 200,
                            margin: EdgeInsets.only(top: 5, left: 21, right: 21),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(color: Colors.black12, blurRadius: 2.0)
                                ],
                                border: Border.all(width: 1, color: Colors.black12),
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(2)),
                            height: 43,
                            child: Padding(
                                padding:
                                const EdgeInsets.only(left: 3, bottom: 4, top: 5),
                                // 添加表单校验
                                child: Form(
                                  key: inputRoomNumKey,
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  child: TextFormField(
                                      textAlign: TextAlign.center,
                                      onSaved: (val) {
                                        // 保存输入的信息
                                        searchName = val;
                                      },
                                      autofocus: false,
                                      autocorrect: false,
                                      controller: searchController,
                                      decoration: InputDecoration(
                                        errorText: _validate ? "输入不能为空" : null,
                                        border: InputBorder.none,
                                      )),
                                ))),
                        // 设置搜索按钮
                        Positioned(
                            left: 20,
                            top: 10,
                            bottom: 5,
                            child: Container(
                              child: IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  icon: Icon(Icons.search),
                                  color: Colors.grey,
                                  onPressed: () {
                                    setState(() {
                                      // 触摸收起键盘,撤销编辑聚焦
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                    });
                                    getSearchNumber();
                                  }),
                            )),
                        // 设置语音按钮
                        Positioned(
                            right: 20,
                            top: 10,
                            bottom: 5,
                            child: new IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                icon: new Icon(Icons.keyboard_voice_sharp),
                                color: Colors.grey,
                                iconSize: 18.0,
                                onPressed: () {
                                  setState(() {
                                    //
                                  });
                                }))
                      ],
                    ),
                    // 右边方框按钮
                    Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black12),
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(3)),
                        child: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          icon: Icon(
                            Icons.texture,
                            color: Colors.black12,
                          ),
                          onPressed: () {},
                        )),
                    SizedBox(width: 10)
                  ]),
                  SizedBox(height: 20),
                  // 设置tabbar
                  Column(
                    children: [
                     Stack(
                       children: [
                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             SizedBox(width: 2),
                             Container(
                               height: 70,
                               width: 162,
                               margin: EdgeInsets.only(left: 5, right: 5),
                               decoration: BoxDecoration(
                                   boxShadow: [
                                     BoxShadow(color: Colors.grey, blurRadius: 3.0)
                                   ],
                                   color: Colors.blue[100],
                                   borderRadius: BorderRadius.circular(5)),
                             ),
                             Container(
                               height: 70,
                               width: 162,
                               margin: EdgeInsets.only(left: 5, right: 5),
                               decoration: BoxDecoration(
                                   boxShadow: [
                                     BoxShadow(color: Colors.grey, blurRadius: 3.0)
                                   ],
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(5)),
                             ),
                             SizedBox(width: 2),
                           ],
                         ),
                         IgnorePointer(
                           child: Container(
                             alignment: Alignment.center,
                           ),
                         ),
                         Theme(
                             data: ThemeData(
                               splashColor: Colors.transparent,
                               highlightColor: Colors.transparent,
                             ),
                             child: TabBar(
                                 onTap: (index) {
                                   //设置监听方法
                                 },
                                 indicator: BoxDecoration(),
                                 //设置未选中时的字体颜色，tabs里面的字体样式优先级最高
                                 unselectedLabelColor: Colors.grey,
                                 //设置未选中时的字体样式，tabs里面的字体样式优先级最高
                                 unselectedLabelStyle: TextStyle(fontSize: 20),
                                 //设置选中时的字体颜色，tabs里面的字体样式优先级最高
                                 labelColor: Colors.black,
                                 //设置选中时的字体样式，tabs里面的字体样式优先级最高
                                 labelStyle: TextStyle(fontSize: 20.0),
                                 //允许左右滚动
                                 isScrollable: false,
                                 //选中下划线的颜色
                                 indicatorColor: Colors.black,
                                 controller: tabController,
                                 tabs: [
                                   Container(
                                       margin: EdgeInsets.only(top: 15),
                                       child: Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             Expanded(
                                               flex: 2,
                                               child: Row(
                                                 children: [
                                                   SizedBox(width: 10),
                                                   Icon(
                                                     Icons.lightbulb,
                                                     color: Colors.lightBlue, size: 36,
                                                   ),
                                                   Spacer(),
                                                   Text("道路分组"),
                                                   SizedBox(width: 10),
                                                 ],
                                               ),
                                             )

                                           ]
                                       )
                                   ),
                                   Container(
                                     margin: EdgeInsets.only(top: 15),
                                       child: Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             SizedBox(width: 10),
                                             Icon(
                                               Icons.lightbulb,
                                               color: Colors.lightBlue, size: 36,
                                             ),
                                             Text("单灯控制"),
                                             SizedBox(width: 10),
                                           ]
                                       )
                                   )
                                 ])
                         )
                       ],
                     )
                    ],
                  ),
                  SizedBox(height: 10),
                  Expanded(
                      flex: 1,
                      child: Theme(
                        data: ThemeData(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        child: TabBarView(controller: tabController, children: [
                          // 视图1
                          getItems(),
                          // 视图2
                          getProduct(),
                        ]),
                      ))
                ]
            )
        )
    );
  }

  /// 搜索
  void getSearchNumber() {}

  /// 切换视图
  Widget getItems() {
    return isSelect == false
        ? Column(
      children: [
        Container(
          height: 470,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Wrap(
                  spacing: 2,
                  runSpacing: 5,
                  children: List.generate(dataItems.length, (index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            var id = dataItems[index]["id"];
                            switch (id) {
                              case 1:
                                isSelect = true;
                                isOK = true;
                                break;
                              case 2:
                                isSelect = true;
                                break;
                              case 3:
                                isSelect = true;
                                break;
                              case 4:
                                isSelect = true;
                                break;
                              case 5:
                                isSelect = true;
                                break;
                              case 6:
                                isSelect = true;
                                break;
                              default:
                                print("OK");
                            }
                          });
                        },
                        child: Card(
                            elevation: 2,
                            child: Column(
                              children: <Widget>[
                                Hero(
                                  tag: dataItems[index]["id"].toString(),
                                  child: Container(
                                    margin: EdgeInsets.only(left: 5, right: 5, top: 6),
                                    padding: EdgeInsets.only(left: 3, right: 3),
                                    width: 153,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.lightbulb, color: Colors.lightBlue),
                                            Text("在线：238", style: TextStyle(color: Colors.grey)),
                                            Spacer(),
                                            GestureDetector(
                                              onTap: (){},
                                              child: Icon(Icons.more_vert, color: Colors.grey, size: 30),
                                            )
                                          ],
                                        ),
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
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(dataItems[index]["name"], style: TextStyle(fontSize: 18, color: Colors.black45)),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text("灯光已开", style: TextStyle(fontSize: 17, color: Colors.black12)),
                                            Spacer(),
                                            FlutterSwitch(
                                              width: 46,
                                              height: 24,
                                              toggleSize: 21,
                                              padding: 1,
                                              inactiveText: "ON",
                                              activeText: "OFF",
                                              valueFontSize: 8.0,
                                              activeTextColor: Colors.black54,
                                              inactiveTextColor: Colors.blueAccent,
                                              showOnOff: true,
                                              toggleColor: Color.fromRGBO(
                                                  30, 100, 120, 1),
                                              switchBorder: Border.all(
                                                color: Colors.blueAccent,
                                                width: 1.0,
                                              ),
                                              activeColor: Colors.black12,
                                              inactiveColor: Colors.white70,
                                              value: flag,
                                              onToggle: (isCheck) {
                                                setState(() {
                                                  /// 此处设置item是否可编辑，再判断传值
                                                  // 打印当前id
                                                  print(dataItems[index]["id"]);
                                                });
                                              },
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            )));
                  }),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
        Text("中华人民共和国广东省深圳市", style: TextStyle(fontSize: 18, color: Colors.black45)),
      ],
    )
        : Column(
        children: [
        Container(
          height: 475,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return index == 0
                  ? Container(
                     alignment: AlignmentDirectional.center,
                     margin: EdgeInsets.only(top: 8, left: 10, right: 10),
                     padding: EdgeInsets.only(
                     left: 12, right: 0, top: 12, bottom: 12),
                    decoration: BoxDecoration(
                     boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 3.0)
                    ],
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.lightbulb, color: Colors.lightBlue),
                        SizedBox(width: 2),
                        Text("在线：238", style: TextStyle(color: Colors.grey)),
                        Spacer(),
                        isOK == true
                            ? Text(dataItems[0]["name"], style: TextStyle(fontSize: 18, color: Colors.black45))
                        : Text(dataItems[2]["name"], style: TextStyle(fontSize: 18, color: Colors.black45)),
                        SizedBox(width: 16),
                        Icon(Icons.more_vert, color: Colors.grey),
                        SizedBox(width: 6),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.lightbulb, color: Colors.black12),
                        SizedBox(width: 2),
                        Text("离线：008", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.warning_amber_outlined, color: Colors.grey),
                        SizedBox(width: 2),
                        Text("警告：000", style: TextStyle(color: Colors.grey)),
                        Spacer(),
                        Text("灯光已开", style: TextStyle(fontSize: 16, color: Colors.black12)),
                        SizedBox(width: 4),
                        FlutterSwitch(
                          width: 46,
                          height: 24,
                          toggleSize: 21,
                          padding: 1,
                          inactiveText: "ON",
                          activeText: "OFF",
                          valueFontSize: 8.0,
                          activeTextColor: Colors.black54,
                          inactiveTextColor: Colors.blueAccent,
                          showOnOff: true,
                          toggleColor: Color.fromRGBO(30, 100, 120, 1),
                          switchBorder: Border.all(
                            color: Colors.blueAccent,
                            width: 1.0,
                          ),
                          activeColor: Colors.black12,
                          inactiveColor: Colors.white70,
                          value: flag,
                          onToggle: (isCheck) {
                            setState(() {
                              flag = isCheck;
                            });
                          },
                        ),
                        SizedBox(width: 6),
                      ],
                    ),
                  ],
                ),
              )
                  : (index == 1
                  ? Container(
                  alignment: AlignmentDirectional.center,
                  margin: EdgeInsets.only(top: 8, left: 10, right: 10),
                  padding: EdgeInsets.only(left: 12, right: 0, top: 12, bottom: 12),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey, blurRadius: 3.0)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Icons.bolt),
                            SizedBox(width: 2),
                            Text("米东南路1号电箱", style: TextStyle(fontSize: 16, color: Colors.black12)),
                            SizedBox(width: 2),
                            Text("在线:32DB  功率:19KW", style: TextStyle(fontSize: 14, color: Colors.black12)),
                            Spacer(),
                            Icon(Icons.more_horiz, color: Colors.grey,),
                            SizedBox(width: 6),
                          ],
                        ),
                      )
                    ],
                  )
              )
                  : Container(
                      alignment: AlignmentDirectional.center,
                      margin: EdgeInsets.only(top: 8, left: 40, right: 10),
                      padding: EdgeInsets.only(left: 12, right: 0, top: 12, bottom: 12),
                   decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, blurRadius: 3.0)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.lightbulb, color: Colors.lightBlue),
                          SizedBox(width: 2),
                          Text(numList[index], style: TextStyle(fontSize: 16, color: Colors.black12)),
                          SizedBox(width: 15),
                          Text("在线: 32DB  功率: 89KW", style: TextStyle(fontSize: 13, color: Colors.black12)),
                          Spacer(),
                          Icon(Icons.more_horiz, color: Colors.grey,),
                          SizedBox(width: 6),
                        ],
                      ),
                    )
                  ],
                ),
              ));
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 3,
              );
            },
          ),
        ),
        Spacer(),
        Text("中华人民共和国广东省深圳市", style: TextStyle(fontSize: 18, color: Colors.black45)),
        SizedBox(height: 3),
      ],
    );
  }

  Widget getProduct() {
    return Container(
      color: Colors.blueAccent,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
