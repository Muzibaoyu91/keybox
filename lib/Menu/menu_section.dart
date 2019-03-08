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
    return GestureDetector(
      onTap: _toggleExpand,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blue[300]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.yellow,
                    ),
                    Column(
                      children: <Widget>[
                        Text('主标题主标题主标题'),
                        Text('fubiaotifubiaotifubiaoti')
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
