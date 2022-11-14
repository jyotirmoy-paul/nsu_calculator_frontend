///
//  Generated code. Do not modify.
//  source: calculator.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'operation.pb.dart' as $0;
import 'factorization.pb.dart' as $1;
import 'average.pb.dart' as $2;
import 'sum.pb.dart' as $3;
export 'calculator.pb.dart';

class CalculatorServiceClient extends $grpc.Client {
  static final _$operate =
      $grpc.ClientMethod<$0.OperationRequest, $0.OperationResponse>(
          '/calculator.CalculatorService/Operate',
          ($0.OperationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.OperationResponse.fromBuffer(value));
  static final _$factorize =
      $grpc.ClientMethod<$1.FactorizationRequest, $1.FactorizationResponse>(
          '/calculator.CalculatorService/Factorize',
          ($1.FactorizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.FactorizationResponse.fromBuffer(value));
  static final _$findAverage =
      $grpc.ClientMethod<$2.AverageRequest, $2.AverageResponse>(
          '/calculator.CalculatorService/FindAverage',
          ($2.AverageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.AverageResponse.fromBuffer(value));
  static final _$sum = $grpc.ClientMethod<$3.SumRequest, $3.SumResponse>(
      '/calculator.CalculatorService/Sum',
      ($3.SumRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.SumResponse.fromBuffer(value));

  CalculatorServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.OperationResponse> operate(
      $0.OperationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$operate, request, options: options);
  }

  $grpc.ResponseStream<$1.FactorizationResponse> factorize(
      $1.FactorizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$factorize, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$2.AverageResponse> findAverage(
      $async.Stream<$2.AverageRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$findAverage, request, options: options)
        .single;
  }

  $grpc.ResponseStream<$3.SumResponse> sum($async.Stream<$3.SumRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$sum, request, options: options);
  }
}

abstract class CalculatorServiceBase extends $grpc.Service {
  $core.String get $name => 'calculator.CalculatorService';

  CalculatorServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.OperationRequest, $0.OperationResponse>(
        'Operate',
        operate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.OperationRequest.fromBuffer(value),
        ($0.OperationResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.FactorizationRequest, $1.FactorizationResponse>(
            'Factorize',
            factorize_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $1.FactorizationRequest.fromBuffer(value),
            ($1.FactorizationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.AverageRequest, $2.AverageResponse>(
        'FindAverage',
        findAverage,
        true,
        false,
        ($core.List<$core.int> value) => $2.AverageRequest.fromBuffer(value),
        ($2.AverageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.SumRequest, $3.SumResponse>(
        'Sum',
        sum,
        true,
        true,
        ($core.List<$core.int> value) => $3.SumRequest.fromBuffer(value),
        ($3.SumResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.OperationResponse> operate_Pre($grpc.ServiceCall call,
      $async.Future<$0.OperationRequest> request) async {
    return operate(call, await request);
  }

  $async.Stream<$1.FactorizationResponse> factorize_Pre($grpc.ServiceCall call,
      $async.Future<$1.FactorizationRequest> request) async* {
    yield* factorize(call, await request);
  }

  $async.Future<$0.OperationResponse> operate(
      $grpc.ServiceCall call, $0.OperationRequest request);
  $async.Stream<$1.FactorizationResponse> factorize(
      $grpc.ServiceCall call, $1.FactorizationRequest request);
  $async.Future<$2.AverageResponse> findAverage(
      $grpc.ServiceCall call, $async.Stream<$2.AverageRequest> request);
  $async.Stream<$3.SumResponse> sum(
      $grpc.ServiceCall call, $async.Stream<$3.SumRequest> request);
}
