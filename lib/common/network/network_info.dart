


import 'dart:io';

abstract class INetworkInfo{
  Future<bool> get isConnected;
}

class NetworkInfo implements INetworkInfo{
  @override
  Future<bool> get isConnected async{
   try{
     await InternetAddress.lookup('www.google.com');
     return true;
   }on SocketException{
     return false;
   }
  }
}