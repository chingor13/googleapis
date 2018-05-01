library googleapis.firebaseremoteconfig.v1.test;

import "dart:core" as core;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:test/test.dart' as unittest;

import 'package:googleapis/firebaseremoteconfig/v1.dart' as api;

class HttpServerMock extends http.BaseClient {
  core.Function _callback;
  core.bool _expectJson;

  void register(core.Function callback, core.bool expectJson) {
    _callback = callback;
    _expectJson = expectJson;
  }

  async.Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_expectJson) {
      return request
          .finalize()
          .transform(convert.utf8.decoder)
          .join('')
          .then((core.String jsonString) {
        if (jsonString.isEmpty) {
          return _callback(request, null);
        } else {
          return _callback(request, convert.json.decode(jsonString));
        }
      });
    } else {
      var stream = request.finalize();
      if (stream == null) {
        return _callback(request, []);
      } else {
        return stream.toBytes().then((data) {
          return _callback(request, data);
        });
      }
    }
  }
}

http.StreamedResponse stringResponse(core.int status,
    core.Map<core.String, core.String> headers, core.String body) {
  var stream = new async.Stream.fromIterable([convert.utf8.encode(body)]);
  return new http.StreamedResponse(stream, status, headers: headers);
}

buildUnnamed1781() {
  var o = new core.List<api.RemoteConfigCondition>();
  o.add(buildRemoteConfigCondition());
  o.add(buildRemoteConfigCondition());
  return o;
}

checkUnnamed1781(core.List<api.RemoteConfigCondition> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRemoteConfigCondition(o[0]);
  checkRemoteConfigCondition(o[1]);
}

buildUnnamed1782() {
  var o = new core.Map<core.String, api.RemoteConfigParameter>();
  o["x"] = buildRemoteConfigParameter();
  o["y"] = buildRemoteConfigParameter();
  return o;
}

checkUnnamed1782(core.Map<core.String, api.RemoteConfigParameter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRemoteConfigParameter(o["x"]);
  checkRemoteConfigParameter(o["y"]);
}

core.int buildCounterRemoteConfig = 0;
buildRemoteConfig() {
  var o = new api.RemoteConfig();
  buildCounterRemoteConfig++;
  if (buildCounterRemoteConfig < 3) {
    o.conditions = buildUnnamed1781();
    o.parameters = buildUnnamed1782();
  }
  buildCounterRemoteConfig--;
  return o;
}

checkRemoteConfig(api.RemoteConfig o) {
  buildCounterRemoteConfig++;
  if (buildCounterRemoteConfig < 3) {
    checkUnnamed1781(o.conditions);
    checkUnnamed1782(o.parameters);
  }
  buildCounterRemoteConfig--;
}

core.int buildCounterRemoteConfigCondition = 0;
buildRemoteConfigCondition() {
  var o = new api.RemoteConfigCondition();
  buildCounterRemoteConfigCondition++;
  if (buildCounterRemoteConfigCondition < 3) {
    o.description = "foo";
    o.expression = "foo";
    o.name = "foo";
    o.tagColor = "foo";
  }
  buildCounterRemoteConfigCondition--;
  return o;
}

checkRemoteConfigCondition(api.RemoteConfigCondition o) {
  buildCounterRemoteConfigCondition++;
  if (buildCounterRemoteConfigCondition < 3) {
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.expression, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.tagColor, unittest.equals('foo'));
  }
  buildCounterRemoteConfigCondition--;
}

buildUnnamed1783() {
  var o = new core.Map<core.String, api.RemoteConfigParameterValue>();
  o["x"] = buildRemoteConfigParameterValue();
  o["y"] = buildRemoteConfigParameterValue();
  return o;
}

checkUnnamed1783(core.Map<core.String, api.RemoteConfigParameterValue> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRemoteConfigParameterValue(o["x"]);
  checkRemoteConfigParameterValue(o["y"]);
}

core.int buildCounterRemoteConfigParameter = 0;
buildRemoteConfigParameter() {
  var o = new api.RemoteConfigParameter();
  buildCounterRemoteConfigParameter++;
  if (buildCounterRemoteConfigParameter < 3) {
    o.conditionalValues = buildUnnamed1783();
    o.defaultValue = buildRemoteConfigParameterValue();
    o.description = "foo";
  }
  buildCounterRemoteConfigParameter--;
  return o;
}

checkRemoteConfigParameter(api.RemoteConfigParameter o) {
  buildCounterRemoteConfigParameter++;
  if (buildCounterRemoteConfigParameter < 3) {
    checkUnnamed1783(o.conditionalValues);
    checkRemoteConfigParameterValue(o.defaultValue);
    unittest.expect(o.description, unittest.equals('foo'));
  }
  buildCounterRemoteConfigParameter--;
}

core.int buildCounterRemoteConfigParameterValue = 0;
buildRemoteConfigParameterValue() {
  var o = new api.RemoteConfigParameterValue();
  buildCounterRemoteConfigParameterValue++;
  if (buildCounterRemoteConfigParameterValue < 3) {
    o.useInAppDefault = true;
    o.value = "foo";
  }
  buildCounterRemoteConfigParameterValue--;
  return o;
}

checkRemoteConfigParameterValue(api.RemoteConfigParameterValue o) {
  buildCounterRemoteConfigParameterValue++;
  if (buildCounterRemoteConfigParameterValue < 3) {
    unittest.expect(o.useInAppDefault, unittest.isTrue);
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterRemoteConfigParameterValue--;
}

main() {
  unittest.group("obj-schema-RemoteConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildRemoteConfig();
      var od = new api.RemoteConfig.fromJson(o.toJson());
      checkRemoteConfig(od);
    });
  });

  unittest.group("obj-schema-RemoteConfigCondition", () {
    unittest.test("to-json--from-json", () {
      var o = buildRemoteConfigCondition();
      var od = new api.RemoteConfigCondition.fromJson(o.toJson());
      checkRemoteConfigCondition(od);
    });
  });

  unittest.group("obj-schema-RemoteConfigParameter", () {
    unittest.test("to-json--from-json", () {
      var o = buildRemoteConfigParameter();
      var od = new api.RemoteConfigParameter.fromJson(o.toJson());
      checkRemoteConfigParameter(od);
    });
  });

  unittest.group("obj-schema-RemoteConfigParameterValue", () {
    unittest.test("to-json--from-json", () {
      var o = buildRemoteConfigParameterValue();
      var od = new api.RemoteConfigParameterValue.fromJson(o.toJson());
      checkRemoteConfigParameterValue(od);
    });
  });

  unittest.group("resource-ProjectsResourceApi", () {
    unittest.test("method--getRemoteConfig", () {
      var mock = new HttpServerMock();
      api.ProjectsResourceApi res =
          new api.FirebaseremoteconfigApi(mock).projects;
      var arg_project = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildRemoteConfig());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .getRemoteConfig(arg_project, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkRemoteConfig(response);
      })));
    });

    unittest.test("method--updateRemoteConfig", () {
      var mock = new HttpServerMock();
      api.ProjectsResourceApi res =
          new api.FirebaseremoteconfigApi(mock).projects;
      var arg_request = buildRemoteConfig();
      var arg_project = "foo";
      var arg_validateOnly = true;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.RemoteConfig.fromJson(json);
        checkRemoteConfig(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["validateOnly"].first,
            unittest.equals("$arg_validateOnly"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildRemoteConfig());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .updateRemoteConfig(arg_request, arg_project,
              validateOnly: arg_validateOnly, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkRemoteConfig(response);
      })));
    });
  });
}
