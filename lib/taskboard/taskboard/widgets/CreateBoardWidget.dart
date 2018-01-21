import 'package:flutter/material.dart';
import 'package:taskr_flutter/taskboard/taskboard/TaskBoardContract.dart';

class CreateBoardWidget extends StatelessWidget {

  final TaskBoardViewContract view;
  String title, description, secret, publicId;

  CreateBoardWidget({this.view});


  @override
  Widget build(BuildContext context) {
    TextEditingController titleInputController = new TextEditingController();
    TextEditingController descriptionInputController = new TextEditingController();
    TextEditingController secretInputController = new TextEditingController();
    TextEditingController publicKeyController = new TextEditingController();
    InputDecoration titleDecoration = new InputDecoration(
      icon: new Icon(Icons.title),
      hintText: 'Title of your board',
      labelText: 'title',
    );
    InputDecoration descriptionDecoration = new InputDecoration(
      icon: new Icon(Icons.description),
      hintText: 'Description',
      labelText: 'description',
    );
    InputDecoration publicKeyDecoration = new InputDecoration(
      icon: new Icon(Icons.lock),
      hintText: 'Public Key',
      labelText: 'public key',
    );
    InputDecoration secretDecoration = new InputDecoration(
      icon: new Icon(Icons.security),
      hintText: 'Secret',
      labelText: 'secret',
    );

    titleInputController.addListener(() {
      this.title = titleInputController.text;
      print('Updating title');
    });
    descriptionInputController.addListener(() {
      this.description = descriptionInputController.text;
      print('Updating description');
    });
    secretInputController.addListener(() {
      this.secret = secretInputController.text;
      print('Updating secret');
    });
    publicKeyController.addListener(() {
      this.publicId = publicKeyController.text;
      print('Updating public key');
    });

    return new Container(
      padding: new EdgeInsets.all(8.0),
      child: new Column(
        children: <Widget>[
          new Text("Create a new Board!"),
          new Padding(padding: new EdgeInsets.only(top: 16.0),
            child: new Column(
              children: <Widget>[
                new TextField(controller: titleInputController,
                  decoration: titleDecoration,),
                new TextField(controller: descriptionInputController,
                  decoration: descriptionDecoration,),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new TextField(
                      controller: secretInputController,
                      decoration: secretDecoration,),
                    new TextField(
                      controller: publicKeyController,
                      decoration: publicKeyDecoration,)
                  ],
                ),
                new FlatButton(onPressed: () {
                  view.createTask(title, description, secret: secret,
                      publicId: publicId);
                  print('Creating Task');
                }, child: new Text('Create'))
              ],
            ),)
        ],
      ),

    );
  }
}