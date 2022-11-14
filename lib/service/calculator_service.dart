import 'dart:developer';

import 'package:calculator_frontend/generated/average.pb.dart';
import 'package:calculator_frontend/generated/calculator.pbgrpc.dart';
import 'package:calculator_frontend/generated/factorization.pb.dart';
import 'package:calculator_frontend/generated/sum.pb.dart';
import 'package:calculator_frontend/generated/operation.pb.dart';
import 'package:calculator_frontend/screens/calculator_screen/models/result.dart';
import 'package:calculator_frontend/screens/calculator_screen/widgets/calculator_button/calculator_button_model.dart';
import 'package:grpc/grpc.dart';

class CalculatorService {
  static const _tag = 'CalculatorService';

  final String _host = '192.168.1.6';
  final int _port = 30031;

  late CalculatorServiceClient _stub;

  CalculatorService() {
    final channel = ClientChannel(
      _host,
      port: _port,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    _stub = CalculatorServiceClient(channel);
  }

  Result _handleGrpcError(GrpcError e) {
    log('$_tag :: operate: GrpcError: ${e.message}');
    return Result(error: e.message);
  }

  Result _handleError(Object e) {
    log('$_tag :: operate: Error: $e');
    return Result.generalError;
  }

  Future<Result?> sum({
    required Stream<double> inStream,
    required void Function(double n) onSumResponse,
  }) async {
    try {
      final outStream = _stub.sum(
        inStream.map((event) => SumRequest(number: event)),
      );

      await outStream.forEach((response) {
        onSumResponse(response.number);
      });

      return null;
    } on GrpcError catch (e) {
      return _handleGrpcError(e);
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<Result> average({
    required Stream<double> stream,
  }) async {
    try {
      final resp = await _stub.findAverage(
        stream.map(
          (event) => AverageRequest(number: event),
        ),
      );

      return Result(
        result: resp.result,
      );
    } on GrpcError catch (e) {
      return _handleGrpcError(e);
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<Result?> factorize({
    required int n,
    required void Function(int factor) onGet,
  }) async {
    try {
      final stream = _stub.factorize(FactorizationRequest(
        number: n,
      ));

      await stream.forEach((response) {
        onGet(response.factor);
      });

      return null;
    } on GrpcError catch (e) {
      return _handleGrpcError(e);
    } catch (e) {
      log('$_tag :: operate: Error: $e');
      return Result.generalError;
    }
  }

  Future<Result> operate({
    required double operandA,
    required double operandB,
    required OperatorType operatorType,
  }) async {
    late OperationType type;

    switch (operatorType) {
      case OperatorType.add:
        type = OperationType.OPERATION_TYPE_ADD;
        break;

      case OperatorType.subtract:
        type = OperationType.OPERATION_TYPE_SUBTRACT;
        break;

      case OperatorType.multiply:
        type = OperationType.OPERATION_TYPE_MULTIPLY;
        break;

      case OperatorType.divide:
        type = OperationType.OPERATION_TYPE_DIVIDE;
        break;

      default:
        log('$_tag :: operate: Invalid OperatorType: $operatorType');
        throw Exception('Invalid OperatorType: $operatorType');
    }

    try {
      final req = OperationRequest(
        operandA: operandA,
        operandB: operandB,
        operationType: type,
      );

      final now = DateTime.now();
      final resp = await _stub.operate(req);
      log('$_tag :: resp recieved in ${DateTime.now().difference(now).inMilliseconds} MS');

      return Result(
        result: resp.result,
      );
    } on GrpcError catch (e) {
      log('$_tag :: operate: GrpcError: ${e.message}');
      return Result(error: e.message);
    } catch (e) {
      log('$_tag :: operate: Error: $e');
      return Result.generalError;
    }
  }
}
