//
//  HighVoltageBrain.m
//  HighVoltage
//
//  Created by Gregory Weiss on 7/28/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "HighVoltageBrain.h"


@interface HighVoltageBrain ()

@property (nonatomic, copy) NSMutableString *operand1String;
@property (nonatomic, copy) NSMutableString *operand2String;
@property int brainRtrnCount;

@property (assign) OperatorType operatorType;

@end

@implementation HighVoltageBrain

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _operand1String = [[NSMutableString alloc] init];
        _operand2String = [[NSMutableString alloc] init];
        _operatorType = OperatorTypeNone;
    }
    
    return self;
}

- (int) getReturnCount:(int)rCount
{
    self.brainRtrnCount = rCount;
    return self.brainRtrnCount;
}

- (NSString *)addOperandDigit:(NSString *)digit
{
    NSString *returnString;
    
    if (self.brainRtrnCount == 0)
    {
        if ([digit isEqualToString:@"."])
        {
            if (![self.operand1String containsString:@"."])
            {
                [self.operand1String appendString:@"."];
            }
        }
        else
        {
            [self.operand1String appendString:digit];
        }
      
        returnString = self.operand1String;
       

    }
    else if (self.brainRtrnCount == 1)
    {
        if ([digit isEqualToString:@"."])
        {
            if (![self.operand2String containsString:@"."])
            {
                [self.operand2String appendString:@"."];
            }
        }
        else
        {
            [self.operand2String appendString:digit];
        }
        returnString = self.operand2String;
    }
    NSLog(@"operand1String is %@", self.operand1String);
    NSLog(@"operand2String is %@", self.operand2String);


    return returnString;

}

- (NSString *)addOperator:(NSString *)operatorValue  // Picking the right equation based on variables
{
    NSString *returnString = nil;
    
   
// *********** Work in this AREA NEXT!!!***************************************************************
    
    if (self.operatorType == OperatorTypeNone && ![self.operand1String isEqualToString:@""])
        {
        
             if ([operatorValue containsString:@"Volts"] && [operatorValue containsString:@"Watts"])
             {
                 if ([operatorValue isEqualToString:@"VoltsWatts"])
                {
                    self.operatorType = OperatorTypeVoltsWatts;
                }
                 else
                 {
                     self.operatorType = OperatorTypeWattsVolts;
                 }
            
             }
             else if ([operatorValue containsString:@"Volts"] && [operatorValue containsString:@"Ohms"])
             {
                 if ([operatorValue isEqualToString:@"VoltsOhms"])
                 {
                     self.operatorType = OperatorTypeVoltsOhms;
                 }
                 else
                 {
                     self.operatorType = OperatorTypeOhmsVolts;
                 }
             }
             else if ([operatorValue containsString:@"Volts"] && [operatorValue containsString:@"Amps"])
             {
                 if ([operatorValue isEqualToString:@"VoltsAmps"])
                 {
                     self.operatorType = OperatorTypeVoltsAmps;
                 }
                 else
                 {
                     self.operatorType = OperatorTypeAmpsVolts;
                 }
             }
             else if ([operatorValue containsString:@"Ohms"] && [operatorValue containsString:@"Amps"])
             {
                 if ([operatorValue isEqualToString:@"OhmsAmps"])
                 {
                     self.operatorType = OperatorTypeOhmsAmps;
                 }
                 else
                 {
                     self.operatorType = OperatorTypeAmpsOhms;
                 }
             }
             else if ([operatorValue containsString:@"Ohms"] && [operatorValue containsString:@"Watts"])
             {
                 if ([operatorValue isEqualToString:@"OhmsWatts"])
                 {
                     self.operatorType = OperatorTypeOhmsWatts;
                 }
                 else
                 {
                     self.operatorType = OperatorTypeWattsOhms;
                 }
             }
             else if ([operatorValue containsString:@"Amps"] && [operatorValue containsString:@"Watts"])
             {
                 if ([operatorValue isEqualToString:@"AmpsWatts"])
                 {
                     self.operatorType = OperatorTypeAmpsWatts;
                 }
                 else
                 {
                     self.operatorType = OperatorTypeWattsAmps;
                 }
             }



            
        }
    NSLog(@"OpType is %u", self.operatorType);
    return returnString;
}

- (NSString *)flipSign
{
    if (![self.operand2String isEqualToString:@""])
    {
        double operand = [self.operand2String doubleValue];
        if (operand != 0)
        {
            // flips positive to negative and vice versa
            operand = operand * -1;
            [self.operand2String setString:[NSString stringWithFormat:@"%g", operand]];
            return self.operand2String;
        }
    }
    else if (![self.operand1String isEqualToString:@""])
    {
        double operand = [self.operand1String doubleValue];
        if (operand != 0)
        {
            // flips positive to negative and vice versa
            operand = operand * -1;
            [self.operand1String setString:[NSString stringWithFormat:@"%g", operand]];
            return self.operand1String;
        }
    }
    
    return nil;
}

- (NSString *)makePercent
{
    if (![self.operand2String isEqualToString:@""])
    {
        double operand = [self.operand2String doubleValue];
        // Convert number to percentage
        operand = operand * 0.01f;
        [self.operand2String setString:[NSString stringWithFormat:@"%g", operand]];
        return self.operand2String;
    }
    else if (![self.operand1String isEqualToString:@""])
    {
        double operand = [self.operand1String doubleValue];
        // Convert number to percentage
        operand = operand * 0.01f;
        [self.operand1String setString:[NSString stringWithFormat:@"%g", operand]];
        return self.operand1String;
    }
    
    return nil;
}

