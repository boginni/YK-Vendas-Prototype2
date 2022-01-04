import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/custom_drawer/custom_drawer.dart';
import 'package:forca_de_vendas/screens/base/moddel_screen.dart';

class LoginScreen extends ModdelScreen {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();



  
  @override
  Widget getCustomScreen(BuildContext context) {
    // TODO: implement getCustomScreen
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: const Text('Entrar'),
          centerTitle: true,
        ),
        body: Center(
          // child: Card(
          //   margin: const EdgeInsets.symmetric(horizontal: 16),
          //   child: Form(
          //     key: formKey,
          //     child: Consumer<UserManager>(
          //         builder: (_,UserManager,__){
          //           return ListView(
          //             padding: const EdgeInsets.all(16),
          //             shrinkWrap: true,
          //             children: <Widget>[
          //               TextFormField(
          //                 controller: emailController,
          //                 enabled: !UserManager.loading,
          //                 decoration: const InputDecoration(hintText: 'E-mail'),
          //                 keyboardType: TextInputType.emailAddress,
          //                 autocorrect: false,
          //                 validator: (email) {
          //                   if (!emailValid(email!)) return 'E-mail inválido';
          //                   return null;
          //                 },
          //               ),
          //
          //               const SizedBox(
          //                 height: 16,
          //               ),
          //
          //               TextFormField(
          //                 controller: passController,
          //                 enabled: !UserManager.loading,
          //                 decoration: const InputDecoration(hintText: 'Senha'),
          //                 autocorrect: false,
          //                 obscureText: true,
          //                 validator: (pass) {
          //                   if (pass!.isEmpty || pass.length < 6)
          //                     return 'Senha inválida';
          //                   return null;
          //                 },
          //               ),
          //
          //               Align(
          //                 alignment: Alignment.centerRight,
          //                 child: TextButton(
          //                   onPressed: () {},
          //                   child: const Text('Esqueci minha senha'),
          //                 ),
          //               ),
          //
          //               const SizedBox(
          //                 height: 16,
          //               ),
          //
          //               SizedBox(
          //                 height: 44,
          //                 child: ElevatedButton(
          //                   onPressed:UserManager.loading?null:() {
          //                     if (formKey.currentState!.validate()) {
          //                       UserManager.signIn(
          //                           userApp: UserApp(
          //                               email: emailController.text,
          //                               password: passController.text),
          //                           onFail: (e) {
          //                             print(e);
          //                           },
          //                           onSuccess: () {
          //                             // TODO: FECHAR TELA DE LOGIN
          //                           });
          //                     }
          //                   },
          //                   style: ElevatedButton.styleFrom(
          //                       primary: Theme.of(context).primaryColor
          //                   ),
          //
          //                   child: const Text(
          //                     "Entrar",
          //                     style: TextStyle(fontSize: 18),
          //                   ),
          //
          //                 ),
          //               ),
          //
          //             ],
          //           );
          //         }
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
