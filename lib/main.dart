// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

void  main() =>runApp(  const MyApp());
class MyApp extends StatefulWidget{
  const MyApp({Key? key}):super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int lcurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List list = [Container(),Container(),Container(),const Center(child: WustHelperWidget()),Container()];
    
    List<BottomNavigationBarItem> _barItem = [
    const BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('主页')),
     const BottomNavigationBarItem(icon: Icon(Icons.volunteer_activism),title: Text('志愿者')),
      const BottomNavigationBarItem(icon: Icon(Icons.schedule),title: Text('课表')),
       const BottomNavigationBarItem(icon: Icon(Icons.school),title: Text('校园')),
        const BottomNavigationBarItem(icon: Icon(Icons.person),title: Text('个人')),
  ];
    return MaterialApp(
      home: Scaffold(
        // body: Center(child: WustHelperWidget(),),
        body: list[lcurrentIndex],
        bottomNavigationBar: BottomNavigationBar(
        items: _barItem,
        currentIndex: lcurrentIndex,
        onTap: (int index){
      setState(() {
        lcurrentIndex = index;
      });
    },
    selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 12.0,
      type: BottomNavigationBarType.fixed,
    )
      ),
    );
  }
}
//---------------------------------------------------------------------------------------------------
class WustHelperWidget extends StatefulWidget{
  const WustHelperWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>WustHelperState();
}

class WustHelperState extends State<WustHelperWidget>
      with SingleTickerProviderStateMixin{
        late TabController tabController;
        
        // int LcurrentIndex = 0;
       // List list = <Widget>[Container(),Container(),SchoolWidget()];
        
@override
// void initState(){
//   super.initState();
//   //tabController = TabController(length: tabs.length, vsync: this);
// }
  @override
  Widget build(BuildContext context) {

List <TabInfo> tabs= [
  TabInfo("最新", Container()),
    TabInfo("最熱", Container()),
  TabInfo("學校", Page1()),
    

];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
        bottom: TabBar(
          tabs:tabs.map((TabInfo tab) => Tab(text:tab.label)).toList(),
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle: const TextStyle(fontSize: 16),
                labelColor: Colors.black,
                labelStyle: const TextStyle(fontSize: 16.0),
                isScrollable: false,
                indicatorColor: Colors.green,
                indicatorSize: TabBarIndicatorSize.label ,
                indicatorWeight: 4.0,
          ),
          
      ),
body: TabBarView(
  children: tabs.map((e) => e.widget).toList()
),
      ),
      
      
    );
  }
      //  @override
        // void dispose(){
        //   tabController.dispose();
        //   super.dispose();
        // }   
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
         OutlinedButton(
          
          onPressed: (){
            Navigator.push(context,
             MaterialPageRoute(builder: (context){
              return NewRoute();
             }),
             );
          }, 
         child: Container(
          constraints: const BoxConstraints.tightFor(width: 300.0,height: 130),
          child: Row(
            children: <Widget>[
              Container(
                constraints: const BoxConstraints.tightFor(width: 200.0,height: 130),
                //color: Colors.red,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(4.0),
                      child: Text("检察机关依法对傅政华涉嫌受贿、徇私枉法案提起公诉",
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18
                      ),
                      overflow: TextOverflow.ellipsis,),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.0),
                      child: Text("中新网7月11日电 据最高人民检察院微信公众号消息，全国政协社会和法制委员会原副主任傅政华涉嫌受贿、徇私枉法案，由国家监察委员会调查终结，经最高人民检察院指定，由吉林省长春市人民检察院审查起诉。近日，长春市人民检察院已向长春市中级人民法院提起公诉。",
                      maxLines: 2,
                       style: TextStyle(
                        color: Colors.black,
                        fontSize: 11
                      ),
                      overflow: TextOverflow.ellipsis,),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.0),
                      child: Text("2022-7-11 XX",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 10,
                      ),),
                    ),
                  ],

                ),
              ),
              Container(
                constraints: const BoxConstraints.tightFor(width: 100.0,height: 130),
                child: Column(children: <Widget>[
                  Image(
                    image: AssetImage("images/汉堡.png"),
                    width: 80.0,
                    height: 80.0,
                    ),
                    Text("热度 XXX")

                ],),
              ),
            ],
          ),
          
         ))
      ],
    );
  }
}

class TabInfo {
  String label;
  Widget widget;
  TabInfo(this.label, this.widget);
}


  

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详 情   DETAILS"),
      ),
      body: Center(
        child: Text("  中新网7月11日电 据最高人民检察院微信公众号消息，全国政协社会和法制委员会原副主任傅政华涉嫌受贿、徇私枉法案，由国家监察委员会调查终结，经最高人民检察院指定，由吉林省长春市人民检察院审查起诉。近日，长春市人民检察院已向长春市中级人民法院提起公诉。"),
      ),
    );
  }
}















// Column(
//         children: <Widget>[
//           ConstrainedBox(
//             constraints: BoxConstraints(
//               minWidth: double.infinity,
//               minHeight: Size.fromHeight(kMinInteractiveDimension).height,
//             ),
//             child: Container(
//               color: Colors.white,
//               child: TabBar(
//                 tabs:tabs,
//                 controller: tabController,
//                 unselectedLabelColor: Colors.grey,
//                 unselectedLabelStyle: TextStyle(fontSize: 16),
//                 labelColor: Colors.black,
//                 labelStyle: TextStyle(fontSize: 16.0),
//                 isScrollable: false,
//                 indicatorColor: Colors.green,
//                 indicatorSize: TabBarIndicatorSize.label ,
//                 indicatorWeight: 4.0,
//                 ),
//             ), 
//             ),
//             Expanded(
//               child:  TabBarView(
//                 controller: tabController,
//                 children: [],
//               )
//               )
//         ],
//       ),
