import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:productkintore/entity/moyamoya.dart';
import 'package:productkintore/provider/moyamoya_provider.dart';
import 'dart:math' as Math;

class MoyamoyaScreen extends HookConsumerWidget with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var moyamoyaList = useState<List<Moyamoya>>([]);
    if (moyamoyaList.value.isEmpty) {
      var provider = ref.watch(fetchAllMoyamoyaProvider);
      provider.when(
          data: (data) {
            moyamoyaList.value.addAll(data);
          },
          error: (e, s) {
            print(e);
          },
          loading: () {});
    }

    final searchController = useTextEditingController();
    final searchResult = useState<List<Moyamoya>>([]);

    useEffect(() {
      searchController.addListener(() {
        if (searchController.text.isEmpty) {
          searchResult.value = [];
        } else {
          final keywords = searchController.text.split(" ");
          final result = moyamoyaList.value.where((moyamoya) {
            bool match = true;
            for (final keyword in keywords) {
              if (!moyamoya.moyamoya
                  .toLowerCase()
                  .contains(keyword.toLowerCase())) {
                match = false;
                break;
              }
            }
            return match;
          }).toList();
          searchResult.value = result;
          FirebaseAnalytics.instance.logEvent(
            name: 'moyamoya_search',
            parameters: <String, dynamic>{
              'keyword': keywords.join(","),
            },
          );
        }
      });

      return () {
        searchController.dispose();
      };
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: "Search...",
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: searchResult.value.isNotEmpty || searchController.text.isNotEmpty
          ? ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(height: 0.5);
              },
              itemCount: searchResult.value.length,
              itemBuilder: (BuildContext context, int index) {
                var text = searchResult.value[index].moyamoya;
                return ListTile(
                  title: Text(
                      "${text.substring(0, Math.min(200, text.length))}..."),
                  subtitle: Text(
                      "コメント数: ${searchResult.value[index].comments.length}, 投稿日: ${searchResult.value[index].createdAt}"),
                  onTap: () {
                    Navigator.pushNamed(context,
                        "/moyamoyaDetail?ts=${searchResult.value[index].ts}",
                        arguments: searchResult.value[index]);
                  },
                );
              },
            )
          : ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(height: 0.5);
              },
              itemCount: moyamoyaList.value.length,
              itemBuilder: (BuildContext context, int index) {
                var text = moyamoyaList.value[index].moyamoya;
                return ListTile(
                  title: Text(
                      "${text.substring(0, Math.min(200, text.length))}..."),
                  subtitle: Text(
                      "コメント数: ${moyamoyaList.value[index].comments.length}, 投稿日: ${moyamoyaList.value[index].createdAt}"),
                  onTap: () {
                    Navigator.pushNamed(context,
                        "/moyamoyaDetail?ts=${moyamoyaList.value[index].ts}",
                        arguments: moyamoyaList.value[index]);
                  },
                );
              },
            ),
    );
  }
}
