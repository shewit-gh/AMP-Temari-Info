import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/comment/blocs/comment_bloc.dart';
import 'package:temari_info_flutter/comment/data_provider/data_provider.dart';
import 'package:temari_info_flutter/comment/repo/comment_repo2.dart';
import 'package:temari_info_flutter/comment/repo/comment_repo2.dart';
import 'package:temari_info_flutter/presentation/add_department/add_department_screen.dart';
import 'package:temari_info_flutter/presentation/add_inst/add_inst_screen.dart';
import 'package:temari_info_flutter/presentation/admin/admin_screen.dart';
import 'package:temari_info_flutter/presentation/admin/reports_list_screen.dart';
import 'package:temari_info_flutter/presentation/contact/contact_screen.dart';
import 'package:temari_info_flutter/presentation/home/home_screen.dart';
import 'package:temari_info_flutter/presentation/institute/institute_screen.dart';
import 'package:temari_info_flutter/presentation/login/login_screen.dart';
import 'package:temari_info_flutter/presentation/report/report_screen.dart';
import 'package:temari_info_flutter/presentation/search/search_screen.dart';
import 'package:temari_info_flutter/presentation/signup/signup_screen.dart';
import 'package:temari_info_flutter/presentation/univ_admin/edit_inst_screen.dart';
import 'package:temari_info_flutter/presentation/univ_admin/edit_univ_screen.dart';
import 'package:temari_info_flutter/presentation/university/university_screen.dart';
import 'package:temari_info_flutter/presentation/user/user_screen.dart';
import 'package:temari_info_flutter/presentation/about/about_us.dart';
import 'package:temari_info_flutter/presentation/user/edit_profile_screen.dart';
import 'package:temari_info_flutter/presentation/login/forgot_password_screen.dart';
import 'package:temari_info_flutter/presentation/login/reset_password_screen.dart';
import 'package:temari_info_flutter/presentation/login/set_new_password_screen.dart';
import 'package:temari_info_flutter/presentation/universities/universities.dart';
import 'package:temari_info_flutter/rating/blocs/rating_bloc.dart';
import 'package:temari_info_flutter/rating/data_provider/data_provider.dart';
import 'package:temari_info_flutter/rating/repo/rating_repo.dart';
<<<<<<< HEAD
import 'package:temari_info_flutter/comment/repo/repo.dart';

=======
import 'package:temari_info_flutter/auth/bloc/auth_bloc.dart';
import 'package:temari_info_flutter/auth/data_providers/auth_provider.dart';
import 'package:temari_info_flutter/auth/repository/auth_repo.dart';
>>>>>>> 5291ade6df2e46bd0e08dc95bcf2de033a3b319d
import 'package:http/http.dart' as http;

import 'package:temari_info_flutter/University/data_provider/university_data_provider.dart';
import 'package:temari_info_flutter/University/bloc/university_bloc.dart';

import 'University/bloc/new.dart';

void main() {
  runApp(MyApp());
}

final RatingRepo _ratingRepo = RatingRepo(dataProvider: RatingDataProvider(httpClient: http.Client()));
<<<<<<< HEAD
final CommentRepo2 commentRepo=CommentRepo2(
  dataProvider: CommentDataProvider(httpClient: http.Client()));

=======
final AuthRepository _authRepo = AuthRepository(dataProvider: AuthDataProvider());
>>>>>>> 5291ade6df2e46bd0e08dc95bcf2de033a3b319d
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(authRepository: _authRepo),
        ),
        BlocProvider<RatingBloc>(
          create: (context) => RatingBloc(_ratingRepo),
        ),
<<<<<<< HEAD

        BlocProvider(create: (_) => CommentBloc(commentRepo: CommentRepo2(dataProvider:CommentDataProvider(httpClient: http.Client()) )))
=======
        
        //  BlocProvider<RatingBloc>(
        //   create: (context) => RatingBloc(_ratingRepo),
>>>>>>> 5291ade6df2e46bd0e08dc95bcf2de033a3b319d
        // ), BlocProvider<RatingBloc>(
        //   create: (context) => RatingBloc(_ratingRepo),
        // ), BlocProvider<RatingBloc>(
        //   create: (context) => RatingBloc(_ratingRepo),
        // ), BlocProvider<RatingBloc>(
        //   create: (context) => RatingBloc(_ratingRepo),
        // ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Temari Info',
          theme: ThemeData(
            // primarySwatch: Colors.blue,
            primarySwatch: Colors.teal,
            brightness: Brightness.dark,
          ),
<<<<<<< HEAD
          initialRoute: University.routeName,
=======
          initialRoute: Login.routeName,
>>>>>>> 5291ade6df2e46bd0e08dc95bcf2de033a3b319d
          routes: {
            University.routeName: (BuildContext context) => University(),
            Institute.routeName: (BuildContext context) => Institute(),
            Home.routeName: (BuildContext context) => Home(),
            Admin.routeName: (BuildContext context) => Admin(),
<<<<<<< HEAD
           // Login.routeName: (BuildContext context) => Login(),
=======
            Login.routeName: (BuildContext context) => Login(),
>>>>>>> 5291ade6df2e46bd0e08dc95bcf2de033a3b319d
            Signup.routeName: (BuildContext context) => Signup(),
            EditUniv.routeName: (BuildContext context) => EditUniv(),
            EditInst.routeName: (BuildContext context) => EditInst(),
            User.routeName: (BuildContext context) => User(),
            Search.routeName: (BuildContext context) => Search(),
            Report.routeName: (BuildContext context) => Report(),
            AddDepartment.routeName: (BuildContext context) => AddDepartment(),
            AddInst.routeName: (BuildContext context) => AddInst(),
            Contact.routeName: (BuildContext context) => Contact(),
            About.routeName: (BuildContext context) => About(),
<<<<<<< HEAD
            //EditProfile.routeName: (BuildContext context) => EditProfile(),
            //ForgotPassword.routeName: (BuildContext context) => ForgotPassword(),
            ResetPassword.routeName: (BuildContext context) => ResetPassword(),
            //SetNewPassword.routeName: (BuildContext context) => SetNewPassword(),
=======
            EditProfile.routeName: (BuildContext context) => EditProfile(),
            ForgotPassword.routeName: (BuildContext context) => ForgotPassword(),
            ResetPassword.routeName: (BuildContext context) => ResetPassword(),
            SetNewPassword.routeName: (BuildContext context) => SetNewPassword(),
>>>>>>> 5291ade6df2e46bd0e08dc95bcf2de033a3b319d
            Universities.routeName: (BuildContext context) => Universities(),
             Reports.routeName: (BuildContext context) => Universities(),
          }),
    );

  }
}
