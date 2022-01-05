import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:obracalc/view/homescreen.dart';
import 'package:obracalc/view/menuprincipal.dart';
import 'package:obracalc/view/telalogin.dart';


class telaBiometria extends StatefulWidget {
  const telaBiometria({Key? key}) : super(key: key);

  @override
  State<telaBiometria> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<telaBiometria> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  @override
  initState(){
    super.initState();
    authenticate();
  }

  authenticate() async {
    if(await _isBiometriaAvailable()){
      await _getListOfBiometricTypes();
      await _authenticateUser();
    }
  }

  Future<bool> _isBiometriaAvailable() async{
    try {
      bool isAvailable = await _localAuthentication.canCheckBiometrics;
      return isAvailable;
    } catch(ex){
      return false;
    }
  }

  Future<void> _getListOfBiometricTypes() async{
    List<BiometricType> listOfBiometrics =
    await _localAuthentication.getAvailableBiometrics();
  }

  Future<void> _authenticateUser()async {
    bool isAuthenticated =
    await _localAuthentication.authenticateWithBiometrics(
      localizedReason: "Use sua impressão digital.",
      stickyAuth: true,
    );
    if (isAuthenticated){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false
      );
    }else{
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => telaLogin()),
              (Route<dynamic> route) => false
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //appBar: AppBar(title: Text('Biometria'),),
    );
  }
}