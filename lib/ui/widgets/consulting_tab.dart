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
import 'package:http/http.dart' as http;

final identifier = new ClientId(
    "8151248460-b0fd644l1qmajedshf6bqde93d31ocs2.apps.googleusercontent.com",
    "nQLDj4Pd10mrjwdIA6UnfBNF");

final scopes = [GmailApi.GmailComposeScope, GmailApi.GmailSendScope];

Future authorizedClient(auth.ClientId id, scopes) {
  // Initializes the oauth2 browser flow, completes as soon as authentication
  // calls can be made.
  return auth.createImplicitBrowserFlow(id, scopes)
      .then((auth.BrowserOAuth2Flow flow) {
    // Try getting credentials without user consent.
    // This will succeed if the user already gave consent for this application.
    return flow.clientViaUserConsent(immediate: true).catchError((_) {
      // Ask the user for consent.
      //
      // Asking for consent will create a popup window where the user has to
      // authenticate with Google and authorize this application to access data
      // on it's behalf.
      //
      // Since most browsers block popup windows by default, we can only do this
      // inside an event handler (if a user action triggered a popup it will
      // usually not be blocked).
      // We use the loginButton for this.
      return flow.clientViaUserConsent(immediate: true);
    }, test: (error) => error is auth.UserConsentException);
  });
}


class ConsultingTab extends StatefulWidget {
  @override
  _ConsultingTabState createState() => _ConsultingTabState();
}

class _ConsultingTabState extends State<ConsultingTab> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   authorizedClient(identifier, scopes).then((client) {

     // Get the HTTP client from authorized client app credentials
     var gmailApi = new GmailApi(client);

     // Create a MimeMessage
     var builder = MessageBuilder.prepareMultipartAlternativeMessage();
     builder.from = [MailAddress('My name', 'guitarman76940@gmail.com')];
     builder.to = [MailAddress('Your name', 'ashtonjonesdev@gmail.com')];
     builder.subject = 'My first message';
     builder.addTextPlain('hello world.');
     var mimeMessage = builder.buildMimeMessage();


     /// Encode the MimeMessage as base64url string
     ///
     /// Encode MimeMessage into bytes
     ///
     var bytes = utf8.encode(mimeMessage.toString());
     var base64Str = base64.encode(bytes);

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
     Message message = Message();

     message.raw = base64Str;

     var request = gmailApi.users.messages.send(message, 'ashtonjonesdev@gmail.com').catchError((error) => print(error));






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
