///
//  Generated code. Do not modify.
//  source: factorization.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class FactorizationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FactorizationRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'calculator'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'number')
    ..hasRequiredFields = false
  ;

  FactorizationRequest._() : super();
  factory FactorizationRequest({
    $fixnum.Int64? number,
  }) {
    final _result = create();
    if (number != null) {
      _result.number = number;
    }
    return _result;
  }
  factory FactorizationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FactorizationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FactorizationRequest clone() => FactorizationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FactorizationRequest copyWith(void Function(FactorizationRequest) updates) => super.copyWith((message) => updates(message as FactorizationRequest)) as FactorizationRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FactorizationRequest create() => FactorizationRequest._();
  FactorizationRequest createEmptyInstance() => create();
  static $pb.PbList<FactorizationRequest> createRepeated() => $pb.PbList<FactorizationRequest>();
  @$core.pragma('dart2js:noInline')
  static FactorizationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FactorizationRequest>(create);
  static FactorizationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get number => $_getI64(0);
  @$pb.TagNumber(1)
  set number($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumber() => clearField(1);
}

class FactorizationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FactorizationResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'calculator'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'factor')
    ..hasRequiredFields = false
  ;

  FactorizationResponse._() : super();
  factory FactorizationResponse({
    $fixnum.Int64? factor,
  }) {
    final _result = create();
    if (factor != null) {
      _result.factor = factor;
    }
    return _result;
  }
  factory FactorizationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FactorizationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FactorizationResponse clone() => FactorizationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FactorizationResponse copyWith(void Function(FactorizationResponse) updates) => super.copyWith((message) => updates(message as FactorizationResponse)) as FactorizationResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FactorizationResponse create() => FactorizationResponse._();
  FactorizationResponse createEmptyInstance() => create();
  static $pb.PbList<FactorizationResponse> createRepeated() => $pb.PbList<FactorizationResponse>();
  @$core.pragma('dart2js:noInline')
  static FactorizationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FactorizationResponse>(create);
  static FactorizationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get factor => $_getI64(0);
  @$pb.TagNumber(1)
  set factor($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFactor() => $_has(0);
  @$pb.TagNumber(1)
  void clearFactor() => clearField(1);
}

