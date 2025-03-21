import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:blogclub/data.dart';
import 'package:blogclub/home.dart';
class Profile extends StatelessWidget {
   Profile({super.key});

final posts = AppDatabase.posts;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
     
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text('Profile', style: theme.textTheme.titleLarge),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
          const SizedBox(width: 16),
        ],
      ),
          body: SingleChildScrollView(
            child: Column(
                    children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 34),
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Assets.img.stories.story4.image(
                                  width: 67,
                                  height: 67,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 24),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '@joviedan',
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Jovi Daniel',
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'UX Designer',
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'About me',
                            style: theme.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                          ),
                          const SizedBox(height: 28),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
              
                  child: Container(
                    width: 171,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.shadow,
                          blurRadius: 10,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 231,
                    height: 68,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "52",
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                              Text(
                                "Post",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "250",
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                              Text(
                                "Following",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "2.5K",
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                              Text(
                                "Followers",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
                   child: Row(
                    children: [
                      Expanded(child: Text("My Posts", style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500,fontSize: 20))),
                      Icon(Icons.view_stream_outlined,color: theme.colorScheme.primary,),
                      const SizedBox(width: 16),
                      Icon(Icons.menu_outlined,color: theme.colorScheme.primary,),
                    ],
                   ),
                 ),
                 PostList(posts: posts)
                ],
              ),
            )
                    ],
                  ),
          ),
    ); 
  }
}
