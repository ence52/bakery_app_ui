import 'package:bakery_app_ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CustomScrollView(
          slivers: [
            const _ImageSection(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _NameAndRatingSection(),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    const _TitleSection(),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      "Seller",
                      style: Theme.of(context).textTheme.bodyMedium!,
                    ),
                    const _SellerSection(),
                    Text(
                      "Description",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Select Weight",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    const _AttributesSection(),
                    SizedBox(
                      height: 10.h,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        const _Buttons(),
        const _AddToCartSection()
      ]),
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    return Text(
      "Chocolate Cake",
      style: Theme.of(context)
          .textTheme
          .headlineSmall!
          .copyWith(fontWeight: FontWeight.w600),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
          height: 5.h,
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          margin: const EdgeInsets.only(top: defaultPadding * 1.5),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                icon: Icons.arrow_back,
              ),
              Row(
                children: [
                  CustomIconButton(
                    icon: Icons.favorite_border_outlined,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomIconButton(
                    icon: Icons.share_outlined,
                  ),
                ],
              )
            ],
          )),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50)),
        child: Icon(icon),
      ),
    );
  }
}

class _AttributesSection extends StatelessWidget {
  const _AttributesSection();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.h,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _AttributeButton(
            isActive: true,
            label: "0.5kg",
          ),
          _AttributeButton(
            isActive: false,
            label: "1kg",
          ),
          _AttributeButton(
            isActive: false,
            label: "1.5kg",
          ),
          _AttributeButton(
            isActive: false,
            label: "2kg",
          ),
          _AttributeButton(
            isActive: false,
            label: "2.5kg",
          ),
        ],
      ),
    );
  }
}

class _AddToCartSection extends StatelessWidget {
  const _AddToCartSection();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 10.h,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(defaultBorderRadiusCircular),
                topRight: Radius.circular(defaultBorderRadiusCircular))),
        child: Padding(
          padding: EdgeInsets.only(
              left: defaultPadding,
              right: defaultPadding,
              bottom: 3.h,
              top: 1.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total Price",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontWeight: FontWeight.w300,
                              color: Colors.grey,
                              fontSize: 11.sp),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "\$25.00",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontSize: 10.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(
                          defaultBorderRadiusCircular * 2)),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                        size: 18.sp,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Add To Cart",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      )
                    ],
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _AttributeButton extends StatelessWidget {
  const _AttributeButton({
    required this.label,
    required this.isActive,
  });
  final String label;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: isActive
                ? Border.all(color: Colors.transparent)
                : Border.all(width: 1, color: Colors.grey),
            color: isActive ? primaryColor : Colors.white,
            borderRadius:
                BorderRadius.circular(defaultBorderRadiusCircular / 2)),
        child: Center(
            child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: isActive ? Colors.white : Colors.black),
        )),
      ),
    );
  }
}

class _SellerSection extends StatelessWidget {
  const _SellerSection();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage:
                    NetworkImage("https://avatar.iran.liara.run/public/92"),
                radius: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jenny Wilson",
                    style: TextStyle(fontSize: 9.sp, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Cook",
                    style: TextStyle(fontSize: 8.sp, color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          const Row(
            children: [
              _CustomIcon(
                icon: Icons.chat,
              ),
              _CustomIcon(
                icon: Icons.phone,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _CustomIcon extends StatelessWidget {
  const _CustomIcon({
    required this.icon,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 20, left: 20),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration:
              const ShapeDecoration(shape: CircleBorder(), color: themeGrey),
          child: Icon(
            icon,
            size: 16.sp,
          ),
        ),
      ),
    );
  }
}

class _NameAndRatingSection extends StatelessWidget {
  const _NameAndRatingSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Cake",
          style: Theme.of(context).textTheme.titleLarge!,
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.orange[200],
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "4.9",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600, color: Colors.grey[600]),
            )
          ],
        )
      ],
    );
  }
}

class _ImageSection extends StatelessWidget {
  const _ImageSection();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 45.h,
        child: Stack(children: [
          SizedBox(
            width: double.infinity,
            height: 45.h,
            child: const Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://www.foodandwine.com/thmb/H9NS3GaVp-2XHt6wbPtrhwh0bws=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Black-Forest-Cake-FT-RECIPE0623-29bb291902e845bab17a7fc1d65e4ebb.jpg")),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(1.w),
              margin: EdgeInsets.only(
                  bottom: defaultPadding / 2, left: 16.w, right: 16.w),
              height: 8.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(defaultBorderRadiusCircular / 2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(
                                defaultBorderRadiusCircular / 2)),
                      )),
                  AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(
                                defaultBorderRadiusCircular / 2)),
                      )),
                  AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(
                                defaultBorderRadiusCircular / 2)),
                      )),
                  AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(
                                defaultBorderRadiusCircular / 2)),
                      )),
                  AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(
                                defaultBorderRadiusCircular / 2)),
                      )),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
