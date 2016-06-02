//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Nelson Rivera on 5/24/16.
//  Copyright © 2016 Applaudo Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"


@interface CardMatchingGame : NSObject

//designated initializer
- (instancetype)initWithCardCount:(NSInteger) count
                        usingDeck:(Deck *) deck;

- (void)chooseCardAtIndex:(NSInteger)index using3CardMode:(BOOL)is3CardModeOn;
- (Card *)cardAtIndex:(NSInteger) index;
- (void)restartGame;


@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) NSString *historyMessage;

@end
