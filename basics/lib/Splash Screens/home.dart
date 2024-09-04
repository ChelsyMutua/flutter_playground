// material has all the defined widgets
import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//Define a var an instance for editing controller
var fName = TextEditingController();
  @override
  Widget build(BuildContext context) {
  //A scaffold template - make the app look nice
    return Scaffold(  
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Column(
        children: [ 
        const Text("Hello World!"),
        TextField(
        //The comma is for incase you wanna add other vars
        controller: fName ,),
        const SizedBox(
          height: 20,
        ),
        //A button => floating and elevated btn
        //Curly logic
        //Const bc it doesn't change state
        ElevatedButton(onPressed: (){}, child: const Text("Click me"))
        
        
        
        ],
        ),
      )
    );
    
  }
}
