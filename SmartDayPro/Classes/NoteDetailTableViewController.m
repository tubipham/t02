//
//  NoteDetailTableViewController.m
//  SmartCal
//
//  Created by Left Coast Logic on 4/5/12.
//  Copyright (c) 2012 LCL. All rights reserved.
//

#import "NoteDetailTableViewController.h"

#import "Common.h"
#import "Colors.h"
#import "Task.h"
#import "Project.h"
#import "ImageManager.h"
#import "ProjectManager.h"
#import "DBManager.h"
#import "TagDictionary.h"

#import "NoteView.h"
#import "CustomTextView.h"

#import "DatePickerViewController.h"
#import "TagEditViewController.h"
#import "ProjectSelectionTableViewController.h"
#import "LinkViewController.h"
#import "NoteInfoViewController.h"

#import "CalendarViewController.h"
#import "SmartListViewController.h"

#import "NoteViewController.h"

#import "SmartDayViewController.h"

#import "AbstractSDViewController.h"
#import "PlannerViewController.h"

extern AbstractSDViewController *_abstractViewCtrler;
extern PlannerViewController *_plannerViewCtrler;

extern BOOL _isiPad;

@interface NoteDetailTableViewController ()

@end

@implementation NoteDetailTableViewController

@synthesize note;
@synthesize noteCopy;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id) init
{
    self = [super init];
    
    if (self)
    {
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(noteChanged:)
													 name:@"NoteContentChangeNotification" object:nil];
        
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(noteBeginEdit:)
													 name:@"NoteBeginEditNotification" object:nil];
        
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(noteFinishEdit:)
													 name:@"NoteFinishEditNotification" object:nil];
        
        self.contentSizeForViewInPopover = CGSizeMake(320,416);
    }
    
    return self;
}

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    self.note = nil;
    self.noteCopy = nil;
    
    [super dealloc];
}

