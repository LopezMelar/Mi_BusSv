import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';


class RegisterPage extends StatelessWidget {

    RegisterController regcon = Get.put(RegisterController());




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(  //stack es para posicionar uno encima de otro
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _imageuser(),
         _buttonBack()
        ],
      )
    );
  }





  Widget _backgroundCover(BuildContext context){
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      color: Colors.yellow,

    );
  }


  Widget _imageuser(){
    return SafeArea(
      child: Container(
        
        margin: EdgeInsets.only(top: 20),
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: (){},
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,

            child: Container(
              child: SizedBox(
                width: 60,
                height: 60,
                child: Image.asset('assets/images/useradd.png', fit: BoxFit.cover),
              ),
            ),
            
          ),
        ),
      ),
    );
  }



  Widget _textYourInfo(){
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 30),
      child: Text('Crea tu cuenta ahora!',
        style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black38, fontSize: 20),
      ));
  }



    Widget _textFieldName(){
      return Container(
        margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
        child:  TextField(
          controller: regcon.nameController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Nombre',
            prefixIcon: Icon(Icons.person)
          ),
        ),
      );

    }

    Widget _textFieldLastName(){
      return Container(
        margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
        child: TextField(
          controller: regcon.lastNameController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Apellido',
            prefixIcon: Icon(Icons.perm_identity)
          ),
        ),
      );
    }


    Widget _textFieldTel(){
      return Container(
        margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
        child:  TextField(
          controller: regcon.telController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: 'Telefono',
            prefixIcon: Icon(Icons.call),
          ),
        ),
      );
    }







   Widget _textFieldEmail(){
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
      child: TextField(
        controller: regcon.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'correo electronico',
          prefixIcon: Icon(Icons.email)
        ),
      ),
    );
  }



  Widget _textFieldPassword(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: regcon.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'contraseña',
            prefixIcon: Icon(Icons.password)
        ),
      ),
    );
  }


  Widget _TextFieldConfirmPassword(){

    return Container(
      margin: EdgeInsets.only(left: 40, right: 40, top: 15),
      child: TextField(
        controller: regcon.passwordConfirmController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Confirma tu contraseña',
          prefixIcon: Icon(Icons.security),
        ),
      )
    );

  }



  Widget _buttonRegister(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 35),
      child: ElevatedButton(
          onPressed: () => regcon.register() , 
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15), backgroundColor: Colors.purple,

          ),
          child: Text("Registrarse", style: TextStyle(color: Colors.white),)
      ),
    );
  }




Widget _buttonBack(){
  return SafeArea(
    child: Container(
      margin: EdgeInsets.only(left: 20, top: 20),
      child: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30,),
        ),
    ) 
  
  );
}





  Widget _boxForm(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height * 0.70,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.22, left: 50, right: 50),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black54,
          blurRadius: 15,
          offset: Offset(0, 0.75)
        )
      ]),
      child: SingleChildScrollView(
        child: Column(
          children: [
              _textYourInfo(),
              _textFieldName(),
              _textFieldLastName(),
              _textFieldEmail(),
              _textFieldTel(),
              _textFieldPassword(),
              _TextFieldConfirmPassword(),
              _buttonRegister()
          ],
        ),
      ),
    );
  }






}