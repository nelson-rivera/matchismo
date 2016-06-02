//
//  Deck.h
//  CardGame
//
//  Created by Nelson Rivera on 5/19/16.
//  Copyright © 2016 Applaudo Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

-(Card *)drawRandomCard;

@end
