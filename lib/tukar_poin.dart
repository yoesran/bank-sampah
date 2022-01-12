import 'package:bank_sampah_app/menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TukarPoin extends StatefulWidget {
  const TukarPoin({Key? key}) : super(key: key);

  @override
  _TukarPoinState createState() => _TukarPoinState();
}

class _TukarPoinState extends State<TukarPoin> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GestureDetector(
            onTap: () {
              Get.off(() => Menu());
            },
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.green.shade900,
                ),
                Text(
                  "Menu",
                  style: TextStyle(color: Colors.green.shade900, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Tukar Poin",
          style: TextStyle(color: Colors.green.shade900, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF527D46),
                Color(0xFF83B644),
              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 2 - 40,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/dollar_backdrop.png"),
                    alignment: Alignment.centerLeft,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your Balance",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green.shade900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "1260",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.green.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TabBar(
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.green.shade900,
                      indicatorColor: Color(0xFF527D45),
                      tabs: [
                        Tab(
                          text: 'Reward Wallet',
                        ),
                        Tab(
                          text: 'Redeem',
                        )
                      ],
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: TabBarView(
                        children: [
                          Column(
                            children: [
                              CardRewardNew(
                                title: "Hadiah I",
                                exp: "Exp : 01/01/2022",
                                redeem: "2500",
                              ),
                              CardReward(
                                title: "Hadiah II",
                                exp: "Exp : 02/02/2022",
                                redeem: "2000",
                              ),
                              CardReward(
                                title: "Hadiah III",
                                exp: "Exp : 03/03/2022",
                                redeem: "1500",
                              ),
                              CardReward(
                                title: "Hadiah IV",
                                exp: "Exp : 04/04/2022",
                                redeem: "1000",
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CardRewardNew(
                                title: "Hadiah I",
                                exp: "Exp : 01/01/2022",
                                isRedeem: true,
                              ),
                            ],
                          )
                        ],
                        controller: _tabController,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardReward extends StatelessWidget {
  const CardReward({
    Key? key,
    this.title,
    this.exp,
    this.redeem,
    this.isRedeem = false,
  }) : super(key: key);

  final String? title;
  final String? exp;
  final String? redeem;
  final bool? isRedeem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4 - 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 5,
            color: Colors.grey.withOpacity(1),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/Rectangle.png",
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  exp!,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 100,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                border: Border.all(
                  color: (isRedeem!) ? Colors.grey : Color(0xFF00A3FF),
                  width: 1.5,
                ),
              ),
              child: Text(
                (isRedeem!) ? "Dalam Proses" : "Redeem $redeem",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: (isRedeem!) ? Colors.grey : Color(0xFF00A3FF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardRewardNew extends StatelessWidget {
  const CardRewardNew({
    Key? key,
    this.title,
    this.exp,
    this.redeem,
    this.isRedeem = false,
  }) : super(key: key);

  final String? title;
  final String? exp;
  final String? redeem;
  final bool? isRedeem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4 - 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 5,
                color: Colors.grey.withOpacity(1),
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/images/Rectangle.png",
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      exp!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 100,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    border: Border.all(
                      color: (isRedeem!) ? Colors.grey : Color(0xFF00A3FF),
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    (isRedeem!) ? "Dalam Proses" : "Redeem $redeem",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: (isRedeem!) ? Colors.grey : Color(0xFF00A3FF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 50,
              height: 20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/Rectangle_new.png",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Text(
                "New",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
