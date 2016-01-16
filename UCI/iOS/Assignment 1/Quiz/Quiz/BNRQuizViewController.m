//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by James Kim on 1/15/16.
//  Copyright © 2016 James. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;


@end

@implementation BNRQuizViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //Call the init method implemented by the superclass
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    
    if (self)
    {
        //Create two arrays filled with questions and answers
        //and make the pointers point to them
        
        self.questions = @[@"From what is cognac made?",
                           @"What is 7 + 7?",
                           @"What is the capital of Vermont?"];
         
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }
    
    return self;
}

- (IBAction) showQuestion: (id) sender
{
    //Step to the next question
    self.currentQuestionIndex++;
    
    //Am I past the last question ?
    if (self.currentQuestionIndex == [self.questions count])
    {
        //Go back to the first quetion
        self.currentQuestionIndex = 0;
    }
    
    //Get the string of last index in the string array
    NSString *question = [self.questions objectAtIndex: self.currentQuestionIndex];
    
    //Display the string in the question label
    self.questionLabel.text = question;
    
    //Reset the answer label
    self.answerLabel.text = @"???";
    
}

-(IBAction) showAnswer:(id)sender
{
    //What is the anwer to the current questions
    NSString *answer = [self.answers objectAtIndex: self.currentQuestionIndex];
    
    //Display the answer
    self.answerLabel.text = answer;
}


@end
