// ignore_for_file: prefer_const_constructors , prefer_const_literals_to_create_immutables

import 'package:alfa/widgets/responsive.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/animation/gf_animation.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/types/gf_animation_type.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/mix_widgets.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('About Us'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'About Us',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ResponsiveWidget(
                mobiView: Column(
                  children: [
                    SizedBox(
                      width: 500,
                      child: GFCard(
                        title: GFListTile(
                          title: wText('About Us'),
                          subTitle: cText('Who we are'),
                        ),
                        content: Text(
                          "IFA Consultancy:\n"
                              "Description: IFA Consultancy is a highly respected FCA compliance specialist that serves independent financial advisers (IFAs) across the UK. They provide both face-to-face and remote IFA compliance advice and services.\n"
                              "Services: IFA Consultancy offers a range of services to help IFAs meet their regulatory obligations, including:\n"
                              "Compliance Audits\n"
                              "Regulatory Updates\n"
                              "Training\n"
                              "FCA Authorisation\n"
                              "File Checking\n"
                              "Senior Managers & Certification Regime (SM&CR)\n"
                              "Policies & Procedures\n",
                          style: GoogleFonts.aBeeZee(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 500,
                      child: GFCard(
                        title: GFListTile(
                          title: wText('IFA Travel & Tourism'),
                          subTitle: cText('Expert Travel Consultants'),
                        ),
                        content: Text(
                          "Corporate and Leisure Travel Management: IFA Travel & Tourism specializes in corporate and leisure travel management. They offer a wide range of services, including personal travel consultancy, air chartering, event planning, meetings, and exclusive corporate offers1\N"
                              "Unique Concierge Services: They provide unique concierge tourism services, catering to IFA group partners and customers. These services include access to private jets, luxury yachts, and tailor-made travel experiences based on specific interests (such as hunting and safari excursions or theme park adventures)",
                          style: GoogleFonts.aBeeZee(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 40.0, left: 20.0, right: 20.0),
                      child: GFImageOverlay(
                        height: 400,
                        width: 500,
                        shape: BoxShape.rectangle,
                        image: AssetImage('assets/images/dubai.jpeg'),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.darken),
                        borderRadius: BorderRadius.circular(20),
                        child: Center(
                          child: Text(
                            'About Us',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 500,
                      child: GFCard(
                        title: GFListTile(
                          title: wText('IFA Real Estate'),
                          subTitle: cText('Real Estate Investment Advisors'),
                        ),
                        content: Text(
                          "Real Estate Investment Advisors: IFA Real Estate is a real estate investment advisory firm that specializes in helping clients make informed decisions about real estate investments. They provide a range of services, including property valuation, market analysis, and investment strategy development.\n"
                              "Property Management: They also offer property management services, including tenant screening, rent collection, maintenance, and property marketing. Their goal is to help clients maximize the return on their real estate investments.\N"
                              "Real Estate Development: IFA Real Estate also provides real estate development services, including land acquisition, project management, and construction oversight. They work with clients to develop custom real estate projects that meet their specific needs and goals.",
                          style: GoogleFonts.aBeeZee(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                webView: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    SizedBox(
                      width: 500,
                      child: GFCard(
                        title: GFListTile(
                          title: wText('About Us'),
                          subTitle: cText('Who we are'),
                        ),
                        content: Text(
                          "IFA Consultancy:\n"
                            "Description: IFA Consultancy is a highly respected FCA compliance specialist that serves independent financial advisers (IFAs) across the UK. They provide both face-to-face and remote IFA compliance advice and services.\n"
                            "Services: IFA Consultancy offers a range of services to help IFAs meet their regulatory obligations, including:\n"
                            "Compliance Audits\n"
                            "Regulatory Updates\n"
                            "Training\n"
                            "FCA Authorisation\n"
                            "File Checking\n"
                            "Senior Managers & Certification Regime (SM&CR)\n"
                            "Policies & Procedures\n",
                           style: GoogleFonts.aBeeZee(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 40.0, left: 20.0, right: 20.0),
                      child: GFImageOverlay(
                        height: 400,
                        width: 500,
                        shape: BoxShape.rectangle,
                        image: AssetImage('assets/images/dubai.jpeg'),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.darken),
                        borderRadius: BorderRadius.circular(20),
                        child: Center(
                          child: Text(
                            'About Us',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 40.0, left: 20.0, right: 20.0),
                        child: GFAnimation(
                          changedWidth: 400,
                          changedHeight: 400,
                          curve: Curves.bounceInOut,
                          type: GFAnimationType.container,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 400,
                            width: 500,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                  style: GoogleFonts.salsa(
                                    fontSize: 16,
                                  ),
                                  "About us\n"
                                  "IFA Travel & Tourism is a prominent travel and tourism company in the Middle East. Here are some key points about them:\n"
                                "Corporate and Leisure Travel Management: IFA Travel & Tourism specializes in corporate and leisure travel management. They offer a wide range of services, including personal travel consultancy, air chartering, event planning, meetings, and much more.\n"
                            )),

                          ),
                        )),
                    SizedBox(
                      width: 500,
                      child: GFCard(
                        title: GFListTile(
                          title: wText('IFA Travel & Tourism'),
                          subTitle: cText('Expert Travel Consultants'),
                        ),
                        content: Text(
                          "Corporate and Leisure Travel Management: IFA Travel & Tourism specializes in corporate and leisure travel management. They offer a wide range of services, including personal travel consultancy, air chartering, event planning, meetings, and exclusive corporate offers1\N"
                            "Unique Concierge Services: They provide unique concierge tourism services, catering to IFA group partners and customers. These services include access to private jets, luxury yachts, and tailor-made travel experiences based on specific interests (such as hunting and safari excursions or theme park adventures)",
                           style: GoogleFonts.aBeeZee(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 500,
                      child: GFCard(
                        title: GFListTile(
                          title: wText('IFA Real Estate'),
                          subTitle: cText('Real Estate Investment Advisors'),
                        ),
                        content: Text(
                          "Real Estate Investment Advisors: IFA Real Estate is a real estate investment advisory firm that specializes in helping clients make informed decisions about real estate investments. They provide a range of services, including property valuation, market analysis, and investment strategy development.\n"
                            "Property Management: They also offer property management services, including tenant screening, rent collection, maintenance, and property marketing. Their goal is to help clients maximize the return on their real estate investments.\N"
                            "Real Estate Development: IFA Real Estate also provides real estate development services, including land acquisition, project management, and construction oversight. They work with clients to develop custom real estate projects that meet their specific needs and goals.",
                           style: GoogleFonts.aBeeZee(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
