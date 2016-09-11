

#import "ConversionViewController.h"

@interface ConversionViewController ()
@property (nonatomic) IBOutlet UILabel *celsiusLabel;
@property (nonatomic) IBOutlet UITextField *fahrenheitField;
@property (nonatomic) double fahrenheitValue;
@property (nonatomic) double celsiusValue;
@end

@implementation ConversionViewController

-(void)setFahrenheitValue:(double)fahrenheitValue {
    _fahrenheitValue = fahrenheitValue;
    [self updateCelsiusLabel];
}

-(void)setCelsiusValue:(double)celsiusValue {
    self.fahrenheitValue = celsiusValue * (9.0/5.0) + 32;
}

-(double)celsiusValue {
    return (self.fahrenheitValue -32) * (5.0/9.0);
}

-(void)updateCelsiusLabel {
    self.celsiusLabel.text = @(self.celsiusValue).stringValue;
}

- (IBAction)fahrenheitFieldEditingChanged:(UITextField *)textField {

    double value = textField.text.doubleValue;
    self.fahrenheitValue = value;
}

- (IBAction)dismissKeyboard:(id)sender {
    [self.fahrenheitField resignFirstResponder];
}

-(void)viewDidLoad {
    
    
}
@end
