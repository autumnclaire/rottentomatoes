//
//  MovieCell.h
//  RottenTomatoes2
//
//  Created by Autumn Victor on 1/12/14.
//  Copyright (c) 2014 Autumn Victor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *posterImageView;
@property (nonatomic, weak) IBOutlet UILabel *movieTitle;
@property (nonatomic, weak) IBOutlet UILabel *movieSummary;
@property (nonatomic, weak) IBOutlet UILabel *movieCast;

@end
