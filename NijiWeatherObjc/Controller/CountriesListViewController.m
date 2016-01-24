//
//  CountriesListViewController.m
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 21/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import "CountriesListViewController.h"
#import "NWAAppManager.h"
#import "NWACountry.h"
#import "CitiesViewController.h"

@interface CountriesListViewController ()

@property(nonatomic,strong)NSMutableArray *listOfCountries;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
@implementation CountriesListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.listOfCountries = [[NSMutableArray alloc] init];
    [self loadCountries];
         
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

-(void)loadCountries
{
    
    __weak typeof(self) weakSelf = self;
    
   
  [[NWAAppManager sharedManager] loadAllCountiresCompletion:^(NSArray *array, NSError *error) {
      __strong typeof(weakSelf) strongSelf = weakSelf;
      [strongSelf.listOfCountries addObjectsFromArray:array];
      dispatch_async(dispatch_get_main_queue(), ^{
          [self.tableView reloadData];
      });
      
      
  }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listOfCountries count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
     cell.textLabel.text=[(NWACountry *)[self.listOfCountries objectAtIndex:indexPath.row] countryName];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"citiesSegue" sender:self];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"citiesSegue"]) {
        CitiesViewController *citiesViewController=[segue destinationViewController];
        citiesViewController.nWACountry=[self.listOfCountries objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
    }
}

@end
