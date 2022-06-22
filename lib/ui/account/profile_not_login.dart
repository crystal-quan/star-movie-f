// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:star_movie_3/ui/utils/textField_custom.dart';
// import 'package:star_movie_3/widgets/app_bar/app_bar_home.dart';


// class ProfileNotLogin extends StatefulWidget {
//   ProfileNotLogin({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _ProfileNotLoginState createState() => _ProfileNotLoginState();
// }

// class _ProfileNotLoginState extends State<ProfileNotLogin> {
//   AccountCubit _cubit;
//   TextEditingController userController = TextEditingController();
//   TextEditingController passController = TextEditingController();

//   @override
//   void initState() {
//     _cubit = context.read<AccountCubit>();
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Container(
//           child: AppBarHome(
//             title: 'Profile',
//             signUp: true,
//           ),
//         ),
//         Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height - 136,
//           margin: EdgeInsets.symmetric(
//             horizontal: 20,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(flex: 4, child: SizedBox()),
//               Expanded(
//                   flex: 7,
//                   child: Container(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         BuildTextFieldCustom(
//                           title: 'USER NAME',
//                           image: 'ic_user.png',
//                           infomation: '',
//                           controller: userController,
//                         ),
//                         BuildTextFieldCustom(
//                           title: 'PASSWORD',
//                           image: 'lock.png',
//                           infomation: '',
//                           hideText: true,
//                           controller: passController,
//                         ),
//                       ],
//                     ),
//                   )),
//               Expanded(
//                   flex: 5,
//                   child: Container(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Text(
//                           'Forgot Passwrod',
//                           style: TextStyle(
//                               color: Colors.white.withOpacity(0.5),
//                               fontSize: 14),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             FirebaseAuth.instance
//                                 .signInWithEmailAndPassword(
//                                     email: userController.text,
//                                     password: passController.text)
//                                 .then((value) => _cubit.checkLogined());
//                           },
//                           child: Container(
//                             margin: EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 20),
//                             width: MediaQuery.of(context).size.width,
//                             height: 50,
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                                 color: Color(0xffE51937),
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(4))),
//                             child: Text(
//                               'Login',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 22,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )),
//               Expanded(flex: 3, child: SizedBox()),
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     buildAuthentication('ic_twitter.png', Color(0xff1AA9E1)),
//                     buildAuthentication('ic_fb.png', Color(0xff3B5A9A)),
//                     buildAuthentication('ic_gg.png', Color(0xffCB3E2D)),
//                   ],
//                 ),
//                 flex: 2,
//               ),
//               Expanded(flex: 1, child: SizedBox()),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   GestureDetector buildAuthentication(String imageName, Color colorbg) {
//     return GestureDetector(
//       onTap: () {},
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 12),
//         width: 44,
//         height: 44,
//         decoration: BoxDecoration(
//             color: colorbg,
//             borderRadius: BorderRadius.all(Radius.circular(50))),
//         child: Image.asset('images/$imageName'),
//       ),
//     );
//   }
// }
