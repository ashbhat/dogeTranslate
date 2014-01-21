//
//  ViewController.m
//  dogeTranslate
//
//  Created by Ash Bhat on 1/20/14.
//  Copyright (c) 2014 Ash Bhat. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property NSArray *dogeWords;
@property NSSet *allBadWords;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dogeWords = [[NSArray alloc]initWithObjects:@"much",@"very",@"such",@"wow",@"so",@"many",nil];
    self.textField.delegate = self;
    self.allBadWords = [NSSet setWithObjects:@"a", @"an",@"at",@"I",@"am",@"you",@"she",@"it",@"he",@"they",@"we",@"us",@"me",@"him",@"her",@"has",@"have", @"are", @"is",@"was",@"were",@"be",@"become",@"became",nil];

    UIFont *displayFont = [UIFont fontWithName:@"Comic Sans MS" size:60];
    UIFont *buttonFont = [UIFont fontWithName:@"Comic Sans MS" size:20];
    self.scrollText.font = displayFont;
    self.generate.titleLabel.font = buttonFont;
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    if(touch.phase == UITouchPhaseBegan) {
        [self.view endEditing:YES];
    }
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self dogify:nil];
    [self.view endEditing:YES];
    return YES;
}
- (IBAction)creditForImage:(id)sender {
    UIAlertView *credit = [[UIAlertView alloc]initWithTitle:@"Image Credit" message:@"Emily Wilson" delegate:self cancelButtonTitle:@"cool" otherButtonTitles:nil, nil];
    [credit show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)dogify:(id)sender {
    [self.view endEditing:YES];
    NSString *temp = [NSString stringWithFormat:@"%@ ",self.textField.text];
    NSMutableArray *array = (NSMutableArray *)[temp componentsSeparatedByString:@" "];
    for (int i=0; i < [array count]; i++) {
        if ([self.allBadWords containsObject:[array objectAtIndex:i]]) {
            [array removeObjectAtIndex:i];
            i--;
        }
        else if ([[array objectAtIndex:i]length ]<4){
            //nothing done
        }
        else{
            NSString *value = [[array objectAtIndex: i] substringFromIndex:[[array objectAtIndex: i] length] - 2];
            if ([value isEqualToString:@"ly"]) {
                value = [value substringToIndex:[value length] - 2];
                [array replaceObjectAtIndex:i withObject:value];
            }
            else{
                NSString *value2 = [[array objectAtIndex: i] substringFromIndex:[[array objectAtIndex: i] length] -3];
                if ([value2 isEqualToString:@"ing"]) {
                    value = [[array objectAtIndex: i] substringToIndex:[[array objectAtIndex: i]length ]-3];
                    [array replaceObjectAtIndex:i withObject:value];
                    
                }
                else{
                    int rand = arc4random() % 6;
                    NSString *randomDoge= [self.dogeWords objectAtIndex:rand];
                    [array insertObject:randomDoge atIndex:i];
                    i++;
                }
            }
        }
    }
    
    
    NSString * result = [[array valueForKey:@"description"] componentsJoinedByString:@" "];
    self.scrollText.text = result;
    
    result = [NSString stringWithFormat:@"%@... wow",result];
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc] init];
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:result];
    utterance.rate = 0.1;
    [synthesizer speakUtterance:utterance]; 
    
    
}

- (IBAction)follow:(id)sender {
    follow = [[TapFollow alloc]init];
    [follow user:@"theashbhat"];
}


@end
