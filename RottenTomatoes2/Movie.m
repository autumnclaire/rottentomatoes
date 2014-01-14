//
//  Movie.m
//  RottenTomatoes2
//
//  Created by Autumn Victor on 1/12/14.
//  Copyright (c) 2014 Autumn Victor. All rights reserved.
//

#import "Movie.h"

@interface Movie()
- (NSMutableString*) buildCastString: (NSDictionary*) dictionary;
- (NSString*) buildPosterUrl: (NSDictionary*) dictionary;

@end

@implementation Movie

- (id) initWithDictionary:(NSDictionary *)dictionary {
    self.title = [dictionary objectForKey:@"title"];
    self.summary = [dictionary objectForKey:@"synopsis"];
    self.cast = [self buildCastString:dictionary];
    self.posterUrl = [self buildPosterUrl:dictionary];
    
    return self;
}

- (NSString*) buildPosterUrl: (NSDictionary*) dictionary {
    NSDictionary* posters = [dictionary objectForKey:@"posters"];
    NSString* thumbnail = [posters objectForKey:@"thumbnail"];
    return thumbnail;
}

- (NSMutableString*) buildCastString: (NSDictionary*) dictionary {
    NSArray *cast = [dictionary objectForKey:@"abridged_cast"];
    NSMutableString *castString = [[NSMutableString alloc] init];
    for (int i = 0; i < cast.count; i++) {
        NSDictionary *castMember = [cast objectAtIndex:i];
        [castString appendString:[castMember objectForKey:@"name"]];
        if (i < cast.count - 1) {
            [castString appendString:@", "];
        }
    }
    return castString;
}

@end
