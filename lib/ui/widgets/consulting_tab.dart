import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:ashton_jones_dev_website/styles/colors.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:enough_mail/message_builder.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/drive/v2.dart';
import 'package:googleapis/gmail/v1.dart';
import 'package:googleapis_auth/auth.dart';
import 'package:googleapis_auth/auth_browser.dart' as auth;
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;




class ConsultingTab extends StatefulWidget {
  @override
  _ConsultingTabState createState() => _ConsultingTabState();
}

class _ConsultingTabState extends State<ConsultingTab> {

  // Service account credentials
  final _credentials = new ServiceAccountCredentials.fromJson(r'''
{
  "type": "service_account",
  "project_id": "midyear-pattern-286419",
  "private_key_id": "4c513d1d895aa754e0876faf571ecd3fd4493698",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCsGL9vd9GNUzg9\nB2Ni1bmERtDAOxeYEzcXstjPyj34uCxzDy37M/kQQe1WHqCXx3BzDlLGOTdPCBVy\nPMZPhk/WxlLXhscealctvzB0dzvZKVUVLzWOhACooRJV19W4cjVC0+1ICnysLeJP\nQmjrnjPmWf7XOiFSBzG4zNF2j2Fh1HD8tRG3171mhON/cuCkw+F+23DclqqRCEo+\nAk9/UfajguKw5GDyCOpDnYp5obJb/6VzZY9OrNhjcktViLuTqOUBdG3z9o6Pyhz7\no3kjSdO1ycqABE+efu2gcSo2okdOlRT81AZTwag+IDrjErxjOGZoXZhwn4IMlnhU\nE+LGX3CPAgMBAAECggEAGGNWwwMl18iSpa4QWtySx7i0CH8snskfpjoaw4eTigBU\n5uagdi2CqYJ45xq8A1uosdq2cY+A07BU6bV3HPnvAoQPD//yOSXfaNo5PFKmppBW\n6wOfrAHviKDFf74bHrerQzx+hGuys0EQBc9myE0eabxt2C5NXoR/0AJ72eNZF4sk\nrNWBJ4lz7/K81JZzMfQjOFW0cI8tJKPtJXsVyXIIn/w0jIarkcebxXE7SGkHUTl6\n3vfNNcRO1VhCKDRyauXq+m2g7bRDug2Yy3wVkYVV8oWMpqVCI/zq0cMAHqfd4Pd8\nhxnCTCSML6K8ZFlMmD8dpzrzlx8rb72nth/CCQvXcQKBgQDZ9ZHh8OfiqiXj5+y8\nzRY29/vR3i2/qgFuNbDRsJSx7DUS9ZBLQ4Fxkgfo6qdsTkid/ZaHUA0SZehIUjOM\nkMvwK6vtb6nZ08GrhB0vMLwMlTCOtE5xhaHoN0QF9oxUXLO1dTE/3ktgCkdgg4PJ\nKRzcPDlyDjYGYtYeuxeGaX8AiwKBgQDKIgkOTbXReOlZsOcw7wQq7WM/VoQthYLZ\npDwVumIjdFYVnW7yvG0KVWGkmbgbsHOkA4bFUalUtc4EizoijT7jEvWiLqIdw7ug\nGC67zKfGzO1F0uXmXmzZMnmggHoC8ixq3sStfPkX/xmg75TzlrH9N3/cmgQfWjBQ\nO1YklkTsjQKBgQCuiPdI9qC54YZ1+kKY7aHcYrhEVqZL1NdQaa4uPDjWQVA+3mWt\n32DIkSfEXCO1lvqPiYIA2Rmeofxf7XNaHJkyucXzXHem9usfbavxHhV3/f/kRn6K\naXg9fAP8wnGdHJ7LsAzAGEJDpfeCUc42R7XUpmVZ8AdTFdJgyXENMW2CAQKBgQC4\n/NEg4AnH/UpCJV5QME62Iq8z5i/toUSRfnbmw77RB8VI3t4NFFkOnflQtMYDwUb0\nEa4jo4q+1ewHyIuZ1354Pn/Cv77qUpnB+J+8i534mM+FmW+Bl2UymbkqJKqFS7FO\n1TVWOQuW5IZF/T1qeL3IKiTAdcvUDawtoUBDF6tYeQKBgEqA8KAVin0Sm1kKGCUg\nmzW9/G53TcTsMFPMGUMcZ+h7+ijGRJM5B+b65qUw/L3aDcW9qkXKNCXX1kULmpLk\nbzi7frDb8r/7m9KxCy6cLtxeeZ5CD1oOc+NTqcjcFxk2JNxYdPq5FZAFZyAkk1fr\nXhe5+pc5zc2njCxExF56kU9N\n-----END PRIVATE KEY-----\n",
  "client_email": "oauth-service-ashton-jones-dev@midyear-pattern-286419.iam.gserviceaccount.com",
  "client_id": "104665520010538800871",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/oauth-service-ashton-jones-dev%40midyear-pattern-286419.iam.gserviceaccount.com"
}
''', impersonatedUser: 'ashton@grapeworks.dev');

