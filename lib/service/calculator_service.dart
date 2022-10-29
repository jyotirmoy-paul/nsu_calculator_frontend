import 'dart:developer';

import 'package:calculator_frontend/generated/calculator.pbgrpc.dart';
import 'package:calculator_frontend/generated/operation.pb.dart';
import 'package:calculator_frontend/screens/calculator_screen/models/result.dart';
import 'package:calculator_frontend/screens/calculator_screen/widgets/calculator_button/calculator_button_model.dart';
import 'package:grpc/grpc.dart';

class CalculatorService {
  static const _tag = 'CalculatorService';

  final String _host = '0.0.0.0';
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