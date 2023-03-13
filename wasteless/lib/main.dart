import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'admin features/map/presentation/screens/admin_map_screen.dart';
import 'injection_container.dart' as di;
import 'admin features/map/presentation/bloc/bloc/map_itemss_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();

  runApp(const WasteLess());
}

class WasteLess extends StatelessWidget {
  const WasteLess({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => di.sl<MapItemssBloc>())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: 'WasteLess',
        home: Scaffold(
          body: const AdminMapScreen(),
        ),
      ),
    );
  }
}
