//Copyright (C) 2013 Potix Corporation. All Rights Reserved.
//History: Mon, Feb 25, 2013  5:28:08 PM
// Author: tomyeh
library test_util;

import 'package:test/test.dart';
import "package:rikulo_commons/util.dart";

void main() {
  test("MapUtil", () {
    final map = MapUtil.parse('abc="first" xyz="second item"');
    expect(map["abc"], "first");
    expect(map["xyz"], "second item");
  });

  test("Color.parse", () {
    expect(Color.parse("#ffffff"), equals(WHITE));
    expect(Color.parse("#fff"), WHITE);
    expect(Color.parse("white"), WHITE);
    expect(Color.parse("rgba(128, 50%, 25%, 10%)"), new Color(128, 127, 63, 0.1));
    expect(Color.parse("rgb(128, 50%, 25%)"), new Color(128, 127, 63));
    expect(Color.parse("hsl(128, 50%, 25%)"), new HslColor(128, 0.5, 0.25));
    expect(Color.parse("hsla(128, 50%, 25%, 20%)"), new HslColor(128, 0.5, 0.25, 0.2));
    expect(Color.parse("hsv(128, 50%, 25%)"), new HsvColor(128, 0.5, 0.25));
    expect(Color.parse("hsva(128, 50%, 25%, 20%)"), new HsvColor(128, 0.5, 0.25, 0.2));
  });

  test("XmlUtil", () {
    expect(XmlUtil.encode("<abc>"), "&lt;abc&gt;");
    expect(XmlUtil.encode('<abc>&\'"'), "&lt;abc&gt;&amp;'&quot;");
    expect(XmlUtil.encode("<abc\nanother line", multiLine: true),
      "&lt;abc<br/>\nanother line");
    expect(XmlUtil.encode("<abc> </abc>\ta", pre: true),
      "&lt;abc&gt;&nbsp;&lt;/abc&gt;&nbsp;&nbsp;&nbsp;&nbsp;a");
    expect(XmlUtil.decode("&lt;abc&gt; and &amp;"), '<abc> and &');

    expect(XmlUtil.encode("<abc de  f   \ng", space: true), "&lt;abc de&nbsp; f&nbsp;&nbsp; \ng");
    expect(XmlUtil.encode("<abc de  f   \ngg", space: true, multiLine: true),
      "&lt;abc de&nbsp; f&nbsp;&nbsp; <br/>\ngg");
  });
}