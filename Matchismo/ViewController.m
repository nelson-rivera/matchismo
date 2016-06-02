//
//  ViewController.m
//  Matchismo
//
//  Created by Nelson Rivera on 5/23/16.
//  Copyright © 2016 Applaudo Studios. All rights reserved.
//

#import "ViewController.h"
#import "PlayingDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
//@property (strong, nonatomic) Deck *deck;
@property (nonatomic) NSUInteger flipCounter;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *historyLabel;
@property (weak, nonatomic) IBOutlet UISwitch *gameMode3CardsSwitch;
@end

@implementation ViewController

- (CardMatchingGame *)game {
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck: [self createDeck]];
    }
    return _game;
}

- (Deck *)deck {
    if (!_deck) {
        _deck = [self createDeck];
    }
    return _deck;
}

- (Deck *)createDeck { //abstract
    return nil;
}

- (IBAction)touchCardButton:(UIButton *)sender {
    BOOL is3CardModeOn = [self.gameMode3CardsSwitch isOn];
    [self.gameMode3CardsSwitch setEnabled:NO];
    
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex using3CardMode:is3CardModeOn];
    [self updateUI];
}

- (IBAction)touchRestartButton:(UIButton *)sender {
    [self.gameMode3CardsSwitch setEnabled:YES];
    self.game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck: [self createDeck]];
    [self updateUI];
}

- (void)updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld",(long)self.game.score];
    self.historyLabel.text = self.game.historyMessage;
}

- (NSString *)titleForCard:(Card *)card {
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end
