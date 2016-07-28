//
//  HighVoltageBrain.h
//  HighVoltage
//
//  Created by Gregory Weiss on 7/28/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HighVoltageBrain : NSObject

- (NSString *)addOperandDigit:(NSString *)digit;
- (NSString *)addOperator:(NSString *)operatorValue;
- (NSString *)performCalculationIfPossible;


@end
