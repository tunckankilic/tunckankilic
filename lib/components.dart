import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

//Variables
var logger = Logger();
final TextEditingController _firstNameController = TextEditingController();
final TextEditingController _lastNameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _messageController = TextEditingController();

//Classes and methods
class TabsWeb extends StatefulWidget {
  final String title;
  final String route;

  const TabsWeb({super.key, required this.title, required this.route});

  @override
  _TabsWebState createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
          // print("Entered");
        },
        onExit: (_) {
          setState(() {
            isSelected = false;
          });
          // print("Exit");
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          curve: Curves.elasticIn,
          style: isSelected
              ? GoogleFonts.roboto(
                  shadows: [
                      const Shadow(
                        color: Colors.black,
                        offset: Offset(0, -8),
                      ),
                    ],
                  fontSize: 25.0,
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationColor: Colors.tealAccent)
              : GoogleFonts.roboto(color: Colors.black, fontSize: 20.0),
          child: Text(widget.title),
        ),
      ),
    );
  }
}

class TabsWebList extends StatefulWidget {
  const TabsWebList({super.key});

  @override
  State<TabsWebList> createState() => _TabsWebListState();
}

class _TabsWebListState extends State<TabsWebList> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(
          flex: 3,
        ),
        TabsWeb(
          title: "Home",
          route: '/',
        ),
        Spacer(),
        TabsWeb(
          title: "Works",
          route: '/works',
        ),
        Spacer(),
        TabsWeb(
          title: "Blog",
          route: '/blog',
        ),
        Spacer(),
        TabsWeb(
          title: "About",
          route: '/about',
        ),
        Spacer(),
        TabsWeb(
          title: 'Contact',
          route: '/contact',
        ),
        Spacer()
      ],
    );
  }
}

class TabsMobile extends StatefulWidget {
  final String text;
  final String route;

  const TabsMobile({super.key, required this.text, required this.route});

  @override
  _TabsMobileState createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 50.0,
      minWidth: 200.0,
      color: Colors.black,
      child: Text(
        widget.text,
        style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
    );
  }
}

urlLauncher(String imgPath, String url) {
  return IconButton(
    icon: SvgPicture.asset(imgPath, color: Colors.black, width: 35),
    onPressed: () async {
      await launchUrl(Uri.parse(url));
    },
  );
}

class DrawersWeb extends StatelessWidget {
  const DrawersWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 72.0,
            backgroundColor: Colors.tealAccent,
            child: CircleAvatar(
              radius: 70.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/image.png"),
            ),
          ),
          const SizedBox(height: 15.0),
          const SansBold("Paulina Knop", 30.0),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher("assets/instagram.svg",
                  "https://www.instagram.com/tuncinyo12derler/"),
              urlLauncher(
                  "assets/twitter.svg", "https://www.twitter.com/tomcruise"),
              urlLauncher(
                  "assets/github.svg", "https://github.com/tunckankilic"),
            ],
          ),
        ],
      ),
    );
  }
}

class DrawersMobile extends StatelessWidget {
  const DrawersMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerHeader(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.0, color: Colors.black)),
              child: Image.asset(
                'assets/profile2-circle.png',
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          const TabsMobile(text: "Home", route: '/'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "Works", route: '/works'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "Blog", route: '/blog'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "About", route: '/about'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "Contact", route: '/contact'),
          const SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher("assets/instagram.svg",
                  "https://www.instagram.com/tomcruise/"),
              urlLauncher(
                  "assets/twitter.svg", "https://www.twitter.com/tomcruise"),
              urlLauncher("assets/github.svg",
                  "https://github.com/sagnik150699/paulina_knop"),
            ],
          )
        ],
      ),
    );
  }
}

class SansBold extends StatelessWidget {
  final String text;
  final double size;

  const SansBold(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class Sans extends StatelessWidget {
  final String text;
  final double size;

  const Sans(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size),
    );
  }
}

class AbelCustom extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final FontWeight? fontWeight;

  const AbelCustom(
      {super.key,
      required this.text,
      required this.size,
      this.color,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
          fontSize: size,
          color: color ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.normal),
    );
  }
}

class TextForm extends StatelessWidget {
  final text;
  final containerWidth;
  final hintText;
  final maxLines;
  final controller;
  final validator;

  const TextForm(
      {super.key,
      @required this.text,
      @required this.containerWidth,
      @required this.hintText,
      this.maxLines,
      @required this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(text, 16.0),
        const SizedBox(height: 5),
        SizedBox(
          width: containerWidth,
          child: TextFormField(
            validator: validator,
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.tealAccent, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedCard extends StatefulWidget {
  final imagePath;
  final text;
  final fit;
  final reverse;
  final height;
  final width;

  const AnimatedCard(
      {super.key,
      @required this.imagePath,
      this.text,
      this.fit,
      this.reverse,
      this.height,
      this.width});

  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);

  late final Animation<Offset> _animation = Tween(
    begin: widget.reverse == true ? const Offset(0, 0.08) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : const Offset(0, 0.08),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(color: Colors.tealAccent),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                height: widget.height ?? 200.0,
                width: widget.width ?? 200.0,
                fit: widget.fit,
              ),
              const SizedBox(height: 10.0),
              widget.text == null
                  ? const SizedBox()
                  : SansBold(widget.text, 15.0),
            ],
          ),
        ),
      ),
    );
  }
}

