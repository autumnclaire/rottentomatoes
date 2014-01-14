//
//  Movie.h
//  RottenTomatoes2
//
//  Created by Autumn Victor on 1/12/14.
//  Copyright (c) 2014 Autumn Victor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *cast;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSString *posterUrl;



- (id) initWithDictionary: (NSDictionary *) dictionary;

@end
