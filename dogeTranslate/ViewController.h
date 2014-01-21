//
//  ViewController.h
//  dogeTranslate
//
//  Created by Ash Bhat on 1/20/14.
//  Copyright (c) 2014 Ash Bhat. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "TapFollow.h"
@interface ViewController : UIViewController<UITextFieldDelegate>
{
    TapFollow *follow;
}
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *scrollText;
@property (weak, nonatomic) IBOutlet UIButton *generate;

- (IBAction)dogify:(id)sender;

@end
