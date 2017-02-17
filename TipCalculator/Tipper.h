//
//  Tipper.h
//  TipCalculator
//
//  Created by Ali Barış Öztekin on 2017-02-17.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tipper : NSObject 
-(float)calculateTipWithBillAmount:(float)billAmount Percentage:(float) percentage;

@end