- (NSString *)performSquareRoot
{
    if (![self.operand2String isEqualToString:@""])
    {
        double operand = [self.operand2String doubleValue];
        if (operand >= 0)
        {
            operand = sqrt(operand);
            [self.operand2String setString:[NSString stringWithFormat:@"%g", operand]];
            return self.operand2String;
        }
        else
        {
            return @"Error";
        }
    }
    else if (![self.operand1String isEqualToString:@""])
    {
        double operand = [self.operand1String doubleValue];
        if (operand >= 0)
        {
            operand = sqrt(operand);
            [self.operand1String setString:[NSString stringWithFormat:@"%g", operand]];
            return self.operand1String;
        }
        else
        {
            return @"Error";
        }
    }
    
    return nil;
}

- (NSString *)performCalculationIfPossible
{
    // If we have 2 operands and an operator, we can perform the calculation
    if (![self.operand1String isEqualToString:@""] && ![self.operand2String isEqualToString:@""] && self.operatorType != OperatorTypeNone)
    {
        double operand1 = [self.operand1String doubleValue];
        double operand2 = [self.operand2String doubleValue];
        
        double answer1 = 0;
        double answer2 = 0;
        
        switch (self.operatorType)
        {
                
            case OperatorTypeWattsOhms:
                self.voltsAsADouble = sqrt(operand1 * operand2);
                self.ampsAsADouble = sqrt(operand1 / operand2);
                self.wattsAsADouble = operand1;
                self.ohmsAsADouble = operand2;
                break;
            case OperatorTypeWattsAmps:
                self.ohmsAsADouble = operand1 / (operand2 * operand2);
                self.voltsAsADouble = operand1 / operand2;
                self.wattsAsADouble = operand1;
                self.ampsAsADouble = operand2;
                break;
            case OperatorTypeWattsVolts:
                self.ampsAsADouble = operand1 / operand2;
                self.ohmsAsADouble = (operand2 * operand2) / operand1;
                self.wattsAsADouble = operand1;
                self.voltsAsADouble = operand2;
                break;
            case OperatorTypeOhmsAmps:
                self.voltsAsADouble = operand2 * operand1;
                self.wattsAsADouble = (operand2 * operand2) * operand1;
                self.ohmsAsADouble = operand1;
                self.ampsAsADouble = operand2;
                break;
            case OperatorTypeOhmsVolts:
                self.wattsAsADouble = (operand2 * operand2) / operand1;
                self.ampsAsADouble = operand2 / operand1;
                self.ohmsAsADouble = operand1;
                self.voltsAsADouble = operand2;
                break;
            case OperatorTypeOhmsWatts:
                self.ampsAsADouble = sqrt(operand2 / operand1);
                self.voltsAsADouble = sqrt(operand2 * operand1);
                self.ohmsAsADouble = operand1;
                self.wattsAsADouble = operand2;
                break;
            case OperatorTypeVoltsAmps:
                self.wattsAsADouble = operand1 * operand2;
                self.ohmsAsADouble = operand1 / operand2;
                self.voltsAsADouble = operand1;
                self.ampsAsADouble = operand2;
                break;
            case OperatorTypeVoltsOhms:
                self.wattsAsADouble = (operand1 * operand1) / operand2;
                self.ampsAsADouble = operand1 / operand2;
                self.voltsAsADouble = operand1;
                self.ohmsAsADouble = operand2;
                break;
            case OperatorTypeVoltsWatts:
                self.ohmsAsADouble = (operand1 * operand1) / operand2;
                self.ampsAsADouble = operand2 / operand1;
                self.voltsAsADouble = operand1;
                self.wattsAsADouble = operand2;
                break;
            case OperatorTypeAmpsOhms:
                self.voltsAsADouble = operand1 * operand2;
                self.wattsAsADouble = (operand1 * operand1) * operand2;
                self.ampsAsADouble = operand1;
                self.ohmsAsADouble = operand2;
                break;
            case OperatorTypeAmpsVolts:
                self.wattsAsADouble = operand2 * operand1;
                self.ohmsAsADouble = operand2 / operand1;
                self.ampsAsADouble = operand1;
                self.voltsAsADouble = operand2;
                break;
            case OperatorTypeAmpsWatts:
                self.ohmsAsADouble = operand2 / (operand1 * operand1);
                self.voltsAsADouble = operand2 / operand1;
                self.ampsAsADouble = operand1;
                self.wattsAsADouble = operand2;
                break;
                
                
            case OperatorTypeDivision:
                if (operand2 != 0)
                {
                    answer1 = operand1 / operand2;
                    answer2 = answer1;
                }
                else
                {
                    // Cannot divide by 0
                    return @"Error";
                }
                break;
                
            default:
                break;
        }
        self.ampsAsAString = [NSString stringWithFormat:@"%g", self.ampsAsADouble];
        self.voltsAsAString = [NSString stringWithFormat:@"%g", self.voltsAsADouble];
        self.wattsAsAString = [NSString stringWithFormat:@"%g", self.wattsAsADouble];
        self.ohmsAsAString = [NSString stringWithFormat:@"%g", self.ohmsAsADouble];
        // Calculation successful, return answer
        return [NSString stringWithFormat:@"%g", answer1];
    }
    
    // We don't have all the components necessary to perform a transaction so return nil
    return nil;
}




@end
