import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:ashton_jones_dev_website/styles/colors.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:enough_mail/media_type.dart';
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
  "private_key_id": "9ad750e52bcdedf776d9f1971fdcc3720796f66d",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCoFocKfZVJ/vQm\nzz7idT9NZw4irnEGNVwpCTX5z1VBkzauZ66QOdkLTWyR3ISkfxt2ga9Vdz/zYjbF\nYwtFxxAgMZsPBOTwCfBWr8kBy33nRy1euO3QbqZCEiVcNZTbRAGz/xO9qGvH9vCP\nSXnHRGp/6TS2vpzzJb/68pF6W+BIi3hOCTEvgvVT+CkLVKRq8BuSbrp4MpEvZZvD\nWMGXoig59GbmZAwd+Cdio4Yn6JA3dvCGRVyLY69LFf8DOBxF9tBhbet8sZu65gEA\nw7xVy8jVLMnKjGsD7USsudk1mMj8+772QIAYKpuE61DQkxMBfGJIIzkSAUcPH8w8\nb4ALVAVtAgMBAAECggEAB0LJ3JMmMscXpuGG9uNXs7FC9A6TBVCixYcHVN428Zk5\nYHlMGiDVll5m1TowZKa0+f6KI2f+VDYm5Ynsv7vkn29lIlX0ycW0Ixp+1VwD+Uyi\n0hes9jcBaZM9F+mcn4glhq/7G1M+LKonJBlpcEktTI83XrmHMB2uWFnIHQABBUEn\nJoE9FwSiNKcK1VFNHKzeUf9+x/UaIJGkO13bAJsWyn911pI2G9s/o5pn6Od/ldPw\nxpmnUTJn+1nFzgJhLKwy5oPwLJpVrzrytK/TmBa3xYNgYYq4Yxpbbxcd9a1eAYUC\njITJLKHlZwlkDZOdbk9PxTUE+uRUxfAEdjfGOzc6xQKBgQDYDacYdoxkWXv5R8vz\nxUo9jPqf0dONL6YG9YJaxca2+gnOg6GM8Tz90wwvP1lwxM1sBuQak9vNZHLghOSW\nhA61vo/ngfZtf+4ItVQhnM22Ymxy/zUt/47G6/vIVJtcDYKpu++kfzFM3mEXKoB2\nxjB74UeBjGMDYPfKIKnB24whpwKBgQDHKo4UuHIR5u4r7u1MAOQU7D2v0G4zJDYm\nTQ+b2+Lpdw3sBz4j1kALu7c2x1XWiK3NsePXo0cHoZKls8CPsyIbS4dqBeXtQJu9\nXnfO0QSYcNbGTHZC6SxvsjlnhuUJ7Xtthw72x0Qtj2jCSZhxMepSU0Eo1eO+L2Vf\nUV/hi266ywKBgB0/e+dr5QWQt5+/gHS3uJ0sgKEyHpl2Ydt/UO5I5+XNY5Z5a11R\nKxiRgYzD3q/NdKGzLR4L9i2P851BYFCf//3KlmCYz2tzbh3vrjv+pjqSiGvo8KIR\nfpqfR66PBZkomw+vSXnTXjExyaMBNfLeUaHzlWKMRrsmXWUXluOPfSDxAoGBAMLV\nJ16vvK80mIOT3MFAEd9B52qJXHRdFTfMpNtUdJrs40qlHy3Rlp+jx6wnvhn7ZQLW\n5ct6J68YaSv+Nv6cP14yOcsG8BFy5aePtWY1ZOh3YjNkc0AreFPgJnXXKVHX5qmT\nuJjDADgNlW6SrjT1noNgfFqlOoA/P0zKfyBV1UGXAoGBALTzCZFQK46lbyR8ypfj\n7oSWyijUb6o0CzNjIcFSJSCI3Mag+MlPs69VyudtESvLcI7HCw3OvJT7G1eYOpEs\nSGXsVXeA9US6CIRoFJvOXt0AZhQWz+4T30gqYWH3F1HGSw2FuSWgr+V1D/d05T17\n7bBxNvOHvr2COAMgSWLhlxIi\n-----END PRIVATE KEY-----\n",
  "client_email": "service-account-g-suite-ashton@midyear-pattern-286419.iam.gserviceaccount.com",
  "client_id": "115662093115400578040",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/service-account-g-suite-ashton%40midyear-pattern-286419.iam.gserviceaccount.com"
}
''');

  GmailApi _gmailApi;

  final scopes = [
    GmailApi.GmailComposeScope,
    GmailApi.GmailSendScope,
    GmailApi.GmailReadonlyScope
  ];

  @override
  void initState() {
    super.initState();

    print(
        'CREDENTIALS: Client ID: ${_credentials.clientId.toString()} | Client Secret: ${_credentials.privateKey}');

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
    } else {
      print('Form validation unsuccessful');
    }
  }

  showSubmissionDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: Text("Success!",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.green),
                textAlign: TextAlign.center),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('images/androidify.gif'),
                  Text("Thank you \b$_name\b! We\'ll be in touch soon!",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: 16, color: Colors.grey.shade700))
                ],
              ),
            ),
            actions: [
              FlatButton.icon(
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.check),
                  label: Text('OK'))
            ],
          );
        });
  }

  clearTextFields() {
    _nameController.clear();
    _subjectController.clear();
    _emailController.clear();
    _messageController.clear();
  }

  sendEmail() async {
    print('sendEmail');

    // Create a Mime Message and encode it using base64

    MessageBuilder messageBuilder = MessageBuilder();

    messageBuilder.from = [
      MailAddress('Ashton Jones', 'ashton@grapeworks.dev')
    ];

    messageBuilder.to = [MailAddress('Ashton Jones', 'ashtonjonesdev@gmail.com')];

    messageBuilder.subject = 'cool subject';

    messageBuilder.text = 'cool text';

    messageBuilder.encoding = MessageEncoding.base64;

    // Added Rfc822 encoding
    messageBuilder.contentType = ContentTypeHeader.from(MediaType.fromSubtype(MediaSubtype.messageRfc822));

    messageBuilder.messageId = '1';

    MimeMessage mimeMessage = messageBuilder.buildMimeMessage();


    // Ensure body is also encoded as base64 and Rfc822
    mimeMessage.body = BodyPart();
    mimeMessage.body.contentType = ContentTypeHeader.from(MediaType.fromSubtype(MediaSubtype.messageRfc822));
    mimeMessage.body.encoding = 'base64';

    // Create a Message object and set the 'raw' property to the encoded String
    Message message = Message();

    // TODO Need to set the 'raw' property as the entire encoded MimeMessage
    // TODO: Figure out if I need to encode the entire MimeMessage as a base 64 String here again (I already set the encoding of the MimeMessage to base64 on line 156)


    // Should return the entire encoded MimeMessage
    String encodedMimeMessage = mimeMessage.renderMessage();

    // Error happening here
    message.raw = encodedMimeMessage;

    print('Encoded message: ${message.raw}');

    // Send the email using the Gmail API 'send' method
    // TODO: When I run this, I get an 'invalid value at 'message.raw' (TYPE_BYTES), Base64 decoding failed' error
    Message messageCompleted =
        await _gmailApi.users.messages.send(message, 'me').catchError((error) {
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
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.grey.shade700),
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
                      autofillHints: [
                        AutofillHints.email,
                      ],
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
                      child: Text(
                        "SUBMIT",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.white),
                      ),
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
