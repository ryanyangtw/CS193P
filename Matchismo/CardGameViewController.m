//
//  ViewController.m
//  Matchismo
//
//  Created by Ryan on 2015/1/21.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

//@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
//@property (nonatomic) int flipCount;
//@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;

@end

@implementation CardGameViewController



- (CardMatchingGame *)game
{

    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];

    return _game;

}


- (Deck *)createDeck //abstract
{
    //return [[PlayingCardDeck alloc] init];
    return nil;
}


- (IBAction)touchCardButton:(UIButton *)sender {
    
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    NSLog( @"chosenButtonIndex %lu",  chosenButtonIndex);
    
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
    
    /*
     if ([sender.currentTitle length]) {
     [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
     forState:UIControlStateNormal];
     [sender setTitle:@"" forState:UIControlStateNormal];
     } else {
     Card *randomCard = [self.deck drawRandomCard];
     
     if (randomCard) {
     [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
     forState:UIControlStateNormal];
     [sender setTitle:randomCard.contents forState:UIControlStateNormal];
     }
     }
     */
    
    //self.flipCount++;
}


- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        //int
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
    //return card.contents;
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}



/*
- (Deck *)deck
{
    if (!_deck) _deck = [self createDeck];
    return _deck;
}
*/



/*
- (void) setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flipCount changed to %d", self.flipCount);
    
 
    //NSString *str = @"Test";
    //NSLog(str);

}
*/



/*
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/
@end
