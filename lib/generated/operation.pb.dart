///
//  Generated code. Do not modify.
//  source: operation.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'operation.pbenum.dart';

export 'operation.pbenum.dart';

class OperationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OperationRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'calculator'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'operandA', $pb.PbFieldType.OD, protoName: 'operandA')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'operandB', $pb.PbFieldType.OD, protoName: 'operandB')
    ..e<OperationType>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'operationType', $pb.PbFieldType.OE, protoName: 'operationType', defaultOrMaker: OperationType.OPERATION_TYPE_UNSPECIFIED, valueOf: OperationType.valueOf, enumValues: OperationType.values)
    ..hasRequiredFields = false
  ;

  OperationRequest._() : super();
  factory OperationRequest({
    $core.double? operandA,
    $core.double? operandB,
    OperationType? operationType,
  }) {
    final _result = create();
    if (operandA != null) {
      _result.operandA = operandA;
    }
    if (operandB != null) {
      _result.operandB = operandB;
    }
    if (operationType != null) {
      _result.operationType = operationType;
    }
    return _result;
  }
  factory OperationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OperationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OperationRequest clone() => OperationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OperationRequest copyWith(void Function(OperationRequest) updates) => super.copyWith((message) => updates(message as OperationRequest)) as OperationRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OperationRequest create() => OperationRequest._();
  OperationRequest createEmptyInstance() => create();
  static $pb.PbList<OperationRequest> createRepeated() => $pb.PbList<OperationRequest>();
  @$core.pragma('dart2js:noInline')
  static OperationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OperationRequest>(create);
  static OperationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get operandA => $_getN(0);
  @$pb.TagNumber(1)
  set operandA($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOperandA() => $_has(0);
  @$pb.TagNumber(1)
  void clearOperandA() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get operandB => $_getN(1);
  @$pb.TagNumber(2)
  set operandB($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOperandB() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperandB() => clearField(2);

  @$pb.TagNumber(3)
  OperationType get operationType => $_getN(2);
  @$pb.TagNumber(3)
  set operationType(OperationType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasOperationType() => $_has(2);
  @$pb.TagNumber(3)
  void clearOperationType() => clearField(3);
}

class OperationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OperationResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'calculator'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  OperationResponse._() : super();
  factory OperationResponse({
    $core.double? result,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    return _result;
  }
  factory OperationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OperationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OperationResponse clone() => OperationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OperationResponse copyWith(void Function(OperationResponse) updates) => super.copyWith((message) => updates(message as OperationResponse)) as OperationResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OperationResponse create() => OperationResponse._();
  OperationResponse createEmptyInstance() => create();
  static $pb.PbList<OperationResponse> createRepeated() => $pb.PbList<OperationResponse>();
  @$core.pragma('dart2js:noInline')
  static OperationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OperationResponse>(create);
  static OperationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get result => $_getN(0);
  @$pb.TagNumber(1)
  set result($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
}

