import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:state_management_bloc/screens/home_screen.dart';
import 'package:state_management_bloc/screens/random_screen.dart';
import 'package:state_management_bloc/services/crypto_provider.dart';

void main() {
  runApp(const MyApp());
}

//************************************************************
// MyApp class
// Author: Miguel Fagundez
// Date: June, 01 2022
// MyApp
//************************************************************
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // We use Multiprovider because normally we use more.
    // than one provider in the app development.
    // lazy: false => create the provider as soon as the app starts.
    // lazy: true  => create the provider when it is used the first time.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CryptoProvider(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crypto State Managment - Singlenton',
        initialRoute: 'home_crypto',
        routes: {
          'home_crypto': (_) => const HomeScreen(),
          'random_crypto': (_) => const RandomScreen()
        },
      ),
    );
  }
}
