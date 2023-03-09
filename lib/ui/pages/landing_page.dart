import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:learncoding/models/landing_page_list_model.dart';
import 'package:learncoding/models/programming_options_model.dart';
import 'package:learncoding/ui/widgets/gradient_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  _Header(theme: theme),
                  const SizedBox(height: 12),

                  // search input field
                  const _SerachTextField(),

                  // header
                  _LanguageHeader(theme: theme, btn: true),

                  const _ListOfProgrammingLanguages(),

                  const SizedBox(height: 12),

                  // header
                  _LanguageHeader(theme: theme, btn: false),

                  const SizedBox(height: 12),

                  AlignedGridView.count(
                      shrinkWrap: true,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      itemCount: homepageListData.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return _CardWidget(index: index, theme: theme);
                      })
                ]))
                // landing page header
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ListOfProgrammingLanguages extends StatefulWidget {
  const _ListOfProgrammingLanguages();

  @override
  State<_ListOfProgrammingLanguages> createState() =>
      _ListOfProgrammingLanguagesState();
}

class _ListOfProgrammingLanguagesState
    extends State<_ListOfProgrammingLanguages> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          ...ProgrammingOptionsModels.map((e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientBtn(
                  onPressed: () {
                    setState(() {
                      e.isPicked = !e.isPicked;
                    });
                  },
                  btnName: e.btnName,
                  isPcked: e.isPicked,
                  iconUrl: e.iconUrl,
                  defaultBtn: false,
                ),
              ))
        ],
      ),
    );
  }
}

class _SerachTextField extends StatelessWidget {
  const _SerachTextField();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search any course',
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: Colors.grey.shade400,
          border: InputBorder.none,
        ),
        onChanged: (val) {
          if (kDebugMode) print(val);
        },
      ),
    );
  }
}

class _LanguageHeader extends StatelessWidget {
  final ThemeData theme;
  final bool btn;
  const _LanguageHeader({required this.theme, required this.btn});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Popular languages',
            style: theme.textTheme.titleMedium
                ?.copyWith(color: Colors.grey.shade600),
          ),
          if (btn) TextButton(onPressed: () {}, child: const Text('See all'))
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final ThemeData theme;
  const _Header({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.menu,
          size: 28,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back',
              style: theme.textTheme.bodySmall?.copyWith(fontSize: 12),
            ),
            Text(
              'Akshay Mauray',
              style: theme.textTheme.bodyLarge
                  ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            if (kDebugMode) print('route to notification');
          },
          child: Stack(
            children: const [
              Icon(
                Icons.notifications_none_rounded,
                size: 28,
              ),
              Positioned(
                  top: 4,
                  right: 4,
                  child: CircleAvatar(
                    maxRadius: 5,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(maxRadius: 4),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

class _CardWidget extends StatelessWidget {
  final int index;
  final ThemeData theme;
  const _CardWidget({required this.index, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                color: Colors.grey.shade300,
                spreadRadius: -6,
                offset: const Offset(-1, 8))
          ]),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10)),
            child: CachedNetworkImage(
              imageUrl: homepageListData[index].imageUrl,
              height: 70,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Text(
              homepageListData[index].title,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: homepageListData[index].icon,
                      height: 24,
                      width: 24,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      homepageListData[index].level,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      homepageListData[index].hours,
                      style: theme.textTheme.bodySmall,
                    ),
                    Icon(
                      Icons.timer_sharp,
                      size: 16,
                      color: Colors.grey.shade400,
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Color(0xffFCEA2B),
                    ),
                    Text(
                      '${homepageListData[index].rating}',
                      style: theme.textTheme.bodySmall?.copyWith(fontSize: 10),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    if (kDebugMode) print('route to enroll');
                  },
                  child: Row(
                    children: [
                      Text(
                        'Enroll Now',
                        style:
                            theme.textTheme.bodySmall?.copyWith(fontSize: 12),
                      ),
                      const SizedBox(width: 4),
                      const CircleAvatar(
                        backgroundColor: Color.fromARGB(80, 38, 175, 255),
                        maxRadius: 10,
                        child: Icon(
                          Icons.arrow_forward,
                          size: 14,
                          color: Color(0xff26B0FF),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
