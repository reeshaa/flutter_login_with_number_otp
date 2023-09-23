import 'package:dummy_phone_login/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController controller = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 64, 24, 0),
          child: Center(
            child: Column(
              children: [
                const Text("Log in",
                    style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 22)),
                SizedBox(height: size.height * 0.03),
                Image(
                    image: const AssetImage('assets/images/image.png'),
                    height: size.height * 0.32),

                /*Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Enter your phone number, we will send an OTP to verifiy.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                  ),
                ),
                SizedBox(height: size.height * 0.024),*/
                // comment the below line if you uncomment the previous ones

                SizedBox(height: size.height * 0.1),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.black.withOpacity(0.13)),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0xffeeeeee),
                            blurRadius: 10,
                            offset: Offset(0, 5))
                      ]),
                  child: InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {},
                    onInputValidated: (bool value) {},
                    selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
                    initialValue: number,
                    keyboardType: TextInputType.number,
                    selectorTextStyle: const TextStyle(color: Colors.black),
                    textFieldController: controller,
                    maxLength: 11,
                    cursorColor: Colors.orange,
                    inputDecoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(bottom: 15, left: 0),
                      border: InputBorder.none,
                      hintText: 'Enter Phone Number',
                      hintStyle:
                          TextStyle(color: Colors.grey.shade500, fontSize: 16),
                    ),
                    onSaved: (PhoneNumber number) {},
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    setState(() {
                      _isLoading = true;
                    });
                    //mimicking the api
                    Future.delayed(const Duration(seconds: 1), () {
                      setState(() {
                        _isLoading = false;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondScreen()));
                    });
                  },
                  color: const Color(0xFFE44533),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            color: Colors.black,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text("Get OTP",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900)),
                ),
                SizedBox(height: size.height * 0.028),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                      'By signing up, you agree with our Terms and conditions',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey[400])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
