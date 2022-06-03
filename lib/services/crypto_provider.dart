import 'package:flutter/material.dart';
import 'package:state_management_bloc/models/crypto_model.dart';

//************************************************************
// CryptoProvider class
// Author: Miguel Fagundez
// Date: June, 01 2022
// This is a basic class for handling our crypto provider
//************************************************************
class CryptoProvider with ChangeNotifier {
  CryptoModel _cryptoModel = CryptoModel(
      cryptoName: '', cryptoSlug: '', cryptoImage: 'assets/question-mark.png');
  bool _hasPushed = false;
  int randomNumber = 0;
  List<CryptoModel> listCryptos = initListOfCryptos();

  // Getters & Setters
  CryptoModel get getCrypto => _cryptoModel;
  bool get getHasPushed => _hasPushed;

  void changeCrypto(int position) {
    _cryptoModel = listCryptos[position];
    randomNumber = position;

    if (!_hasPushed) {
      _hasPushed = true;
    }
    notifyListeners();
  }
}

List<CryptoModel> initListOfCryptos() {
  return [
    CryptoModel(
        cryptoName: 'Bitcoin',
        cryptoSlug: 'BTC',
        cryptoImage: 'assets/bitcoin.png'),
    CryptoModel(
        cryptoName: 'Ethereum',
        cryptoSlug: 'ETH',
        cryptoImage: 'assets/ethereum.png'),
    CryptoModel(
        cryptoName: 'Cardano',
        cryptoSlug: 'ADA',
        cryptoImage: 'assets/cardano.png'),
    CryptoModel(
        cryptoName: 'Coti', cryptoSlug: 'COTI', cryptoImage: 'assets/coti.png'),
    CryptoModel(
        cryptoName: 'Crypto.com',
        cryptoSlug: 'CRO',
        cryptoImage: 'assets/crypto-com.png'),
    CryptoModel(
        cryptoName: 'Decentraland',
        cryptoSlug: 'MANA',
        cryptoImage: 'assets/decentraland.png'),
    CryptoModel(
        cryptoName: 'Dogecoin',
        cryptoSlug: 'DOGE',
        cryptoImage: 'assets/dogecoin.png'),
    CryptoModel(
        cryptoName: 'Fantom',
        cryptoSlug: 'FTM',
        cryptoImage: 'assets/fantom.png'),
    CryptoModel(
        cryptoName: 'Shiba-Inu',
        cryptoSlug: 'SHIB',
        cryptoImage: 'assets/shiba-inu.png'),
    CryptoModel(
        cryptoName: 'Solana',
        cryptoSlug: 'SOL',
        cryptoImage: 'assets/solana.png'),
    CryptoModel(
        cryptoName: 'Tether',
        cryptoSlug: 'USDT',
        cryptoImage: 'assets/tether.png'),
  ];
}