- (void) refreshStart
{
    UITableViewCell *cell = [noteTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    
    if (cell != nil)
    {
        UILabel *label = (UILabel *)[cell viewWithTag:10010];
        
        label.text = [Common getFullDateString:self.noteCopy.startTime];
    }
}

- (void) refreshProject
{
    UITableViewCell *cell = [noteTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    
    if (cell != nil)
    {
        ProjectManager *pm = [ProjectManager getInstance];
        
        Project *prj = [pm getProjectByKey:self.noteCopy.project];
        
        UILabel *label = (UILabel *)[cell viewWithTag:11000];
 
		label.text = prj.name;
		label.textColor = [Common getColorByID:prj.colorId colorIndex:0];        
    }    
}

- (void) refreshInfo
{
    ProjectManager *pm = [ProjectManager getInstance];
    
    UIImage *img = [pm getNoteIcon:self.noteCopy.project];
    
    noteImgView.image = img;

    prjNameLabel.text = [pm getProjectNameByKey:self.noteCopy.project];
    
    dateLabel.text = [Common getFullDateString:self.noteCopy.startTime];
}

#pragma mark Actions
- (void) editDetail:(id) sender
{
    ////printf("edit detail\n");
    
    NoteInfoViewController *ctrler = [[NoteInfoViewController alloc] init];
    
    ctrler.note = self.noteCopy;
    
    [self.navigationController pushViewController:ctrler animated:YES];
    [ctrler release];
}

- (void) save:(id)sender
{
    [noteView finishEdit];

/*
    [self.note updateByTask:self.noteCopy];
    
    DBManager *dbm = [DBManager getInstance];
    
    NSInteger action = TASK_UPDATE;

    if (self.note.primaryKey == -1)
    {
        [self.note insertIntoDB:[dbm getDatabase]];
        
        action = TASK_CREATE;
    }
    else 
    {
        [self.note updateIntoDB:[dbm getDatabase]];
    }
    
    if (_plannerViewCtrler != nil) {
        [_plannerViewCtrler changeItem:self.note];
        [_plannerViewCtrler hidePopover];
    } else {
        //[_abstractViewCtrler changeItem:self.note action:action];
        [_abstractViewCtrler changeItem:self.note];
        
        [_abstractViewCtrler hidePopover];
    }
*/
    
    if (_plannerViewCtrler != nil)
    {
        [_plannerViewCtrler updateTask:self.note withTask:self.noteCopy];
    }
    else if (_abstractViewCtrler != nil)
    {
        [_abstractViewCtrler updateTask:self.note withTask:self.noteCopy];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) noteChanged:(NSNotification *)notification
{
    self.navigationItem.title = self.noteCopy.name;
    
    saveButton.enabled = ![self.noteCopy.name isEqualToString:@""];
}

- (void) noteBeginEdit:(NSNotification *)notification
{
    /*
    noteHeightAlternate = noteView.bounds.size.height;
    
    CGFloat h = contentView.bounds.size.height - (_isiPad?0:[Common getKeyboardHeight]);
    
    [noteView changeFrame:CGRectMake(0, 30, contentView.bounds.size.width, h-30)];
    */
    noteFrm = noteView.frame;
    CGRect frm = noteFrm;
    
    if (UIInterfaceOrientationIsLandscape(_abstractViewCtrler.interfaceOrientation))
    {
        frm.size.height = 250;
    }
    else
    {
        frm.size.height -= (_isiPad?0:[Common getKeyboardHeight]);
    }
    
    [noteView changeFrame:frm];
    
    saveButton.enabled = NO;
}

- (void) noteFinishEdit:(NSNotification *)notification
{
    saveButton.enabled = ![self.noteCopy.name isEqualToString:@""];
    
    //[noteView changeFrame:CGRectMake(0, 30, contentView.bounds.size.width, noteHeightAlternate)];

    [noteView changeFrame:noteFrm];
}

#pragma mark View

- (void) loadView
{
    CGRect frm = CGRectZero;
    frm.size = [Common getScreenSize];
    
    if (_isiPad)
    {
        frm.size.width = 320;
        frm.size.height = 416;
    }
    
	contentView = [[UIView alloc] initWithFrame:frm];
    contentView.backgroundColor = [UIColor clearColor];
    
    self.view = contentView;
    [contentView release];
	
    noteView = [[NoteView alloc] initWithFrame:CGRectMake(0, 30, frm.size.width, frm.size.height-30)];
    
    [contentView addSubview:noteView];
    [noteView release];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frm.size.width, 35)];
    topView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"noteHeaderBG.png"]];
    
    [contentView addSubview:topView];
    [topView release];
    
    noteImgView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 8, 14, 14)];
    
    [topView addSubview:noteImgView];
    [noteImgView release];
    
    prjNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(45, 5, 160, 20)];
    prjNameLabel.backgroundColor = [UIColor clearColor];
    prjNameLabel.textColor = [UIColor grayColor];
    
    [topView addSubview:prjNameLabel];
    [prjNameLabel release];
    
    dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 5, 120, 20)];
    dateLabel.backgroundColor = [UIColor clearColor];
    dateLabel.textColor = [UIColor grayColor];
    
    [topView addSubview:dateLabel];
    [dateLabel release];
    
    UIImageView *detailImgView = [[UIImageView alloc] initWithImage:[[ImageManager getInstance] getImageWithName:@"detail.png"] ];
    detailImgView.frame = CGRectMake(290, 5, 20, 20);
    
    [topView addSubview:detailImgView];
    [detailImgView release];
            
    UIButton *detailButton = [Common createButton:@"" 
                          buttonType:UIButtonTypeCustom 
                               frame:CGRectMake(280, 0, 40, 40)
                          titleColor:[UIColor whiteColor]
                              target:self 
                            selector:@selector(editDetail:) 
                    normalStateImage:nil 
                  selectedStateImage:nil];
    detailButton.backgroundColor=[UIColor clearColor];
    
    [contentView addSubview:detailButton];    
    
    self.noteCopy = self.note;
    noteView.note = self.noteCopy;
    
    //printf("note name:%s\n", [self.noteCopy.name UTF8String]);
    
    self.navigationItem.title = self.noteCopy.name;
    
	saveButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave 
															  target:self action:@selector(save:)];
	self.navigationItem.rightBarButtonItem = saveButton;
	[saveButton release];  
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.note.primaryKey == -1)
    {
        [noteView startEdit];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self refreshInfo];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
