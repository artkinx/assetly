import 'package:assetly/core/helper/constants_helper.dart';
import 'package:assetly/core/helper/country_helper.dart';
import 'package:assetly/presentation/widget/line_chart.dart';
import 'package:assetly/presentation/widget/list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 10, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(child: Icon(Icons.image)),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Welcome, Assetly")
                      ],
                    ),
                    Icon(
                      Icons.settings_outlined,
                      color: greyColor,
                      size: 26,
                      weight: 14,
                      grade: 0,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 59.5,
              ),
              Container(
                height: 63,
                child: Stack(
                  children: [
                    const Positioned(
                      left: 6,
                      child: Text(
                        "Assetly Balance",
                        style: TextStyle(
                          fontSize: 12,
                          color: greyColor,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 24,
                      child: Container(
                        width: 66,
                        height: 23,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: greyColor,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/usa.svg"),
                            const SizedBox(
                              width: 3,
                            ),
                            const Text("USD")
                          ],
                        ),
                      ),
                    ),
                    const Positioned(
                        left: 6,
                        bottom: 3,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "\$120,000.95",
                              style: TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.w700,
                                height: 0.8,
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Icon(
                              Icons.remove_red_eye,
                              size: 15,
                              color: greyColor,
                            )
                          ],
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 34,
              ),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    3,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        color: index == 0 ? primaryColor : greyColor2,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone_android,
                            color: index == 0 ? Colors.white : primaryColor,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            "Deposit",
                            style: TextStyle(
                                color:
                                    index == 0 ? Colors.white : primaryColor),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              // Container(
              //   height: 180,
              //   width: 154,
              //   decoration: BoxDecoration(
              //       color: greyColor2, borderRadius: BorderRadius.circular(20)),
              //   child: const Column(
              //     crossAxisAlignment: CrossAxisAlignment.stretch,
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       Expanded(child: LineChartSample1()),
              //     ],
              //   ),
              // ),
              Wrap(
                spacing: 8,
                children: List.generate(
                  2,
                  (index) => Container(
                    padding: const EdgeInsets.all(10),
                    height: 180,
                    width: 174,
                    decoration: BoxDecoration(
                        color: greyColor2,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Stack(children: [
                      Positioned(
                        left: 17,
                        top: 9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$120,000",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Recieved this month.",
                              style: TextStyle(fontSize: 11, color: greyColor),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 2,
                        bottom: 0,
                        child: SizedBox(
                          width: 170,
                          height: 90,
                          child: LineChartSample1(),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              Container(
                margin: const EdgeInsets.only(right: 24),
                padding: const EdgeInsets.only(top: 23, left: 14, right: 14),
                height: MediaQuery.sizeOf(context).height / 2,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: greyColor2,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Transaction History"),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 1,
                      color: greyColor.withOpacity(0.5),
                    ),
                    ...List.generate(13, (index) => const ListItemWidget())
                        .toList()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