class AddDataFirestore {
  CollectionReference response =
      FirebaseFirestore.instance.collection('messages');

  Future addResponse(final firstName, final lastName, final email,
      final phoneNumber, final message) async {
    return response.add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'phone number': phoneNumber,
      'message': message
    }).then((value) {
      logger.d("Success");
      return true;
    }).catchError((error) {
      logger.d(error);
      return false;
    });
  }
}

Future DialogError(BuildContext context, String title) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: SansBold(title, 20.0),
          ));
}

class ContactFormWeb extends StatefulWidget {
  const ContactFormWeb({super.key});

  @override
  State<ContactFormWeb> createState() => _ContactFormWebState();
}

class _ContactFormWebState extends State<ContactFormWeb> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 30.0),
          const SansBold("Contact me", 40.0),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  TextForm(
                    text: "First Name",
                    containerWidth: 350.0,
                    hintText: "Please type first name",
                    controller: _firstNameController,
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "First name is required";
                      }
                    },
                  ),
                  const SizedBox(height: 15.0),
                  TextForm(
                      text: "Email",
                      containerWidth: 350.0,
                      hintText: "Please type email address",
                      controller: _emailController,
                      validator: (text) {
                        if (text.toString().isEmpty) {
                          return "Email is required";
                        }
                      }),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextForm(
                    text: "Last Name",
                    containerWidth: 350.0,
                    hintText: "Please type last name",
                    controller: _lastNameController,
                  ),
                  const SizedBox(height: 15.0),
                  TextForm(
                    text: "Phone number",
                    containerWidth: 350.0,
                    hintText: "Please type phone number",
                    controller: _phoneController,
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          TextForm(
            text: "Message",
            containerWidth: widthDevice / 1.5,
            hintText: "Please type your message",
            maxLines: 10,
            controller: _messageController,
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Message is required";
              }
            },
          ),
          const SizedBox(height: 20.0),
          MaterialButton(
            onPressed: () async {
              logger.d(_firstNameController.text);
              final addData = AddDataFirestore();
              if (formKey.currentState!.validate()) {
                if (await addData.addResponse(
                    _firstNameController.text,
                    _lastNameController.text,
                    _emailController.text,
                    _phoneController.text,
                    _messageController.text)) {
                  formKey.currentState!.reset();
                  DialogError(context, "Message sent successfully");
                } else {
                  DialogError(context, "Message failed to sent");
                }
              }
            },
            elevation: 20.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            height: 60.0,
            minWidth: 200.0,
            color: Colors.tealAccent,
            child: const SansBold("Submit", 20.0),
          ),
          const SizedBox(height: 10.0)
        ],
      ),
    );
  }
}

class ContactFormMobile extends StatefulWidget {
  const ContactFormMobile({super.key});

  @override
  State<ContactFormMobile> createState() => _ContactFormMobileState();
}

class _ContactFormMobileState extends State<ContactFormMobile> {
  final formKey = GlobalKey<FormState>();

  // final TextEditingController _firstNameController = TextEditingController();
  // final TextEditingController _lastNameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _phoneController = TextEditingController();
  // final TextEditingController _messageController = TextEditingController();
  // final formKey = GlobalKey<FormState>();
  // var logger = Logger();
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Wrap(
        runSpacing: 20.0,
        spacing: 20.0,
        alignment: WrapAlignment.center,
        children: [
          const SansBold("Contact me", 35.0),
          TextForm(
            text: "First name",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type first name",
            controller: _firstNameController,
            validator: (text) {
              if (text.toString().isEmpty) {
                return "First name is required";
              }
            },
          ),
          TextForm(
            text: "Last name",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type last name",
            controller: _lastNameController,
          ),
          TextForm(
            text: "Phone number",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type phone number",
            controller: _phoneController,
          ),
          TextForm(
              text: "Email",
              containerWidth: widthDevice / 1.4,
              hintText: "Please type email address",
              controller: _emailController,
              validator: (text) {
                if (text.toString().isEmpty) {
                  return "Email is required";
                }
              }),
          TextForm(
            text: "Message",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type your message",
            maxLines: 10,
            controller: _messageController,
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Message is required";
              }
            },
          ),
          MaterialButton(
            onPressed: () async {
              logger.d(_firstNameController.text);
              final addData = AddDataFirestore();
              if (formKey.currentState!.validate()) {
                if (await addData.addResponse(
                    _firstNameController.text,
                    _lastNameController.text,
                    _emailController.text,
                    _phoneController.text,
                    _messageController.text)) {
                  formKey.currentState!.reset();
                  DialogError(context, "Message sent successfully");
                } else {
                  DialogError(context, "Message failed to sent");
                }
              }
            },
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 60.0,
            minWidth: widthDevice / 2.2,
            color: Colors.tealAccent,
            child: const SansBold("Submit", 20.0),
          )
        ],
      ),
    );
  }
}

tealContainer(String text) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.tealAccent,
          style: BorderStyle.solid,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(5.0)),
    padding: const EdgeInsets.all(7.0),
    child: Text(
      text,
      style: GoogleFonts.openSans(fontSize: 15.0),
    ),
  );
}
