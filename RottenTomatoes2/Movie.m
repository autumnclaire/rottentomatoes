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
- (NSURL*) buildPosterUrl: (NSDictionary*) dictionary;

@end

@implementation Movie

- (id) initWithDictionary:(NSDictionary *)dictionary {
    self.title = [dictionary objectForKey:@"title"];
    self.summary = [dictionary objectForKey:@"synopsis"];
    self.cast = [self buildCastString:dictionary];
    
    self.posterUrl = [self buildPosterUrl:dictionary];
    
    return self;
}

- (NSURL*) buildPosterUrl: (NSDictionary*) dictionary {
    NSDictionary* posters = [dictionary objectForKey:@"posters"];
    return [[NSURL alloc] initWithString:[posters objectForKey:@"thumbnail"]];
}

- (NSMutableString*) buildCastString: (NSDictionary*) dictionary {
    NSArray *cast = [dictionary objectForKey:@"abridged_cast"];
    NSMutableString *castString = [[NSMutableString alloc] init];

    int count = cast.count <= 3 ? cast.count : 3;
    for (int i = 0; i < count; i++) {
        NSDictionary *castMember = [cast objectAtIndex:i];
        [castString appendString:[castMember objectForKey:@"name"]];
        if (i < count - 1) {
            [castString appendString:@", "];
        }
    }
    return castString;
}

@end
