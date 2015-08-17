library googleapis_beta.pubsub.v1beta1.test;

import "dart:core" as core;
import "dart:collection" as collection;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as http_testing;
import 'package:unittest/unittest.dart' as unittest;

import 'package:googleapis_beta/pubsub/v1beta1.dart' as api;

class HttpServerMock extends http.BaseClient {
  core.Function _callback;
  core.bool _expectJson;

  void register(core.Function callback, core.bool expectJson) {
    _callback = callback;
    _expectJson = expectJson;
  }

  async.Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_expectJson) {
      return request.finalize()
          .transform(convert.UTF8.decoder)
          .join('')
          .then((core.String jsonString) {
        if (jsonString.isEmpty) {
          return _callback(request, null);
        } else {
          return _callback(request, convert.JSON.decode(jsonString));
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

http.StreamedResponse stringResponse(
    core.int status, core.Map headers, core.String body) {
  var stream = new async.Stream.fromIterable([convert.UTF8.encode(body)]);
  return new http.StreamedResponse(stream, status, headers: headers);
}

buildUnnamed2669() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2669(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterAcknowledgeRequest = 0;
buildAcknowledgeRequest() {
  var o = new api.AcknowledgeRequest();
  buildCounterAcknowledgeRequest++;
  if (buildCounterAcknowledgeRequest < 3) {
    o.ackId = buildUnnamed2669();
    o.subscription = "foo";
  }
  buildCounterAcknowledgeRequest--;
  return o;
}

checkAcknowledgeRequest(api.AcknowledgeRequest o) {
  buildCounterAcknowledgeRequest++;
  if (buildCounterAcknowledgeRequest < 3) {
    checkUnnamed2669(o.ackId);
    unittest.expect(o.subscription, unittest.equals('foo'));
  }
  buildCounterAcknowledgeRequest--;
}

core.int buildCounterLabel = 0;
buildLabel() {
  var o = new api.Label();
  buildCounterLabel++;
  if (buildCounterLabel < 3) {
    o.key = "foo";
    o.numValue = "foo";
    o.strValue = "foo";
  }
  buildCounterLabel--;
  return o;
}

checkLabel(api.Label o) {
  buildCounterLabel++;
  if (buildCounterLabel < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.numValue, unittest.equals('foo'));
    unittest.expect(o.strValue, unittest.equals('foo'));
  }
  buildCounterLabel--;
}

buildUnnamed2670() {
  var o = new core.List<api.Subscription>();
  o.add(buildSubscription());
  o.add(buildSubscription());
  return o;
}

checkUnnamed2670(core.List<api.Subscription> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSubscription(o[0]);
  checkSubscription(o[1]);
}

core.int buildCounterListSubscriptionsResponse = 0;
buildListSubscriptionsResponse() {
  var o = new api.ListSubscriptionsResponse();
  buildCounterListSubscriptionsResponse++;
  if (buildCounterListSubscriptionsResponse < 3) {
    o.nextPageToken = "foo";
    o.subscription = buildUnnamed2670();
  }
  buildCounterListSubscriptionsResponse--;
  return o;
}

checkListSubscriptionsResponse(api.ListSubscriptionsResponse o) {
  buildCounterListSubscriptionsResponse++;
  if (buildCounterListSubscriptionsResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed2670(o.subscription);
  }
  buildCounterListSubscriptionsResponse--;
}

buildUnnamed2671() {
  var o = new core.List<api.Topic>();
  o.add(buildTopic());
  o.add(buildTopic());
  return o;
}

checkUnnamed2671(core.List<api.Topic> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTopic(o[0]);
  checkTopic(o[1]);
}

core.int buildCounterListTopicsResponse = 0;
buildListTopicsResponse() {
  var o = new api.ListTopicsResponse();
  buildCounterListTopicsResponse++;
  if (buildCounterListTopicsResponse < 3) {
    o.nextPageToken = "foo";
    o.topic = buildUnnamed2671();
  }
  buildCounterListTopicsResponse--;
  return o;
}

checkListTopicsResponse(api.ListTopicsResponse o) {
  buildCounterListTopicsResponse++;
  if (buildCounterListTopicsResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed2671(o.topic);
  }
  buildCounterListTopicsResponse--;
}

buildUnnamed2672() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2672(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterModifyAckDeadlineRequest = 0;
buildModifyAckDeadlineRequest() {
  var o = new api.ModifyAckDeadlineRequest();
  buildCounterModifyAckDeadlineRequest++;
  if (buildCounterModifyAckDeadlineRequest < 3) {
    o.ackDeadlineSeconds = 42;
    o.ackId = "foo";
    o.ackIds = buildUnnamed2672();
    o.subscription = "foo";
  }
  buildCounterModifyAckDeadlineRequest--;
  return o;
}

checkModifyAckDeadlineRequest(api.ModifyAckDeadlineRequest o) {
  buildCounterModifyAckDeadlineRequest++;
  if (buildCounterModifyAckDeadlineRequest < 3) {
    unittest.expect(o.ackDeadlineSeconds, unittest.equals(42));
    unittest.expect(o.ackId, unittest.equals('foo'));
    checkUnnamed2672(o.ackIds);
    unittest.expect(o.subscription, unittest.equals('foo'));
  }
  buildCounterModifyAckDeadlineRequest--;
}

core.int buildCounterModifyPushConfigRequest = 0;
buildModifyPushConfigRequest() {
  var o = new api.ModifyPushConfigRequest();
  buildCounterModifyPushConfigRequest++;
  if (buildCounterModifyPushConfigRequest < 3) {
    o.pushConfig = buildPushConfig();
    o.subscription = "foo";
  }
  buildCounterModifyPushConfigRequest--;
  return o;
}

checkModifyPushConfigRequest(api.ModifyPushConfigRequest o) {
  buildCounterModifyPushConfigRequest++;
  if (buildCounterModifyPushConfigRequest < 3) {
    checkPushConfig(o.pushConfig);
    unittest.expect(o.subscription, unittest.equals('foo'));
  }
  buildCounterModifyPushConfigRequest--;
}

buildUnnamed2673() {
  var o = new core.List<api.PubsubMessage>();
  o.add(buildPubsubMessage());
  o.add(buildPubsubMessage());
  return o;
}

checkUnnamed2673(core.List<api.PubsubMessage> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPubsubMessage(o[0]);
  checkPubsubMessage(o[1]);
}

core.int buildCounterPublishBatchRequest = 0;
buildPublishBatchRequest() {
  var o = new api.PublishBatchRequest();
  buildCounterPublishBatchRequest++;
  if (buildCounterPublishBatchRequest < 3) {
    o.messages = buildUnnamed2673();
    o.topic = "foo";
  }
  buildCounterPublishBatchRequest--;
  return o;
}

checkPublishBatchRequest(api.PublishBatchRequest o) {
  buildCounterPublishBatchRequest++;
  if (buildCounterPublishBatchRequest < 3) {
    checkUnnamed2673(o.messages);
    unittest.expect(o.topic, unittest.equals('foo'));
  }
  buildCounterPublishBatchRequest--;
}

buildUnnamed2674() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2674(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterPublishBatchResponse = 0;
buildPublishBatchResponse() {
  var o = new api.PublishBatchResponse();
  buildCounterPublishBatchResponse++;
  if (buildCounterPublishBatchResponse < 3) {
    o.messageIds = buildUnnamed2674();
  }
  buildCounterPublishBatchResponse--;
  return o;
}

checkPublishBatchResponse(api.PublishBatchResponse o) {
  buildCounterPublishBatchResponse++;
  if (buildCounterPublishBatchResponse < 3) {
    checkUnnamed2674(o.messageIds);
  }
  buildCounterPublishBatchResponse--;
}

core.int buildCounterPublishRequest = 0;
buildPublishRequest() {
  var o = new api.PublishRequest();
  buildCounterPublishRequest++;
  if (buildCounterPublishRequest < 3) {
    o.message = buildPubsubMessage();
    o.topic = "foo";
  }
  buildCounterPublishRequest--;
  return o;
}

checkPublishRequest(api.PublishRequest o) {
  buildCounterPublishRequest++;
  if (buildCounterPublishRequest < 3) {
    checkPubsubMessage(o.message);
    unittest.expect(o.topic, unittest.equals('foo'));
  }
  buildCounterPublishRequest--;
}

core.int buildCounterPubsubEvent = 0;
buildPubsubEvent() {
  var o = new api.PubsubEvent();
  buildCounterPubsubEvent++;
  if (buildCounterPubsubEvent < 3) {
    o.deleted = true;
    o.message = buildPubsubMessage();
    o.subscription = "foo";
    o.truncated = true;
  }
  buildCounterPubsubEvent--;
  return o;
}

checkPubsubEvent(api.PubsubEvent o) {
  buildCounterPubsubEvent++;
  if (buildCounterPubsubEvent < 3) {
    unittest.expect(o.deleted, unittest.isTrue);
    checkPubsubMessage(o.message);
    unittest.expect(o.subscription, unittest.equals('foo'));
    unittest.expect(o.truncated, unittest.isTrue);
  }
  buildCounterPubsubEvent--;
}

buildUnnamed2675() {
  var o = new core.List<api.Label>();
  o.add(buildLabel());
  o.add(buildLabel());
  return o;
}

checkUnnamed2675(core.List<api.Label> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkLabel(o[0]);
  checkLabel(o[1]);
}

core.int buildCounterPubsubMessage = 0;
buildPubsubMessage() {
  var o = new api.PubsubMessage();
  buildCounterPubsubMessage++;
  if (buildCounterPubsubMessage < 3) {
    o.data = "foo";
    o.label = buildUnnamed2675();
    o.messageId = "foo";
  }
  buildCounterPubsubMessage--;
  return o;
}

checkPubsubMessage(api.PubsubMessage o) {
  buildCounterPubsubMessage++;
  if (buildCounterPubsubMessage < 3) {
    unittest.expect(o.data, unittest.equals('foo'));
    checkUnnamed2675(o.label);
    unittest.expect(o.messageId, unittest.equals('foo'));
  }
  buildCounterPubsubMessage--;
}

core.int buildCounterPullBatchRequest = 0;
buildPullBatchRequest() {
  var o = new api.PullBatchRequest();
  buildCounterPullBatchRequest++;
  if (buildCounterPullBatchRequest < 3) {
    o.maxEvents = 42;
    o.returnImmediately = true;
    o.subscription = "foo";
  }
  buildCounterPullBatchRequest--;
  return o;
}

checkPullBatchRequest(api.PullBatchRequest o) {
  buildCounterPullBatchRequest++;
  if (buildCounterPullBatchRequest < 3) {
    unittest.expect(o.maxEvents, unittest.equals(42));
    unittest.expect(o.returnImmediately, unittest.isTrue);
    unittest.expect(o.subscription, unittest.equals('foo'));
  }
  buildCounterPullBatchRequest--;
}

buildUnnamed2676() {
  var o = new core.List<api.PullResponse>();
  o.add(buildPullResponse());
  o.add(buildPullResponse());
  return o;
}

checkUnnamed2676(core.List<api.PullResponse> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPullResponse(o[0]);
  checkPullResponse(o[1]);
}

core.int buildCounterPullBatchResponse = 0;
buildPullBatchResponse() {
  var o = new api.PullBatchResponse();
  buildCounterPullBatchResponse++;
  if (buildCounterPullBatchResponse < 3) {
    o.pullResponses = buildUnnamed2676();
  }
  buildCounterPullBatchResponse--;
  return o;
}

checkPullBatchResponse(api.PullBatchResponse o) {
  buildCounterPullBatchResponse++;
  if (buildCounterPullBatchResponse < 3) {
    checkUnnamed2676(o.pullResponses);
  }
  buildCounterPullBatchResponse--;
}

core.int buildCounterPullRequest = 0;
buildPullRequest() {
  var o = new api.PullRequest();
  buildCounterPullRequest++;
  if (buildCounterPullRequest < 3) {
    o.returnImmediately = true;
    o.subscription = "foo";
  }
  buildCounterPullRequest--;
  return o;
}

checkPullRequest(api.PullRequest o) {
  buildCounterPullRequest++;
  if (buildCounterPullRequest < 3) {
    unittest.expect(o.returnImmediately, unittest.isTrue);
    unittest.expect(o.subscription, unittest.equals('foo'));
  }
  buildCounterPullRequest--;
}

core.int buildCounterPullResponse = 0;
buildPullResponse() {
  var o = new api.PullResponse();
  buildCounterPullResponse++;
  if (buildCounterPullResponse < 3) {
    o.ackId = "foo";
    o.pubsubEvent = buildPubsubEvent();
  }
  buildCounterPullResponse--;
  return o;
}

checkPullResponse(api.PullResponse o) {
  buildCounterPullResponse++;
  if (buildCounterPullResponse < 3) {
    unittest.expect(o.ackId, unittest.equals('foo'));
    checkPubsubEvent(o.pubsubEvent);
  }
  buildCounterPullResponse--;
}

core.int buildCounterPushConfig = 0;
buildPushConfig() {
  var o = new api.PushConfig();
  buildCounterPushConfig++;
  if (buildCounterPushConfig < 3) {
    o.pushEndpoint = "foo";
  }
  buildCounterPushConfig--;
  return o;
}

checkPushConfig(api.PushConfig o) {
  buildCounterPushConfig++;
  if (buildCounterPushConfig < 3) {
    unittest.expect(o.pushEndpoint, unittest.equals('foo'));
  }
  buildCounterPushConfig--;
}

core.int buildCounterSubscription = 0;
buildSubscription() {
  var o = new api.Subscription();
  buildCounterSubscription++;
  if (buildCounterSubscription < 3) {
    o.ackDeadlineSeconds = 42;
    o.name = "foo";
    o.pushConfig = buildPushConfig();
    o.topic = "foo";
  }
  buildCounterSubscription--;
  return o;
}

checkSubscription(api.Subscription o) {
  buildCounterSubscription++;
  if (buildCounterSubscription < 3) {
    unittest.expect(o.ackDeadlineSeconds, unittest.equals(42));
    unittest.expect(o.name, unittest.equals('foo'));
    checkPushConfig(o.pushConfig);
    unittest.expect(o.topic, unittest.equals('foo'));
  }
  buildCounterSubscription--;
}

core.int buildCounterTopic = 0;
buildTopic() {
  var o = new api.Topic();
  buildCounterTopic++;
  if (buildCounterTopic < 3) {
    o.name = "foo";
  }
  buildCounterTopic--;
  return o;
}

checkTopic(api.Topic o) {
  buildCounterTopic++;
  if (buildCounterTopic < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterTopic--;
}


main() {
  unittest.group("obj-schema-AcknowledgeRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildAcknowledgeRequest();
      var od = new api.AcknowledgeRequest.fromJson(o.toJson());
      checkAcknowledgeRequest(od);
    });
  });


  unittest.group("obj-schema-Label", () {
    unittest.test("to-json--from-json", () {
      var o = buildLabel();
      var od = new api.Label.fromJson(o.toJson());
      checkLabel(od);
    });
  });


  unittest.group("obj-schema-ListSubscriptionsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListSubscriptionsResponse();
      var od = new api.ListSubscriptionsResponse.fromJson(o.toJson());
      checkListSubscriptionsResponse(od);
    });
  });


  unittest.group("obj-schema-ListTopicsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListTopicsResponse();
      var od = new api.ListTopicsResponse.fromJson(o.toJson());
      checkListTopicsResponse(od);
    });
  });


  unittest.group("obj-schema-ModifyAckDeadlineRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildModifyAckDeadlineRequest();
      var od = new api.ModifyAckDeadlineRequest.fromJson(o.toJson());
      checkModifyAckDeadlineRequest(od);
    });
  });


  unittest.group("obj-schema-ModifyPushConfigRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildModifyPushConfigRequest();
      var od = new api.ModifyPushConfigRequest.fromJson(o.toJson());
      checkModifyPushConfigRequest(od);
    });
  });


  unittest.group("obj-schema-PublishBatchRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildPublishBatchRequest();
      var od = new api.PublishBatchRequest.fromJson(o.toJson());
      checkPublishBatchRequest(od);
    });
  });


  unittest.group("obj-schema-PublishBatchResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildPublishBatchResponse();
      var od = new api.PublishBatchResponse.fromJson(o.toJson());
      checkPublishBatchResponse(od);
    });
  });


  unittest.group("obj-schema-PublishRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildPublishRequest();
      var od = new api.PublishRequest.fromJson(o.toJson());
      checkPublishRequest(od);
    });
  });


  unittest.group("obj-schema-PubsubEvent", () {
    unittest.test("to-json--from-json", () {
      var o = buildPubsubEvent();
      var od = new api.PubsubEvent.fromJson(o.toJson());
      checkPubsubEvent(od);
    });
  });


  unittest.group("obj-schema-PubsubMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildPubsubMessage();
      var od = new api.PubsubMessage.fromJson(o.toJson());
      checkPubsubMessage(od);
    });
  });


  unittest.group("obj-schema-PullBatchRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildPullBatchRequest();
      var od = new api.PullBatchRequest.fromJson(o.toJson());
      checkPullBatchRequest(od);
    });
  });


  unittest.group("obj-schema-PullBatchResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildPullBatchResponse();
      var od = new api.PullBatchResponse.fromJson(o.toJson());
      checkPullBatchResponse(od);
    });
  });


  unittest.group("obj-schema-PullRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildPullRequest();
      var od = new api.PullRequest.fromJson(o.toJson());
      checkPullRequest(od);
    });
  });


  unittest.group("obj-schema-PullResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildPullResponse();
      var od = new api.PullResponse.fromJson(o.toJson());
      checkPullResponse(od);
    });
  });


  unittest.group("obj-schema-PushConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildPushConfig();
      var od = new api.PushConfig.fromJson(o.toJson());
      checkPushConfig(od);
    });
  });


  unittest.group("obj-schema-Subscription", () {
    unittest.test("to-json--from-json", () {
      var o = buildSubscription();
      var od = new api.Subscription.fromJson(o.toJson());
      checkSubscription(od);
    });
  });


  unittest.group("obj-schema-Topic", () {
    unittest.test("to-json--from-json", () {
      var o = buildTopic();
      var od = new api.Topic.fromJson(o.toJson());
      checkTopic(od);
    });
  });


  unittest.group("resource-SubscriptionsResourceApi", () {
    unittest.test("method--acknowledge", () {

      var mock = new HttpServerMock();
      api.SubscriptionsResourceApi res = new api.PubsubApi(mock).subscriptions;
      var arg_request = buildAcknowledgeRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.AcknowledgeRequest.fromJson(json);
        checkAcknowledgeRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("pubsub/v1beta1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 25), unittest.equals("subscriptions/acknowledge"));
        pathOffset += 25;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.acknowledge(arg_request).then(unittest.expectAsync((_) {}));
    });

    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.SubscriptionsResourceApi res = new api.PubsubApi(mock).subscriptions;
      var arg_request = buildSubscription();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Subscription.fromJson(json);
        checkSubscription(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("pubsub/v1beta1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 13), unittest.equals("subscriptions"));
        pathOffset += 13;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildSubscription());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request).then(unittest.expectAsync(((api.Subscription response) {
        checkSubscription(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.SubscriptionsResourceApi res = new api.PubsubApi(mock).subscriptions;
      var arg_subscription = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("pubsub/v1beta1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("subscriptions/"));
        pathOffset += 14;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_subscription).then(unittest.expectAsync((_) {}));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.SubscriptionsResourceApi res = new api.PubsubApi(mock).subscriptions;
      var arg_subscription = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("pubsub/v1beta1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("subscriptions/"));
        pathOffset += 14;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildSubscription());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_subscription).then(unittest.expectAsync(((api.Subscription response) {
        checkSubscription(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.SubscriptionsResourceApi res = new api.PubsubApi(mock).subscriptions;
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_query = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("pubsub/v1beta1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 13), unittest.equals("subscriptions"));
        pathOffset += 13;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["query"].first, unittest.equals(arg_query));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListSubscriptionsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(maxResults: arg_maxResults, pageToken: arg_pageToken, query: arg_query).then(unittest.expectAsync(((api.ListSubscriptionsResponse response) {
        checkListSubscriptionsResponse(response);
      })));
    });

    unittest.test("method--modifyAckDeadline", () {

      var mock = new HttpServerMock();
      api.SubscriptionsResourceApi res = new api.PubsubApi(mock).subscriptions;
      var arg_request = buildModifyAckDeadlineRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.ModifyAckDeadlineRequest.fromJson(json);
        checkModifyAckDeadlineRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("pubsub/v1beta1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 31), unittest.equals("subscriptions/modifyAckDeadline"));
        pathOffset += 31;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.modifyAckDeadline(arg_request).then(unittest.expectAsync((_) {}));
    });

    unittest.test("method--modifyPushConfig", () {

      var mock = new HttpServerMock();
      api.SubscriptionsResourceApi res = new api.PubsubApi(mock).subscriptions;
      var arg_request = buildModifyPushConfigRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.ModifyPushConfigRequest.fromJson(json);
        checkModifyPushConfigRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("pubsub/v1beta1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 30), unittest.equals("subscriptions/modifyPushConfig"));
        pathOffset += 30;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.modifyPushConfig(arg_request).then(unittest.expectAsync((_) {}));
    });

    unittest.test("method--pull", () {

      var mock = new HttpServerMock();
      api.SubscriptionsResourceApi res = new api.PubsubApi(mock).subscriptions;
      var arg_request = buildPullRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.PullRequest.fromJson(json);
        checkPullRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("pubsub/v1beta1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 18), unittest.equals("subscriptions/pull"));
        pathOffset += 18;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildPullResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.pull(arg_request).then(unittest.expectAsync(((api.PullResponse response) {
        checkPullResponse(response);
      })));
    });

    unittest.test("method--pullBatch", () {

      var mock = new HttpServerMock();
      api.SubscriptionsResourceApi res = new api.PubsubApi(mock).subscriptions;
      var arg_request = buildPullBatchRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.PullBatchRequest.fromJson(json);
        checkPullBatchRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("pubsub/v1beta1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 23), unittest.equals("subscriptions/pullBatch"));
        pathOffset += 23;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildPullBatchResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.pullBatch(arg_request).then(unittest.expectAsync(((api.PullBatchResponse response) {
        checkPullBatchResponse(response);
      })));
    });

  });


  unittest.group("resource-TopicsResourceApi", () {
    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.TopicsResourceApi res = new api.PubsubApi(mock).topics;
      var arg_request = buildTopic();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Topic.fromJson(json);
        checkTopic(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("pubsub/v1beta1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("topics"));
        pathOffset += 6;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTopic());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request).then(unittest.expectAsync(((api.Topic response) {
        checkTopic(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.TopicsResourceApi res = new api.PubsubApi(mock).topics;
      var arg_topic = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("pubsub/v1beta1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals("topics/"));
        pathOffset += 7;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_topic).then(unittest.expectAsync((_) {}));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.TopicsResourceApi res = new api.PubsubApi(mock).topics;
      var arg_topic = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("pubsub/v1beta1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals("topics/"));
        pathOffset += 7;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTopic());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_topic).then(unittest.expectAsync(((api.Topic response) {
        checkTopic(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.TopicsResourceApi res = new api.PubsubApi(mock).topics;
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_query = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("pubsub/v1beta1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("topics"));
        pathOffset += 6;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["query"].first, unittest.equals(arg_query));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListTopicsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(maxResults: arg_maxResults, pageToken: arg_pageToken, query: arg_query).then(unittest.expectAsync(((api.ListTopicsResponse response) {
        checkListTopicsResponse(response);
      })));
    });

    unittest.test("method--publish", () {

      var mock = new HttpServerMock();
      api.TopicsResourceApi res = new api.PubsubApi(mock).topics;
      var arg_request = buildPublishRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.PublishRequest.fromJson(json);
        checkPublishRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("pubsub/v1beta1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("topics/publish"));
        pathOffset += 14;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.publish(arg_request).then(unittest.expectAsync((_) {}));
    });

    unittest.test("method--publishBatch", () {

      var mock = new HttpServerMock();
      api.TopicsResourceApi res = new api.PubsubApi(mock).topics;
      var arg_request = buildPublishBatchRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.PublishBatchRequest.fromJson(json);
        checkPublishBatchRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("pubsub/v1beta1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 19), unittest.equals("topics/publishBatch"));
        pathOffset += 19;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildPublishBatchResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.publishBatch(arg_request).then(unittest.expectAsync(((api.PublishBatchResponse response) {
        checkPublishBatchResponse(response);
      })));
    });

  });


}

