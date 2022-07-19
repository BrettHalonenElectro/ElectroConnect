import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eicfront/common/show_dialog.dart';
import 'package:eicfront/view_model/login_view_model.dart';
import 'package:eicfront/providers/state.dart';
import 'package:eicfront/UI/widgets/input_widget.dart';
import 'package:eicfront/UI/widgets/button_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class LoginPage extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginViewModel = LoginViewModel();

  final String signin = """
  mutation signin(\$email: String!, \$password: String!) {
    signin(input: {email: \$email, password: \$password}) {
    jwtToken
  }
}
""";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
    var isLoadingState = ref.watch(isSaving.state).state;
    return Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: SingleChildScrollView(
            child: Card(
                elevation: 8,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Mutation(
                  options: MutationOptions(
                      document: gql(signin),
                      fetchPolicy: FetchPolicy.noCache,
                      onCompleted: (data) {
                        isLoadingState = false;
                        final loginData = data!['signin'];
                        print("\n");
                        print("\n");
                        print(loginData['jwtToken']);
                        print("\n");
                        // final dataResp = ResponseMessage.fromJson(loginData);
                        if (1 == 1) {
                          loginViewModel.setToken(
                              context, ref, loginData['jwtToken']);
                        } else {
                          showDialogWidget(context, 'Wrong Credentials',
                              loginData['error'].toString());
                        }
                      }),
                  builder: (runMutation, QueryResult? result) {
                    return Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Electro Connect',
                                  style: TextStyle(
                                      fontSize: 24,
                                      letterSpacing: 1.4,
                                      fontWeight: FontWeight.w300),
                                )),
                            const SizedBox(
                              height: 15,
                            ),
                            InputWidget(
                              labelText: 'E-mail',
                              // initialValue: 'rui_oficial',
                              controller: emailController,
                              // inputFunction: (String value) => value = '',
                              validatorFunction: (String value) => value.isEmpty
                                  ? 'Insert username/e-mail'
                                  : null,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            InputWidget(
                              labelText: 'Password',
                              // initialValue: '123456',
                              controller: passwordController,
                              obscureText: true,
                              // inputFunction: (String value) => value = '',
                              validatorFunction: (String value) =>
                                  value.isEmpty ? 'Insert password' : null,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ButtonWidget(
                              text: isLoadingState ? 'Loading.' : 'Login',
                              onPressed: isLoadingState
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        isLoadingState = true;
                                        runMutation({
                                          "email": emailController.text,
                                          "password": passwordController.text
                                        });
                                      }
                                    },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed("/register");
                                },
                                child:
                                    const Text("Are you new? Create Account."))
                          ],
                        ),
                      ),
                    );
                  },
                )),
          ),
        ));
  }
}
