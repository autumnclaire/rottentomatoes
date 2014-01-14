//
//  MovieListViewController.m
//  RottenTomatoes2
//
//  Created by Autumn Victor on 1/12/14.
//  Copyright (c) 2014 Autumn Victor. All rights reserved.
//

#import "MovieListViewController.h"
#import "Movie.h"
#import "MovieCell.h"
#import <UIImageView+AFNetworking.h>

@interface MovieListViewController ()

@property (nonatomic, strong) NSMutableArray *movies;

- (void) makeMovies:(id)object;

@end

@implementation MovieListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self sendNetworkRequest];
        self.movies = [NSMutableArray array];
    }
    return self;
}

- (void)sendNetworkRequest {
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        [self makeMovies:object];
        [self.tableView reloadData];
        NSLog(@"%@", object);
    }];
}

- (void) makeMovies:(id)object {
    NSArray *movieList = [object valueForKeyPath:@"movies"]; //use the Movie object here
    
    for (int i = 0; i < movieList.count; i++) {
        Movie *movie = [Movie alloc];
        movie = [movie initWithDictionary:movieList[i]];
        [self.movies addObject:movie];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MovieCell";
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Movie *movie = [self.movies objectAtIndex:indexPath.row];
    
    cell.movieTitle.text = movie.title;
    cell.movieSummary.text = movie.summary;
    cell.movieCast.text = movie.cast;
    [cell.posterImageView setImageWithURL:movie.posterUrl];
    
    return cell;
}



@end
