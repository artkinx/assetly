import 'package:assetly/core/helper/constants_helper.dart';
import 'package:assetly/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoanPage extends StatefulWidget {
  const LoanPage({super.key});

  @override
  State<LoanPage> createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(35, 60, 35, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Column(
                  children: [
                    Text(
                      "P2P Loan",
                      style: GoogleFonts.inter().copyWith(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 3, bottom: 3),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          const Text("Credit score "),
                          Image.asset("assets/star.png"),
                          const Text("  10")
                        ],
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  "assets/filter.svg",
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 113,
                  width: MediaQuery.sizeOf(context).width / 2.7,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: greyColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/money-send.svg",
                          height: 20,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Loan Out:",
                          style: GoogleFonts.inter().copyWith(color: greyColor),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          "\$114,000.00",
                          overflow: TextOverflow.clip,
                          style: GoogleFonts.inter().copyWith(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        )
                      ]),
                ),
                const SizedBox(
                  width: 22,
                ),
                Container(
                  height: 113,
                  width: MediaQuery.sizeOf(context).width / 2.7,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: greyColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/money-send.svg",
                          height: 20,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Refunded Loan",
                          style: GoogleFonts.inter().copyWith(color: greyColor),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          "\$114,000.00",
                          overflow: TextOverflow.clip,
                          style: GoogleFonts.inter().copyWith(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        )
                      ]),
                )
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Loan Listing",
                  style: GoogleFonts.inter().copyWith(fontSize: 14),
                ),
                Text(
                  "More",
                  style: GoogleFonts.inter().copyWith(fontSize: 14),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 9,
                  itemBuilder: (_, index) => Container(
                        height: 146,
                        margin: const EdgeInsets.only(bottom: 17),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: greyColor2,
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 23.0),
                              child: CircleAvatar(child: Icon(Icons.image)),
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Micheal Davide",
                                    style: GoogleFonts.inter().copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Loan Request: \$1,200",
                                    style: GoogleFonts.inter().copyWith(
                                        color: greyColor, fontSize: 13),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Term: 3 month",
                                    overflow: TextOverflow.clip,
                                    style: GoogleFonts.inter().copyWith(
                                      fontSize: 12,
                                      color: greyColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 13,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      SizedBox(
                                          width: 90,
                                          child: CustomButton(
                                            elevation: 0,
                                            text: "Apply",
                                            onPressed: () {},
                                          )),
                                      const SizedBox(
                                        width: 9,
                                      ),
                                      const Icon(
                                        Icons.person,
                                        color: primaryColor,
                                      )
                                    ],
                                  )
                                ]),
                            Container(
                              width: 120,
                              margin: const EdgeInsets.only(top: 23.0),
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 3, bottom: 3),
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  const Text("Cscore "),
                                  Image.asset("assets/star.png"),
                                  const Text("  10")
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
