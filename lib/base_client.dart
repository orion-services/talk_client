/// Copyright 2020 Orion Services
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
/// http://www.apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
///  limitations under the License.
class BaseClient {
  /// the host of the service
  String host;

  /// the port of the service
  String talkPort;

  /// the port of the users service
  String usersPort;

  /// the name of the talk app
  String talkApp;

  /// The name of the user app
  String usersApp;

  /// the service endpoint name
  String talkEndpoint;

  /// the service endpoint name
  String usersEndpoint;

  /// the socket endpoint name
  String talkSocketEndpoint;

  /// the api version
  String api;

  /// the result url for talk service
  String talkWsURL;

  /// the result url for users service
  String usersWsURL;

  /// the result url for the Web Socket
  String talkSocketURL;

  /// the token of a talk channel
  String token;

  /// [bool enableSecurity] indicates if will be used a secure protocol
  /// and [bool devMode] changes the URL of remove for development mode
  BaseClient(bool enableSecurity, bool devMode) {
    talkApp = 'orion-talk-service';
    usersApp = 'orion-users-service';
    host = 'localhost';
    talkPort = '9081';
    usersPort = '9080';
    talkEndpoint = 'talk';
    usersEndpoint = 'users';
    talkSocketEndpoint = 'talkws';
    api = 'api/v1';

    changeServiceURL(enableSecurity, devMode, host, talkPort);
  }

  void changeServiceURL(
      bool enableSecurity, bool devMode, String newHost, String newPort) {
    host = newHost;
    talkPort = newPort;
    _enableSecurityProtocol(enableSecurity);
    _enableDevMode(devMode);
  }

  void _enableSecurityProtocol(bool enableSecurity) {
    if (enableSecurity) {
      talkWsURL = 'https://';
      usersWsURL = 'https://';
      talkSocketURL = 'wss://';
    } else {
      talkWsURL = 'http://';
      usersWsURL = 'http://';
      talkSocketURL = 'ws://';
    }
  }

  /// cuts the app name from the url to enable dev mode
  void _enableDevMode(bool devMode) {
    var talkBaseURL = host + ':' + talkPort;
    var usersBaseURL = host + ':' + usersPort;

    // In dev mode isn't necessary to append the application name
    if (devMode) {
      // Talk service URL
      talkWsURL =
          talkWsURL + talkBaseURL + '/' + talkEndpoint + '/' + api + '/';

      // Users service URL
      usersWsURL =
          usersWsURL + usersBaseURL + '/' + usersEndpoint + '/' + api + '/';

      // Talk Web Socket URL
      talkSocketURL =
          talkSocketURL + talkBaseURL + '/' + talkSocketEndpoint + '/';
    } else {
      // Talk service URL
      talkWsURL = talkWsURL +
          talkBaseURL +
          '/' +
          talkApp +
          '/' +
          talkEndpoint +
          '/' +
          api +
          '/';

      // Users service URL
      usersWsURL = usersWsURL +
          usersBaseURL +
          '/' +
          usersApp +
          '/' +
          usersEndpoint +
          '/' +
          api +
          '/';

      // Talk Web Socket URL
      talkSocketURL = talkSocketURL +
          talkBaseURL +
          '/' +
          talkApp +
          '/' +
          talkSocketEndpoint +
          '/';
    }
  }
}
