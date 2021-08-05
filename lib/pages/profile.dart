import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:launch_review/launch_review.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:travel_flutter/blocs/sign_in_bloc.dart';
import 'package:travel_flutter/config/config.dart';
import 'package:travel_flutter/pages/edit_profile.dart';
import 'package:travel_flutter/pages/sign_in.dart';
import 'package:travel_flutter/utils/next_screen.dart';
import 'package:travel_flutter/widgets/language.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with AutomaticKeepAliveClientMixin{



  


  openAboutDialog (){
    final sb = context.read<SignInBloc>();
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AboutDialog(
          applicationName: Config().appName,
          applicationIcon: Image(image: AssetImage(Config().splashIcon), height: 30, width: 30,),
          applicationVersion: sb.appVersion,
        );
      }
    );
  }


  TextStyle _textStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.grey[900]
  );



  





  @override
  Widget build(BuildContext context) {
    super.build(context);
    final sb = context.watch<SignInBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text('profile').tr(),
        centerTitle: false,
        actions: [
          IconButton(icon: Icon(Feather.bell, size: 20), onPressed: ()=> null)
        ],
        
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 50),
        children: [
          sb.isSignedIn == false ? GuestUserUI() : UserUI(),

          Text("general setting", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),).tr(),


          SizedBox(height: 15,),
          ListTile(
            title: Text('get notifications', style: _textStyle).tr(),
            leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Icon(Feather.bell, size: 20, color: Colors.white),
            ),
          ),
          Divider(height: 5,),
          ListTile(
            title: Text('contact us', style: _textStyle).tr(),
            leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Icon(Feather.mail, size: 20, color: Colors.white),
            ),
            trailing: Icon(Feather.chevron_right, size: 20,),
            onTap: ()async=> await launch('mailto:${Config().supportEmail}?subject=About ${Config().appName} App&body='),
          ),
          Divider(height: 5,),

          ListTile(
            title: Text('language', style: _textStyle).tr(),
            leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Icon(Feather.globe, size: 20, color: Colors.white),
            ),
            trailing: Icon(Feather.chevron_right, size: 20,),
            onTap: ()=> nextScreenPopup(context, LanguagePopup()),
          ),
          Divider(height: 5,),

          ListTile(
            title: Text('rate this app', style: _textStyle).tr(),
            leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Icon(Feather.star, size: 20, color: Colors.white),
            ),
            trailing: Icon(Feather.chevron_right, size: 20,),
            onTap: ()async=> LaunchReview.launch(androidAppId: sb.packageName, iOSAppId: Config().iOSAppId),
          ),
          Divider(height: 5,),

          ListTile(
            title: Text('licence', style: _textStyle).tr(),
            leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Icon(Feather.paperclip, size: 20, color: Colors.white),
            ),
            trailing: Icon(Feather.chevron_right, size: 20,),
            onTap: ()=> openAboutDialog(),
          ),
          Divider(height: 5,),

          ListTile(
            title: Text('privacy policy', style: _textStyle).tr(),
            leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Icon(Feather.lock, size: 20, color: Colors.white),
            ),
            trailing: Icon(Feather.chevron_right, size: 20,),
            onTap: (){
              launch(Config().privacyPolicyUrl);
            },
          ),
          Divider(height: 5,),

          ListTile(
            title: Text('about us', style: _textStyle).tr(),
            leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Icon(Feather.info, size: 20, color: Colors.white),
            ),
            trailing: Icon(Feather.chevron_right, size: 20,),
            onTap: ()async{
              launch(Config().ourWebsiteUrl);
            },
          ),
        ],
      )
      
      
    );
  }

  

  @override
  bool get wantKeepAlive => true;
}


class GuestUserUI extends StatelessWidget {
  const GuestUserUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextStyle _textStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.grey[900]
    );


    return Column(
      children: [
        ListTile(
            title: Text('login', style: _textStyle,).tr(),
            leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Icon(Feather.user, size: 20, color: Colors.white),
            ),
            trailing: Icon(Feather.chevron_right, size: 20,),
            onTap: ()=> nextScreenPopup(context, SignInPage(tag: 'popup',)),
          ),
        SizedBox(height: 20,),
      ],
    );
  }
}


class UserUI extends StatelessWidget {
  const UserUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sb = context.watch<SignInBloc>();
    TextStyle _textStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.grey[900]
    );
    return Column(
      children: [
        Container(
          height: 200,
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[300],
                backgroundImage: CachedNetworkImageProvider(sb.imageUrl)
              ),
              SizedBox(height: 10,),
              Text(sb.name, style: TextStyle(
                fontSize: 18
              ),)
            ],
          ),
        ),

        ListTile(
            title: Text(sb.email, style: _textStyle,),
            leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Icon(Feather.mail, size: 20, color: Colors.white),
            ),
          ),
          Divider(height: 5,),

          ListTile(
            title: Text(sb.joiningDate, style: _textStyle,),
            leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Icon(LineIcons.dashboard, size: 20, color: Colors.white),
            ),
          ),
          Divider(height: 5,),

          ListTile(
            title: Text('edit profile', style: _textStyle,).tr(),
            leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Icon(Feather.edit_3, size: 20, color: Colors.white),
            ),
            trailing: Icon(Feather.chevron_right, size: 20,),
            onTap: ()=> nextScreen(context, EditProfile(name: sb.name, imageUrl: sb.imageUrl))
          ),

          Divider(height: 5,),

          ListTile(
            title: Text('logout', style: _textStyle,).tr(),
            leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Icon(Feather.log_out, size: 20, color: Colors.white),
            ),
            trailing: Icon(Feather.chevron_right, size: 20,),
            onTap: ()=> openLogoutDialog(context),
          ),



          SizedBox(height: 15,)
        

      ],
    );
  }


  void openLogoutDialog (context) {
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('logout title').tr(),
          actions: [
            FlatButton(
              child: Text('no').tr(),
              onPressed: ()=> Navigator.pop(context),
            ),
            FlatButton(
              child: Text('yes').tr(),
              onPressed: ()async{
                Navigator.pop(context);
                await context.read<SignInBloc>().userSignout()
                .then((value) => nextScreenCloseOthers(context, SignInPage()));
                
                
              },
            )
          ],
        );
      }
    );
  }
}