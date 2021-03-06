
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_akwen/app/global/components/img_background.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_akwen/app/global/utils/schemas.dart';
import 'package:flutter_akwen/app/global/utils/translation/translation_store.dart';
import 'package:flutter_akwen/app/modulos/home/home_module.dart';
import 'package:flutter_akwen/app/modulos/registration/components/inputs_decorations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_akwen/app/modulos/registration/registration_store.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:mobx/mobx.dart';

class RegistrationPage extends StatefulWidget {
  final String title;
  const RegistrationPage({Key? key, this.title = 'RegistrationPage'})
      : super(key: key);
  @override
  RegistrationPageState createState() => RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage> {
  final RegistrationStore store = Modular.get();
  Services service = Modular.get();
  final TranslationStore translationStore = Modular.get();
  

  bool _isLogging = false;

  List<ReactionDisposer> disposers = [];

  @override
  void initState(){
    disposers = [
      reaction(
        (_) => store.registered == true, 
        (_) => Modular.to.navigate(HomeModule.routeName)
      ),
      reaction(
        (_) => store.usernameExist == true, 
        (_) => Flushbar(
          title: 'Error',
          message: 'Username já está cadastrado!',
          mainButton: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ).show(context)
      ),
      reaction(
        (_) => store.errorMessage.isNotEmpty, 
        (_) => Flushbar(
          title: 'Error',
          message: store.errorMessage,
          mainButton: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ).show(context)
      ),
      reaction(
        (_) => store.errorMessage.isNotEmpty || store.usernameExist == true, 
        (_) => setState(() {
          _isLogging = false;
        })
      )
    ];
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }
  
  final FocusScopeNode _node = FocusScopeNode();
  final _formKey = GlobalKey<FormState>();

  @override 
  void dispose(){
    _node.dispose();
    store.dispose();
    for(var element in disposers){
      element.call();
    }
    super.dispose();
  }

  String wordTranslated(String word){
    if(translationStore.translation == 'PT-BR'){
      switch(word){
        case 'cadastro':
          return translationStore.cadastroPTBR;
        case 'accountStudentNotEmail':
          return translationStore.accountStudentNotEmailPTBR;
        case 'accountStudent':
          return translationStore.accountStudentPTBR;
        case 'name':
          return translationStore.namePTBR;
        case 'password':
          return translationStore.passwordPTBR;
        case 'confirmPassword':
          return translationStore.confirmPasswordPTBR;
        case 'register':
          return translationStore.resgisterPTBR;
      }
    } else {
      switch(word){
        case 'cadastro':
          return translationStore.cadastroAkwe;
        case 'accountStudentNotEmail':
          return translationStore.accountStudentNotEmailAkwe;
        case 'accountStudent':
          return translationStore.accountStudentAkwe;
        case 'name':
          return translationStore.nameAkwe;
        case 'password':
          return translationStore.passwordAkwe;
        case 'confirmPassword':
          return translationStore.confirmPasswordAkwe;
        case 'register':
          return translationStore.resgisterAkwe;
      }
    }
    return word;
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(wordTranslated('cadastro'), 
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 30,),
          onPressed: () => Modular.to.navigate('/login'),
        ),
        elevation: 0,
        backgroundColor: blueColor,
      ),

      resizeToAvoidBottomInset: false,

      body: SingleChildScrollView(
        reverse: true,
        child: ImgBackground(
          height: false,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Form(
              key: _formKey,
              child:  FocusScope(
                node: _node,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    //_columnSpace('inputSpace'),
                    const SizedBox(height: 20),
                    Container(
                      width: screen.width * 0.8,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 25,
                            offset: Offset(0, 10)
                          )
                        ],
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Observer(builder: (_) {
                            return Transform.scale(
                              scale: 2,
                              child: Checkbox(
                                  value: store.isStudent,
                                  activeColor: redColor,
                                  shape: const CircleBorder(),
                                  onChanged: (bool? value) {
                                    store.setIsStudent(value);
                                  }),
                            );
                          }),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              wordTranslated('accountStudent') + ".\nObs: "+ wordTranslated('accountStudentNotEmail') + ".",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    _columnSpace('inputSpace'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Observer(builder: (_) {
                          return Text(
                            'E-mail',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              shadows: [
                                Shadow(
                                  color: Colors.white.withOpacity(0.4),
                                  offset: const Offset(5, 5),
                                  blurRadius: 10
                                )
                              ],
                              color: store.isStudent ? Colors.grey : null),
                          );
                        }),
                        _columnSpace('titleSpace'),
                        Observer(builder: (_) {
                          return Container(
                            decoration: _boxDecoration(),
                            width: screen.width * 0.8,
                            child: TextFormField(
                              enabled: !store.isStudent,
                              validator: (email) {
                                if(store.isStudent){
                                  return null;
                                } else if(email != null && !EmailValidator.validate(email)){
                                  return 'E-mail invalido';
                                }
                                return null;
                              },
                              decoration:  InputDecorationCustom('exemple@mail.com'),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: store.emailController,
                              onEditingComplete: _node.nextFocus,
                            ),
                          );
                        }),
                      ],
                    ),

                    _columnSpace('inputSpace'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _Title(wordTranslated('name')),
                        _columnSpace('titleSpace'),
                        Observer(builder: (_) {
                          return Container(
                            decoration: _boxDecoration(),
                            width: screen.width * 0.8,
                            child: TextFormField(
                              validator: (username) {
                                if(username == null 
                                  || username.isEmpty 
                                  || username == ''){
                                  return 'Esse campo é obrigatorio';
                                }
                                if(username.contains(' ')){
                                  return 'O nome não pode conter espaço';
                                }
                                return null;
                              },
                              decoration: InputDecorationCustom('username'),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: store.usernameController,
                              onEditingComplete: _node.nextFocus,
                            ),
                          );
                        }),
                      ],
                    ),

