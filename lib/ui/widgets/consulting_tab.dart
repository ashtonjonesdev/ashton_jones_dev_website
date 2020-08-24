import 'dart:html';

import 'package:ashton_jones_dev_website/core/utils/ComputerProgrammerController.dart';
import 'package:ashton_jones_dev_website/styles/colors.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class ConsultingTab extends StatefulWidget {
  @override
  _ConsultingTabState createState() => _ConsultingTabState();
}

class _ConsultingTabState extends State<ConsultingTab> {

  ComputerProgrammerController _computerProgrammerController;


  @override
  void initState() {
    _computerProgrammerController = ComputerProgrammerController();
    super.initState();
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


  // Send email using mail_to and url_launcher packages
  sendEmail() async {

    print('sendEmail');

    final mailtoLink = Mailto(
      to: ['ashtonjonesdev@gmail.com'],
      subject: '$_subject',
      body: '$_message',
    );
    // Convert the Mailto instance into a string.
    // Use either Dart's string interpolation
    // or the toString() method.
    await launch('$mailtoLink');

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
                  Container(
                      height: 200,
                      padding: const EdgeInsets.only(left: 30.0, right:30.0),
                      child: FlareActor(
                        "assets/computer_programmer.flr",
                        shouldClip: false,
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.contain,
                        controller: _computerProgrammerController,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
