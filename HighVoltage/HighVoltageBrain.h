//
//  HighVoltageBrain.h
//  HighVoltage
//
//  Created by Gregory Weiss on 7/28/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HighVoltageBrain : NSObject

typedef enum
{
    OperatorTypeNone,
    OperatorTypeSome,
    OperatorTypeAddition,
    OperatorTypeSubtraction,
    OperatorTypeMultiplication,
    OperatorTypeDivision,
    OperatorTypeWattsOhms,
    OperatorTypeWattsAmps,
    OperatorTypeWattsVolts,
    OperatorTypeOhmsWatts,
    OperatorTypeOhmsAmps,
    OperatorTypeOhmsVolts,
    OperatorTypeVoltsOhms,
    OperatorTypeVoltsAmps,
    OperatorTypeVoltsWatts,
    OperatorTypeAmpsOhms,
    OperatorTypeAmpsWatts,
    OperatorTypeAmpsVolts,
} OperatorType;

@property (nonatomic, assign)enum OperatorType *thisOperator;

- (NSString *)addOperandDigit:(NSString *)digit;
- (NSString *)addOperator:(NSString *)operatorValue;
- (NSString *)performCalculationIfPossible;
- (int) getReturnCount:(int)rCount;



@end
