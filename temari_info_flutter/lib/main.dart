import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/University/repository/university_repository.dart';
import 'package:temari_info_flutter/comment/blocs/comment_bloc.dart';
import 'package:temari_info_flutter/comment/data_provider/comment_data.dart';
import 'package:temari_info_flutter/comment/repo/repo.dart';
import 'package:temari_info_flutter/institute/blocs/institute_bloc.dart';
import 'package:temari_info_flutter/institute/data_provider/institute_data.dart';
import 'package:temari_info_flutter/institute/repo/institute_repo.dart';
import 'package:temari_info_flutter/presentation/add_department/add_department_screen.dart';
import 'package:temari_info_flutter/presentation/add_inst/add_inst_screen.dart';
import 'package:temari_info_flutter/presentation/admin/admin_screen.dart';
import 'package:temari_info_flutter/presentation/admin/admin_univadd_screen.dart';
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
import 'package:temari_info_flutter/presentation/user/change_password_screen.dart';

import 'package:temari_info_flutter/presentation/about/about_us.dart';
import 'package:temari_info_flutter/presentation/user/edit_profile_screen.dart';
import 'package:temari_info_flutter/presentation/login/forgot_password_screen.dart';
import 'package:temari_info_flutter/presentation/login/reset_password_screen.dart';
import 'package:temari_info_flutter/presentation/login/set_new_password_screen.dart';
import 'package:temari_info_flutter/presentation/universities/universities.dart';
import 'package:temari_info_flutter/rating/blocs/rating_bloc.dart';
import 'package:temari_info_flutter/rating/data_provider/data_provider.dart';
import 'package:temari_info_flutter/rating/repo/rating_repo.dart';
import 'package:temari_info_flutter/auth/bloc/auth_bloc.dart';
import 'package:temari_info_flutter/auth/data_providers/auth_provider.dart';
import 'package:temari_info_flutter/auth/repository/auth_repo.dart';
import 'package:http/http.dart' as http;

import 'package:temari_info_flutter/University/data_provider/university_data_provider.dart';
import 'package:temari_info_flutter/University/bloc/uni_bloc.dart';
import 'package:temari_info_flutter/comment/data_provider/comment_data.dart';
import 'package:temari_info_flutter/comment/repo/comment_repo2.dart';

void main() {
  runApp(MyApp());
}

final RatingRepo _ratingRepo =
    RatingRepo(dataProvider: RatingDataProvider(httpClient: http.Client()));
final AuthRepository _authRepo =
    AuthRepository(dataProvider: AuthDataProvider(httpClient: http.Client()));
final InstituteRepository instRepo = InstituteRepository(
    dataProvider: InstituteDataProvider(httpClient: http.Client()));
final UniversityRepository uniRepo = UniversityRepository(
    dataProvider: UniversityDataProvider(httpClient: http.Client()));
final CommentRepo2 commentRepo = CommentRepo2(
  dataProvider: CommentDataProvider(httpClient: http.Client()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(authRepository: _authRepo),
        ),
        BlocProvider<UniBloc>(
          create: (context) => UniBloc(uniRepo),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(uniRepo),
        ),
        BlocProvider<UnivAddBloc>(
          create: (context) => UnivAddBloc(uniRepo),
        ),
        BlocProvider<RatingBloc>(
          create: (context) => RatingBloc(_ratingRepo),
        ),
        BlocProvider<InstituteBloc>(
            create: (context) => InstituteBloc(instRepo)),
        BlocProvider<CommentBloc>(
            create: (context) => CommentBloc(commentRepo:commentRepo)),
        //  BlocProvider<RatingBloc>(
        //   create: (context) => RatingBloc(_ratingRepo),
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

          initialRoute: Signup.routeName,
            routes: {
            UniversityDetail.routeName: (BuildContext context) =>
                UniversityDetail(),
            Institute.routeName: (BuildContext context) => Institute(),
            Home.routeName: (BuildContext context) => Home(),
            Admin.routeName: (BuildContext context) => Admin(),
            UnivAdd.routeName: (BuildContext context) => UnivAdd(),
            Login.routeName: (BuildContext context) => Login(),
            Signup.routeName: (BuildContext context) => Signup(),
            EditUniv.routeName: (BuildContext context) => EditUniv(),
            EditInst.routeName: (BuildContext context) => EditInst(),
            Userp.routeName: (BuildContext context) => Userp(),
            Search.routeName: (BuildContext context) => Search(),
            Report.routeName: (BuildContext context) => Report(),
            AddDepartment.routeName: (BuildContext context) => AddDepartment(),
            AddInst.routeName: (BuildContext context) => AddInst(),
            Contact.routeName: (BuildContext context) => Contact(),
            About.routeName: (BuildContext context) => About(),
            EditProfile.routeName: (BuildContext context) => EditProfile(),
            ForgotPassword.routeName: (BuildContext context) =>
                ForgotPassword(),
            ResetPassword.routeName: (BuildContext context) => ResetPassword(),
            SetNewPassword.routeName: (BuildContext context) =>
                SetNewPassword(),
            Universities.routeName: (BuildContext context) => Universities(),
            Reports.routeName: (BuildContext context) => Universities(),
            ChangePassword.routeName:(BuildContext context) => ChangePassword()
          }),
    );
  }
}
