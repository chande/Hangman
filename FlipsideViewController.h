//
//  FlipsideViewController.h
//  Hangman
//
//  Created by sebastian chande on 3/8/14.
//  Copyright (c) 2014 sebastian chande. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController

@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;
@property (nonatomic, strong) IBOutlet UISlider *guessesSlider;
@property (nonatomic, strong) IBOutlet UISlider *wordLengthSlider;
@property (nonatomic, strong) IBOutlet UILabel *guessesLabel;
@property (nonatomic, strong) IBOutlet UILabel *wordLengthLabel;

- (IBAction)sliderValueChanged:(id)sender;
- (IBAction)done:(id)sender;

@end
