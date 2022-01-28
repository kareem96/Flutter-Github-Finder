import 'package:flutter/material.dart';
import 'package:github_finder/common/utils.dart';
import 'package:github_finder/injection.dart' as di;
import 'package:github_finder/presentation/pages/detail_page.dart';
import 'package:github_finder/presentation/pages/home_page.dart';
import 'package:github_finder/presentation/pages/user_detail_page.dart';
import 'package:github_finder/presentation/provider/load_repo_provider.dart';
import 'package:github_finder/presentation/provider/search_user_provider.dart';
import 'package:github_finder/presentation/provider/user_detail_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // initializeDI();
  di.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchListNotifier>(
            create: (_) => di.locator<SearchListNotifier>()
        ),
        ChangeNotifierProvider(
            create: (_) => di.locator<UserDetailNotifier>()
        ),
        ChangeNotifierProvider<LoadRepoNotifier>(
            create: (_) => di.locator<LoadRepoNotifier>()
        )
      ],
      child: MaterialApp(
        title: 'Github Finder user',
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.indigo,
        ),
        home: HomePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings){
          switch(settings.name){
            case '/home':
              return MaterialPageRoute(builder: (_) => HomePage());
            case UserDetailPage.route:
              final username = settings.arguments as String;
              return MaterialPageRoute(
                  builder: (_) => UserDetailPage(username: username),
              );
            case DetailRepoPage.route:
              final username = settings.arguments as String;
              return MaterialPageRoute(
                  builder: (_) => DetailRepoPage(user: username)
              );
            default:
              return MaterialPageRoute(builder: (_){
                return Scaffold(
                  body: Center(child: Text('Page not found!'),),
                );
              });
          }
        },
      ),
    );
  }
}