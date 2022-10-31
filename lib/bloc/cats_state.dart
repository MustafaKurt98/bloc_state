// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

abstract class CatsState{
  const CatsState();
}

  class CatsInitial extends CatsState {
    const CatsInitial();
  }

  class CatsLoading extends CatsState {
    const CatsLoading();
  }

class CatsCompleted extends CatsState {
    final List<String> response;
    const CatsCompleted(this.response);
    
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CatsCompleted && listEquals(other.response, response);
      
  }

  @override
  int get hashCode => response.hashCode;
  }
 

  class CatsError extends CatsState {
    const CatsError(this.message);
    final String message;
  }