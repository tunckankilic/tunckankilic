import 'package:flutter/material.dart';
import 'package:tunckankilic/common/blog.dart';
import 'package:tunckankilic/mobile/about_mobile.dart';
import 'package:tunckankilic/mobile/contact_mobile.dart';
import 'package:tunckankilic/mobile/works_mobile.dart';
import 'package:tunckankilic/web/about_web.dart';
import 'package:tunckankilic/web/landing_page_web.dart';
import 'package:tunckankilic/web/works_web.dart';

import 'mobile/landing_page_mobile.dart';
import 'web/contact_web.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return const LandingPageWeb();
            } else {
              return const LandingPageMobile();
            }
          }),
        );
      case '/contact':
        return MaterialPageRoute(
            builder: (_) => LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return const ContactWeb();
                  } else {
                    return const ContactMobile();
                  }
                }),
            settings: settings);
      case '/about':
        return MaterialPageRoute(
            builder: (_) => LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return const AboutWeb();
                  } else {
                    return const AboutMobile();
                  }
                }),
            settings: settings);
      case '/blog':
        return MaterialPageRoute(
            builder: (_) => const Blog(), settings: settings);
      case '/works':
        return MaterialPageRoute(
            builder: (_) => LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return const WorksWeb();
                  } else {
                    return const WorksMobile();
                  }
                }),
            settings: settings);
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return const LandingPageWeb();
            } else {
              return const LandingPageMobile();
            }
          }),
        );
    }
  }
}
