///
//  Generated code. Do not modify.
//  source: operation.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class OperationType extends $pb.ProtobufEnum {
  static const OperationType OPERATION_TYPE_UNSPECIFIED = OperationType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OPERATION_TYPE_UNSPECIFIED');
  static const OperationType OPERATION_TYPE_ADD = OperationType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OPERATION_TYPE_ADD');
  static const OperationType OPERATION_TYPE_SUBTRACT = OperationType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OPERATION_TYPE_SUBTRACT');
  static const OperationType OPERATION_TYPE_MULTIPLY = OperationType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OPERATION_TYPE_MULTIPLY');
  static const OperationType OPERATION_TYPE_DIVIDE = OperationType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OPERATION_TYPE_DIVIDE');

  static const $core.List<OperationType> values = <OperationType> [
    OPERATION_TYPE_UNSPECIFIED,
    OPERATION_TYPE_ADD,
    OPERATION_TYPE_SUBTRACT,
    OPERATION_TYPE_MULTIPLY,
    OPERATION_TYPE_DIVIDE,
  ];

  static final $core.Map<$core.int, OperationType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static OperationType? valueOf($core.int value) => _byValue[value];

  const OperationType._($core.int v, $core.String n) : super(v, n);
}

