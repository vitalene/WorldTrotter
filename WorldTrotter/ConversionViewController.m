

#import "ConversionViewController.h"

@interface ConversionViewController ()
@property (nonatomic) IBOutlet UILabel *celsiusLabel;
@end

@implementation ConversionViewController

- (IBAction)fahrenheitFieldEditingChanged:(UITextField *)textField {
    self.celsiusLabel.text = textField.text;
}

-(void)viewDidLoad {

    
}
@end
