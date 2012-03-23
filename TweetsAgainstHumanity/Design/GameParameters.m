//
//  GameParameters.m
//  TweetsAgainstHumanity
//
//  Created by Adam Telfer on 12-03-22.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameParameters.h"
#import "NSDictionary+XMG.h"

@implementation GameParameters

@synthesize responses, categories, gameText;

static GameParameters* _parameters;

+ (GameParameters*) sharedParameters {
    if (_parameters == nil) {
        _parameters = [[GameParameters alloc] init];
    }
    return _parameters;
}

- (id) init {
    self = [super init];
    if (self != nil) {
        NSString *thePath = [[NSBundle mainBundle] pathForResource:@"text" ofType:@"plist"];
        self.gameText = [[NSDictionary alloc] initWithContentsOfFile:thePath];
        thePath = [[NSBundle mainBundle] pathForResource:@"responses" ofType:@"plist"];
        self.responses = [[NSArray alloc] initWithContentsOfFile:thePath];
        thePath = [[NSBundle mainBundle] pathForResource:@"categories" ofType:@"plist"];
        self.categories = [[NSArray alloc] initWithContentsOfFile:thePath];
    }
    return self;
}

- (NSString*) getTextForKey:(NSString *)key
{
    NSObject* obj = [self.gameText objectForKey:key];
	if ([obj isKindOfClass:[NSArray class]]) {
		NSArray* arr = (NSArray*)obj;
		int ind = rand() % [arr count];
		return [arr objectAtIndex:ind];
	} else {
		return obj;
	}
}

- (void) dealloc {
    self.responses = nil;
    self.categories = nil;
}

@end
