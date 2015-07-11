//
//  ViewController.m
//  Multiply
//
//  Created by NP ECE BME Centre on 11/7/15.
//  Copyright (c) 2015 NP ECE BME Centre. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (weak, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)onCalculateButtonPressed:(UIButton *)sender {
    
    [self doMultiplicationAndShowColor];
    
}

- (void)doMultiplicationAndShowColor{
    int numbertextField = self.numberTextField.text.intValue;
    int multiplierLabel = self.multiplierLabel.text.intValue;
    
    long result;
    
    if(self.operatorSegmentControl.selectedSegmentIndex == 0){
        result = numbertextField * multiplierLabel;
    }
    else{
        result = numbertextField / multiplierLabel;
    }

    if ((result % 3==0) && (result % 5==0)) {
        self.answerLabel.text = @"fizzbuzz";
    }
    else if((result % 3==0)) {
        self.answerLabel.text = @"fizz";
    }
    else if((result % 5==0)) {
        self.answerLabel.text = @"buzz";
    }
    else{
        self.answerLabel.text = [NSString stringWithFormat:@"%ld",result];
    }
    NSLog(@"%ld",result);
    
    if (result >= 20) {
        self.view.backgroundColor = [UIColor greenColor];
    }
    else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
    [self.numberTextField resignFirstResponder];
    
}
- (IBAction)onSliderValueChanged:(UISlider *)sender {
    self.multiplierLabel.text = [NSString stringWithFormat:@"%ld", lround(sender.value)];
    // self.multiplierLabel.text = [NSString stringWithFormat:@"%.0f", sender.value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
