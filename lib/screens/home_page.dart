import 'package:bakery_app_ui/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _AppBarSection(),
          _SpecialOffersSection(),
          _AdSection(),
          _CategoriesSection(),
          _CategoriesIconSection(),
          _FeaturedProductsSection(),
          _FeaturedProductsCardsSection(),
        ],
      ),
    );
  }
}

class _FeaturedProductsCardsSection extends StatelessWidget {
  const _FeaturedProductsCardsSection();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 22.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            SizedBox(
              width: defaultPadding,
            ),
            _ProductCard(
              label: "Cake",
              price: 150,
              url:
                  "https://www.foodandwine.com/thmb/H9NS3GaVp-2XHt6wbPtrhwh0bws=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Black-Forest-Cake-FT-RECIPE0623-29bb291902e845bab17a7fc1d65e4ebb.jpg",
            ),
            _ProductCard(
              label: "Cookie",
              price: 60,
              url:
                  "https://www.foodandwine.com/thmb/4_UScMzHQCxZzACBITHHmT_EM3U=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Chocolate-Chunk-Halwah-Cookies-FT-RECIPE0923-1f8df755df6d468da98887aa846a2fe3.jpg",
            ),
            _ProductCard(
              label: "Bread",
              price: 20,
              url:
                  "https://www.seriouseats.com/thmb/LoXQL7Yp_uXxtipH8cCp_LGVg5E=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__recipes__images__2014__08__20140810-workhorse-bread-vicky-wasik-3-3a86ee51da2e4a7b8239ceb62d8d8d17.jpg",
            )
          ],
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.label,
    required this.url,
    required this.price,
  });
  final String label;
  final String url;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 2.h),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 50)
      ]),
      margin: EdgeInsets.only(right: 5.w),
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(defaultBorderRadiusCircular)),
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage(url)),
                          borderRadius: const BorderRadius.only(
                            topLeft:
                                Radius.circular(defaultBorderRadiusCircular),
                            topRight:
                                Radius.circular(defaultBorderRadiusCircular),
                          )),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              label,
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${price}TL",
                              style: TextStyle(fontSize: 11.sp),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding / 3,
                      vertical: defaultPadding / 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 6.w,
                        width: 12.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                defaultBorderRadiusCircular * 0.8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 11.sp,
                            ),
                            Text(
                              "4.8",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 9.sp),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 8.w,
                        width: 8.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.pink,
                          size: 16.sp,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _CategoriesIconSection extends StatelessWidget {
  const _CategoriesIconSection();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          height: 12.h,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _CategoryIconWidget(
                icon: Icons.cake,
                label: "Cake",
              ),
              _CategoryIconWidget(
                icon: Icons.cookie,
                label: "Cookies",
              ),
              _CategoryIconWidget(
                icon: Icons.donut_large,
                label: "Donuts",
              ),
              _CategoryIconWidget(
                icon: Icons.breakfast_dining,
                label: "Breads",
              ),
            ],
          )),
    );
  }
}

class _CategoryIconWidget extends StatelessWidget {
  const _CategoryIconWidget({
    required this.icon,
    required this.label,
  });
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12.h,
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: const ShapeDecoration(
                    shape: CircleBorder(), color: themeGrey),
                child: Icon(
                  icon,
                  size: 24.sp,
                ),
              ),
            ),
          ),
          Text(label)
        ],
      ),
    );
  }
}

class _CategoriesSection extends StatelessWidget {
  const _CategoriesSection();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        height: 6.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            Text(
              "See All",
              style: TextStyle(fontSize: 10.sp, color: primaryColor),
            )
          ],
        ),
      ),
    );
  }
}

class _FeaturedProductsSection extends StatelessWidget {
  const _FeaturedProductsSection();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        height: 6.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Featured Products",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            Text(
              "See All",
              style: TextStyle(fontSize: 10.sp, color: primaryColor),
            )
          ],
        ),
      ),
    );
  }
}

class _AdSection extends StatelessWidget {
  const _AdSection();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 5 / 2,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                  left: defaultPadding,
                  right: defaultPadding,
                  bottom: defaultPadding / 2),
              decoration: BoxDecoration(
                  color: themeTextColor,
                  borderRadius:
                      BorderRadius.circular(defaultBorderRadiusCircular * 2)),
            ),
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 2.w,
            alignment: WrapAlignment.center,
            children: [
              Container(
                width: 3.w,
                height: 3.w,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(50)),
              ),
              Container(
                width: 3.w,
                height: 3.w,
                decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(100),
                    borderRadius: BorderRadius.circular(50)),
              ),
              Container(
                width: 3.w,
                height: 3.w,
                decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(100),
                    borderRadius: BorderRadius.circular(50)),
              ),
              Container(
                width: 3.w,
                height: 3.w,
                decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(100),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _SpecialOffersSection extends StatelessWidget {
  const _SpecialOffersSection();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        height: 6.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Special Offers",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            Text(
              "See All",
              style: TextStyle(fontSize: 10.sp, color: primaryColor),
            )
          ],
        ),
      ),
    );
  }
}

class _AppBarSection extends StatelessWidget {
  const _AppBarSection();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
          margin: EdgeInsets.only(bottom: 2.h),
          padding: EdgeInsets.only(
              bottom: 2.h,
              top: 4.h,
              left: defaultPadding,
              right: defaultPadding),
          decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          height: 25.h,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _DropDownAndButtons(),
              _SearchAndFilter(),
            ],
          )),
    );
  }
}

class _DropDownAndButtons extends StatelessWidget {
  const _DropDownAndButtons();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _LeftSection(),
          _RightSection(),
        ],
      ),
    );
  }
}

class _SearchAndFilter extends StatelessWidget {
  const _SearchAndFilter();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      child: Row(
        children: [
          Expanded(
            child: TextField(
                style: TextStyle(fontSize: 10.sp),
                onChanged: (value) {},
                decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Icon(
                        CupertinoIcons.search,
                        size: 18.sp,
                      ),
                    ))),
          ),
          SizedBox(
            width: 2.w,
          ),
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(defaultBorderRadiusCircular)),
              width: 5.w,
              child: Icon(
                Icons.filter_alt,
                size: 18.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _RightSection extends StatelessWidget {
  const _RightSection();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        _AppBarIcon(
          icon: Icons.shopping_cart,
        ),
        _AppBarIcon(
          icon: Icons.notifications,
        ),
      ],
    );
  }
}

class _AppBarIcon extends StatelessWidget {
  const _AppBarIcon({
    required this.icon,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.5.w, top: 1.8.w, left: 2.w),
      child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(defaultBorderRadiusCircular),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20.sp,
            ),
          )),
    );
  }
}

class _LeftSection extends StatelessWidget {
  const _LeftSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Location",
            style: TextStyle(fontSize: 9.sp, color: themeTextColor)),
        const _DropDown()
      ],
    );
  }
}

class _DropDown extends StatelessWidget {
  const _DropDown();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: themeIconColor,
          size: 16.sp,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            icon: const Icon(
              CupertinoIcons.chevron_down,
              color: themeIconColor,
            ),
            dropdownColor: primaryColor,
            hint: Text(
              "New York,USA",
              style: TextStyle(color: themeTextColor, fontSize: 10.sp),
            ),
            onChanged: (value) => {},
            items: <String>['A', 'B', 'C']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
