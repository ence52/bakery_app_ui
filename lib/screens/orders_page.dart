import 'package:bakery_app_ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _createAppbar(context),
        body: const Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: TabBarView(
            children: [
              _ActiveOrdersTab(),
              _CompletedOrdersTab(),
              _CancelledOrdersTab()
            ],
          ),
        ),
      ),
    );
  }

  AppBar _createAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border:
                Border.all(color: Colors.grey.withOpacity(0.5), width: 1.5)),
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      elevation: 0,
      centerTitle: true,
      title: Text(
        "My Orders",
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      bottom: TabBar(
        overlayColor: WidgetStateColor.transparent,
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        indicatorPadding: EdgeInsets.only(
            top: 4.5.h, left: defaultPadding / 2, right: defaultPadding / 2),
        indicator: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
        labelStyle: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
        tabs: const [
          Tab(text: 'Active'),
          Tab(text: 'Completed'),
          Tab(text: 'Cancelled'),
        ],
      ),
    );
  }
}

class _ActiveOrdersTab extends StatelessWidget {
  const _ActiveOrdersTab();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => _ListItem(
        widgetColor: primaryColor,
        buttonWidget: Text(
          "Track Order",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: 4,
    );
  }
}

class _CompletedOrdersTab extends StatelessWidget {
  const _CompletedOrdersTab();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => _ListItem(
        widgetColor: Colors.green[300]!,
        buttonWidget: Icon(
          Icons.check,
          color: Colors.white,
          size: 16.sp,
        ),
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: 4,
    );
  }
}

class _CancelledOrdersTab extends StatelessWidget {
  const _CancelledOrdersTab();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => _ListItem(
        widgetColor: Colors.red,
        buttonWidget: Icon(
          Icons.cancel_outlined,
          color: Colors.white,
          size: 16.sp,
        ),
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: 4,
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    required this.buttonWidget,
    required this.widgetColor,
  });
  final Widget buttonWidget;
  final Color widgetColor;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(defaultBorderRadiusCircular),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://www.foodandwine.com/thmb/H9NS3GaVp-2XHt6wbPtrhwh0bws=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Black-Forest-Cake-FT-RECIPE0623-29bb291902e845bab17a7fc1d65e4ebb.jpg"))),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: defaultPadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Chocolate Cake",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "Cake | Qty: 2pcs",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.grey, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "\$50.00",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AspectRatio(
                  aspectRatio: 3,
                  child: Container(
                    decoration: BoxDecoration(
                        color: widgetColor,
                        borderRadius: BorderRadius.circular(
                            defaultBorderRadiusCircular * 2)),
                    child: Center(
                      child: buttonWidget,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
