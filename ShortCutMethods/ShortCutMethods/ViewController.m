//
//  ViewController.m
//  ShortCutMethods
//
//  Created by Ranosys on 19/05/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "ViewController.h"

#define kCellsPerRow 2

@interface ViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Set scrollView height according to UIView height
- (void)setDynamicScrollHeightOfScrollView {

    self.view.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
//    self.scrollView.contentSize = CGSizeMake(0,_mainView.frame.size.height);
}
#pragma mark - end

#pragma mark - Textfield delegates
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
//    if(textField == self.mobileField) {
//        if (range.length > 0 && [string length] == 0)
//        {
//            return YES;
//        }
//        if (textField.text.length > 9 && range.length == 0)
//        {
//            return NO;
//        }
//        else
//        {
//            return YES;
//        }
//    }
//    else {
        return YES;
//    }
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
//  --------- Table view cell access by uitextfield ---------
//    textField.text = [textField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
//    UITableViewCell *cell;
//    if ([textField.superview.superview.superview isKindOfClass:[UITableViewCell class]]) {
//        cell = (UITableViewCell *)textField.superview.superview.superview;
//    }
//    else if ([textField.superview.superview isKindOfClass:[UITableViewCell class]]) {
//        cell = (UITableViewCell *)textField.superview.superview;
//    }
//    
//    NSIndexPath *indexPath = [self.myTableViewObject indexPathForCell:cell];
//    if (textField == cell.heightField) {
//        [self setMeasureHeightLength:(int)indexPath.row text:textField.text isHeight:YES];
//        cell.heightField.text = textField.text;
//    }
//    else {
//        [self setMeasureHeightLength:(int)indexPath.row text:textField.text isHeight:NO];
//        cell.lengthField.text = textField.text;
//    }
//  --------- end ---------
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}
#pragma mark - end

#pragma mark - Textview delegates
- (void)textViewDidBeginEditing:(UITextView *)textView {}

- (void)textViewDidChange:(UITextView *)textView {
    
    float dynamicHeight=[textView sizeThatFits:textView.frame.size].height;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
//    if(textView == reasonTextView)
//    {
//        if (range.length > 0 && [text length] == 0)
//        {
//            return YES;
//        }
//        if (isAppSetting) {
//            if (textView.text.length > 19 && range.length == 0)
//            {
//                return NO;
//            }
//            else
//            {
//                return YES;
//            }
//        }
//        else {
//            if (textView.text.length > 100 && range.length == 0)
//            {
//                return NO;
//            }
//            else
//            {
//                return YES;
//            }
//        }
//    }
    return YES;
}
#pragma mark - end

