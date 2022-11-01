import 'package:bloc_state/bloc/cats_model.dart';
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
    final List<CatsModel> response;
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