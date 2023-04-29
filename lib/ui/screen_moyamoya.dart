import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:productkintore/entity/moyamoya.dart';
import 'package:productkintore/provider/moyamoya_provider.dart';
import 'dart:math' as Math;

class MoyamoyaScreen extends HookConsumerWidget with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var moyamoyaList = useState(<Moyamoya>[]);
    var provider = ref.watch(fetchAllMoyamoyaProvider);
    provider.when(
        data: (data) {
          moyamoyaList.value.addAll(data);
        },
        error: (e, s) {
          print(e);
        },
        loading: () {});

    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(height: 0.5);
      },
      itemCount: moyamoyaList.value.length,
      itemBuilder: (context, index) {
        var text = moyamoyaList.value[index].moyamoya;
        return ListTile(
          subtitle: Text(text.substring(0, Math.min(200, text.length)) + "..."),
          onTap: () {
            Navigator.pushNamed(
                context, "/moyamoyaDetail?ts=" + moyamoyaList.value[index].ts,
                arguments: moyamoyaList.value[index]);
          },
        );
      },
    );
  }
}
