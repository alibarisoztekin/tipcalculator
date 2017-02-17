//
//  ViewController.m
//  TipCalculator
//
//  Created by Ali Barış Öztekin on 2017-02-17.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "ViewController.h"
#import "Tipper.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;
@property (weak, nonatomic) IBOutlet UILabel *calculatedTip;

@property (nonatomic,strong) Tipper* tipper;
@property (nonatomic,assign) float tip;
@property (nonatomic,assign) float bill;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tipper = [Tipper new];
    self.tip = 15;
  
    // Do any additional setup after loading the view, typically from a nib.
   }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)slideTipPercentage:(UISlider*) sender
{
    self.tip =sender.value;
    NSLog(@"%f",sender.value);
    self.tipPercentageTextField.placeholder = [NSString stringWithFormat:@"%.f",self.tip];
    [self.view setNeedsDisplay];
}
-(void) getBillandTipInput
{
    NSString* billString = self.billAmountTextField.text;
   self.bill = [billString floatValue];
    if([self.tipPercentageTextField isFirstResponder])
    {
        NSString* tipString = self.tipPercentageTextField.text;
        self.tip = [tipString floatValue];
    }
    [self.view setNeedsDisplay];
    
}
- (IBAction)calculateTip:(id)sender {
    
    [self getBillandTipInput];
    float tip= [self.tipper calculateTipWithBillAmount:self.bill Percentage:self.tip];
    self.calculatedTip.text = [NSString stringWithFormat:@"$ %.f",tip];
    [self.view setNeedsDisplay];
    
}
-(IBAction) resignTextFieldfromFirstResponder:(UITapGestureRecognizer*) sender
{
    if (sender.state == UIGestureRecognizerStateBegan){
        if([self.tipPercentageTextField isFirstResponder] || [self.billAmountTextField isFirstResponder])
        {
            [self.tipPercentageTextField endEditing:YES];
            [self.billAmountTextField endEditing:YES];
        }
        [self.view setNeedsDisplay];
    }

}
@end
