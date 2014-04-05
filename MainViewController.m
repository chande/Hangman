//
//  MainViewController.m
//  Hangman
//
//  Created by sebastian chande on 3/8/14.
//  Copyright (c) 2014 sebastian chande. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.inputField becomeFirstResponder];
  self.letterLabels = [[NSMutableArray alloc]  initWithObjects:_aLabel, _bLabel, _cLabel, _dLabel, _eLabel, _fLabel, _gLabel, _hLabel, _iLabel, _jLabel, _kLabel, _lLabel, _mLabel, _nLabel, _oLabel, _pLabel, _qLabel, _rLabel, _sLabel, _tLabel, _uLabel, _vLabel, _wLabel, _xLabel, _yLabel, _zLabel, nil];
  
  NSString *fileWithPath = [[NSBundle mainBundle] pathForResource:@"words" ofType:@"plist"];
  _wordSet = [[NSMutableArray alloc] initWithContentsOfFile:fileWithPath];
  
  // Log the first work in the list
  NSLog(@"%d", _wordSet.count);
  
  [self newGame];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)keyPressed:(id)sender
{
  if (self.theWord.length > 0){
    unsigned long textLength = self.inputField.text.length - 1;
    //NSLog(@"%C", [self.inputField.text characterAtIndex:textLength]);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger guessesLeft = [defaults integerForKey:@"guessesLeft"] - 1;
    
    if (guessesLeft >= 0 && isalpha([self.inputField.text characterAtIndex:textLength])){
      for (UILabel *label in self.letterLabels){
        unichar currentChar = [label.text.lowercaseString characterAtIndex:0];
        if (currentChar == [self.inputField.text characterAtIndex:textLength]){
          
          //letter hasn't been tried yet
          if (label.backgroundColor != [UIColor redColor] && label.backgroundColor != [UIColor greenColor]){
            label.backgroundColor = [UIColor redColor];
            
            int charWasFound = 0;
            //check if key that was pressed occurs in randomly selected word
            for (int i = 0; i < self.theWord.length; i++){
              char testChar = [self.theWord characterAtIndex:i];
              if (testChar == currentChar) {
                self.currentWordLabel.text = [self.currentWordLabel.text stringByReplacingCharactersInRange:NSMakeRange(((i*3)+1),1) withString:[NSString stringWithFormat:@"%c", currentChar]];
                charWasFound = 1;
                _correctGuesses++;
                label.backgroundColor = [UIColor greenColor];
              }
            }
            
            if (!charWasFound){
              self.guessesLeftLabel.text = [NSString stringWithFormat:@"%ld", (long)guessesLeft];
              [defaults setInteger:guessesLeft forKey:@"guessesLeft"];
              [defaults synchronize];
              if (guessesLeft == 0){
                NSString *loseMessage = [[NSString alloc] initWithFormat:@"'%@' was the word.", _theWord];
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over"
                                                                message:loseMessage
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
              }
            }
          }
        }
      }
      if (_correctGuesses == _theWord.length){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over"
                                                        message:@"You Win!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [defaults setInteger:0 forKey:@"guessesLeft"];
        [defaults synchronize];
      }
    }
  }
}

- (IBAction)newGame
{
  for (UILabel *label in self.letterLabels){
    label.backgroundColor = [UIColor whiteColor];
  }
  
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  self.guessesLeftLabel.text = [NSString stringWithFormat:@"%@", [defaults valueForKey:@"maxGuesses"]];
  
  [defaults setInteger:[defaults integerForKey:@"maxGuesses"] forKey:@"guessesLeft"];
  [defaults synchronize];
  
  //randomly select word
  do {
    self.theWord = self.selectNewWord;
  }while (self.theWord.length > [defaults integerForKey:@"wordLength"]);
    //NSLog(@"%@", self.theWord);
    
    //show underscores in game window
    int wordLength = self.theWord.length;
    self.currentWordLabel.text = @"";
    NSString *currentWordPlaceholders = [self.currentWordLabel.text stringByPaddingToLength:wordLength*3 withString:@" - " startingAtIndex:0];
    self.currentWordLabel.text = currentWordPlaceholders;
    
    _correctGuesses = 0;
  }
  
  - (NSString *) selectNewWord
  {
    uint32_t rnd = arc4random_uniform(_wordSet.count);
    return [[_wordSet objectAtIndex:rnd] lowercaseString];
  }
  
#pragma mark - Flipside View
  
  - (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
  {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.inputField becomeFirstResponder];
  }
  
  - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
  {
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
      [[segue destinationViewController] setDelegate:self];
    }
  }
  
  @end
