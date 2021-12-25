import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';


class ProductDetailPage extends StatefulWidget {
  /// 设置序列ID
  final String id;

  /// 款式
  final String name;

  /// 编码
  final String code;
  /// 图示
  final String img;
  final String scan;
  final String like;

  const ProductDetailPage(
      {Key? key,
        required this.id,
        required this.name,
        required this.code,
        required this.img, required this.scan, required this.like,
        })
      : super(key: key);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
