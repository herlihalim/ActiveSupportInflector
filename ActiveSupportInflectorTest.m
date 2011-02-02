//
//  InflectorTest.m
//  ActiveSupportInflector
//
//  Created by Tom Ward on 26/05/2009.
//  Copyright 2009 Tom Ward. All rights reserved.
//

#import "NSString+ActiveSupportInflector.h"

@interface ActiveSupportInflectorTest : SenTestCase
@end

@implementation ActiveSupportInflectorTest

- (void)testPluralizationAndSingularization {
  NSDictionary* dictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle bundleForClass:[self class]] pathForResource:@"ActiveSupportInflectorTest" ofType:@"plist"]];
  NSArray* singularAndPlural = [dictionary objectForKey:@"singularAndPlural"];
  for (NSArray* sAndP in singularAndPlural) {
    NSString* singular = [sAndP objectAtIndex:0];
    NSString* plural = [sAndP objectAtIndex:1];

    assertThat(plural, equalTo([singular pluralizeString]));
    assertThat(singular, equalTo([plural singularizeString]));
  }
}

@end