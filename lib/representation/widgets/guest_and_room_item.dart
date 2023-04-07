import 'package:flutter/material.dart';
import 'package:travel_app_ui/core/constants/dismention_constants.dart';
import 'package:travel_app_ui/core/helpers/assets_helper.dart';

class GuestAndRoomItem extends StatefulWidget {
  GuestAndRoomItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.content});

  final String icon;
  final String title;
  int content;

  @override
  State<GuestAndRoomItem> createState() => _GuestAndRoomItemState();
}

class _GuestAndRoomItemState extends State<GuestAndRoomItem> {
  late final TextEditingController _textEditingController;
  final FocusNode _focusNode = FocusNode();
  late int number;

  @override
  void initState() {
    super.initState();
    number = widget.content;
    _textEditingController =
        TextEditingController(text: widget.content.toString());
    _textEditingController.addListener(() {
      number = int.tryParse(_textEditingController.text) ?? 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(kTopPadding),
          ),
          color: Colors.white),
      child: Row(
        children: [
          Image.asset(
            widget.icon,
            width: 30,
            height: 30,
          ),
          const SizedBox(
            width: kDefaultPadding,
          ),
          Text(
            widget.title,
          ),
          const Spacer(),
          GestureDetector(
              onTap: () {
                if (number == 1) {
                  return;
                }
                number--;

                _textEditingController.text = number.toString();
                if (_focusNode.hasFocus) {
                  _focusNode.unfocus();
                }
              },
              child: Image.asset(AssetsHelper.icoDecrese)),
          Container(
            height: 35,
            width: 60,
            padding: const EdgeInsets.only(left: 3),
            alignment: Alignment.center,
            child: TextField(
              controller: _textEditingController,
              focusNode: _focusNode,
              textAlign: TextAlign.center,
              enabled: true,
              autocorrect: false,
              minLines: 1,
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(bottom: 18),
              ),
              onChanged: (value) {},
              onSubmitted: (value) {},
            ),
          ),
          GestureDetector(
              onTap: () {
                number++;

                _textEditingController.text = number.toString();
                if (_focusNode.hasFocus) {
                  _focusNode.unfocus();
                }
              },
              child: Image.asset(AssetsHelper.icoIncrese)),
        ],
      ),
    );
  }
}
