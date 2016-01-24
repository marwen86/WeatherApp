//
//  CitiesViewController.m
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 21/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import "CitiesViewController.h"
#import "NWAAppManager.h"
#import "NWACity.h"
#import "StationsViewController.h"

@interface CitiesViewController ()

@property(nonatomic,strong)NSArray *listOfCities;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CitiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.listOfCities=[[NSArray alloc]init];
    [self loadCitiesForCountry:self.nWACountry];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)loadCitiesForCountry:(NWACountry *)nWACountry
{
  [[NWAAppManager sharedManager]loadAllCitiesForCountry:nWACountry Completion:^(NSArray *array, NSError *error) {
      self.listOfCities =[NSArray arrayWithArray:array];
      dispatch_async(dispatch_get_main_queue(), ^{
          [self.tableView reloadData];
      });
  }];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listOfCities count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text=[(NWACity *)[self.listOfCities objectAtIndex:indexPath.row] citieName];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"StationSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"StationSegue"]) {
        StationsViewController *stationsViewController = [segue destinationViewController];
        stationsViewController.nWACity= [self.listOfCities  objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
    }
}



@end
