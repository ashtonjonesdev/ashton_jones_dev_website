import 'package:ashton_jones_dev_website/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ConsultingTab extends StatefulWidget {
  @override
  _ConsultingTabState createState() => _ConsultingTabState();
}

class _ConsultingTabState extends State<ConsultingTab> {

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
     Map<String, String> headers = new Map();
     headers["Authorization"] =
     "Bearer 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 ";
     headers["Content-Type"] = "application/json";


     var url = 'https://api.sendgrid.com/v3/mail/send';
     var response = await http.post(url,
         headers: headers,
         body: '{"personalizations": [{"to": [{"email": "descxcrs@gmail.com"}]}],"from": {"email": "ashtonjonesdev@gmail.com"},"subject": "Hello, World!","content": [{"type": "text/plain", "value": "Heya!"}]}');
     print('Response status: ${response.statusCode}');
     print('Response body: ${response.body}');

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