  GmailApi _gmailApi;

  final scopes = [GmailApi.GmailComposeScope, GmailApi.GmailSendScope, GmailApi.GmailReadonlyScope];


  @override
  void initState() {
    super.initState();

    print('CREDENTIALS: Client ID: ${_credentials.clientId.toString()} | Client Secret: ${_credentials.privateKey}');

    // Authenticate the credentials with the service account and use them to initialize the GmailAPI
    clientViaServiceAccount(_credentials, scopes).then((AuthClient httpClient) {
      _gmailApi = GmailApi(httpClient);

      print('Users: ${_gmailApi.users}');

    });





  }

  final _consultingFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyHome = GlobalKey<ScaffoldState>();


  String _name;
  String _email;
  String _subject;
  String _message;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();




  validateAndSendEmail() {
    final form = _consultingFormKey.currentState;
    form.save();
    // Validate information was correctly entered
    if (form.validate()) {

      _consultingFormKey.currentState.save();
      print('Form was successfully validated');
      print(
          'Sending email data: Name: $_name | Email: $_email Subject: | $_subject Message: $_message');
      //  TODO: Send email with form data
      sendEmail();
      showSubmissionDialog();
      clearTextFields();

    }

    else {
      print('Form validation unsuccessful');
    }
  }

   showSubmissionDialog() {

     showDialog(
         context: context,
         builder: (BuildContext context){
           return AlertDialog(
             shape:
             RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
             title: Text("Success!", style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.green), textAlign: TextAlign.center),
             content: SingleChildScrollView(
               child: Column(
                 children: [
                   Image.asset('images/androidify.gif'),
                   Text("Thank you \b$_name\b! We\'ll be in touch soon!", style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16, color: Colors.grey.shade700))
                 ],
               ),
             ),
             actions: [
               FlatButton.icon(color: kPrimaryColor,onPressed: () {Navigator.of(context).pop();}, icon: Icon(Icons.check), label: Text('OK'))
             ],
           );
         }
     );
   }

   clearTextFields() {

    _nameController.clear();
    _subjectController.clear();
    _emailController.clear();
    _messageController.clear();

   }

   sendEmail()  async {

    print('sendEmail');

    // Create a MimeMessage
    MimeMessage mimeMessage = MessageBuilder.buildSimpleTextMessage(MailAddress('Ashton Jones', 'guitarman76940v@gmail.com'), [MailAddress('Ashton Jones', 'ashtonjonesdev@gmail.com')], 'hello', subject: 'cool subject', messageId: '23423748273492');

    print(mimeMessage);

    // Encode the MimeMessage to base64String
    Uint8List asciiCodec = AsciiCodec().encode(mimeMessage.bodyRaw);

    String encodedMessage = base64Encode(asciiCodec);


    // Create a Message object and set the 'raw' property to the encoded String

    Message message = Message();


    message.raw = encodedMessage;

    message.id = '234823423';

    print('Encoded message: ${message.raw}');

    //
//
    Message messageCompleted = await _gmailApi.users.messages.send(message, 'ashton@grapeworks.dev').catchError(( error) {
      print(error);
    });

    print(messageCompleted);





   }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _consultingFormKey,
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(58.0),
            child: Material(
              borderRadius: BorderRadius.circular(16),
              elevation: 16,
              child: Column(
                children: [
                  SizedBox(height: 40.0),
                  Text(
                    'Work with me',
                    style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.grey.shade700),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: TextFormField(
                      autofillHints: [AutofillHints.name],
                      style: Theme.of(context).textTheme.bodyText1,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: "Name"),
                      onSaved: (value) => _name = value,
                      controller: _nameController,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: TextFormField(
                      autofillHints: [AutofillHints.email,],
                      style: Theme.of(context).textTheme.bodyText1,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter an email';
                        }
                        if (!value.contains('@') || !value.contains('.')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: "Email"),
                      onSaved: (value) => _email = value,
                      controller: _emailController,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: TextFormField(
                      style: Theme.of(context).textTheme.bodyText1,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter a subject';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: "Subject"),
                      onSaved: (value) => _subject = value,
                      controller: _subjectController,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: TextFormField(
                      style: Theme.of(context).textTheme.bodyText1,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter a message';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: "Message"),
                      onSaved: (value) => _message = value,
                      controller: _messageController,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Material(
                    borderRadius: BorderRadius.circular(30.0),
                    color: kPrimaryColor,
                    child: MaterialButton(
                      minWidth: 400,
                      child: Text("SUBMIT", style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),),
                      onPressed: validateAndSendEmail,
                    ),
                  ),
                  SizedBox(height: 40.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
