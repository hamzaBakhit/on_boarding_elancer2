import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _obsecure = false;
  late TextEditingController _email, _password;
  String? _emailErrorValue;
  String? _passwordErrorValue;
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
    // طريقة افضل من اللي تحت
    // النقطتين بيرجعوك للمتغير
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = createNewAccountAction;
    //انظر للاعلى
    // _tapGestureRecognizer.onTap = createNewAccountAction;
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  void createNewAccountAction(){
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SIGN IN',
          style: GoogleFonts.nunito(
              color: Colors.black, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SIGN IN',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text(
              'LOG IN TO CONTINUE YOUR ACCOUNT!',
              style: GoogleFonts.nunito(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              style: GoogleFonts.nunito(),
              //**********************//
              onTap: () => print('tapped'),
              onChanged: (String value) => print(value),
              //**********************//
              readOnly: false,
              enabled: true,
              //**********************//
              textAlign: TextAlign.start,
              textDirection: TextDirection.ltr,
              //**********************//
              // cursorColor: Colors.pink,
              // cursorRadius: Radius.circular(10),
              // cursorWidth: 2,
              // cursorHeight: 10,
              //********************//
              // obscureText: true,
              // obscuringCharacter: '-',
              //*************************//
              textInputAction: TextInputAction.search,
              onSubmitted: (String value) => print(value),
              //******************************//
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: false),
              textCapitalization: TextCapitalization.words,
              /******************************/
              // يجب ان تكون قيمة الماكس اعلى من المين
              minLines: null,
              maxLines: null,
              //تعمل اذا كانت قمية الماكس والمين نول
              //اذا كانت ترو بدنا نحها داخل الكونسترينز بداخل الديكوريشين
              expands: true,
              ////////////////**
              controller: _email,
              //******************************//

              // maxLength: 25,
              // buildCounter: (
              //   BuildContext context, {
              //   required int currentLength,
              //   required int? maxLength,
              //   required bool isFocused,
              // }) {
              //   return isFocused ? Text('$currentLength - $maxLength') : null;
              // },

              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: GoogleFonts.nunito(),
                // hintMaxLines: 1,
                hintTextDirection: TextDirection.ltr,
                //*************************************//
                // عشان الاكسباندد صارت ترو بدي احجم باستخدام هاي
                constraints: BoxConstraints(
                  maxHeight: _emailErrorValue == null ? 60 : 75,
                  minHeight: _emailErrorValue == null ? 60 : 75,
                ),
                //*************************************//
                // contentPadding: EdgeInsets.all(20) ,
                // لاخفاء العداد
                // counterText: '',
                //*******************************//
                // labelText: 'text',
                // labelStyle: GoogleFonts.nunito(),
                // floatingLabelStyle: GoogleFonts.nunito(),
                // floatingLabelAlignment: FloatingLabelAlignment.start,
                // floatingLabelBehavior: FloatingLabelBehavior.always,
                //*************************************//
                fillColor: Colors.grey,
                //مش هيقبل بدونها يتلون وهي المفتاح
                // filled: true,
                //*************************//
                //ظاهرة في كل الحالات عند التفعيل او لا
                //ظاهرة ضمن المحتوى داخل الخط
                prefixIcon: const Icon(
                  Icons.email,
                ),
                // بتظهر لما تكون فوكس بس
                // prefix: Icon(Icons.email,),
                // ما بقدر اخدها مع النص
                // prefixText: 'ucas-',
                //*******************//
                // suffix , suffixText ما بنجمعهم مع بعض
                // suffixIcon: Icon(Icons.send,),
                // suffix: const Icon(Icons.send,),
                // suffixText: 'valid',
                //*************************************///
                // icon: const Icon(Icons.email ),
                //************************************///
                // helperText: '',
                // helperStyle: GoogleFonts.nunito(),
                // helperMaxLines: 1,
                //********************************//

                //************************************//
                // القيمة الافتراضية نول ومش هيظهر اللون الاحمر الا لو تغيرت القيمة
                errorText: _emailErrorValue,
                //******************************************//
                // border: InputBorder.none
                //*******//
                // border: UnderlineInputBorder(
                //   borderSide:BorderSide(
                //     color: Colors.pink,
                //     width: 1
                //   ),
                // ),
                //************//
                enabledBorder: OutlineInputBorder(
                  borderSide:const  BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide:const  BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),

                errorBorder: OutlineInputBorder(
                  borderSide:const  BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),

                focusedErrorBorder: OutlineInputBorder(
                  borderSide:const  BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                //*********************///*******************//
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: _obsecure,
              //********************//
              minLines: 1,
              maxLines: 1,
              expands: false,
              //***********************//
              //**************************//
              controller: _password,
              //****************************//
              style: GoogleFonts.nunito(),
              decoration: InputDecoration(
                hintText: 'Password',
                /*****************/
                errorText: _passwordErrorValue,
                //*********************//
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obsecure = !_obsecure;
                    });
                  },
                  icon: _obsecure
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
                // contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                constraints: BoxConstraints(
                  maxHeight: _passwordErrorValue == null ? 60 : 75,
                  minHeight: _passwordErrorValue == null ? 60 : 75,
                ),
                hintStyle: GoogleFonts.nunito(),

                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),

                errorBorder: OutlineInputBorder(
                  borderSide:const  BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),

                focusedErrorBorder: OutlineInputBorder(
                  borderSide:const  BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //* button log in
            ElevatedButton(
              onPressed: () => performLogin(),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'LOGIN',
              ),
            ),

            // don't have an account create now
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Don\'t have an account ',
                  style: GoogleFonts.nunito(
                    color: Colors.grey.shade700,
                  ),
                  children: [
                    const TextSpan(text: ''),
                    TextSpan(
                      text: 'create now',
                      recognizer: _tapGestureRecognizer ,
                      style: GoogleFonts.poppins(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // perform login /  check data => login (single responsibility) SOLID
  void performLogin() {
    print('per0');
    if (checkData()) {
      login();
    }
  }

  bool checkData() {
    // DRY don't repeat your self...
    if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
      _controlErrorValue();
      return true;
    }
    _controlErrorValue();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Error, enter required data',
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
    return false;
  }

  void _controlErrorValue() {
    setState(() {
      _emailErrorValue = _email.text.isEmpty ? 'invalid email' : null;
      _passwordErrorValue = _password.text.isEmpty ? 'invalid password' : null;
    });
  }

  void login() {
    Navigator.pushReplacementNamed(context, '/categories_screen');
  }
}
