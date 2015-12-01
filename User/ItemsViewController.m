//
//  ItemsViewController.m
//  
//
//  Created by Johny Babylon on 11/24/15.
//
//

#import "ItemsViewController.h"
#import "Person.h"
#import "PersonStore.h"
#import "DetailViewController.h"

@interface ItemsViewController ()


@end

@implementation ItemsViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    
    if(self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Users";
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        
        navItem.rightBarButtonItem = bbi;
        
        navItem.leftBarButtonItem = self.editButtonItem;
        
    }
    
    
    return self;
}
                                 
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController =
    [[DetailViewController alloc] init];
    
    NSArray *persons = [[PersonStore sharedStore] allPersons];
    Person *selectedPerson = persons[indexPath.row];
    
    detailViewController.person = selectedPerson;
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

- (NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section
{
    return [[[PersonStore sharedStore] allPersons] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                        forIndexPath:indexPath];
    
    NSArray *persons = [[PersonStore sharedStore] allPersons];
    Person *person = persons[indexPath.row];
    
    cell.textLabel.text = [person description];
    
    return cell;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (IBAction)addNewItem:(id)sender
{

    Person *newPerson = [[PersonStore sharedStore] createPerson];
    
    NSInteger lastRow = [[[PersonStore sharedStore] allPersons] indexOfObject:newPerson];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationTop];
    
}


- (void)tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *persons = [[PersonStore sharedStore] allPersons];
        Person *person = persons[indexPath.row];
        [[PersonStore sharedStore] removePerson:person];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationBottom];
    }
}

- (void)tableView:(UITableView *)tableView
    moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[PersonStore sharedStore] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

@end






















