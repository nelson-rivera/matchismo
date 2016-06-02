//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Nelson Rivera on 5/24/16.
//  Copyright © 2016 Applaudo Studios. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong, readwrite) NSString *historyMessage;
@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic, strong) Deck *startDeck;
@property (nonatomic) NSInteger initCardCount;
@end

@implementation CardMatchingGame

- (NSMutableArray *) cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype) initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck{
    
    self = [super init];
    
    if  (self) {
        self.startDeck = deck;
        self.initCardCount = count;
        [self fillCards];
    }
    
    return self;
}

- (void) fillCards {
    if (self.startDeck && self.initCardCount) {
        for (int i = 0; i < self.initCardCount; i++) {
            Card *card = [self.startDeck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }
            else {
                break;
            }
        }
    }
}

- (Card *)cardAtIndex:(NSInteger)index{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSInteger)index using3CardMode:(BOOL)is3CardModeOn{
    NSInteger cardsToPlay = is3CardModeOn ? 3 : 2;
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        }
        else {
            NSMutableArray *chosenCards = [[NSMutableArray alloc] init];
            NSMutableString *historyMessageChosenCards = [[NSMutableString alloc] init];
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [chosenCards addObject:otherCard];
                    [historyMessageChosenCards appendFormat:@"%@", otherCard.contents];
                }
            }
            
            if ([chosenCards count] == cardsToPlay - 1) {
                int matchScore = [card match:chosenCards];
                if (matchScore) {
                    self.score += matchScore * MATCH_BONUS;
                    card.matched = YES;
                    for (Card *chosenCard in chosenCards) {
                        chosenCard.matched = YES;
                    }
                    self.historyMessage = [[NSString stringWithFormat:@"You scored %ld points, match made with %@", (long)matchScore * MATCH_BONUS, card.contents] stringByAppendingString:historyMessageChosenCards];
                }
                else {
                    self.score -= MISMATCH_PENALTY;
                    for (Card *chosenCard in chosenCards) {
                        chosenCard.chosen = NO;
                    }
                    self.historyMessage = [NSString stringWithFormat:@"You got penilized with %ld points, no match found", (long)MISMATCH_PENALTY];
                }
            }
            
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
    
}

- (void)restartGame {
    //self.cards = nil;
    //[self fillCards];
    self.score = 0;
}

@end
