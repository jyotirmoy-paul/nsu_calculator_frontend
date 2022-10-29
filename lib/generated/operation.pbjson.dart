///
//  Generated code. Do not modify.
//  source: operation.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use operationTypeDescriptor instead')
const OperationType$json = const {
  '1': 'OperationType',
  '2': const [
    const {'1': 'OPERATION_TYPE_UNSPECIFIED', '2': 0},
    const {'1': 'OPERATION_TYPE_ADD', '2': 1},
    const {'1': 'OPERATION_TYPE_SUBTRACT', '2': 2},
    const {'1': 'OPERATION_TYPE_MULTIPLY', '2': 3},
    const {'1': 'OPERATION_TYPE_DIVIDE', '2': 4},
  ],
};

/// Descriptor for `OperationType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List operationTypeDescriptor = $convert.base64Decode('Cg1PcGVyYXRpb25UeXBlEh4KGk9QRVJBVElPTl9UWVBFX1VOU1BFQ0lGSUVEEAASFgoST1BFUkFUSU9OX1RZUEVfQUREEAESGwoXT1BFUkFUSU9OX1RZUEVfU1VCVFJBQ1QQAhIbChdPUEVSQVRJT05fVFlQRV9NVUxUSVBMWRADEhkKFU9QRVJBVElPTl9UWVBFX0RJVklERRAE');
@$core.Deprecated('Use operationRequestDescriptor instead')
const OperationRequest$json = const {
  '1': 'OperationRequest',
  '2': const [
    const {'1': 'operandA', '3': 1, '4': 1, '5': 1, '10': 'operandA'},
    const {'1': 'operandB', '3': 2, '4': 1, '5': 1, '10': 'operandB'},
    const {'1': 'operationType', '3': 3, '4': 1, '5': 14, '6': '.calculator.OperationType', '10': 'operationType'},
  ],
};

/// Descriptor for `OperationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List operationRequestDescriptor = $convert.base64Decode('ChBPcGVyYXRpb25SZXF1ZXN0EhoKCG9wZXJhbmRBGAEgASgBUghvcGVyYW5kQRIaCghvcGVyYW5kQhgCIAEoAVIIb3BlcmFuZEISPwoNb3BlcmF0aW9uVHlwZRgDIAEoDjIZLmNhbGN1bGF0b3IuT3BlcmF0aW9uVHlwZVINb3BlcmF0aW9uVHlwZQ==');
@$core.Deprecated('Use operationResponseDescriptor instead')
const OperationResponse$json = const {
  '1': 'OperationResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 1, '10': 'result'},
  ],
};

/// Descriptor for `OperationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List operationResponseDescriptor = $convert.base64Decode('ChFPcGVyYXRpb25SZXNwb25zZRIWCgZyZXN1bHQYASABKAFSBnJlc3VsdA==');
