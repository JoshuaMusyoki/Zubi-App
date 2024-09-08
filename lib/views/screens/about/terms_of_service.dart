import 'package:flutter/material.dart';

class TermsOfService extends StatefulWidget {
  const TermsOfService({super.key});

  @override
  State<TermsOfService> createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms of Service"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
            onPressed: (){
            Navigator.pop(context);
            },
        ),
      ),
      body: const Padding(
          padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            '''
            There are many variations of passages of Lorem Ipsum available, 
            but the majority have suffered alteration in some form, by injected humour, 
            or randomised words which don't look even slightly believable. 
            If you are going to use a passage of Lorem Ipsum, you need to be sure 
            there isn't anything embarrassing hidden in the middle of text. 
            All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary,
             making this the first true generator on the Internet. 
             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures,
              to generate Lorem Ipsum which looks reasonable.
              The generated Lorem Ipsum is therefore always free from repetition, injected humour, 
              or non-characteristic words etc.
              
              There are many variations of passages of Lorem Ipsum available, but the majority have 
              suffered alteration in some form, by injected humour, or randomised words which don't
               look even slightly believable. If you are going to use a passage of Lorem Ipsum, 
               you need to be sure there isn't anything embarrassing hidden in the middle of text. 
               All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary,
                making this the first true generator on the Internet. It uses a dictionary of over 200 Latin
                 words, combined with a handful of model sentence structures, to generate Lorem Ipsum 
                 which looks reasonable. The generated Lorem Ipsum is therefore .
            '''
          ),
        ),
      ),
    );
  }
}
