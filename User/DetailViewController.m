//
//  DetailViewController.m
//  User
//
//  Created by elliott chavis on 12/1/15.
//  Copyright (c) 2015 Johny Babylon. All rights reserved.
//

#import "DetailViewController.h"
#import "Person.h"

@interface DetailViewController ()
    <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end

@implementation DetailViewController
- (IBAction)takePicture:(id)sender {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController
         isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    imagePicker.delegate = self;
    
    [self presentViewController:imagePicker animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    self.imageView.image = image;
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    Person *person = self.person;
    
    self.nameField.text = person.personName;
    self.phoneField.text = person.personPhone;
    
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle =NSDateFormatterNoStyle;
    }
    
    self.dateLabel.text = [dateFormatter stringFromDate:person.dateCreated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    
    Person *person = self.person;
    person.personName = self.nameField.text;
    person.personPhone = self.phoneField.text;
    
    
}

- (void)setPerson:(Person *)person
{
    _person = person;
    self.navigationItem.title = _person.personName;
}













@end
