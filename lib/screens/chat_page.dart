import 'package:bakery_app_ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: _createAppbar(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: TextField(
                decoration: InputDecoration(
                    hintText: "Search Seller",
                    hintStyle: Theme.of(context)
                        .inputDecorationTheme
                        .hintStyle!
                        .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w700),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 18.sp,
                    ))),
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.only(
                    top: defaultPadding,
                    left: defaultPadding,
                    right: defaultPadding),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(defaultBorderRadiusCircular * 2),
                        topRight:
                            Radius.circular(defaultBorderRadiusCircular * 2))),
                child: SizedBox(
                  height: 75.h,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (context, index) => const _ChatBox(),
                    itemCount: 10,
                  ),
                )),
          )
        ],
      ),
    );
  }

  AppBar _createAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 0,
      centerTitle: true,
      leading: InkWell(
        splashColor: Colors.transparent,
        onTap: () => Navigator.pop(context),
        child: Container(
          margin: const EdgeInsets.all(defaultPadding * 0.3),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(1000)),
          child: const Icon(
            Icons.arrow_back,
            color: primaryColor,
          ),
        ),
      ),
      title: Text(
        "Chat",
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

class _ChatBox extends StatelessWidget {
  const _ChatBox();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 6,
      child: Container(
        padding: const EdgeInsets.all(defaultPadding * 0.35),
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(defaultBorderRadiusCircular / 2),
            border: Border.all(color: Colors.grey.withOpacity(0.3))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 1,
              child: Center(
                child: CircleAvatar(
                  foregroundImage:
                      NetworkImage("https://avatar.iran.liara.run/public/1"),
                  radius: 25,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Carla Schoen",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Perfect, will check it",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.grey.withOpacity(0.8),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Text(
                  "09:43 PM",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.grey.withOpacity(0.9),
                      fontWeight: FontWeight.w700),
                ))
          ],
        ),
      ),
    );
  }
}
