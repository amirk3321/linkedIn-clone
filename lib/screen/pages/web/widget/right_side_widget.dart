import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin_clone/repository/repository.dart';
import 'package:linkedin_clone/screen/widgets/style/theme.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RightSideWidget extends StatefulWidget {
  final SizingInformation sizingInformation;

  const RightSideWidget({Key key, this.sizingInformation}) : super(key: key);

  @override
  _RightSideWidgetState createState() => _RightSideWidgetState();
}

class _RightSideWidgetState extends State<RightSideWidget> {
  final _companyData = FakeRepository.companyListData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      child: Column(
        children: [
          _headerWidget(),
          SizedBox(
            height: 10,
          ),
          _adWidget(),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 1.50,
            color: Colors.black.withOpacity(.2),
          ),
          SizedBox(
            height: 10,
          ),
          _optionButtonsWidget(),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _headerWidget() {
    return Container(
      padding: EdgeInsets.all(10),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add to your feed",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Icon(Icons.help_outline)
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: ListView.builder(
              itemCount: _companyData.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: Colors.grey.withOpacity(.5)),
                              child: _companyData[index].profileUrl == ""
                                  ? Icon(FontAwesomeIcons.user)
                                  : ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      child: Image.asset(
                                        _companyData[index].profileUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_companyData[index].name),
                                Text(_companyData[index].description),
                              ],
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: blueColor, width: 0.50)),
                          child: Text("+ Follow"),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            child: Text(
              "View all recommendations",
              style: TextStyle(
                fontSize: 16,
                color: blueColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _adWidget() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.2),
              blurRadius: 1,
              spreadRadius: 1,
              offset: Offset(0.5, 0.5))
        ],
        border: Border.all(color: Colors.black87, width: 0.50),
      ),
      child: Image.asset('assets/icons/add_linkedIn.jpg'),
    );
  }

  Widget _optionButtonsWidget() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.center,
      children: [
        _text("About"),
        SizedBox(
          width: 10,
        ),
        _text("Accessibility"),
        SizedBox(
          width: 10,
        ),
        _text("Help Center"),
        SizedBox(
          width: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                _text("Privacy & Terms"),
                Icon(Icons.arrow_drop_down),
              ],
            ),
            _text("Ad Choices"),
            _text("Advertising"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                _text("Business Services"),
                Icon(Icons.arrow_drop_down),
              ],
            ),
            _text("Get the LinkedIn app"),
          ],
        ),
        _text("more"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              child: Image.asset('assets/icons/linkedInLoog.png'),
            ),
            _text("LinkedIn Corporation © 2020")
          ],
        )
      ],
    );
  }

  Widget _text(String text) => InkWell(
        onTap: () {},
        child: Text(text),
      );
}
