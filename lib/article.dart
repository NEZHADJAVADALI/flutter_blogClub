import 'package:flutter/material.dart';
import 'package:blogclub/gen/assets.gen.dart';

class Article extends StatelessWidget {
  const Article({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 111,
        height: 48,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.thumb_up_outlined),
              const SizedBox(width: 4),
              Text('2.1K'),
            ],
          ),
        ),
      ),
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ), //title: Text('Test'),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Four Things Every Woman Needs To Know',
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Assets.img.stories.story1.image(
                          width: 38,
                          height: 38,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Richard Gervain',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '2m ago',
                              style: theme.textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share_outlined,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark_border,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32, top: 32),
                  child: Assets.img.background.article.image(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                  child: Text(
                    "A man's sexuality is never your mind responsibility.",
                    style: theme.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                  child: Text(
                    "This one got an incredible amount of backlash the last time I said it, so I'm going to say it again: a man's sexuality is never, ever your responsibility, under any circumstances. Whether it's the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn't whether you ought to \"take care of him\" or \"put out\" because it's been a while or he's really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.",
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ],
        ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 116,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffFAFBFF), Color(0x1aF9FAFF),],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          ]),
    );
  }
}