                    _columnSpace('inputSpace'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _Title(wordTranslated('password')),
                        _columnSpace('titleSpace'),
                        Observer(builder: (_) {
                          return Container(
                            decoration: _boxDecoration(),
                            width: screen.width * 0.8,
                            child: TextFormField(
                              validator: (pass) {
                                if(pass == null || pass.isEmpty){
                                  return 'Esse campo é obrigatorio';
                                }else if (pass.length < 6){
                                  return 'A senha deve ter no minimo 6 caracter';
                                }
                                return null;
                              },
                              decoration: InputDecorationPasswordCustom(store, 'password'),
                              obscureText: store.hintPassword,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: store.passController,
                              onEditingComplete: _node.nextFocus,
                            ),
                          );
                        }),
                      ],
                    ),

                    _columnSpace('inputSpace'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _Title(wordTranslated('confirmPassword')),
                        _columnSpace('titleSpace'),
                        Observer(builder: (_) {
                          return Container(
                            decoration: _boxDecoration(),
                            width: screen.width * 0.8,
                            child: TextFormField(
                              validator: (pass) {
                                if(pass == null || pass.isEmpty){
                                  return 'Esse campo é obrigatorio';
                                }else if (pass != store.passController.text){
                                  return 'As senha não são iguais';
                                }
                                return null;
                              },
                              decoration:  InputDecorationPasswordCustom(store, 'confirm'), 
                              obscureText: store.hintConfirmPassword,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: store.confirPasslController,
                              onEditingComplete: _node.nextFocus,
                            ),
                          );
                        }),
                      ],
                    ),

                    _columnSpace('inputSpace'),
                    Observer(builder: (_) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(screen.width * 0.8, 50),
                          primary: blueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                          ),
                          shadowColor: Colors.black
                        ),
                        onPressed: () {
                          setState(() {
                            _isLogging = true;
                          });
                          if(!_formKey.currentState!.validate()){
                            Flushbar(
                              title: 'Error',
                              message: 'Insira os dados corretamentes',
                              duration: const Duration(seconds: 2),
                            ).show(context);
                            setState(() {
                              _isLogging = false;
                            });
                          } else {
                            if(store.isStudent){
                              String studentEmail = store.usernameController.text + '@student.com';
                              store.emailController.text = studentEmail;
                            }
                            store.register();
                          }
                        },
                        child: _isLogging 
                          ? const CircularProgressIndicator( color: Colors.white, ) 
                          : Text(wordTranslated('register'), 
                          style: const TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold, 
                            fontSize: 30
                          ),),
                      );
                    }),
                    Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _Title(String text){
    return Text(text, 
      style: TextStyle(
        fontWeight: FontWeight.bold, 
        fontSize: 25, 
        fontFamily: 'Nunito',
        shadows: [
          Shadow(
            color: Colors.white.withOpacity(0.4),
            offset: const Offset(5, 5),
            blurRadius: 10,
          )
        ]
      ));
  }

  Widget _columnSpace(String typeSpace) {
    final Size screen = MediaQuery.of(context).size;
    return SizedBox(
      height: typeSpace == 'inputSpace' ? 40 : 5,
    );
  }

  BoxDecoration _boxDecoration(){
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: const [
        BoxShadow(
          color: Colors.black38,
          blurRadius: 25,
          offset: Offset(0, 10),
        ),
      ],
    );
  }

}
