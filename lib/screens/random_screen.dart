import 'package:flutter/material.dart';
import 'dart:math';

import 'package:provider/provider.dart';
import 'package:state_management_bloc/services/crypto_provider.dart';

//************************************************************
// RandomScreen class
// Author: Miguel Fagundez
// Date: June, 01 2022
// This is the second screen of the app
// Every time user push the button, we need to update
// the CRypto model in the provider and show it in this screen
//************************************************************
class RandomScreen extends StatelessWidget {
  const RandomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Screen'),
        elevation: 3.0,
        backgroundColor: Colors.indigo,
      ),
      body: const RandomScreenBody(),
    );
  }
}

class RandomScreenBody extends StatelessWidget {
  const RandomScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CryptoProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text('Take a random crypto & Go back to HomeScreen'),
        ),
        const SizedBox(
          height: 20,
        ),
        const CryptoButton(),
        const SizedBox(
          height: 50,
        ),
        Text('Winning Crypto: ${provider.getCrypto.cryptoName}'),
        Text('Random is: ${provider.randomNumber}'),
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Text(
              'If the random number does not change it is because the value was repeated. Push again!'),
        ),
        const Text('')
      ],
    );
  }
}

class CryptoButton extends StatelessWidget {
  const CryptoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return Center(
        child: SizedBox(
      height: 80,
      child: MaterialButton(
          color: Colors.blue,
          onPressed: () {
            final num = random.nextInt(11);
            final provider =
                Provider.of<CryptoProvider>(context, listen: false);
            provider.changeCrypto(num);
          },
          child: const Text(
            'Random number',
            style: TextStyle(color: Colors.white),
          )),
    ));
  }
}
