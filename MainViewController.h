//
//  MainViewController.h
//  Hangman
//
//  Created by sebastian chande on 3/8/14.
//  Copyright (c) 2014 sebastian chande. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextField *inputField;
@property (strong, nonatomic) IBOutlet UILabel *guessesLeftLabel;
@property (strong, nonatomic) IBOutlet UILabel *currentWordLabel;
@property (strong, nonatomic) IBOutlet UILabel *aLabel;
@property (strong, nonatomic) IBOutlet UILabel *bLabel;
@property (strong, nonatomic) IBOutlet UILabel *cLabel;
@property (strong, nonatomic) IBOutlet UILabel *dLabel;
@property (strong, nonatomic) IBOutlet UILabel *eLabel;
@property (strong, nonatomic) IBOutlet UILabel *fLabel;
@property (strong, nonatomic) IBOutlet UILabel *gLabel;
@property (strong, nonatomic) IBOutlet UILabel *hLabel;
@property (strong, nonatomic) IBOutlet UILabel *iLabel;
@property (strong, nonatomic) IBOutlet UILabel *jLabel;
@property (strong, nonatomic) IBOutlet UILabel *kLabel;
@property (strong, nonatomic) IBOutlet UILabel *lLabel;
@property (strong, nonatomic) IBOutlet UILabel *mLabel;
@property (strong, nonatomic) IBOutlet UILabel *nLabel;
@property (strong, nonatomic) IBOutlet UILabel *oLabel;
@property (strong, nonatomic) IBOutlet UILabel *pLabel;
@property (strong, nonatomic) IBOutlet UILabel *qLabel;
@property (strong, nonatomic) IBOutlet UILabel *rLabel;
@property (strong, nonatomic) IBOutlet UILabel *sLabel;
@property (strong, nonatomic) IBOutlet UILabel *tLabel;
@property (strong, nonatomic) IBOutlet UILabel *uLabel;
@property (strong, nonatomic) IBOutlet UILabel *vLabel;
@property (strong, nonatomic) IBOutlet UILabel *wLabel;
@property (strong, nonatomic) IBOutlet UILabel *xLabel;
@property (strong, nonatomic) IBOutlet UILabel *yLabel;
@property (strong, nonatomic) IBOutlet UILabel *zLabel;
@property (strong, nonatomic) NSMutableArray *letterLabels;
@property (strong, nonatomic) NSMutableArray *wordSet;
@property (nonatomic) int correctGuesses;
@property (strong, nonatomic) NSString *theWord;

- (IBAction)keyPressed:(id)sender;
- (IBAction)newGame;

- (NSString *) selectNewWord;

@end
