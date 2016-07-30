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
    OperatorTypeOhmsAmps,
    OperatorTypeOhmsVolts,
    OperatorTypeOhmsWatts,
    OperatorTypeVoltsAmps,
    OperatorTypeVoltsWatts,
    OperatorTypeVoltsOhms,
    OperatorTypeAmpsOhms,
    OperatorTypeAmpsVolts,
    OperatorTypeAmpsWatts
} OperatorType;

@property (strong, nonatomic) NSMutableArray *brainAnswers;
@property (strong, nonatomic) NSString *voltsAsAString;
@property (strong, nonatomic) NSString *wattsAsAString;
@property (strong, nonatomic) NSString *ohmsAsAString;
@property (strong, nonatomic) NSString *ampsAsAString;
@property double voltsAsADouble;
@property double wattsAsADouble;
@property double ohmsAsADouble;
@property double ampsAsADouble;
@property (nonatomic, assign)enum OperatorType *thisOperator;

- (NSString *)addOperandDigit:(NSString *)digit;
- (NSString *)addOperator:(NSString *)operatorValue;
- (NSString *)performCalculationIfPossible;
- (int) getReturnCount:(int)rCount;



@end
