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
  "project_id": "ashton-jones-dev-website",
  "private_key_id": "9cf385141ecab9b43bb35f50d9b910a5c8fc094a",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCQjA4DCVyDCa/h\nedxGwESWRuJxXPxnyB/IqokpD7CCIosGLzyiVzcMHo8QpoT72fgk5/fxiZsgG0g9\nMC3MI54tpl8pYtmp1ubrzdtgcGkF1xy7nOl2nb75AYaKP4QpPfDY2QV6lQGzsGKT\nYw7VuLXxu7OQYb7le1zTFslfswFmSbPQoqeun2iGBlh2QDZPanQ2hcn34LC5zuyi\n8cITXf1Pt/AHu2jtaYrHLcalyS3QV9HlHF3xw2SP2MOvh1Om/jFgipjLmTXW2LTb\nMUk3RExB+S5XN6uuA3Yzo86lt/rvfdxeaKuyo+AcNoXE4h20GRnU4iEEAXvvfguG\nCa30j8wnAgMBAAECggEALokYfbvGz90PhazA0PpXWnYpsst360WPjf/xNon5jnvm\nfDA6+hzP+RPhhT/G8nojHGad+WIO0hBWenSHWgBhjVrRqjZL0xT/tQzKQssN1LaD\nZpdGxkxUzj/Ce8GlH830OyvrSqKsMJhps/+hKAdWdCO01JfTaHgF02Ozox6zJaW6\n0aq4o8obKZGoGfNSVv2090AXNypdDhy/mTqseZhYvk++AcRWCCO8us0NhzdZpBjh\nuDetQ0VE58AnlsK8AN4tVhwZJnWVeesVnmp/u8/GX/KD1Co3lfDGOfdkmeKcoU+j\nsf+KwdUlw7D0BSF4rOxyHjK/eEJOCv1HCpXWlkc+qQKBgQDHJQe2NsYqvvOoY1Db\nADM4b5T0rx5pf9up3tPR04Z0RWKcwidARGLzDdYgT9XeucWmVtFwa4rcfhTe6nPu\nbFB3QkhgdEL3wGtLScFjflk0U7QYf6HkWxgpkOhv/zkcMI/Rzl4bYNr9Obwb5rWq\nPijdKp4KrvPZB2uUrUYK6v1yHQKBgQC50KEjvgS3Jpad7WbRQNM7R7kAlbN8Lq5J\nYQVrs8PytpVilwZ4B8b92vp8iIkYkWPJbs1RfbJiRiTSf4YeUKZY9qy18CWHOI0u\n0ylgfsT+I4Yu3WV3iJemiMV1LbGwrTx7mcTvEE11lw+oBo8xqDq4/8VSonEpdgPz\n1VHfiFFkEwKBgDXFqe9pmtiv9trg9lQsGaiDeJUZM/0IqSeVI1zk4MlEcvwg8LhJ\nvu4iLk9LP1SElPn1N1hDsZsX8ErAw8z9Mj0BiMmCmxKKwm3x3GYhF7UpZNe4nt4q\nOrv+hMS5BZK3Ch58uqxp2rfFfyWJhkQRxLbzavk3hGB1wHbE0sTf7s+BAoGBAJwF\nn1h4tFLpNuzyqzOnP/Z1udTQ3n22YKfCrJ+LuUuynerDry3YMfF0DoHEz4Dui6BW\nxlXXupIkHcUWSRJpW9Q1hD3coFZTWNDpg8O/jj9qqr/tLMbazaOLEmna7WnRfIi4\nTBEEWlYTepT2tQPYIz61nQVO2sAalSUHiJCuUNE7AoGACeBN6JS1fBCjyLhT/GNY\nxz/lyvZcAec4nscb3COZfylSVKvb3K8QFuD3xr+Y3QuMgjyVloATmTBadk+qn0a0\nGDjRwoRA0mzX8a+1PnX7CU7FEzJGhIqUQADxDVOfs+CutvGi58vgy2PDfC6DvnCp\nFlbNo4OQ+8qbHfoMMJsV01A=\n-----END PRIVATE KEY-----\n",
  "client_email": "oauth-service-ashton-jones-dev@ashton-jones-dev-website.iam.gserviceaccount.com",
  "client_id": "108668530476668501164",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/oauth-service-ashton-jones-dev%40ashton-jones-dev-website.iam.gserviceaccount.com"
}
''');

  GmailApi _gmailApi;

  final scopes = [GmailApi.GmailComposeScope, GmailApi.GmailSendScope, GmailApi.GmailReadonlyScope];


  @override
  void initState() {
    super.initState();

    print('CREDENTIALS: Client ID: ${_credentials.clientId} | Client Secret: ${_credentials.privateKey}');

    // Authenticate the credentials with the service account and use them to initialize the GmailAPI
    clientViaServiceAccount(_credentials, scopes).then((http_client) {
      _gmailApi = GmailApi(http_client, servicePath: 'gmail/v1/users/');
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

    var mimeMessageBuilder = MessageBuilder(text: 'hello there');

    mimeMessage.to = [MailAddress('Ashton Jones', 'guitarman76940@gmail.com')];

    mimeMessageBuilder.from = [MailAddress('Ashton Jones', 'ashtonjonesdev@gmail.com')];

    mimeMessageBuilder.subject = "cool subject";

    MimeMessage mimeMessage2 = mimeMessageBuilder.buildMimeMessage();

    // Encode the MimeMessage to base64String
    Uint8List asciiCodec = AsciiCodec().encode(mimeMessage2.bodyRaw);

    String encodedMessage = base64Encode(asciiCodec);


    // Create a Message object and set the 'raw' property to the encoded String

    Message message = Message();


    message.raw = encodedMessage;

    message.id = '234823423';

    print('Encoded message: ${message.raw}');

    // Send the message using the GmailAPI
    Message messageCompleted = await _gmailApi.users.messages.send(message, 'me', uploadOptions: UploadOptions.Default).catchError(( error) {
      print(error);
    });







     /// Encode the MimeMessage as base64url string
     ///
     /// Encode MimeMessage into bytes
     ///
//     var bytes = utf8.encode(mimeMessage.toString());
//
//     var messageByteString = MailCodec.base64.encodeData(bytes);
//
//     var base64Str = base64.encode(bytes);

     /// Create byte stream
//     var encodedString = utf8.encode(mimeMessage);
//     var encodedLength = encodedString.length;
//     var data = ByteData(encodedLength + 4);
//     data.setUint32(0, encodedLength, Endian.big);
//     var bytes = data.buffer.asUint8List();
//     bytes.setRange(4, encodedLength + 4, encodedString);
//     return bytes;

//
//     String encodedEmail = Base64Encoder().convert([bytes]);
//
//     Message message = Message();
//
//     message.raw = mimeMessage.
//     Message message = Message();
//
//     message.raw = messageByteString;
//
//     var request = gmailApi.users.messages.send(message, 'ashtonjonesdev@gmail.com').catchError((error) => print(error));
//
//
//
//
//
//
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
