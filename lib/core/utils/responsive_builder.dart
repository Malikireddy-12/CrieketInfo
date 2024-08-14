import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

typedef WidgetBuilder = Widget Function(BuildContext);

/// A Widget with a builder that provides you with sizing information
/// This widget is used by the CustomScreenTypeLayout to provide different widget builders
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;
  const ResponsiveBuilder({
    super.key,
    required this.builder,
    this.breakpoints,
    this.refinedBreakpoints,
  });

  final ScreenBreakpoints? breakpoints;
  final RefinedBreakpoints? refinedBreakpoints;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      var mediaQuery = MediaQuery.of(context);
      var sizingInformation = SizingInformation(
        deviceScreenType: getDeviceType(mediaQuery.size, breakpoints),
        refinedSize: getRefinedSize(mediaQuery.size,
            refinedBreakpoint: refinedBreakpoints),
        screenSize: mediaQuery.size,
        localWidgetSize:
            Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
      );
      return builder(context, sizingInformation);
    });
  }
}

enum OrientationLayoutBuilderMode {
  auto,
  landscape,
  portrait,
}

class OrientationLayoutBuilder extends StatelessWidget {
  final WidgetBuilder? landscape;
  final WidgetBuilder portrait;
  final OrientationLayoutBuilderMode mode;

  const OrientationLayoutBuilder({
    super.key,
    this.landscape,
    required this.portrait,
    this.mode = OrientationLayoutBuilderMode.auto,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var orientation = MediaQuery.of(context).orientation;
      if (mode != OrientationLayoutBuilderMode.portrait &&
          (orientation == Orientation.landscape ||
              mode == OrientationLayoutBuilderMode.landscape)) {
        if (landscape != null) {
          return landscape!(context);
        }
      }
      return portrait(context);
    });
  }
}

/// Provides a builder function for different screen types
/// Each builder will get built based on the current device width.
/// [breakpoints] define your own custom device resolutions.
/// [watch] will be built and shown when width is less than 300
/// [mobile] will be built  when width is greater than 300
/// [tablet] will be built when width is greater than 600
/// [desktop] will be built if width is greater than 950
///
class CustomScreenTypeLayout extends StatelessWidget {
  CustomScreenTypeLayout(
      {super.key,
      this.breakpoints,
      Widget? watch,
      required Widget mobile,
      Widget? smallMobile,
      Widget? tablet,
      Widget? desktop})
      : watch = _builderOrNull(watch),
        mobile = _builderOrNull(mobile),
        smallMobile = _builderOrNull(smallMobile),
        tablet = _builderOrNull(tablet),
        desktop = _builderOrNull(desktop) {
    _checkIfMobileOrDesktopIsSupplied();
  }

  CustomScreenTypeLayout.builder({
    super.key,
    this.breakpoints,
    this.watch,
    this.smallMobile,
    this.mobile,
    this.tablet,
    this.desktop,
  }) {
    _checkIfMobileOrDesktopIsSupplied();
  }
  final ScreenBreakpoints? breakpoints;
  final WidgetBuilder? watch;
  final WidgetBuilder? mobile;
  final WidgetBuilder? smallMobile;
  final WidgetBuilder? tablet;
  final WidgetBuilder? desktop;

  void _checkIfMobileOrDesktopIsSupplied() {
    final hasMobileLayout = mobile != null;
    final hasDesktopLayout = desktop != null;
    assert(
      hasMobileLayout || hasDesktopLayout,
      "You should supply either a mobile layout or a desktop layout. If you don't to need two layout then remove this widget and use the widget you want to use directly.",
    );
  }

  static WidgetBuilder? _builderOrNull(Widget? widget) {
    return widget == null ? null : ((_) => widget);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        breakpoints: breakpoints,
        builder: (context, sizingInformation) {
          //If we're desktop Size
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            //If we have supplied the desktop layout then display that
            // if the device is a wide tablet (not web) then return tablet view even though sizing things we are desktop size
            if (desktop != null && tablet != null) {
              return !kIsWeb ? tablet!(context) : desktop!(context);
            }
            // if no desktop layout is supplied we want to check if we have the size below it and display that.

            if (tablet != null) return tablet!(context);
          }

          if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
            if (tablet != null) return tablet!(context);
          }
          if (sizingInformation.deviceScreenType == DeviceScreenType.watch &&
              watch != null) {
            return watch!(context);
          }
          if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
            // if (smallMobile != null && context.mediaQuery.size.height) {}
            if (mobile != null) return mobile!(context);
          }
          //if none of the layouts above are supplied we use the preferred layout based on the flag
          final bool buildDeskTopLayout =
              ResponsiveAppUtil.preferDesktop && desktop != null;
          return buildDeskTopLayout ? desktop!(context) : mobile!(context);
        });
  }
}

/// Provides a builder function for refined screen sizes to be used with [CustomScreenTypeLayout]
/// Each builder will get built based on the current device width.
/// [breakpoints] define your own custom device resolutions.
/// [extraLarge] will be built if width is greater than  2160 on desktop,1280 on tablets, 600 on mobiles.
/// [large] will be built  when width is greater than 1440 on desktop,1024 on tablets,414 on mobiles
/// [normal] will be built  when width is greater than 1080 on desktop,768 on tablets,375 on mobiles
/// [small] will be built  when width is less than 720 on desktop,600 on tablets,320 on mobiles
///
class RefinedLayoutBuilder extends StatelessWidget {
  const RefinedLayoutBuilder(
      {super.key,
      this.refinedBreakpoints,
      this.extraLarge,
      this.large,
      required this.normal,
      this.small});
  final RefinedBreakpoints? refinedBreakpoints;
  final WidgetBuilder? extraLarge;
  final WidgetBuilder? large;
  final WidgetBuilder normal;
  final WidgetBuilder? small;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        refinedBreakpoints: refinedBreakpoints,
        builder: (context, sizingInformation) {
          //if we re at Extra large size
          if (sizingInformation.refinedSize == RefinedSize.extraLarge) {
            //if we have supplied the extra large layout then display that
            if (extraLarge != null) return extraLarge!(context);
            // if no extra large supplied we want check if we have size below it and display that
            if (large != null) return large!(context);
          }
          if (sizingInformation.refinedSize == RefinedSize.large) {
            //if we have supplied large layout then display that
            if (large != null) return large!(context);
            // if no large layout supplied we want to check if we have the size below it and display that
            return normal(context);
          }
          if (sizingInformation.refinedSize == RefinedSize.small) {
            // if we have supplied small layout then display that
            if (small != null) return small!(context);
          }

          // if none the layouts above all supplied or we are on the small size layout then we show the small layout
          return normal(context);
        });
  }
}
