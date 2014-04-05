//
//  FlipsideViewController.m
//  Hangman
//
//  Created by sebastian chande on 3/8/14.
//  Copyright (c) 2014 sebastian chande. All rights reserved.
//

#import "FlipsideViewController.h"

@interface FlipsideViewController ()

@end

@implementation FlipsideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _wordLengthSlider.value = [defaults integerForKey:@"wordLength"];
    _wordLengthLabel.text = [NSString stringWithFormat:@"%0.0f", _wordLengthSlider.value];
    
    _guessesSlider.value = [defaults integerForKey:@"maxGuesses"];
    _guessesLabel.text = [NSString stringWithFormat:@"%0.0f", _guessesSlider.value];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

-(IBAction)sliderValueChanged:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (sender == _wordLengthSlider) {
        _wordLengthLabel.text = [NSString stringWithFormat:@"%0.0f", _wordLengthSlider.value];
        [defaults setInteger:[_wordLengthLabel.text intValue] forKey:@"wordLength"];
    }
    if (sender == _guessesSlider) {
        _guessesLabel.text = [NSString stringWithFormat:@"%0.0f", _guessesSlider.value];
        [defaults setInteger:[_guessesLabel.text intValue] forKey:@"maxGuesses"];
    }
    [defaults synchronize];
}

@end
