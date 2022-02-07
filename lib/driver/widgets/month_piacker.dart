import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef OnSelectedDate = void Function(String date);

class DatePicker extends StatefulWidget {
  const DatePicker(
    {
      Key? key,
      required this.onSelectedDate,
      required this.selectedDate,
      this.startYear = 2020,
      this.endYear = 2500
    }
  ) : super(key: key);

  // 结果返回
  final OnSelectedDate onSelectedDate;
  final String selectedDate; //选中的时间
  final int startYear;
  final int endYear;

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  //年数组
  List<String> yearList = [];
  //月数组
  List<String> monthList = [];
  //年的索引
  int yearIndex = 0;
  //月的索引
  int monthIndex = 0;

  late FixedExtentScrollController yearScrollController;
  late FixedExtentScrollController monthScrollController;

  @override
  void initState() {
    super.initState();

    _setupData();

    _initSelectedIndex();
  }

  @override
  void dispose() {
    yearScrollController.dispose();
    monthScrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _headerWidget(),
        _datePicker(),
      ],
    );
  }

  ///初始化数据
  void _setupData() {
    for (int i = widget.startYear; i <= widget.endYear; i++) {
      yearList.add(i.toString());
    }

    for (int i = 1; i <= 12; i++) {
      monthList.add(i.toString().padLeft(2, '0'));
    }
  }

  ///初始化时间索引
  void _initSelectedIndex() {
    final List uniqueYearList = Set.from(yearList).toList();
    final List uniqueMonthList = Set.from(monthList).toList();

    ///获取索引
    if (widget.selectedDate.isNotEmpty) {
      ///传了选中日期的时候
      List<String> date = widget.selectedDate.split('-');

     setState(() {
       yearIndex = uniqueYearList.indexOf(date[0]);
       monthIndex = uniqueMonthList.indexOf(date[1]);
     });
    } else {
      ///没有传选中日期默认当前系统时间
      String year = DateTime.now().year.toString();
      String month = DateTime.now().month.toString().padLeft(2, '0');

     setState(() {
       yearIndex = uniqueYearList.indexOf(year);
       monthIndex = uniqueMonthList.indexOf(month);
     });
    }

    yearScrollController = FixedExtentScrollController(initialItem: yearIndex);
    monthScrollController = FixedExtentScrollController(initialItem: monthIndex);
  }

  Widget _headerWidget() {
    return Container(
      height: 60,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton(
              child: const Text(
                '取消',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text(
                '确定',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              onPressed: () {
                String date = yearList[yearIndex]+'-'+monthList[monthIndex];
                widget.onSelectedDate(date);
              },
            ),
          ]),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1)),
      ),
    );
  }

  Widget _datePicker() {
    return Container(
      color: Colors.white,
      height: 200,
      child: Stack(
        children: [
          Row(
            children: <Widget>[
              Expanded(child: _yearPickerView()),
              Expanded(child: _monthPickerView()),
            ],
          ),
          Container(
            color: const Color.fromARGB(255, 209, 209, 304),
            margin: const EdgeInsets.only(top: 78),
            height: 1,
          ),
          Container(
            color: const Color.fromARGB(255, 209, 209, 304),
            margin: const EdgeInsets.only(top: 124),
            height: 1,
          ),
          Container(
            margin: const EdgeInsets.only(top: 78),
            child: Row(
              children: const [
                Expanded(
                  child: Text(""),
                ),
                SizedBox(
                  width: 50,
                  child: Padding(
                    padding: EdgeInsets.only(top: 9),
                    child: Text(
                      '年',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                      maxLines: 1,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(""),
                ),
                SizedBox(
                  width: 60,
                  child: Padding(
                    padding: EdgeInsets.only(top: 9),
                    child: Text(
                      '月',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///年
  Widget _yearPickerView() {
    return CupertinoPicker(
      scrollController: yearScrollController,
      children: _buildYearWidget(),
      looping: false,
      selectionOverlay: const Center(),
      onSelectedItemChanged: (index) {
        setState(() {
          yearIndex = index;
        });
      },
      itemExtent: 44,
    );
  }

  ///月
  Widget _monthPickerView() {
    return CupertinoPicker(
      scrollController: monthScrollController,
      children: _buildMonthWidget(),
      looping: false,
      selectionOverlay: const Center(),
      onSelectedItemChanged: (index) {
        setState(() {
          monthIndex = index;
        });
      },
      itemExtent: 44,
    );
  }

  ///年Widget
  List<Widget> _buildYearWidget() {
    List<Widget> yearListWidget = []; //先建一个数组用于存放循环生成的widget
    for (var item in yearList) {
      yearListWidget.add(
        Center(
          child: Text(
            item,
            style: const TextStyle(color: Colors.black87, fontSize: 16),
            maxLines: 1,
          ),
        ),
      );
    }

    return yearListWidget;
  }

  ///月Widget
  List<Widget> _buildMonthWidget() {
    List<Widget> monthListWidget = []; //先建一个数组用于存放循环生成的widget
    for (var item in monthList) {
      monthListWidget.add(
        Center(
          child: Text(
            item,
            style: const TextStyle(color: Colors.black87, fontSize: 16),
            maxLines: 1,
          ),
        ),
      );
    }

    return monthListWidget;
  }
}
