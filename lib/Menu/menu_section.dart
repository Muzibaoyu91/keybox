import 'package:flutter/material.dart';

class MenuSection extends StatefulWidget {
  final String themeStr;
  final String nameStr;
  final String keyStr;
  final String assetId;
  final bool isActive;

  MenuSection(this.themeStr, this.nameStr, this.keyStr, this.isActive,
      {this.assetId, Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SectionState();
  }
}

class _SectionState extends State<MenuSection>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  static final Animatable<double> _sizeTween = Tween<double>(
    begin: 0.0,
    end: 1.0,
  );

  Animation<double> _sizeAnimation;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    final CurvedAnimation curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );

    _sizeAnimation = _sizeTween.animate(curve);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });

    switch (_sizeAnimation.status) {
      case AnimationStatus.completed:
        {
          _controller.reverse();
          break;
        }
      case AnimationStatus.dismissed:
        {
          _controller.forward();
          break;
        }
      case AnimationStatus.reverse:
      case AnimationStatus.forward:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Container _icon = Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.blue[400]),
      child: Text(
        'G',
        style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );

    Container _mainTitle = Container(
      width: 250,
      height: 30,
      child: Text('Gmail', style: TextStyle(fontSize: 20, color: Colors.black)),
    );

    Container _subTitle = Container(
      width: 250,
      height: 25,
      alignment: Alignment.topLeft,
      child: Text('pierrebaoy@gmail.com',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black54,
          )),
    );

    return GestureDetector(
      onTap: _toggleExpand,
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: <Widget>[
                        _icon,
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: <Widget>[
                        _mainTitle,
                        _subTitle,
                      ],
                    )
                  ],
                ),
              ),
              SizeTransition(
                axisAlignment: 0.0,
                axis: Axis.vertical,
                sizeFactor: _sizeAnimation,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 56, right: 20, top: 10),
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[Text('我是密码')],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
