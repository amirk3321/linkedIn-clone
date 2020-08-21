import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:linkedin_clone/repository/repository.dart';
import 'package:linkedin_clone/screen/pages/web/widget/common.dart';
import 'package:linkedin_clone/screen/widgets/style/theme.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CenterWidget extends StatefulWidget {
  final SizingInformation sizingInformation;

  const CenterWidget({Key key, this.sizingInformation}) : super(key: key);

  @override
  _CenterWidgetState createState() => _CenterWidgetState();
}

class _CenterWidgetState extends State<CenterWidget> {
  List<bool> _rowButtonHover = [
    false,
    false,
    false,
    false,
  ];
  bool _startPostHover = false;
  bool _isLoadMore = false;
  final _postData = FakeRepository.postList;
  bool _hashTagHover = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 640,
      child: Column(
        children: [
          _startPostWidget(),
          SizedBox(
            width: 10,
          ),
          _sortByWidget(),
          _isLoadMore
              ? Container(
                  width: 40,
                  height: 40,
                  child: Image.asset("assets/loading.gif"),
                )
              : Column(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    _listOfPostWidget(),
                    _loadMoreButtonWidget(),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _startPostWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0.5, 0.5),
          ),
        ],
        border: Border.all(color: Colors.black87, width: 0.50),
      ),
      child: Column(
        children: [
          _startAPostRowWidget(),
          Divider(
            thickness: 0.50,
            color: Colors.black38,
          ),
          _rowButtonWidget(),
        ],
      ),
    );
  }

  Widget _startAPostRowWidget() {
    return InkWell(
      onTap: () {
        _postPopUp();
      },
      onHover: (hover) {
        setState(() {
          _startPostHover = hover ? true : false;
        });
      },
      child: Container(
        height: 45,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 9),
        margin: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 0),
        color:
            _startPostHover ? Colors.black.withOpacity(.1) : Colors.transparent,
        child: Row(
          children: [
            Container(
              height: 25,
              width: 25,
              child: Image.asset('assets/icons/edit_icon.jpg'),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Start a post",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowButtonWidget() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            onHover: (hover) {
              setState(() {
                _rowButtonHover[0] = hover ? true : false;
              });
            },
            child: rowSingleButton(
              name: "Photo",
              iconImage: "assets/icons/camera_icon.png",
              color: Colors.blueAccent,
              isHover: _rowButtonHover[0],
            ),
          ),
          InkWell(
            onTap: () {},
            onHover: (hover) {
              setState(() {
                _rowButtonHover[1] = hover ? true : false;
              });
            },
            child: rowSingleButton(
              name: "Video",
              iconImage: "assets/icons/add_video.png",
              color: Colors.blueAccent,
              isHover: _rowButtonHover[1],
            ),
          ),
          InkWell(
            onTap: () {},
            onHover: (hover) {
              setState(() {
                _rowButtonHover[2] = hover ? true : false;
              });
            },
            child: rowSingleButton(
              name: "Document",
              iconImage: "assets/icons/document_icon.png",
              color: Colors.deepPurpleAccent,
              isHover: _rowButtonHover[2],
            ),
          ),
          InkWell(
            onTap: () {},
            onHover: (hover) {
              setState(() {
                _rowButtonHover[3] = hover ? true : false;
              });
            },
            child: rowSingleButton(
              name: "Write article",
              iconImage: "assets/icons/wirte_article_icon.png",
              color: Colors.deepOrangeAccent,
              isHover: _rowButtonHover[3],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sortByWidget() {
    return Container(
      child: Row(
        children: [
          _rowDivider(thickness: 0.80),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Text("Sort by:"),
                Text(
                  "Top",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          )
        ],
      ),
    );
  }

  _rowDivider({double thickness}) {
    return Container(
      width: 530,
      height: thickness,
      decoration: BoxDecoration(color: Colors.black38),
    );
  }

  Widget _listOfPostWidget() {
    return Container(
      child: ListView.builder(
        itemCount: _postData.length,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return _singlePostItem(index);
        },
      ),
    );
  }

  Widget _singlePostItem(int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black87, width: 0.50),
          color: Colors.white),
      child: Column(
        children: [
          _headerPost(index),
          _descriptionImageWidget(index),
        ],
      ),
    );
  }

  Widget _headerPost(int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: ClipRRect(
                    child: Image.asset(_postData[index].profileUrl),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_postData[index].name),
                    Container(
                      width: 530,
                      child: Text(
                        _postData[index].headline,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(.4),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.more_horiz)
        ],
      ),
    );
  }

  Widget _descriptionImageWidget(int index) {
    return Container(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(_postData[index].description),
          SizedBox(
            height: 5,
          ),
          Text(
            _postData[index].tags,
            style: TextStyle(color: blueColor),
          ),
          SizedBox(
            height: 10,
          ),
          _postData[index].isVideoPost == true
              ? Container()
              : Container(
                  height: 500,
                  width: 600,
                  child: Image.asset(
                    _postData[index].image,
                    fit: BoxFit.contain,
                  ),
                ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                width: 25,
                height: 25,
                child: Image.asset('assets/icons/like_icon.png'),
              ),
              Container(
                width: 25,
                height: 25,
                child: Image.asset('assets/icons/celebrate_icon.png'),
              ),
              if (index == 1 || index == 4 || index == 6)
                Container(
                  width: 25,
                  height: 25,
                  child: Image.asset('assets/icons/love_icon.png'),
                ),
              SizedBox(
                width: 4,
              ),
              Text(_postData[index].likes),
              Text(
                "⚫",
                style: TextStyle(fontSize: 10, color: Colors.blueGrey),
              ),
              Text(_postData[index].comments),
            ],
          ),
          _rowButtonsLikeCommentWidget(),
        ],
      ),
    );
  }

  _loadMoreButtonWidget() {
    return InkWell(
      onTap: () {
        setState(() {
          _isLoadMore = true;
        });
        Future.delayed(Duration(seconds: 4), () {
          setState(() {
            _isLoadMore = false;
          });
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white60,
            border: Border.all(color: Colors.blueGrey, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Text("Load More"),
      ),
    );
  }

  Widget _rowButtonsLikeCommentWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            onHover: (hover) {
              setState(() {
                _rowButtonHover[0] = hover ? true : false;
              });
            },
            child: _singleLikeCommentButtonWidget(
              color: Colors.black,
              iconImage: 'assets/icons/like_icon_white.png',
              name: "Like",
              isHover: _rowButtonHover[0],
            ),
          ),
          InkWell(
            onTap: () {},
            onHover: (hover) {
              setState(() {
                _rowButtonHover[1] = hover ? true : false;
              });
            },
            child: _singleLikeCommentButtonWidget(
              color: Colors.black,
              iconImage: 'assets/icons/comment_icon.png',
              name: "Comment",
              isHover: _rowButtonHover[1],
            ),
          ),
          InkWell(
            onTap: () {},
            onHover: (hover) {
              setState(() {
                _rowButtonHover[2] = hover ? true : false;
              });
            },
            child: _singleLikeCommentButtonWidget(
              color: Colors.black,
              iconImage: 'assets/icons/share_icon.png',
              name: "Share",
              isHover: _rowButtonHover[2],
            ),
          ),
          InkWell(
            onTap: () {},
            onHover: (hover) {
              setState(() {
                _rowButtonHover[3] = hover ? true : false;
              });
            },
            child: _singleLikeCommentButtonWidget(
              color: Colors.black,
              iconImage: 'assets/icons/sent_icon.png',
              name: "Send",
              isHover: _rowButtonHover[3],
            ),
          ),
        ],
      ),
    );
  }

  _singleLikeCommentButtonWidget(
      {String name, String iconImage, Color color, bool isHover}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      decoration: BoxDecoration(
          color: isHover ? Colors.black.withOpacity(.1) : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Row(
        children: [
          Container(
            width: 25,
            height: 25,
            child: Image.asset(
              iconImage,
              color: color,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void _postPopUp() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            content: Container(
              width: widget.sizingInformation.screenSize.width / 2.50,
              height: widget.sizingInformation.screenSize.height / 1.50,
              padding: EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: paddingH10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Create Post",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close)),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black38,
                    thickness: 0.80,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: paddingH10,
                    child: Row(
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.withOpacity(.4),
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            child: Image.asset('assets/profile.jpg'),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Amir khan",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black87, width: 1),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.filter_tilt_shift),
                                  Text(
                                    "Anyone",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: paddingH10,
                    child: Scrollbar(
                      child: TextField(
                        maxLines: 12,
                        decoration: InputDecoration(
                          hintText: "What do you want to talk about?",
                          border: InputBorder.none,
                          hintStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: paddingH10,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          onHover: (hover) {
                            _hashTagHover = hover ? true : false;
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                                color: _hashTagHover
                                    ? blueColor.withOpacity(.7)
                                    : Colors.transparent),
                            child: Text(
                              "Add hashtag",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: blueColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Help the right people see your post"),
                      ],
                    ),
                  ),
                  SizedBox(height: 8,),
                  _rowPostButtonsWidget(),
                ],
              ),
            ),
          );
        });
  }

  Widget _rowPostButtonsWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 10,right: 10,left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){},
            onHover: (hover){
              _rowButtonHover[0]=hover?true:false;
            },
            child: rowSinglePostButton(
              color: Colors.black,
              iconImage: "assets/icons/add_plus_icon.png",
              isHover: _rowButtonHover[0],
            ),
          ),
          InkWell(
            onTap: (){},
            onHover: (hover){
              _rowButtonHover[1]=hover?true:false;
            },
            child: rowSinglePostButton(
              color: Colors.black,
              iconImage: "assets/icons/camera_icon.png",
              isHover: _rowButtonHover[1],
            ),
          ),
          InkWell(
            onTap: (){},
            onHover: (hover){
              _rowButtonHover[2]=hover?true:false;
            },
            child: rowSinglePostButton(
              color: Colors.black,
              iconImage: "assets/icons/add_video.png",
              isHover: _rowButtonHover[2],
            ),
          ),
          InkWell(
            onTap: (){},
            onHover: (hover){
              _rowButtonHover[3]=hover?true:false;
            },
            child: rowSinglePostButton(
              color: Colors.black,
              iconImage: "assets/icons/document_icon.png",
              isHover: _rowButtonHover[3],
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 4),
              decoration: BoxDecoration(
                color: blueColor,
              ),
              child: Text("Post",style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }

}
