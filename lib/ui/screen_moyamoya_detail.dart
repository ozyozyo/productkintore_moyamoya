import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:html_unescape/html_unescape.dart';
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
    FirebaseAnalytics.instance.logEvent(
      name: 'moyamoya_detail',
      parameters: <String, dynamic>{
        'category': 'moyamoya',
        'ts': ts,
      },
    );

    final unescape = HtmlUnescape();

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
              Text(unescape.convert(value.moyamoya)),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Text("https://product-kintore.web.app/#/?ts=" + value.ts),
                  SizedBox(
                    width: 12,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(
                            text: "https://product-kintore.web.app/#/?ts=" +
                                value.ts));
                        final snackBar = SnackBar(
                          content: Text('コピーしました'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text("共有リンクをコピー")),
                  SizedBox(
                    width: 24,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        html.window.open(value.slackMessageUrl, "");
                      },
                      child: Text("Slackをひらく")),
                ],
              ),
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
    final unescape = HtmlUnescape();
    for (var m in moyamoya.comments) {
      result.add(Text(unescape.convert(m["comment"]!)));
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
