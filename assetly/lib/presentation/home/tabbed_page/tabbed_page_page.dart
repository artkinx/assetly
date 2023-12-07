import 'package:assetly/core/helper/constants_helper.dart';
import 'package:assetly/data/tab_object.dart';
import 'package:assetly/presentation/home/dash_board/dash_board_page.dart';
import 'package:assetly/presentation/home/loan/loan_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final tabs = <TabObject>[
  TabObject("Wallet", logo: const Icon(Icons.wallet)),
  TabObject("P2P Loan", logo: const Icon(Icons.wallet), isActive: true),
];

const pages = <String, Widget>{
  "Wallet": DashBoardPage(),
  "P2P Loan": LoanPage(),
};

class TabbedPage extends StatefulWidget {
  const TabbedPage({super.key});

  @override
  State<TabbedPage> createState() => _TabbedPageState();
}

class _TabbedPageState extends State<TabbedPage> with TickerProviderStateMixin {
  int index = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SizedBox(
          height: 106,
          child: ColoredBox(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Center(
              child: Container(
                height: 54,
                margin: const EdgeInsets.only(
                    bottom: 10, left: 20, right: 20, top: 20),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: greyColor2, borderRadius: BorderRadius.circular(40)),
                child: Row(
                    children: tabs
                        .map((e) => Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    tabs
                                        .firstWhere(
                                            (element) => element.isActive)
                                        .isActive = false;

                                    e.isActive = true;

                                    index = pages.keys.indexed
                                        .firstWhere(
                                            (element) => element.$2 == e.title)
                                        .$1;

                                    _tabController.animateTo(index);
                                  });
                                },
                                child: Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: e.isActive
                                          ? Colors.white
                                          : greyColor2,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        e.logo == null
                                            ? e.logoWidget ??
                                                const SizedBox.shrink()
                                            : Icon(
                                                e.logo!.icon,
                                                color: e.isActive
                                                    ? primaryColor
                                                    : greyColor,
                                              ),
                                        const SizedBox(
                                          width: 11,
                                        ),
                                        Text(
                                          e.title,
                                          style: GoogleFonts.inter().copyWith(
                                            color: e.isActive
                                                ? primaryColor
                                                : greyColor,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ))
                        .toList()),
              ),
            ),
          ),
        ),
        extendBody: true,
        body: DefaultTabController(
          length: 2,
          initialIndex: index,
          child: TabBarView(
              dragStartBehavior: DragStartBehavior.down,
              controller: _tabController,
              children: pages.entries.map((e) => e.value).toList()),
        ));
  }
}
