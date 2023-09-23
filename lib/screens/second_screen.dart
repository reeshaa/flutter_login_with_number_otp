import 'package:dummy_phone_login/componenets/pin_input.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool _isOtpResent = false;
  showAlertDialog(BuildContext context) {
    Widget okButton = MaterialButton(
        child: const Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        });

    AlertDialog alert = AlertDialog(
        title: const Text("OTP Submitted",
            style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 10,
        actionsPadding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
        surfaceTintColor: Colors.orange[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: const Text("Your details have been submitted."),
        actions: [okButton]);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
                const Text("OTP Verify",
                    style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 22)),
                SizedBox(height: size.height * 0.03),
                Image(
                    image: const AssetImage('assets/images/image.png'),
                    height: size.height * 0.32),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: RichText(
                    text: TextSpan(
                      text: _isOtpResent == true
                          ? 'OTP has been RESENT to\n'
                          : 'OTP has been sent to\n',
                      // text: 'OTP has been ' + 'resent' + ' to \n',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      children: const [
                        TextSpan(
                          text: '+91 1234567899',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            height: 1.6,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                  ),
                ),
                // SizedBox(height: size.height * 0.024),
                SizedBox(height: size.height * 0.02),
                const PinInput(),
                SizedBox(height: size.height * 0.065),
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
                      showAlertDialog(context);
                    });
                  },
                  color: const Color(0xFFE44533),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                  // const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
                      : const Text("Verify OTP",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900)),
                ),
                SizedBox(height: size.height * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn't you receive any code?",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isOtpResent = true;
                        });
                      },
                      child: const Text(
                        "Resend New Code",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE44533),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),

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
