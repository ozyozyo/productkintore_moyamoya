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
    var provider = ref.watch(fetchAllMoyamoyaProvider);

    final searchController = useTextEditingController();
    final searchResult = useState<List<Moyamoya>>([]);

    useEffect(() {
      searchController.addListener(() {
        if (searchController.text.isEmpty) {
          searchResult.value = [];
        } else {
          final result = moyamoyaList.value
              .where((moyamoya) => moyamoya.moyamoya
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()))
              .toList();
          searchResult.value = result;
        }
      });

      return () {
        searchController.dispose();
      };
    }, []);
    provider.when(
        data: (data) {
          moyamoyaList.value.addAll(data);
        },
        error: (e, s) {
          print(e);
        },
        loading: () {});

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: "Search...",
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
          ),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: searchResult.value.length != 0 || searchController.text.isNotEmpty
          ? ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(height: 0.5);
              },
              itemCount: searchResult.value.length,
              itemBuilder: (BuildContext context, int index) {
                var text = searchResult.value[index].moyamoya;
                return ListTile(
                  subtitle: Text(
                      text.substring(0, Math.min(200, text.length)) + "..."),
                  onTap: () {
                    Navigator.pushNamed(context,
                        "/moyamoyaDetail?ts=" + searchResult.value[index].ts,
                        arguments: searchResult.value[index]);
                  },
                );
              },
            )
          : ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(height: 0.5);
              },
              itemCount: moyamoyaList.value.length,
              itemBuilder: (BuildContext context, int index) {
                var text = moyamoyaList.value[index].moyamoya;
                return ListTile(
                  subtitle: Text(
                      text.substring(0, Math.min(200, text.length)) + "..."),
                  onTap: () {
                    Navigator.pushNamed(context,
                        "/moyamoyaDetail?ts=" + moyamoyaList.value[index].ts,
                        arguments: moyamoyaList.value[index]);
                  },
                );
              },
            ),
    );
  }
}