#pragma mark - Check string empty
- (BOOL)isEmpty:(NSString *)string {
    
    return ([string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0) ? YES : NO;
}
#pragma mark - end

#pragma mark - Push and present navigation
- (void)storyboardWithXibNavigation {
    
    //StoryBoard navigation
    UIViewController *obj = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DynamicItemsViewController"];
    [self.navigationController pushViewController:obj animated:YES];
    
    //    //Xib Navigation
    //    CustomAudioViewController *obj1 = [[CustomAudioViewController alloc] initWithNibName:@"CustomAudioViewController" bundle:nil];;
    //    [self.navigationController pushViewController:obj1 animated:YES];
}

- (void)presentStoryboardWithXibNavigation {
    
    //StoryBoard navigation
    UIStoryboard * storyboard=storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *popupView =[storyboard instantiateViewControllerWithIdentifier:@"GlobalImageViewController"];
    popupView.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6f];
    [popupView setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    [self presentViewController:popupView animated:YES completion:nil];
    
    //    //Xib Navigation
    //    CustomAudioViewController *obj = [[CustomAudioViewController alloc] initWithNibName:@"CustomAudioViewController" bundle:nil];
    //    obj.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6f];
    //    [obj setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    //    [self presentViewController:obj animated:YES completion:nil];
    
    
    //Dismiss view
    //[self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - end

#pragma mark - Image picker delegate
//Privacy - Photo Library Usage Description     We need to access your photos in order to attach them
//Privacy - Camera Usage Description        We need to access your camera in order to attach them
- (void)selectPickerPhoto {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Select Photo"
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* cameraAction = [UIAlertAction actionWithTitle:@"Take Photo" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             
                                                             UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                                             picker.delegate = self;
                                                             picker.allowsEditing = NO;
                                                             picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                                                             [self presentViewController:picker animated:YES completion:NULL];
                                                         }];
    
    UIAlertAction* galleryAction = [UIAlertAction actionWithTitle:@"Choose from Gallery" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                                              picker.delegate = self;
                                                              picker.allowsEditing = NO;
                                                              picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                                              picker.navigationBar.tintColor = [UIColor whiteColor];
                                                              
                                                              [self presentViewController:picker animated:YES completion:NULL];
                                                          }];
    
    UIAlertAction * defaultAct = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel
                                                        handler:^(UIAlertAction * action) {
                                                            [alert dismissViewControllerAnimated:YES completion:nil];
                                                        }];
    [alert addAction:cameraAction];
    [alert addAction:galleryAction];
    [alert addAction:defaultAct];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image1 editingInfo:(NSDictionary *)info {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (NSString *)getImageName:(UIImage*)image {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale *locale = [[NSLocale alloc]
                        initWithLocaleIdentifier:@"en_US"];
    [dateFormatter setLocale:locale];
    [dateFormatter setDateFormat:@"ddMMYYhhmmss"];
    NSString * datestr = [dateFormatter stringFromDate:[NSDate date]];
    NSString *fileName = [NSString stringWithFormat:@"%@_%@.jpeg",datestr,@"AnyName"];
    NSString *filePath = [[NSTemporaryDirectory() stringByAppendingPathComponent:@"FolderNames"] stringByAppendingPathComponent:fileName];
    NSData * imageData = UIImageJPEGRepresentation(image, 0.1);
    [imageData writeToFile:filePath atomically:YES];
    return fileName;
}
#pragma mark - end

#pragma mark - Show alert view
- (void)showAlertMessage:(NSString *)title message:(NSString *)message {
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:title
                                          message:message
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   [alertController dismissViewControllerAnimated:YES completion:nil];
                               }];
    
    [alertController addAction:okAction];
    [[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:alertController animated:YES completion:nil];
}
#pragma mark - end

#pragma mark - Table view data source
/*
  There is additional space at the top of my UITableView's.
 
 -> YouStoryboard.storyboard > YouViewController > Attributes inspector > Uncheck - Adjust scroll view insets.
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 44;
    //return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView * headerView;
    headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 66.0)];
    headerView.backgroundColor = [UIColor clearColor];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, headerView.frame.size.width - 20, 66)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:14];
    label.numberOfLines = 2;
    label.text = @"Please add dimensions as per crop marks.\nClick on each individual photo to enlarge.";
    [headerView addSubview:label];
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
//    cell.buttonOutlet.tag=indexPath.row;
//    [cell.buttonOutlet addTarget:self action:@selector(ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
#pragma mark - end

- (IBAction)ButtonAction:(UIButton *)sender {
    
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[sender tag] inSection:0]; // Assuming one section
//    UITableViewCell *cell = [self.tableview cellForRowAtIndexPath:indexPath];
}

#pragma mark - Fixed number of collectionView cells in a row
- (void)customizedCollectionCell {
    
    //    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    //    CGFloat availableWidthForCells = CGRectGetWidth(self.view.frame) - flowLayout.sectionInset.left - flowLayout.sectionInset.right - flowLayout.minimumInteritemSpacing * (kCellsPerRow -1);
    //    CGFloat cellWidth = (availableWidthForCells / kCellsPerRow);
    //    flowLayout.itemSize = CGSizeMake(cellWidth, cellWidth);
    //    //end
    //
    //    [self.collectionView reloadData];
}
#pragma mark - end

#pragma mark - Collection view delegates
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {}
#pragma mark - end

#pragma mark - Set label dynamic height
- (float)getDynamicLabelHeight:(NSString *)text font:(UIFont *)font widthValue:(float)widthValue{
    
    CGSize size = CGSizeMake(widthValue,1000);
    CGRect textRect=[text
                     boundingRectWithSize:size
                     options:NSStringDrawingUsesLineFragmentOrigin
                     attributes:@{NSFontAttributeName:font}
                     context:nil];
    if (![text isEqualToString:@""] && [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length != 0) {
        textRect.size.height = textRect.size.height + 8;
    }
    else {
        textRect.size.height = 0.0;
    }
    return textRect.size.height;
}
#pragma mark - end
@end
