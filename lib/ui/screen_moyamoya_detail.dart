import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:productkintore/entity/moyamoya.dart';
import 'package:productkintore/provider/moyamoya_provider.dart';
import 'package:productkintore/ui/screen_home.dart';

import 'dart:html' as html;

class MoyamoyaDetailScreen extends HookConsumerWidget
    with WidgetsBindingObserver {
  String? ts;
  MoyamoyaDetailScreen({this.ts});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var moyamoya = ModalRoute.of(context)!.settings.arguments;
    if (ts != null && moyamoya is Moyamoya) {
      ts = moyamoya.ts;
    }
    if (ts == null) {
      return HomeScreen();
    }

    var provider = ref.watch(fetchMoyamoyaProvider(ts!));
    return provider.when(data: (value) {
      return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.all(24),
          width: double.infinity,
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                height: 24,
              ),
              Text(value.moyamoya),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  onPressed: () {
                    html.window.open(value.slackMessageUrl, "");
                  },
                  child: Text("Slackをひらく")),

              /*
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/comment", arguments: value);
                  },
                  child: Text("コメントする")),
              */
              SizedBox(
                height: 24,
              ),
              Divider(
                height: 10,
                thickness: 5,
                endIndent: 0,
                color: Colors.grey,
              ),
              composeComments(context, value),
            ]),
          ),
        ),
      );
    }, error: (e, s) {
      return Placeholder();
    }, loading: () {
      return Container();
    });
  }

  composeComments(BuildContext context, Moyamoya moyamoya) {
    var result = <Widget>[];
    result.add(
      Text(
        "コメント",
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
    result.add(
      SizedBox(
        height: 24,
      ),
    );
    for (var m in moyamoya.comments) {
      result.add(Text(m["comment"]!));
      result.add(
        SizedBox(
          height: 24,
        ),
      );
      result.add(
        Divider(
          height: 10,
          thickness: 5,
          endIndent: 0,
          color: Colors.grey,
        ),
      );
      result.add(
        SizedBox(
          height: 24,
        ),
      );
    }
    if (result.length == 2) {
      result.add(
        Text(
          "コメントはまだありません。一人目のコメントを書きましょう！",
        ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: result,
    );
  }
}
