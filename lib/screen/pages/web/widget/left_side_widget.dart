import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin_clone/model/group_model.dart';
import 'package:linkedin_clone/repository/repository.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LeftSideWidget extends StatefulWidget {
  final SizingInformation sizingInformation;

  const LeftSideWidget({Key key, this.sizingInformation}) : super(key: key);

  @override
  _LeftSideWidgetState createState() => _LeftSideWidgetState();
}

class _LeftSideWidgetState extends State<LeftSideWidget> {
  final _user =FakeRepository.userProfile;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 221,
      child: Column(
        children: [
          _headerWidget(),
          SizedBox(height: 10,),
          _groupRecentWidget(),
        ],
      ),
    );
  }

  Widget _headerWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0.5, 0.5))
      ]),
      child: Stack(
        children: [
          Container(
            height: 65,
            decoration: BoxDecoration(color: Colors.red),
            child: Image.asset(
              'assets/profile_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        offset: Offset(1.0, 1.0),
                        spreadRadius: 1,
                        blurRadius: 1)
                  ]),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Image.asset('assets/profile.jpg')),
            ),
          ),
          Align(
            child: Container(
              margin: EdgeInsets.only(top: 110),
              child: Column(
                children: [
                  Text(_user.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  Text(_user.headline,textAlign: TextAlign.center,style: TextStyle(fontSize: 12)),
                  SizedBox(height: 10,),
                  Divider(
                    thickness: 0.50,
                    color: Colors.black38,
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Who viewed your profile",style: TextStyle(fontSize: 12),),
                        Text(_user.viewProfile,style: TextStyle(fontSize: 12),),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Connection",style: TextStyle(fontSize: 12),),
                            Text("Manage your network",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Text(_user.connections,style: TextStyle(fontSize: 12),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Divider(
                    thickness: 0.50,
                    color: Colors.black38,
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 5,),
                      Icon(Icons.bookmark_border),
                      SizedBox(width: 5,),
                      Text("Saved items"),
                    ],
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _groupRecentWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0.5, 0.5))
      ]),
      child:  Column(
        children: [
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: FakeRepository.recentData.length,
              itemBuilder: (BuildContext context, int index) {
                return ExpandedListTile(groupModel:
                  FakeRepository.recentData[index]
                );
              },),
          ),
          SizedBox(height: 10,),
          Divider(thickness: 0.50,color: Colors.black38,),
          Container(
            alignment: Alignment.center,
            child: Text("Discover more"),
          ),
          SizedBox(height: 15,),
        ],
      ),
    );
  }
}
class  ExpandedListTile extends StatelessWidget{
  final GroupModel groupModel;

  const ExpandedListTile({Key key, this.groupModel}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return _buildTiles(groupModel);
  }

  Widget _buildTiles(GroupModel groupModel) {
    if (groupModel.children.isEmpty){
      return ListTile(
        title: Text(groupModel.title,style: TextStyle(fontSize: 12,color: Colors.black),),
        leading: Icon(FontAwesomeIcons.userFriends),
      );
    }
    return Theme(
      data: ThemeData(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        key: PageStorageKey<GroupModel>(groupModel),
        title: Text(groupModel.title,style: TextStyle(fontSize: 12,color: Colors.black),),
        children: groupModel.children.map<Widget>(_buildTiles).toList(),
      ),
    );
  }

}