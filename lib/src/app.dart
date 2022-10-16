import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learning/src/auth/presentation/login.dart';
import 'package:learning/src/download_test.dart';
import 'package:learning/src/interactive/soil_page.dart';
import 'package:learning/src/main_map/main_map1.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(
            fontFamily: 'MyanUni',
            brightness: Brightness.light,
            primaryColor: Colors.red[800],
            appBarTheme: AppBarTheme(
              color: Colors.red[800],
            ),
            // textTheme: const TextTheme(
            //   headline1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            //   headline6: TextStyle(
            //     fontSize: 16.0,
            //   ),
            //   bodyText2: TextStyle(
            //     fontSize: 14.0,
            //   ),
            // ),
          ),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          initialRoute: LoginScreen.routeName,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  case SoilPageScreen.routeName:
                    return const SoilPageScreen();
                  case LoginScreen.routeName:
                    return const LoginScreen();
                  case DownloadTest.routeName:
                    return const DownloadTest();
                  case SampleItemListView.routeName:
                  default:
                    return const MainMapFirstScreen();
                }
              },
            );
          },
        );
      },
    );
  }
}
