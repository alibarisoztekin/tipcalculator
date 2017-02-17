//
//  Tipper.m
//  TipCalculator
//
//  Created by Ali Barış Öztekin on 2017-02-17.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "Tipper.h"

@implementation Tipper


-(float)calculateTipWithBillAmount:(float)billAmount Percentage:(float) percentage
{

    return billAmount*percentage/100;
    
}


@end
