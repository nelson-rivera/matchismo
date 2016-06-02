//
//  ViewController.h
//  Matchismo
//
//  Created by Nelson Rivera on 5/23/16.
//  Copyright © 2016 Applaudo Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) Deck *deck;
- (Deck *) createDeck; //abstract method

@end

