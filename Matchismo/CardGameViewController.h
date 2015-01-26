//
//  ViewController.h
//  Matchismo
//
//  Created by Ryan on 2015/1/21.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

// Abstract ckasS. Must implement methods as described below.
#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController


// protected
// for subclasses
- (Deck *)createDeck; // abstract

@end

