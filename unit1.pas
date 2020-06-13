// ***********************************************************************
// ***********************************************************************
// fbNotex 1.x
// Author and copyright: Massimo Nardello, Modena (Italy) 2020.
// Free software released under GPL licence version 3 or later.

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version. You can read the version 3
// of the Licence in http://www.gnu.org/licenses/gpl-3.0.txt
// or in the file Licence.txt included in the files of the
// source code of this software.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
// ***********************************************************************
// ***********************************************************************

unit Unit1;

{$mode objfpc}{$H+}
{$modeswitch objectivec1}

interface

uses
  Classes, SysUtils, DB, IBConnection, sqldb, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, Menus, DBGrids, ComCtrls, DBCtrls, StdCtrls, Grids,
  ZConnection, ZDataset, ZSqlUpdate, LCLIntf, IniFiles, LazUTF8,
  zipper, LazFileUtils, FileUtil, Clipbrd, process, DefaultTranslator, Unix,
  CocoaThemes, CocoaAll, CocoaTextEdits, CocoaUtils;

type

  { TfmMain }

  TfmMain = class(TForm)
    apfbNotex: TApplicationProperties;
    B26: TMenuItem;
    B3: TMenuItem;
    B37: TMenuItem;
    B8: TMenuItem;
    bvFind: TBevel;
    bnBackup: TButton;
    bnRestore: TButton;
    bnExit: TButton;
    bnFind: TButton;
    cbFields: TComboBox;
    cbNotebooksOnly: TCheckBox;
    dsAllTasks: TDataSource;
    dbText: TMemo;
    dsFind: TDataSource;
    dbID: TDBEdit;
    dbTasks: TDBMemo;
    dbTitle: TDBEdit;
    dsImpExpNotes: TDataSource;
    dsTagsList: TDataSource;
    dsTasks: TDataSource;
    edFind: TMemo;
    edPassword: TEdit;
    edUserName: TEdit;
    grAttachments: TDBGrid;
    grFind: TDBGrid;
    grTagsList: TDBGrid;
    grTasks: TDBGrid;
    grLinks: TDBGrid;
    grTags: TDBGrid;
    grNotes: TDBGrid;
    grSections: TDBGrid;
    grNotebooks: TDBGrid;
    dsLinks: TDataSource;
    dsNotebooks: TDataSource;
    dsTags: TDataSource;
    dsSections: TDataSource;
    dsNotes: TDataSource;
    dsAttachments: TDataSource;
    ilLogo: TImage;
    lbBackup: TLabel;
    lbSize: TLabel;
    lbFindHelp: TLabel;
    lbFound: TLabel;
    lbLogo: TLabel;
    lbPassword: TLabel;
    lbUserName: TLabel;
    lbInfo: TLabel;
    lbTitle: TLabel;
    lbID: TLabel;
    miEditSelectAll: TMenuItem;
    N34: TMenuItem;
    miEditPaste: TMenuItem;
    miEditCopy: TMenuItem;
    miEditCut: TMenuItem;
    N26: TMenuItem;
    miToolsHideMarCol: TMenuItem;
    N24: TMenuItem;
    miToolsFullScreen: TMenuItem;
    miEditOpenAllWriter: TMenuItem;
    miEditOpenCurrWriter: TMenuItem;
    N15: TMenuItem;
    pmInsertTag: TMenuItem;
    miEditOpenAllWord: TMenuItem;
    miToolsCompact: TMenuItem;
    miEditBookmarks: TMenuItem;
    N31: TMenuItem;
    miFileExport: TMenuItem;
    miFileImport: TMenuItem;
    N29: TMenuItem;
    N14: TMenuItem;
    miEditReformat: TMenuItem;
    miNotesImport: TMenuItem;
    N28: TMenuItem;
    N27: TMenuItem;
    miFBManual: TMenuItem;
    N30: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    P2: TMenuItem;
    P3: TMenuItem;
    miNotesSearch: TMenuItem;
    miNotesCopyID: TMenuItem;
    miSectionsCopyID: TMenuItem;
    miNotebooksCopyID: TMenuItem;
    N25: TMenuItem;
    miEditOpenCurrWord: TMenuItem;
    miFileClose: TMenuItem;
    miNotesShowAllTasks: TMenuItem;
    miEditPreview: TMenuItem;
    N23: TMenuItem;
    miToolsBackup: TMenuItem;
    miToolsRestore: TMenuItem;
    miNotesTasksHide: TMenuItem;
    N16: TMenuItem;
    N22: TMenuItem;
    miNoteschangeSection: TMenuItem;
    N21: TMenuItem;
    miSectionsChangeNotebook: TMenuItem;
    N20: TMenuItem;
    miNotesMoveDown: TMenuItem;
    miNotesMoveUp: TMenuItem;
    miNotesMove: TMenuItem;
    N19: TMenuItem;
    miSectionsMoveDown: TMenuItem;
    miSectionsMoveUp: TMenuItem;
    miSectionsMove: TMenuItem;
    N18: TMenuItem;
    miNotebooksMoveDown: TMenuItem;
    miNotebooksMoveUp: TMenuItem;
    miNotebooksMove: TMenuItem;
    N17: TMenuItem;
    miToolsShowEditor: TMenuItem;
    miEdit: TMenuItem;
    miNotesTagsRename: TMenuItem;
    N13: TMenuItem;
    miNotesFind: TMenuItem;
    N12: TMenuItem;
    miNotesLinksLocate: TMenuItem;
    N11: TMenuItem;
    N10: TMenuItem;
    miFileRefresh: TMenuItem;
    miNotesAttachmentsOpen: TMenuItem;
    miNotesAttachmentsSaveAs: TMenuItem;
    N9: TMenuItem;
    miSectionsComments: TMenuItem;
    N8: TMenuItem;
    miFileUndo: TMenuItem;
    miNotebooksComments: TMenuItem;
    N7: TMenuItem;
    N6: TMenuItem;
    miFBCopyright: TMenuItem;
    miToolsOptions: TMenuItem;
    miNotesTasksDelete: TMenuItem;
    miNotesTasksNew: TMenuItem;
    miNotesLinksDelete: TMenuItem;
    miNotesLinksNew: TMenuItem;
    miNotesAttachmentsDelete: TMenuItem;
    miNotesAttachmentsNew: TMenuItem;
    miNotesTagsDelete: TMenuItem;
    miNotesTagsNew: TMenuItem;
    miNotesTasks: TMenuItem;
    miNotesLinks: TMenuItem;
    miNotesAttachments: TMenuItem;
    miNotesTags: TMenuItem;
    N5: TMenuItem;
    miNotesSortByCustom: TMenuItem;
    miNotesSortByModificationDate: TMenuItem;
    miNotesSortByTitle: TMenuItem;
    miNotesSortBy: TMenuItem;
    N4: TMenuItem;
    miNotesDelete: TMenuItem;
    miNotesNew: TMenuItem;
    miSectionsSortbyCustom: TMenuItem;
    miSectionsSortbyTitle: TMenuItem;
    miSectionsSortby: TMenuItem;
    N3: TMenuItem;
    miNotebooksSortbyCustom: TMenuItem;
    miNotebooksSortbyTitle: TMenuItem;
    miNotebooksSortby: TMenuItem;
    N2: TMenuItem;
    miSectionsDelete: TMenuItem;
    miSectionsNew: TMenuItem;
    miNotebooksDelete: TMenuItem;
    miNotebooksNew: TMenuItem;
    miFBNotex: TMenuItem;
    miTools: TMenuItem;
    miNotes: TMenuItem;
    miSection: TMenuItem;
    miNotebooks: TMenuItem;
    N1: TMenuItem;
    miFileSave: TMenuItem;
    miFile: TMenuItem;
    mmMenu: TMainMenu;
    odOpenDialog: TOpenDialog;
    pmNotebooksCopyID: TMenuItem;
    pmNotebooksDelete: TMenuItem;
    pmNotebooksMove: TMenuItem;
    pmNotebooksMoveDown: TMenuItem;
    pmNotebooksMoveUp: TMenuItem;
    pmNotebooksNew: TMenuItem;
    pmNotesAttachmentsDelete: TMenuItem;
    pmNotesAttachmentsNew: TMenuItem;
    pmNotesAttachmentsOpen: TMenuItem;
    pmNotesAttachmentsSaveAs: TMenuItem;
    pmNotesCopyID: TMenuItem;
    pmNotesDelete: TMenuItem;
    pmNotesLinksDelete: TMenuItem;
    pmNotesLinksLocate: TMenuItem;
    pmNotesLinksNew: TMenuItem;
    pmNotesMove: TMenuItem;
    pmNotesMoveDown: TMenuItem;
    pmNotesMoveUp: TMenuItem;
    pmNotesNew: TMenuItem;
    pmNotesTagsDelete: TMenuItem;
    pmNotesTagsNew: TMenuItem;
    pmNotesTagsRename: TMenuItem;
    pmSectionsCopyID: TMenuItem;
    pmSectionsDelete: TMenuItem;
    pmSectionsMove: TMenuItem;
    pmSectionsMoveDown: TMenuItem;
    pmSectionsMoveUp: TMenuItem;
    pmSectionsNew: TMenuItem;
    pnLogin: TPanel;
    pnText: TPanel;
    pnTasks: TPanel;
    pnTitle: TPanel;
    pcPageControl: TPageControl;
    pnBottom: TPanel;
    pnRight: TPanel;
    pnNotebook_Sections: TPanel;
    pnLeft: TPanel;
    pnMain: TPanel;
    pnMain1: TPanel;
    pnStatusBar: TPanel;
    pmNotebooks: TPopupMenu;
    pmSections: TPopupMenu;
    pmNotes: TPopupMenu;
    pmAttachments: TPopupMenu;
    pmTags: TPopupMenu;
    pmLinks: TPopupMenu;
    ppTags: TPopupMenu;
    sdSaveDialog: TSaveDialog;
    shLogin: TShape;
    shSave: TShape;
    spLeft: TSplitter;
    spRight: TSplitter;
    spTitles: TSplitter;
    spBottom: TSplitter;
    spAttachments: TSplitter;
    spLink: TSplitter;
    spNotebooks: TSplitter;
    spNotebooks_Sections: TSplitter;
    sgTitles: TStringGrid;
    tsNotes: TTabSheet;
    tsTasks: TTabSheet;
    zcConnection: TZConnection;
    zqAllTasksCOMMENTS: TMemoField;
    zqAllTasksDONE: TSmallintField;
    zqAllTasksEND_DATE: TDateField;
    zqAllTasksNOTEBOOKSID: TLongintField;
    zqAllTasksNOTEBOOKSTITLE: TStringField;
    zqAllTasksNOTESID: TLongintField;
    zqAllTasksNOTESTITLE: TStringField;
    zqAllTasksPRIORITY: TStringField;
    zqAllTasksRESOURCES: TStringField;
    zqAllTasksSECTIONSID: TLongintField;
    zqAllTasksSECTIONSTITLE: TStringField;
    zqAllTasksSTART_DATE: TDateField;
    zqAllTasksTASKSID: TLongintField;
    zqAllTasksTITLE: TStringField;
    zqImpExpAttachments: TZQuery;
    zqAttachmentsATTACHMENT: TBlobField;
    zqAttachmentsID: TLongintField;
    zqAttachmentsID_NOTES: TLongintField;
    zqAttachmentsORD: TLongintField;
    zqAttachmentsTITLE: TStringField;
    zqFindIDNOTEBOOKS: TLongintField;
    zqFindIDNOTES: TLongintField;
    zqFindIDSECTIONS: TLongintField;
    zqFindTITLENOTEBOOKS: TStringField;
    zqFindTITLENOTES: TStringField;
    zqFindTITLESECTIONS: TStringField;
    zqImpExpAttachmentsATTACHMENT: TBlobField;
    zqImpExpAttachmentsID: TLongintField;
    zqImpExpAttachmentsID_NOTES: TLongintField;
    zqImpExpAttachmentsORD: TLongintField;
    zqImpExpAttachmentsTITLE: TStringField;
    zqImpExpNotesID: TLongintField;
    zqImpExpNotesID_SECTIONS: TLongintField;
    zqImpExpNotesMODIFICATION_DATE: TDateTimeField;
    zqImpExpNotesORD: TLongintField;
    zqImpExpNotesTEXT: TMemoField;
    zqImpExpNotesTITLE: TStringField;
    zqImpExpTasks: TZQuery;
    zqImpExpTagsID: TLongintField;
    zqImpExpTagsID_NOTES: TLongintField;
    zqImpExpTagsTAG: TStringField;
    zqImpExpTasksCOMMENTS: TMemoField;
    zqImpExpTasksDONE: TSmallintField;
    zqImpExpTasksEND_DATE: TDateField;
    zqImpExpTasksID: TLongintField;
    zqImpExpTasksID_NOTES: TLongintField;
    zqImpExpTasksPRIORITY: TStringField;
    zqImpExpTasksRESOURCES: TStringField;
    zqImpExpTasksSTART_DATE: TDateField;
    zqImpExpTasksTITLE: TStringField;
    zqLinks: TZQuery;
    zqLinksID: TLongintField;
    zqLinksID_NOTES: TLongintField;
    zqLinksLINK_NOTE: TLongintField;
    zqLinksTITLE: TStringField;
    zqImpExpNotes: TZQuery;
    zqNotesMODIFICATION_DATE: TDateTimeField;
    zqImpExpTags: TZQuery;
    zqTagsList: TZQuery;
    zqTagsListTAG: TStringField;
    zqTasks: TZQuery;
    zqNotebooksCOMMENTS: TMemoField;
    zqNotebooksID: TLongintField;
    zqNotebooksORD: TLongintField;
    zqNotebooksTITLE: TStringField;
    zqNotesID: TLongintField;
    zqNotesID_SECTIONS: TLongintField;
    zqNotesORD: TLongintField;
    zqNotesTEXT: TMemoField;
    zqNotesTITLE: TStringField;
    zqSectionsCOMMENTS: TMemoField;
    zqSectionsID: TLongintField;
    zqSectionsID_NOTEBOOKS: TLongintField;
    zqSectionsORD: TLongintField;
    zqSectionsTITLE: TStringField;
    zqNotebooks: TZQuery;
    zqTags: TZQuery;
    zqSections: TZQuery;
    zqNotes: TZQuery;
    zqAttachments: TZQuery;
    zqGenID: TZReadOnlyQuery;
    zqTagsID: TLongintField;
    zqTagsID_NOTES: TLongintField;
    zqTagsTAG: TStringField;
    zqTasksCOMMENTS: TMemoField;
    zqTasksDONE: TSmallintField;
    zqTasksEND_DATE: TDateField;
    zqTasksID: TLongintField;
    zqTasksID_NOTES: TLongintField;
    zqTasksPRIORITY: TStringField;
    zqTasksRESOURCES: TStringField;
    zqTasksSTART_DATE: TDateField;
    zqTasksTITLE: TStringField;
    zqGetLink: TZReadOnlyQuery;
    zqFind: TZReadOnlyQuery;
    zqRenameTags: TZQuery;
    zqAllTasks: TZQuery;
    zuImpExpAttachments: TZUpdateSQL;
    zuImpExpTasks: TZUpdateSQL;
    zuLinks: TZUpdateSQL;
    zuImpExpNotes: TZUpdateSQL;
    zuRenameTags: TZUpdateSQL;
    zuImpExpTags: TZUpdateSQL;
    zuTasks: TZUpdateSQL;
    zuNotebooks: TZUpdateSQL;
    zuTags: TZUpdateSQL;
    zuSections: TZUpdateSQL;
    zuNotes: TZUpdateSQL;
    zuAttachments: TZUpdateSQL;
    procedure apfbNotexException(Sender: TObject; E: Exception);
    procedure bnExitClick(Sender: TObject);
    procedure bnFindClick(Sender: TObject);
    procedure dbTextChange(Sender: TObject);
    procedure dbTextKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure dbTextKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure dbTitleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure dsNotesDataChange(Sender: TObject; Field: TField);
    procedure dsTasksDataChange(Sender: TObject; Field: TField);
    procedure edFindKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure edPasswordKeyPress(Sender: TObject; var Key: char);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of string);
    procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure grAttachmentsDblClick(Sender: TObject);
    procedure grFindDblClick(Sender: TObject);
    procedure grFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grLinksDblClick(Sender: TObject);
    procedure grNotebooksDblClick(Sender: TObject);
    procedure grSectionsDblClick(Sender: TObject);
    procedure grTagsListDblClick(Sender: TObject);
    procedure grTagsListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grTasksDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: integer; Column: TColumn; State: TGridDrawState);
    procedure grTasksKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure miEditCopyClick(Sender: TObject);
    procedure miEditCutClick(Sender: TObject);
    procedure miEditPasteClick(Sender: TObject);
    procedure miEditSelectAllClick(Sender: TObject);
    procedure miToolsHideMarColClick(Sender: TObject);
    procedure miEditBookmarksClick(Sender: TObject);
    procedure miEditOpenCurrWriterClick(Sender: TObject);
    procedure miEditReformatClick(Sender: TObject);
    procedure miFileExportClick(Sender: TObject);
    procedure miFileImportClick(Sender: TObject);
    procedure miNotesImportClick(Sender: TObject);
    procedure miFBManualClick(Sender: TObject);
    procedure miEditOpenCurrWordClick(Sender: TObject);
    procedure miEditPreviewClick(Sender: TObject);
    procedure miFileCloseClick(Sender: TObject);
    procedure miNotebooksCopyIDClick(Sender: TObject);
    procedure miNotesCopyIDClick(Sender: TObject);
    procedure miNotesSearchClick(Sender: TObject);
    procedure miNotesShowAllTasksClick(Sender: TObject);
    procedure miNotesTasksHideClick(Sender: TObject);
    procedure miFileRefreshClick(Sender: TObject);
    procedure miFBCopyrightClick(Sender: TObject);
    procedure miNotebooksMoveDownClick(Sender: TObject);
    procedure miNotebooksMoveUpClick(Sender: TObject);
    procedure miNotesAttachmentsOpenClick(Sender: TObject);
    procedure miNotesAttachmentsSaveAsClick(Sender: TObject);
    procedure miNoteschangeSectionClick(Sender: TObject);
    procedure miNotesFindClick(Sender: TObject);
    procedure miNotesLinksLocateClick(Sender: TObject);
    procedure miNotesMoveDownClick(Sender: TObject);
    procedure miNotesMoveUpClick(Sender: TObject);
    procedure miNotesTagsRenameClick(Sender: TObject);
    procedure miSectionsChangeNotebookClick(Sender: TObject);
    procedure miSectionsCopyIDClick(Sender: TObject);
    procedure miSectionsMoveDownClick(Sender: TObject);
    procedure miSectionsMoveUpClick(Sender: TObject);
    procedure miToolsBackupClick(Sender: TObject);
    procedure miToolsCompactClick(Sender: TObject);
    procedure miToolsFullScreenClick(Sender: TObject);
    procedure miToolsRestoreClick(Sender: TObject);
    procedure miToolsShowEditorClick(Sender: TObject);
    procedure miToolsOptionsClick(Sender: TObject);
    procedure pmInsertTagClick(Sender: TObject);
    procedure sgTitlesClick(Sender: TObject);
    procedure StateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miFileSaveClick(Sender: TObject);
    procedure miNotebooksCommentsClick(Sender: TObject);
    procedure miNotebooksDeleteClick(Sender: TObject);
    procedure miNotebooksNewClick(Sender: TObject);
    procedure miNotebooksSortbyCustomClick(Sender: TObject);
    procedure miNotebooksSortbyTitleClick(Sender: TObject);
    procedure miNotesAttachmentsDeleteClick(Sender: TObject);
    procedure miNotesAttachmentsNewClick(Sender: TObject);
    procedure miNotesDeleteClick(Sender: TObject);
    procedure miNotesLinksDeleteClick(Sender: TObject);
    procedure miNotesLinksNewClick(Sender: TObject);
    procedure miNotesNewClick(Sender: TObject);
    procedure miNotesSortByCustomClick(Sender: TObject);
    procedure miNotesSortByModificationDateClick(Sender: TObject);
    procedure miNotesSortByTitleClick(Sender: TObject);
    procedure miNotesTagsDeleteClick(Sender: TObject);
    procedure miNotesTagsNewClick(Sender: TObject);
    procedure miNotesTasksDeleteClick(Sender: TObject);
    procedure miNotesTasksNewClick(Sender: TObject);
    procedure miSectionsCommentsClick(Sender: TObject);
    procedure miSectionsDeleteClick(Sender: TObject);
    procedure miSectionsNewClick(Sender: TObject);
    procedure miSectionsSortbyCustomClick(Sender: TObject);
    procedure miSectionsSortbyTitleClick(Sender: TObject);
    procedure miFileUndoClick(Sender: TObject);
    procedure zqAllTasksAfterDelete(DataSet: TDataSet);
    procedure zqAllTasksBeforeDelete(DataSet: TDataSet);
    procedure zqAttachmentsAfterDelete(DataSet: TDataSet);
    procedure zqAttachmentsAfterInsert(DataSet: TDataSet);
    procedure zqAttachmentsBeforeDelete(DataSet: TDataSet);
    procedure zqAttachmentsBeforeInsert(DataSet: TDataSet);
    procedure zqLinksAfterDelete(DataSet: TDataSet);
    procedure zqLinksAfterInsert(DataSet: TDataSet);
    procedure zqLinksBeforeDelete(DataSet: TDataSet);
    procedure zqLinksBeforeInsert(DataSet: TDataSet);
    procedure zqNotebooksAfterDelete(DataSet: TDataSet);
    procedure zqNotebooksAfterInsert(DataSet: TDataSet);
    procedure zqNotebooksAfterScroll(DataSet: TDataSet);
    procedure zqNotebooksBeforeDelete(DataSet: TDataSet);
    procedure zqNotesAfterDelete(DataSet: TDataSet);
    procedure zqNotesAfterInsert(DataSet: TDataSet);
    procedure zqNotesAfterScroll(DataSet: TDataSet);
    procedure zqNotesBeforeDelete(DataSet: TDataSet);
    procedure zqNotesBeforeInsert(DataSet: TDataSet);
    procedure zqNotesBeforePost(DataSet: TDataSet);
    procedure zqNotesBeforeScroll(DataSet: TDataSet);
    procedure zqSectionsAfterDelete(DataSet: TDataSet);
    procedure zqSectionsAfterInsert(DataSet: TDataSet);
    procedure zqSectionsAfterScroll(DataSet: TDataSet);
    procedure zqSectionsBeforeDelete(DataSet: TDataSet);
    procedure zqSectionsBeforeInsert(DataSet: TDataSet);
    procedure zqTagsAfterDelete(DataSet: TDataSet);
    procedure zqTagsAfterInsert(DataSet: TDataSet);
    procedure zqTagsBeforeDelete(DataSet: TDataSet);
    procedure zqTagsBeforeInsert(DataSet: TDataSet);
    procedure zqTasksAfterDelete(DataSet: TDataSet);
    procedure zqTasksAfterInsert(DataSet: TDataSet);
    procedure zqTasksAfterPost(DataSet: TDataSet);
    procedure zqTasksBeforeDelete(DataSet: TDataSet);
    procedure zqTasksBeforeInsert(DataSet: TDataSet);
  private
    function CleanXML(stXMLText: string): string;
    function ColorToHtml(clColor: TColor): string;
    procedure Connect;
    function CopyAsHTML(smOutput: SmallInt; blAll: Boolean): string;
    procedure FindNotes;
    function GenID(GenName: string): integer;
    procedure Disconnect;
    function GetDbSize(stDatabase: String): String;
    function GetDict(txt: NSTextStorage; textOffset: integer): NSDictionary;
    function GetNotexTempDir: String;
    function GetPara(txt: NSTextStorage; textOffset: integer; isReadOnly,
      useDefault: Boolean): NSParagraphStyle;
    function GetSpaceWidth: Integer;
    function GetWritePara(txt: NSTextStorage; textOffset: integer
      ): NSMutableParagraphStyle;
    procedure InsText(stText: string);
    function IsHeader(stLine: String): boolean;
    procedure SelectInsertFootnote;
    procedure RenumberFootnotes;
    procedure RenumberList;
    procedure ResetChanges;
    procedure RefreshData;
    procedure SaveAll;
    procedure SelectTitle;
    function GoToNotePos(IDNote: integer): integer;
    procedure SetLists;
    procedure SetNotePos(IDNote, iPos: integer);
    procedure UpdateInfo;
  public
    procedure ListAndFormatTitle;
    procedure FormatMarkers(iAll: SmallInt);
    procedure SetLineParagraph;

  end;

type
  TNotePos = record
    IDNote: integer;
    Pos: integer;
  end;

  TNotePosArray = Array of TNotePos;

var
  fmMain: TfmMain;
  myNotePos: TNotePosArray;
  myHomeDir, myConfigFile, stBackupFile, stGBackDir: string;
  blSortCustomNotebooks: boolean = True;
  blSortCustomSections: boolean = True;
  blSortCustomNotes: boolean = True;
  blChangeIDSectionNote: SmallInt = -1;
  blChangedText: boolean = False;
  blLoadNotes: boolean = True;
  blModNote: boolean = False;
  blHideMarCol: boolean = False;
  iLastNotebook: integer = 0;
  iLastSection: integer = 0;
  iLastNote: integer = 0;
  iSimpleTextFrom: integer = 100000;
  iLineSpacing: integer = 1;
  iParagraphSpacing: integer = 1;
  clMarker: TColor = clRed;
  clHighlight: TColor = clGreen;
  clTaskGreen, clTaskBlue: TColor;

resourcestring

  msg001 = 'Data input or operation not correct. The error message is:';
  msg002 = 'Undo the changes to the text?';
  msg003 = 'The value entered is not a valid ID.';
  msg004 = 'No note has been selected.';
  msg005 = 'Backup the database';
  msg006 = 'It was not possible to copy the database file.';
  msg007 = 'Backup completed.';
  msg008 = 'The backup procedure has raised an error.';
  msg009 = 'There''s no backup file available.';
  msg010 = 'Restore the database from the backup file created on';
  msg011 = 'at';
  msg012 = 'It was not possible to copy the database file.';
  msg013 = 'Restore completed.';
  msg014 = 'The restore procedure has raised an error.';
  msg015 = 'Delete the current notebook with all the related sections and notes?';
  msg016 = 'It''s not possible to add a new section because no notebook is selected.';
  msg017 = 'Delete the current section with all the related notes?';
  msg018 = 'It''s not possible to add a new note because no section is selected.';
  msg019 = 'Delete the current note with all the related elements?';
  msg020 = 'It''s not possible to add a new attachment because no note is selected.';
  msg021 = 'Delete the current attachment?';
  msg022 = 'It''s not possible to add a new tag because no note is selected.';
  msg023 = 'Delete the current tag?';
  msg024 = 'It''s not possible to add a new link because no note is selected.';
  msg025 = 'Delete the current link?';
  msg026 = 'It''s not possible to add a new task because no note is selected.';
  msg027 = 'Delete the current task?';
  msg028 = 'The user name or the password are not correct.';
  msg029 = 'It''s not possible to save the data.';
  msg030 = 'Undo all the changes not yet saved?';
  msg031 = 'It''s not possible to undo the changes.';
  msg032 = 'It''s not possible to refresh the data.';
  msg033 = 'The start date is not correct.';
  msg034 = 'The end date is not correct.';
  msg035 = 'Insert notebook ID';
  msg036 = 'Insert the ID of the new notebook.';
  msg037 = 'Insert the ID of the note to be linked.';
  msg038 = 'Insert section ID';
  msg039 = 'Insert the ID of the new section.';
  msg040 = 'No note selected.';
  msg041 = 'Notes found:';
  msg042 = 'It''s not possible to import the file';
  msg043 = 'The SQL clause is not correct.';
  msg044 = 'Add a new tag?';
  msg045 = 'It was not possible to export the notes.';
  msg046 = 'It was not possible to import the notes.';
  msg047 = 'The selected file was note created with sqlNotex.';
  msg048 = 'It was not possible to find the note.';
  msg049 = 'No backup file has been specified in the options of the software.';
  msg050 = 'The database has been compacted.';
  msg051 = 'It was not possible to compact the database. Check that the passwords are correct';
  msg052 = 'Insert note ID';
  msg053 = 'The note is already linked.';
  msg054 = 'The tag is already present.';
  dateformat = 'en';
  prior1 = '1. Urgent';
  prior2 = '2. Very important';
  prior3 = '3. Important';
  prior4 = '4. Normal';
  prior5 = '5. Optional';
  find1 = 'Title contains';
  find2 = 'Text contains';
  find3 = 'Modification date among';
  find4 = 'Tags equal to';
  find5 = 'Attachment name contains';
  find6 = 'Activity name contains';
  find7 = 'SQL Where clause';
  sb001 = 'The current note has been saved on';
  sb002 = 'at';
  sb003 = 'Tasks';
  sb004 = 'Database size';
  sb005 = 'Number of characters (markers included)';
  ts001 = 'Done';
  ts002 = 'Title';
  ts003 = 'Start date';
  ts004 = 'End date';
  ts005 = 'Priority';
  ts006 = 'Resources';
  fileext001 = 'All formats|*.txt;*.odt;*.docx|' +
    'Text file|*.txt|Writer files|*.odt|' + 'Word files|*.docx|All files|*';
  fileext002 = 'All files|*';
  fileext003 = 'fbNotex archive|*.sna';
  pdfmanual = 'fbnotex-manual.pdf';


implementation


uses Unit2, Unit3, Unit4, Unit5, Unit6, Unit7, Unit8, Unit9, Unit10,
  unitcopyright;

{$R *.lfm}

procedure TfmMain.FormCreate(Sender: TObject);
var
  MyIni: TIniFile;
begin
  myHomeDir := GetUserDir + 'Library/Preferences/';
  myConfigFile := 'fbnotex.plist';
  stBackupFile := '/Users/' + GetUserDir + 'Data/fbNotex-backup.fdb';
  stGBackDir := '/Library/Frameworks/firebird.framework/Versions/A/' +
    'Resources/bin/gbak';
  if DirectoryExists(myHomeDir) = False then
  begin
    CreateDirUTF8(myHomeDir);
  end;
  if DirectoryExists(GetNotexTempDir) = False then
  begin
    CreateDirUTF8(GetNotexTempDir);
  end;
  if FileExistsUTF8(myHomeDir + myConfigFile) then
  begin
    try
      MyIni := TIniFile.Create(myHomeDir + myConfigFile);
      if MyIni.ReadString('fbnotex', 'maximize', '') = 'true' then
      begin
        fmMain.WindowState := wsMaximized;
      end
      else
      begin
        fmMain.Top := MyIni.ReadInteger('fbnotex', 'top', 0);
        fmMain.Left := MyIni.ReadInteger('fbnotex', 'left', 0);
        if MyIni.ReadInteger('fbnotex', 'width', 0) > 100 then
          fmMain.Width := MyIni.ReadInteger('fbnotex', 'width', 0)
        else
          fmMain.Width := 1000;
        if MyIni.ReadInteger('fbnotex', 'heigth', 0) > 100 then
          fmMain.Height := MyIni.ReadInteger('fbnotex', 'heigth', 0)
        else
          fmMain.Height := 600;
      end;
      pnNotebook_Sections.Width :=
        MyIni.ReadInteger('fbnotex', 'pnnotebooksection', 300);
      pnLeft.Width := MyIni.ReadInteger('fbnotex', 'pnleft', 550);
      pnRight.Width := MyIni.ReadInteger('fbnotex', 'pnright', 360);
      zcConnection.HostName := MyIni.ReadString('fbnotex', 'host', 'localhost');
      zcConnection.Database :=
        MyIni.ReadString('fbnotex', 'database', '');
      zcConnection.Port := MyIni.ReadInteger('fbnotex', 'port', 3050);
      stBackupFile := MyIni.ReadString('fbnotex', 'backupfile', '');
      dbText.Font.Name := MyIni.ReadString('fbnotex', 'fontname', 'Helvetica');
      dbText.Font.Size := MyIni.ReadInteger('fbnotex', 'fontsize', 12);
      sgTitles.Font.Size := MyIni.ReadInteger('fbnotex', 'fonttitlessize', 12);
      iLineSpacing := MyIni.ReadInteger('fbnotex', 'linespacing', 1);
      iParagraphSpacing := MyIni.ReadInteger('fbnotex', 'paragraphspacing', 1);
      iSimpleTextFrom := MyIni.ReadInteger('fbnotex', 'simpletxtfrom', 100000);
      if MyIni.ReadInteger('fbnotex', 'hidemarkcol', 0) = 1 then
      begin
        miToolsHideMarColClick(nil);
      end;
      if IsPaintDark = False then
      begin
        dbText.Font.Color := StringToColor(MyIni.ReadString('fbnotex',
          'fontcolor', 'clDefault'));
      end
      else
      begin
        dbText.Font.Color := StringToColor(MyIni.ReadString('fbnotex',
          'fontcolor', 'clWhite'));
      end;
      sgTitles.Font.Name := dbText.Font.Name;
      sgTitles.Font.Color := dbText.Font.Color;
      clMarker := StringToColor(MyIni.ReadString('fbnotex',
        'marker', 'clRed'));
      clHighlight := StringToColor(MyIni.ReadString('fbnotex',
        'highlight', 'clGreen'));
      iLastNotebook := MyIni.ReadInteger('fbnotex', 'lastnotebook', 0);
      iLastSection := MyIni.ReadInteger('fbnotex', 'lastsection', 0);
      iLastNote := MyIni.ReadInteger('fbnotex', 'lastnote', 0);
      edUserName.Text := MyIni.ReadString('fbnotex', 'username', 'SYSDBA');
    finally
      MyIni.Free;
    end;
  end;
  Disconnect;
  miFBNotex.Caption := #$EF#$A3#$BF;
  grNotebooks.FocusRectVisible := False;
  grSections.FocusRectVisible := False;
  grNotes.FocusRectVisible := False;
  grAttachments.FocusRectVisible := False;
  grTags.FocusRectVisible := False;
  grLinks.FocusRectVisible := False;
  grTasks.FocusRectVisible := False;
  grTagsList.FocusRectVisible := False;
  grFind.FocusRectVisible := False;
  sgTitles.FocusRectVisible := False;
  if IsPaintDark = False then
  begin
    clTaskGreen := clGreen;
    clTaskBlue := clBlue;
  end
  else
  begin
    clTaskGreen := clLime;
    clTaskBlue := clSkyBlue;
  end;
  if dateformat = 'en' then
  begin
    zqTasksSTART_DATE.DisplayFormat := 'dddd mmmm dd yyyy';
    zqTasksEND_DATE.DisplayFormat := 'dddd mmmm dd yyyy';
  end
  else
  begin
    zqTasksSTART_DATE.DisplayFormat := 'dddd dd mmmm yyyy';
    zqTasksEND_DATE.DisplayFormat := 'dddd dd mmmm yyyy';
  end;
  with grTasks.Columns[4].PickList do
  begin
    Clear;
    Add(prior1);
    Add(prior2);
    Add(prior3);
    Add(prior4);
    Add(prior5);
  end;
  with cbFields.Items do
  begin
    Clear;
    Add(find1);
    Add(find2);
    Add(find3);
    Add(find4);
    Add(find5);
    Add(find6);
    Add(find7);
  end;
  cbFields.ItemIndex := 1;
end;

procedure TfmMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  MyIni: TIniFile;
begin
  if zcConnection.Connected = True then
  begin;
    SaveAll;
    dbText.Clear;
    Disconnect;
  end;
  try
    MyIni := TIniFile.Create(myHomeDir + myConfigFile);
    if fmMain.WindowState = wsMaximized then
    begin
      MyIni.WriteString('fbnotex', 'maximize', 'true');
    end
    else
    begin
      MyIni.WriteString('fbnotex', 'maximize', 'false');
      MyIni.WriteInteger('fbnotex', 'top', fmMain.Top);
      MyIni.WriteInteger('fbnotex', 'left', fmMain.Left);
      MyIni.WriteInteger('fbnotex', 'width', fmMain.Width);
      MyIni.WriteInteger('fbnotex', 'heigth', fmMain.Height);
    end;
    MyIni.WriteInteger('fbnotex', 'pnnotebooksection', pnNotebook_Sections.Width);
    MyIni.WriteInteger('fbnotex', 'pnleft', pnLeft.Width);
    MyIni.WriteInteger('fbnotex', 'pnright', pnRight.Width);
    MyIni.WriteString('fbnotex', 'host', zcConnection.HostName);
    MyIni.WriteString('fbnotex', 'database', zcConnection.Database);
    MyIni.WriteInteger('fbnotex', 'port', zcConnection.Port);
    MyIni.WriteString('fbnotex', 'backupfile', stBackupFile);
    MyIni.WriteString('fbnotex', 'fontname', dbText.Font.Name);
    MyIni.WriteInteger('fbnotex', 'fontsize', dbText.Font.Size);
    MyIni.WriteInteger('fbnotex', 'fonttitlessize', sgTitles.Font.Size);
    MyIni.WriteInteger('fbnotex', 'linespacing', iLineSpacing);
    MyIni.WriteInteger('fbnotex', 'paragraphspacing', iParagraphSpacing);
    MyIni.WriteString('fbnotex', 'fontcolor', ColorToString(dbText.Font.Color));
    MyIni.WriteString('fbnotex', 'marker', ColorToString(clMarker));
    MyIni.WriteString('fbnotex', 'highlight', ColorToString(clHighlight));
    MyIni.WriteInteger('fbnotex', 'simpletxtfrom', iSimpleTextFrom);
    if miToolsHideMarCol.Checked = True then
    begin
      MyIni.WriteInteger('fbnotex', 'hidemarkcol', 1);
    end
    else
    begin
      MyIni.WriteInteger('fbnotex', 'hidemarkcol', 0);
    end;
    if iLastNotebook > 0 then
    begin
      MyIni.WriteInteger('fbnotex', 'lastnotebook', iLastNotebook);
    end;
    if iLastSection > 0 then
    begin
      MyIni.WriteInteger('fbnotex', 'lastsection', iLastSection);
    end;
    if iLastNote > 0 then
    begin
      MyIni.WriteInteger('fbnotex', 'lastnote', iLastNote);
    end;
    MyIni.WriteString('fbnotex', 'username', edUserName.Text);
    if DirectoryExistsUTF8(GetNotexTempDir) = True then
    begin
      DeleteDirectory(GetNotexTempDir, False);
    end;
  finally
    MyIni.Free;
  end;
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  fmOptions.edFBLibPath.Text := zcConnection.LibraryLocation;
  fmOptions.edServer.Text := zcConnection.HostName;
  fmOptions.edPath.Text := zcConnection.Database;
  fmOptions.edBackup.Text := stBackupFile;
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    setRichText(False);
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    setContinuousSpellCheckingEnabled(True);
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    textContainer.setLineFragmentPadding(30);
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    setFocusRingType(1);
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    setAutomaticQuoteSubstitutionEnabled(True);
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    setSmartInsertDeleteEnabled(True);
end;

procedure TfmMain.FormDropFiles(Sender: TObject; const FileNames: array of string);
var
  myFile: string;
begin
  if zqNotes.RecordCount = 0 then
    Abort;
  for myFile in FileNames do
  begin
    zqAttachments.Append;
    zqAttachments.Edit;
    zqAttachmentsATTACHMENT.LoadFromFile(myFile);
    zqAttachmentsTITLE.Value :=
      StringReplace(ExtractFileName(myFile),
     #39, '', [rfReplaceAll]);
    zqAttachments.Post;
    lbSize.Caption := sb004 + ': ' + GetDbSize(zcConnection.Database) + '.';
  end;
end;

procedure TfmMain.FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if pnMain.Visible = False then
    Abort;
  if ((key > 47) and (key < 58) and (Shift = [ssMeta, ssAlt])) then
  begin
    if zqNotesID.AsString <> '' then
    begin;
      fmBookmarks.sgBookmarks.Cells[1, key - 48] := zqNotebooksID.AsString;
      fmBookmarks.sgBookmarks.Cells[2, key - 48] := zqSectionsID.AsString;
      fmBookmarks.sgBookmarks.Cells[3, key - 48] := zqNotesID.AsString;
      fmBookmarks.sgBookmarks.Cells[4, key - 48] := zqNotebooksTITLE.Value;
      fmBookmarks.sgBookmarks.Cells[5, key - 48] := zqSectionsTITLE.Value;
      fmBookmarks.sgBookmarks.Cells[6, key - 48] := zqNotesTITLE.Value;
    end;
    key := 0;
  end
  else if ((key > 47) and (key < 58) and (Shift = [ssMeta])) then
  begin
    if fmBookmarks.sgBookmarks.Cells[1, key - 48] <> '' then
    begin
      SaveAll;
      blLoadNotes := False;
      zqNotebooks.Locate('ID', fmBookmarks.sgBookmarks.Cells[1, key - 48], []);
      zqSections.Locate('ID', fmBookmarks.sgBookmarks.Cells[2, key - 48], []);
      blLoadNotes := True;
      if zqNotes.Locate('ID', fmBookmarks.
        sgBookmarks.Cells[3, key - 48], []) = False then
      begin
        dsNotesDataChange(nil, nil);
        MessageDlg(msg048, mtWarning, [mbOK], 0);
      end;
    end;
    key := 0;
  end
  else
  if ((key = 187) and (Shift = [ssMeta])) then
  begin
    if dbText.Font.Size < 128 then
    begin
      dbText.Font.Size := dbText.Font.Size + 1;
    end;
    if sgTitles.Font.Size < 128 then
    begin
      sgTitles.Font.Size := sgTitles.Font.Size + 1;
    end;
    FormatMarkers(2);
    key := 0;
  end
  else
  if ((key = 189) and (Shift = [ssMeta])) then
  begin
    if dbText.Font.Size > 6 then
    begin
      dbText.Font.Size := dbText.Font.Size - 1;
    end;
    if sgTitles.Font.Size > 6 then
    begin
      sgTitles.Font.Size := sgTitles.Font.Size - 1;
    end;
    FormatMarkers(2);
    key := 0;
  end
  else
  if ((key = 33) and (Shift = [ssMeta])) then
  begin
    zqNotes.Prior;
    key := 0;
  end
  else
  if ((key = 34) and (Shift = [ssMeta])) then
  begin
    zqNotes.Next;
    key := 0;
  end
end;

procedure TfmMain.edPasswordKeyPress(Sender: TObject; var Key: char);
begin
  if key = #13 then
  begin
    key := #0;
    Connect;
  end;
end;

procedure TfmMain.bnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.apfbNotexException(Sender: TObject; E: Exception);
begin
  MessageDlg(msg001 + LineEnding + LineEnding + E.Message + '.',
    mtWarning, [mbOK], 0);
end;

procedure TfmMain.dbTextKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
  var iPos: integer;
begin
  if zqNotes.RecordCount = 0 then
  begin
    key := 0;
  end
  else
  if ((key = Ord('Y')) and (Shift = [ssMeta, ssShift])) then
  begin
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      selectParagraph(nil);
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      delete(nil);
    ListAndFormatTitle;
    key := 0;
  end
  else
  if ((key = Ord('F')) and (Shift = [ssMeta, ssAlt])) then
  begin
    SelectInsertFootnote;
    key := 0;
  end
  else
  if ((key = 190) and (Shift = [ssMeta, ssAlt])) then // It's the dot
  begin
    SetLists;
    dbTextChange(nil);
    FormatMarkers(2);
    key := 0;
  end
  else
  if ((key = Ord('Z')) and (Shift = [ssAlt, ssMeta])) then
  begin
    if MessageDlg(msg002, mtConfirmation, [mbOK, mbCancel], 0) = mrOk then
    begin
      zqNotes.CancelUpdates;
      dbText.Text := zqNotesTEXT.Value;
      dbText.SelStart := 0;
      SetLineParagraph;
      ListAndFormatTitle;
      FormatMarkers(2);
    end;
    key := 0;
  end
  else
  if ((key = 38) and (Shift = [ssAlt, ssMeta])) then
  begin
    if dbText.CaretPos.y > 0 then
    begin
      iPos := dbText.SelStart - UTF8Length(dbtext.Lines[dbText.CaretPos.Y - 1]) -
         UTF8Length(LineEnding);
      dbText.Lines.Move(dbText.CaretPos.y, dbText.CaretPos.y - 1);
      dbText.SelStart := iPos;
      ListAndFormatTitle;
      dbTextChange(nil);
      FormatMarkers(2);
    end;
    key := 0;
  end
  else
  if ((key = 40) and (Shift = [ssAlt, ssMeta])) then
  begin
    if dbText.CaretPos.y < dbText.Lines.Count - 1 then
    begin
      if ((dbText.CaretPos.y = dbText.Lines.Count - 2) and
        (dbText.Lines[dbText.CaretPos.y + 1] = '')) then
      begin
        key := 0;
        Exit;
      end;
      iPos := dbText.SelStart + UTF8Length(dbtext.Lines[dbText.CaretPos.Y + 1]) +
        UTF8Length(LineEnding);
      dbText.Lines.Move(dbText.CaretPos.y, dbText.CaretPos.y + 1);
      dbText.SelStart := iPos;
      ListAndFormatTitle;
      dbTextChange(nil);
      FormatMarkers(2);
    end;
    key := 0;
  end
  else
  if ((key = 8) or (key = 46)) then
  begin
    dbTextChange(nil);
  end;
end;

procedure TfmMain.dbTextKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
  var
    iNum, iPos: integer;
    stLastChar, stNextChar: ShortString;
begin
  if key in [16, 17, 18, 20, 27, 33, 34, 35, 36, 37, 38, 39, 40, 45, 234] then
  begin
    Exit;
  end;
  if key = 13 then
  begin
    if UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1, 1) = '#' then
    begin
      iPos := dbText.SelStart;
      // Useful to make the text in normal color
      dbText.Lines.Move(dbText.CaretPos.y, dbText.CaretPos.y);
      ListAndFormatTitle;
      FormatMarkers(2);
      dbText.SelStart := iPos;
    end;
    if ((dbText.Lines[dbText.CaretPos.Y - 1] = '*'#9) or
      (dbText.Lines[dbText.CaretPos.Y - 1] = '-'#9) or
      (dbText.Lines[dbText.CaretPos.Y - 1] = '+'#9) or
      (dbText.Lines[dbText.CaretPos.Y - 1] = '*'#9' ') or
      (dbText.Lines[dbText.CaretPos.Y - 1] = '-'#9' ') or
      (dbText.Lines[dbText.CaretPos.Y - 1] = '+'#9' ') or
      ((UTF8Length(dbText.Lines[dbText.CaretPos.Y - 1]) < 5) and
      ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1],
      UTF8Length(dbText.Lines[dbText.CaretPos.Y - 1]), 1) = #9) or
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1],
      UTF8Length(dbText.Lines[dbText.CaretPos.Y - 1]), 1) = ' ')) and
      ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 2, 2) = '.'#9) or
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 3, 2) = '.'#9)))) then
    begin
      dbText.Lines[dbText.CaretPos.Y - 1] := '';
      FormatMarkers(2);
      // Workaround
      dbText.SelStart := dbText.SelStart - 1;
      dbText.SelStart := dbText.SelStart + 1;
    end
    else
    if ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1, 3) = '*'#9' ') and
      (UTF8Length(dbText.Lines[dbText.CaretPos.Y - 1]) > 3)) then
    begin
      if dbText.SelStart = UTF8Length(dbText.Text) then
      begin
        InsText('*'#9' ' + LineEnding);
        dbText.SelStart := dbText.SelStart - UTF8Length(LineEnding);
      end
      else
      begin
        InsText('*'#9' ');
      end;
    end
    else
    if ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1, 2) = '*'#9) and
      (UTF8Length(dbText.Lines[dbText.CaretPos.Y - 1]) > 2)) then
    begin
      if dbText.SelStart = UTF8Length(dbText.Text) then
      begin
        InsText('*'#9 + LineEnding);
        dbText.SelStart := dbText.SelStart - UTF8Length(LineEnding);
      end
      else
      begin
        InsText('*'#9);
      end;
    end
    else
    if ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1, 3) = '-'#9' ') and
      (UTF8Length(dbText.Lines[dbText.CaretPos.Y - 1]) > 3)) then
    begin
      if dbText.SelStart = UTF8Length(dbText.Text) then
      begin
        InsText('-'#9' ' + LineEnding);
        dbText.SelStart := dbText.SelStart - UTF8Length(LineEnding);
      end
      else
      begin
        InsText('-'#9' ');
      end;
    end
    else
    if ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1, 2) = '-'#9) and
      (UTF8Length(dbText.Lines[dbText.CaretPos.Y - 1]) > 2)) then
    begin
      if dbText.SelStart = UTF8Length(dbText.Text) then
      begin
        InsText('-'#9 + LineEnding);
        dbText.SelStart := dbText.SelStart - UTF8Length(LineEnding);
      end
      else
      begin
        InsText('-'#9);
      end;
    end
    else
    if ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1, 3) = '+'#9' ') and
      (UTF8Length(dbText.Lines[dbText.CaretPos.Y - 1]) > 3)) then
    begin
      if dbText.SelStart = UTF8Length(dbText.Text) then
      begin
        InsText('+'#9' ' + LineEnding);
        dbText.SelStart := dbText.SelStart - UTF8Length(LineEnding);
      end
      else
      begin
        InsText('+'#9' ');
      end;
    end
    else
    if ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1, 2) = '+'#9) and
      (UTF8Length(dbText.Lines[dbText.CaretPos.Y - 1]) > 2)) then
    begin
      if dbText.SelStart = UTF8Length(dbText.Text) then
      begin
        InsText('+'#9 + LineEnding);
        dbText.SelStart := dbText.SelStart - UTF8Length(LineEnding);
      end
      else
      begin
        InsText('+'#9);
      end;
    end
    else
    if TryStrToInt(
      UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1,
      UTF8Pos('.'#9' ', dbText.Lines[dbText.CaretPos.Y - 1]) - 1), iNum) = True then
    begin
      if dbText.SelStart = UTF8Length(dbText.Text) then
      begin
        InsText(IntToStr(iNum + 1) + '.'#9' ' + LineEnding);
        dbText.SelStart := dbText.SelStart - UTF8Length(LineEnding);
      end
      else
      begin
        InsText(IntToStr(iNum + 1) + '.'#9' ');
      end;
    end
    else
    if TryStrToInt(
      UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1,
      UTF8Pos('.'#9, dbText.Lines[dbText.CaretPos.Y - 1]) - 1), iNum) = True then
    begin
      if dbText.SelStart = UTF8Length(dbText.Text) then
      begin
        InsText(IntToStr(iNum + 1) + '.'#9 + LineEnding);
        dbText.SelStart := dbText.SelStart - UTF8Length(LineEnding);
      end
      else
      begin
        InsText(IntToStr(iNum + 1) + '.'#9);
      end;
    end;
  end;
  stLastChar := UTF8Copy(dbText.Text, dbText.SelStart, 1);
  stNextChar := UTF8Copy(dbText.Text, dbText.SelStart + 1, 1);
  if ((stLastChar = ':') and
    ((UTF8Copy(dbText.Text, dbText.SelStart - 1, 1) = ':') or
    (UTF8Copy(dbText.Text, dbText.SelStart + 1, 1) = ':'))) then
  begin
    FormatMarkers(1);
  end
  else
  if ((UTF8Pos(stLastChar, '1234567890*/_~#|`()[]!^.>+- ' +
      #13 + #9 + LineEnding) > 0) or
    (key = 8) or (key = 46) or
    (UTF8Pos(stNextChar, '*/~_') > 0)) then
  begin
    FormatMarkers(1);
  end;
  //Workaround to color immediately all the title
  if ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 1) = '#') and
    (stLastChar = ' ') and (stNextChar = LineEnding)) then
  begin
    dbText.SelStart := dbText.SelStart - 1;
    dbText.SelStart := dbText.SelStart + 1;
  end;
  UpdateInfo;
end;

procedure TfmMain.sgTitlesClick(Sender: TObject);
begin
  SelectTitle;
end;

procedure TfmMain.grTasksDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if zqTasks.FieldByName('DONE').AsInteger = 1 then
  begin
    grTasks.canvas.Font.Color := clTaskGreen;
  end
  else if ((zqTasks.FieldByName('END_DATE').IsNull = False) and
    (zqTasks.FieldByName('END_DATE').AsDateTime < Date)) then
  begin
    grTasks.canvas.Font.Color := clRed;
  end
  else if ((zqTasks.FieldByName('START_DATE').IsNull = False) and
    (zqTasks.FieldByName('START_DATE').AsDateTime <= Date)) then
  begin
    grTasks.canvas.Font.Color := clTaskBlue;
  end;
  grTasks.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfmMain.grAttachmentsDblClick(Sender: TObject);
begin
  if zqAttachments.RecordCount > 0 then
  begin
    miNotesAttachmentsOpenClick(nil);
  end;
end;

procedure TfmMain.grFindDblClick(Sender: TObject);
  var rng: NSRange;
begin
  if zqFind.Active = False then
  begin
    Abort;
  end;
  if zqFind.RecordCount > 0 then
  begin
    blLoadNotes := False;
    zqNotebooks.Locate('ID', zqFindIDNOTEBOOKS.Value, []);
    zqSections.Locate('ID', zqFindIDSECTIONS.Value, []);
    zqNotes.Locate('ID', zqFindIDNOTES.Value, []);
    blLoadNotes := True;
    zqNotesAfterScroll(nil);
    if cbFields.ItemIndex = 1 then
    begin
      rng.location := UTF8Pos(UTF8LowerCase(edFind.Text),
        UTF8LowerCase(dbText.Text)) - 1;
      rng.length := UTF8Length(edFind.Text);
      dbText.SelStart := rng.location;
      TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
        showFindIndicatorForRange(rng);
    end;
    if cbFields.ItemIndex = 5 then
    begin
      pcPageControl.ActivePageIndex := 1;
      try
        zqTasks.DisableControls;
        zqTasks.First;
        while zqTasks.EOF = False do
        begin
          if UTF8Pos(UTF8LowerCase(edFind.Text),
            UTF8LowerCase(zqTasksTITLE.Value)) > 0 then
          begin
            Break;
          end;
          zqTasks.Next;
        end;
      finally
        zqTasks.EnableControls;
      end;
    end
    else
    begin
      pcPageControl.ActivePageIndex := 0;
    end;
  end;
end;

procedure TfmMain.grFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    key := 0;
    grFindDblClick(nil);
  end;
end;

procedure TfmMain.grTasksKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if zqTasks.RecordCount = 0 then
    Exit;
  if grTasks.SelectedColumn.FieldName = 'START_DATE' then
  begin
    if key = 32 then
    begin
      zqTasks.Edit;
      zqTasksSTART_DATE.Value := Date;
      zqTasksEND_DATE.Value := Date + 30;
      zqTasks.Post;
      key := 0;
    end
    else if ((key = 37) and (Shift = [ssShift])) then
    begin
      zqTasks.Edit;
      zqTasksSTART_DATE.Value := zqTasksSTART_DATE.Value - 1;
      zqTasks.Post;
      key := 0;
    end
    else if ((key = 39) and (Shift = [ssShift])) then
    begin
      zqTasks.Edit;
      zqTasksSTART_DATE.Value := zqTasksSTART_DATE.Value + 1;
      zqTasks.Post;
      key := 0;
    end;
  end;
  if grTasks.SelectedColumn.FieldName = 'END_DATE' then
  begin
    if key = 32 then
    begin
      zqTasks.Edit;
      zqTasksSTART_DATE.Value := Date;
      zqTasksEND_DATE.Value := Date + 30;
      zqTasks.Post;
      key := 0;
    end
    else if ((key = 37) and (Shift = [ssShift])) then
    begin
      zqTasks.Edit;
      zqTasksEND_DATE.Value := zqTasksEND_DATE.Value - 1;
      zqTasks.Post;
      key := 0;
    end
    else if ((key = 39) and (Shift = [ssShift])) then
    begin
      zqTasks.Edit;
      zqTasksEND_DATE.Value := zqTasksEND_DATE.Value + 1;
      zqTasks.Post;
      key := 0;
    end;
  end;
end;

procedure TfmMain.edFindKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if ((key = 13) and (Shift = [])) then
  begin
    key := 0;
    FindNotes;
  end;
end;

procedure TfmMain.bnFindClick(Sender: TObject);
begin
  FindNotes;
end;

procedure TfmMain.dbTextChange(Sender: TObject);
begin
  if blModNote = False then
  begin
    if blChangedText = False then
    begin
      if zqNotes.RecordCount > 0 then
      begin
        zqNotes.Edit;
      end
      else
      begin
        zqNotes.Insert;
        zqNotes.Edit;
      end;
      // The only edit is not enough
      zqNotesMODIFICATION_DATE.Value := Now;
    end;
    blChangedText := True;
    UpdateInfo;
  end;
end;

procedure TfmMain.dbTitleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if ((key = 13) and (Shift = [ssMeta])) then
  begin
    key := 0;
    dbText.Lines.Insert(0, '# ' + dbTitle.Text + LineEnding);
    dbText.SelStart := UTF8Length(dbText.Lines[0]);
    if dbText.Visible = True then
    begin
      dbText.SetFocus;
    end;
  end
  else
  if key = 13 then
  begin
    key := 0;
    if dbText.Visible = True then
    begin
      dbText.SetFocus;
    end;
  end;
end;

procedure TfmMain.grNotebooksDblClick(Sender: TObject);
begin
  miNotebooksCommentsClick(nil);
end;

procedure TfmMain.grSectionsDblClick(Sender: TObject);
begin
  miSectionsCommentsClick(nil);
end;

procedure TfmMain.grTagsListDblClick(Sender: TObject);
begin
  cbFields.ItemIndex := 3;
  if ((edFind.Text <> zqTagsListTAG.Value) and
    (UTF8Pos(zqTagsListTAG.Value, ', ' + edFind.Text + ', ') < 1) and
    (UTF8Copy(edFind.Text, UTF8Length(edFind.Text) -
    UTF8Length(zqTagsListTAG.Value), UTF8Length(edFind.Text)) <>
    zqTagsListTAG.Value)) then
  begin
    if edFind.Text = '' then
    begin
      edFind.Text := zqTagsListTAG.Value;
    end
    else
    begin
      edFind.Text := edFind.Text + ', ' + zqTagsListTAG.Value;
    end;
  end;
end;

procedure TfmMain.grTagsListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    key := 0;
    grTagsListDblClick(nil);
  end;
end;


procedure TfmMain.grLinksDblClick(Sender: TObject);
begin
  if zqLinks.RecordCount > 0 then
  begin
    miNotesLinksLocateClick(nil);
  end;
end;

// *****************************************************
// ****************** Menu procedures ******************
// *****************************************************

procedure TfmMain.miFileSaveClick(Sender: TObject);
begin
  SaveAll;
end;

procedure TfmMain.miFileUndoClick(Sender: TObject);
begin
  ResetChanges;
end;

procedure TfmMain.miFileRefreshClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TfmMain.miFileExportClick(Sender: TObject);
  var
    myFile: TextFile;
    stText, stAttFile: String;
    myGUID: TGuid;
begin
   sdSaveDialog.DefaultExt := '*.sna';
   sdSaveDialog.Filter := fileext003;
  if sdSaveDialog.Execute then
  try
    try
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;
      if DirectoryExistsUTF8(LazfileUtils.ExtractFileNameWithoutExt(
        sdSaveDialog.FileName)) = True then
      begin
        DeleteDirectory(LazfileUtils.ExtractFileNameWithoutExt(
        sdSaveDialog.FileName), False);
      end;
      AssignFile(myFile, sdSaveDialog.FileName);
      Rewrite(myFile);
      zqImpExpNotes.Open;
      zqImpExpAttachments.Open;
      zqImpExpTags.Open;
      zqImpExpTasks.Open;
      WriteLn(myFile, 'File exported by fbNotex');
      if zqImpExpNotes.RecordCount > 0 then
      begin
        while zqImpExpNotes.EOF = False do
        begin
          WriteLn(myFile, '<title>');
          WriteLn(myFile, zqImpExpNotesTITLE.Value);
          WriteLn(myFile, '</title>');
          WriteLn(myFile, '<text>');
          stText := zqImpExpNotesTEXT.AsString;
          stText := StringReplace(stText, '<', '&lt;', [rfReplaceAll]);
          stText := StringReplace(stText, '>', '&gt;', [rfReplaceAll]);
          stText := StringReplace(stText, LineEnding, '<p>', [rfReplaceAll]);
          stText := StringReplace(stText, #0, '', [rfReplaceAll]);
          WriteLn(myFile, stText);
          WriteLn(myFile, '</text>');
          if zqImpExpAttachments.RecordCount > 0 then
          begin;
            while zqImpExpAttachments.EOF = False do
            begin
              WriteLn(myFile, '<attachment>');
              WriteLn(myFile, zqImpExpAttachmentsTITLE.Value);
               CreateGUID(myGUID);
              stAttFile := UTF8copy(GUIDToString(myGUID), 2,
                UTF8Length(GUIDToString(myGUID)) - 2);
              if DirectoryExistsUTF8(LazfileUtils.ExtractFileNameWithoutExt(
                sdSaveDialog.FileName)) = False then
              begin
                CreateDirUTF8(LazfileUtils.ExtractFileNameWithoutExt(
                  sdSaveDialog.FileName));
              end;
              zqImpExpAttachmentsATTACHMENT.SaveToFile(
                LazfileUtils.ExtractFileNameWithoutExt(sdSaveDialog.FileName) +
                DirectorySeparator + stAttFile);
              WriteLn(myFile, stAttFile);
              WriteLn(myFile, '</attachment>');
              zqImpExpAttachments.Next;
            end;
          end;
          if zqImpExpTags.RecordCount > 0 then
          begin
            while zqImpExpTags.EOF = False do
            begin
              WriteLn(myFile, '<tag>');
              WriteLn(myFile, zqImpExpTagsTAG.Value);
              WriteLn(myFile, '</tag>');
              zqImpExpTags.Next;
            end;
          end;
          if zqImpExpTasks.RecordCount > 0 then
          begin
            while zqImpExpTasks.EOF = False do
            begin
              WriteLn(myFile, '<task>');
              WriteLn(myFile,
                zqImpExpTasksTITLE.AsString + #9 +
                zqImpExpTasksSTART_DATE.AsString + #9 +
                zqImpExpTasksEND_DATE.AsString + #9 +
                zqImpExpTasksDONE.AsString + #9 +
                zqImpExpTasksPRIORITY.AsString + #9 +
                zqImpExpTasksRESOURCES.AsString + #9 +
                StringReplace(zqImpExpTasksCOMMENTS.AsString, LineEnding,
                '<p>', [rfReplaceAll]));
              WriteLn(myFile, '</task>');
              zqImpExpTasks.Next;
            end;
          end;
          zqImpExpNotes.Next;
        end;
      end;
    finally
      CloseFile(myFile);
      zqImpExpNotes.Close;
      zqImpExpAttachments.Close;
      zqImpExpTags.Close;
      zqImpExpTasks.Close;
      Screen.Cursor := crDefault;
    end;
  except;
    MessageDlg(msg045, mtError, [mbOK], 0);
  end;
end;

procedure TfmMain.miFileImportClick(Sender: TObject);
  var
    myFile: TextFile;
    stLine, stField: String;
    iField: SmallInt;
begin
  odOpenDialog.Filter := fileext003;
 if odOpenDialog.Execute then
 try
   try
     Screen.Cursor := crHourGlass;
     Application.ProcessMessages;
     AssignFile(myFile, odOpenDialog.FileName);
     Reset(myFile);
     ReadLn(myFile, stLine);
     if stLine <> 'File exported by fbNotex' then
     begin
       MessageDlg(msg047, mtWarning, [mbOK], 0);
       Exit;
     end;
     zqImpExpNotes.Open;
     zqImpExpAttachments.Open;
     zqImpExpTags.Open;
     zqImpExpTasks.Open;
     while not EOF(myFile) do
     begin
       ReadLn(myFile, stLine);
       if stLine = '<title>' then
       begin
         iField := 0;
         zqImpExpNotes.Append;
         zqImpExpNotesID.Value := GenID('GEN_NOTES_ID');
         zqImpExpNotesORD.Value := zqImpExpNotesID.Value;
         zqImpExpNotesID_SECTIONS.Value :=
           zqSectionsID.Value;
         zqImpExpNotes.Post;
         zqImpExpNotes.ApplyUpdates;
         zqImpExpNotes.Edit;
       end
       else
       if stLine = '</title>' then
       begin
         iField := 0;
       end
       else
       if stLine = '<text>' then
       begin
         iField := 1;
       end
       else
       if stLine = '</text>' then
       begin
         iField := 1;
         zqImpExpNotes.Post;
         zqImpExpNotes.ApplyUpdates;
       end
       else
       if stLine = '<attachment>' then
       begin
         iField := 2;
         zqImpExpAttachments.Append;
         zqImpExpAttachmentsID.Value := GenID('GEN_ATTACHMENTS_ID');
         zqImpExpAttachmentsORD.Value := zqImpExpAttachmentsID.Value;
         zqImpExpAttachmentsID_NOTES.Value :=
           zqImpExpNotesID.Value;
         zqImpExpAttachments.Post;
         zqImpExpAttachments.ApplyUpdates;
         zqImpExpAttachments.Edit
       end
       else
       if stLine = '</attachment>' then
       begin
         iField := 2;
         zqImpExpAttachments.Post;
         zqImpExpAttachments.ApplyUpdates;
       end
       else
       if stLine = '<tag>' then
       begin
         iField := 3;
         zqImpExpTags.Append;
         zqImpExpTagsID.Value := GenID('GEN_TAGS_ID');
         zqImpExpTagsID_NOTES.Value := zqImpExpNotesID.Value;
         zqImpExpTags.Post;
         zqImpExpTags.ApplyUpdates;
         zqImpExpTags.Edit;
       end
       else
       if stLine = '</tag>' then
       begin
         iField := 3;
         zqImpExpTags.Post;
         zqImpExpTags.ApplyUpdates;
       end
       else
       if stLine = '<task>' then
       begin
         iField := 4;
         zqImpExpTasks.Append;
         zqImpExpTasksID.Value := GenID('GEN_TASKS_ID');
         zqImpExpTasksID_NOTES.Value := zqImpExpNotesID.Value;
         zqImpExpTasks.Post;
         zqImpExpTasks.ApplyUpdates;
         zqImpExpTasks.Edit;
       end
       else
       if stLine = '</task>' then
       begin
         iField := 4;
         zqImpExpTasks.Post;
         zqImpExpTasks.ApplyUpdates;
       end
       else
       begin
         if iField = 0 then
         begin
           zqImpExpNotesTITLE.Value := stLine;
         end
         else
         if iField = 1 then
         begin
           stLine := StringReplace(stLine, '<p>', LineEnding, [rfReplaceAll]);
           stLine := StringReplace(stLine, '&lt;', '<', [rfReplaceAll]);
           stLine := StringReplace(stLine, '&gt;', '>', [rfReplaceAll]);
           zqImpExpNotesTEXT.Value := stLine;
         end
         else
         if iField = 2 then
         begin
           zqImpExpAttachmentsTITLE.Value := stLine;
           ReadLn(myFile, stLine);
           if FileExists(LazfileUtils.ExtractFileNameWithoutExt(
             odOpenDialog.FileName) + DirectorySeparator + stLine) = True then
           begin
             zqImpExpAttachmentsATTACHMENT.LoadFromFile(
               LazfileUtils.ExtractFileNameWithoutExt(odOpenDialog.FileName) +
               DirectorySeparator + stLine);
           end;
         end
         else
         if iField = 3 then
         begin
           zqImpExpTagsTAG.Value := stLine;
         end
         else
         if iField = 4 then
         begin
           stField := stLine;
           zqImpExpTasksTITLE.AsString :=
             UTF8Copy(stField, 1, UTF8Pos(#9, stField) - 1);
           stField := UTF8Copy(stField, UTF8Pos(#9, stField) + 1,
             UTF8Length(stField));
           zqImpExpTasksSTART_DATE.AsString :=
             UTF8Copy(stField, 1, UTF8Pos(#9, stField) - 1);
           stField := UTF8Copy(stField, UTF8Pos(#9, stField) + 1,
             UTF8Length(stField));
           zqImpExpTasksEND_DATE.AsString :=
             UTF8Copy(stField, 1, UTF8Pos(#9, stField) - 1);
           stField := UTF8Copy(stField, UTF8Pos(#9, stField) + 1,
             UTF8Length(stField));
           zqImpExpTasksDONE.AsString :=
             UTF8Copy(stField, 1, UTF8Pos(#9, stField) - 1);
           stField := UTF8Copy(stField, UTF8Pos(#9, stField) + 1,
             UTF8Length(stField));
           zqImpExpTasksPRIORITY.AsString :=
             UTF8Copy(stField, 1, UTF8Pos(#9, stField) - 1);
           stField := UTF8Copy(stField, UTF8Pos(#9, stField) + 1,
             UTF8Length(stField));
           zqImpExpTasksRESOURCES.AsString :=
             UTF8Copy(stField, 1, UTF8Pos(#9, stField) - 1);
           stField := UTF8Copy(stField, UTF8Pos(#9, stField) + 1,
             UTF8Length(stField));
           zqImpExpTasksCOMMENTS.AsString := StringReplace(stField, '<p>',
             LineEnding, [rfReplaceAll]);
         end;
       end;
     end;
    finally
      CloseFile(myFile);
      zqImpExpNotes.Close;
      zqImpExpAttachments.Close;
      zqImpExpTags.Close;
      zqImpExpTasks.Close;
      RefreshData;
      Screen.Cursor := crDefault;
    end;
  except
    MessageDlg(msg046, mtError, [mbOK], 0);
  end;
end;

procedure TfmMain.miFileCloseClick(Sender: TObject);
begin
  SaveAll;
  Disconnect;
  if edPassword.Visible = True then
  begin
    edPassword.SetFocus;
  end;
end;

procedure TfmMain.miEditCutClick(Sender: TObject);
begin
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    cut(nil);
end;

procedure TfmMain.miEditCopyClick(Sender: TObject);
begin
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    copy_(nil);
end;

procedure TfmMain.miEditPasteClick(Sender: TObject);
begin
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    pasteAsPlainText(nil);
  FormatMarkers(1);
end;

procedure TfmMain.miEditSelectAllClick(Sender: TObject);
begin
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    selectAll(nil);
end;

procedure TfmMain.miEditReformatClick(Sender: TObject);
  var iPos: integer;
begin
  if zqNotes.RecordCount = 0 then
  begin
    Exit;
  end;
  iPos := dbText.SelStart;
  RenumberFootnotes;
  RenumberList;
  ListAndFormatTitle;
  FormatMarkers(2);
  dbText.Refresh;
  dbText.SelStart := iPos;
  // This menu item can be called outside dbText, so...
  if blChangedText = False then
  begin
    zqNotes.Edit;
    // The only edit is not enough
    zqNotesMODIFICATION_DATE.Value := Now;
  end;
  blChangedText := True;
end;

procedure TfmMain.miEditPreviewClick(Sender: TObject);
var
  myMemo: TMemo;
begin
  SaveAll;
  if dbText.Text <> '' then
    try
      myMemo := TMemo.Create(self);
      myMemo.Text := CopyAsHTML(0, False);
      myMemo.Lines.SaveToFile(GetNotexTempDir + 'fbnotex.html');
      OpenDocument(GetNotexTempDir + 'fbnotex.html');
    finally
      myMemo.Free;
    end;
end;

procedure TfmMain.miEditOpenCurrWordClick(Sender: TObject);
var
  myMemo: TMemo;
begin
  SaveAll;
  if dbText.Text <> '' then
    try
      myMemo := TMemo.Create(self);
      if Sender = miEditOpenCurrWord then
      begin
        myMemo.Text := CopyAsHTML(2, False);
      end
      else
      begin
        myMemo.Text := CopyAsHTML(2, True);
      end;
      myMemo.Lines.SaveToFile(GetNotexTempDir + 'fbnotex.html');
      Unix.fpSystem('open -a /Applications/Microsoft\ Word.app ' +
        GetNotexTempDir + 'fbnotex.html');
    finally
      myMemo.Free;
    end;
end;

procedure TfmMain.miEditOpenCurrWriterClick(Sender: TObject);
var
  myMemo: TMemo;
begin
  SaveAll;
  if dbText.Text <> '' then
    try
      myMemo := TMemo.Create(self);
      if Sender = miEditOpenCurrWriter then
      begin
        myMemo.Text := CopyAsHTML(1, False);
      end
      else
      begin
        myMemo.Text := CopyAsHTML(1, True);
      end;
      myMemo.Lines.SaveToFile(GetNotexTempDir + 'fbnotex.html');
      Unix.fpSystem('open -a /Applications/LibreOffice.app/Contents/MacOS/soffice ' +
        GetNotexTempDir + 'fbnotex.html --args --writer ');
    finally
      myMemo.Free;
    end;
end;

procedure TfmMain.miEditBookmarksClick(Sender: TObject);
begin
  if fmBookmarks.ShowModal = mrOK then
  begin
    SaveAll;
    blLoadNotes := False;
    zqNotebooks.Locate('ID', fmBookmarks.sgBookmarks.Cells
      [1, fmBookmarks.sgBookmarks.Row], []);
    zqSections.Locate('ID', fmBookmarks.sgBookmarks.Cells
    [2, fmBookmarks.sgBookmarks.Row], []);
    blLoadNotes := True;
    if zqNotes.Locate('ID', fmBookmarks.sgBookmarks.Cells
      [3, fmBookmarks.sgBookmarks.Row], []) = False then
    begin
      dsNotesDataChange(nil, nil);
      MessageDlg(msg048, mtWarning, [mbOK], 0);
    end;
  end;
end;

procedure TfmMain.miNotebooksNewClick(Sender: TObject);
begin
  zqNotebooks.Append;
  fmNotebooks.ShowModal;
end;

procedure TfmMain.miNotebooksSortbyCustomClick(Sender: TObject);
begin
  blSortCustomNotebooks := True;
  with zqNotebooks do
    try
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('Select * from Notebooks order by Ord');
      Open;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miNotebooksSortbyTitleClick(Sender: TObject);
begin
  blSortCustomNotebooks := False;
  with zqNotebooks do
    try
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('Select * from Notebooks order by Title');
      Open;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miNotebooksMoveUpClick(Sender: TObject);
var
  OldOrd, NewOrd, OldID, NewID: integer;
begin
  if blSortCustomNotebooks = False then
    Abort;
  with zqNotebooks do
    try
      DisableControls;
      OldOrd := zqNotebooksORD.Value;
      OldID := zqNotebooksID.Value;
      Prior;
      NewOrd := zqNotebooksORD.Value;
      NewID := zqNotebooksID.Value;
      if OldID <> NewID then
      begin
        Edit;
        zqNotebooksORD.Value := OldOrd;
        Post;
        Next;
        Edit;
        zqNotebooksORD.Value := NewOrd;
        Post;
        ApplyUpdates;
        Refresh;
      end;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miNotebooksMoveDownClick(Sender: TObject);
var
  OldOrd, NewOrd, OldID, NewID: integer;
begin
  if blSortCustomNotebooks = False then
    Abort;
  with zqNotebooks do
    try
      DisableControls;
      OldOrd := zqNotebooksORD.Value;
      OldID := zqNotebooksID.Value;
      Next;
      NewOrd := zqNotebooksORD.Value;
      NewID := zqNotebooksID.Value;
      if OldID <> NewID then
      begin
        Edit;
        zqNotebooksORD.Value := OldOrd;
        Post;
        Prior;
        Edit;
        zqNotebooksORD.Value := NewOrd;
        Post;
        ApplyUpdates;
        Refresh;
      end;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miNotebooksDeleteClick(Sender: TObject);
begin
  zqNotebooks.Delete;
end;

procedure TfmMain.miNotebooksCommentsClick(Sender: TObject);
begin
  fmNotebooks.ShowModal;
end;

procedure TfmMain.miNotebooksCopyIDClick(Sender: TObject);
begin
  Clipboard.AsText := zqNotebooksID.AsString;
end;

procedure TfmMain.miSectionsNewClick(Sender: TObject);
begin
  zqSections.Append;
  fmSections.ShowModal;
end;

procedure TfmMain.miSectionsDeleteClick(Sender: TObject);
begin
  zqSections.Delete;
end;

procedure TfmMain.miSectionsSortbyCustomClick(Sender: TObject);
begin
  blSortCustomSections := True;
  with zqSections do
    try
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('Select * from Sections order by Ord');
      Open;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miSectionsSortbyTitleClick(Sender: TObject);
begin
  blSortCustomSections := False;
  with zqSections do
    try
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('Select * from Sections order by Title');
      Open;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miSectionsMoveUpClick(Sender: TObject);
var
  OldOrd, NewOrd, OldID, NewID: integer;
begin
  if blSortCustomSections = False then
    Abort;
  with zqSections do
    try
      DisableControls;
      OldOrd := zqSectionsORD.Value;
      OldID := zqSectionsID.Value;
      Prior;
      NewOrd := zqSectionsORD.Value;
      NewID := zqSectionsID.Value;
      if OldID <> NewID then
      begin
        Edit;
        zqSectionsORD.Value := OldOrd;
        Post;
        Next;
        Edit;
        zqSectionsORD.Value := NewOrd;
        Post;
        ApplyUpdates;
        Refresh;
      end;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miSectionsMoveDownClick(Sender: TObject);
var
  OldOrd, NewOrd, OldID, NewID: integer;
begin
  if blSortCustomSections = False then
    Abort;
  with zqSections do
    try
      DisableControls;
      OldOrd := zqSectionsORD.Value;
      OldID := zqSectionsID.Value;
      Next;
      NewOrd := zqSectionsORD.Value;
      NewID := zqSectionsID.Value;
      if OldID <> NewID then
      begin
        Edit;
        zqSectionsORD.Value := OldOrd;
        Post;
        Prior;
        Edit;
        zqSectionsORD.Value := NewOrd;
        Post;
        ApplyUpdates;
        Refresh;
      end;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miSectionsCommentsClick(Sender: TObject);
begin
  fmSections.ShowModal;
end;

procedure TfmMain.miSectionsChangeNotebookClick(Sender: TObject);
begin
  if zqSections.RecordCount = 0 then
  begin
    Exit;
  end;
  pcPageControl.PageIndex := 0;
  fmInsertID.Caption := msg035;
  fmInsertID.lbIDKind.Caption := msg036;
  if blChangeIDSectionNote <> 0 then
  begin
    fmInsertID.edID.Clear;
    fmInsertID.lbTitle.Caption := '';
    blChangeIDSectionNote := 0;
  end;
  fmInsertID.iNoteSect := 0;
  if fmInsertID.ShowModal = mrOk then
  try
    zqSections.Edit;
    zqSectionsID_NOTEBOOKS.Value := StrToInt(fmInsertID.edID.Text);
    zqSections.Post;
    zqSections.ApplyUpdates;
    blLoadNotes := True;
    zqNotesAfterScroll(nil);
  except
    zqSections.CancelUpdates;
    MessageDlg(msg003, mtWarning, [mbOK], 0);
  end;
end;

procedure TfmMain.miSectionsCopyIDClick(Sender: TObject);
begin
  Clipboard.AsText := zqSectionsID.AsString;
  ;
end;

procedure TfmMain.miNotesNewClick(Sender: TObject);
begin
  pcPageControl.PageIndex := 0;
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  zqNotes.Append;
  pcPageControl.ActivePageIndex := 0;
  if dbTitle.Visible = True then
  begin
    dbTitle.SetFocus;
  end;
end;

procedure TfmMain.miNotesDeleteClick(Sender: TObject);
begin
  pcPageControl.PageIndex := 0;
  if zqNotes.RecordCount > 0 then
  begin
    zqNotes.Delete;
  end;
end;

procedure TfmMain.miNotesSortByCustomClick(Sender: TObject);
begin
  pcPageControl.PageIndex := 0;
  blSortCustomNotes := True;
  with zqNotes do
    try
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('Select * from Notes order by Ord');
      Open;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miNotesSortByTitleClick(Sender: TObject);
begin
  pcPageControl.PageIndex := 0;
  blSortCustomNotes := False;
  with zqNotes do
    try
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('Select * from Notes order by Title');
      Open;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miNotesSortByModificationDateClick(Sender: TObject);
begin
  pcPageControl.PageIndex := 0;
  blSortCustomNotes := False;
  with zqNotes do
    try
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('Select * from Notes order by Modification_Date');
      Open;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miNotesMoveUpClick(Sender: TObject);
var
  OldOrd, NewOrd, OldID, NewID: integer;
begin
  pcPageControl.PageIndex := 0;
  if blSortCustomNotes = False then
    Abort;
  with zqNotes do
    try
      DisableControls;
      OldOrd := zqNotesORD.Value;
      OldID := zqNotesID.Value;
      Prior;
      NewOrd := zqNotesORD.Value;
      NewID := zqNotesID.Value;
      if OldID <> NewID then
      begin
        Edit;
        zqNotesORD.Value := OldOrd;
        Post;
        Next;
        Edit;
        zqNotesORD.Value := NewOrd;
        Post;
        ApplyUpdates;
        Refresh;
      end;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miNotesMoveDownClick(Sender: TObject);
var
  OldOrd, NewOrd, OldID, NewID: integer;
begin
  pcPageControl.PageIndex := 0;
  if blSortCustomNotes = False then
    Abort;
  with zqNotes do
    try
      DisableControls;
      OldOrd := zqNotesORD.Value;
      OldID := zqNotesID.Value;
      Next;
      NewOrd := zqNotesORD.Value;
      NewID := zqNotesID.Value;
      if OldID <> NewID then
      begin
        Edit;
        zqNotesORD.Value := OldOrd;
        Post;
        Prior;
        Edit;
        zqNotesORD.Value := NewOrd;
        Post;
        ApplyUpdates;
        Refresh;
      end;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miNotesAttachmentsNewClick(Sender: TObject);
var
  i: integer;
begin
  odOpenDialog.Filter := fileext002;
  if zqNotes.RecordCount > 0 then
  begin
    if odOpenDialog.Execute then
    begin
      for i := 0 to odOpenDialog.Files.Count - 1 do
      begin
        zqAttachments.Append;
        zqAttachments.Edit;
        zqAttachmentsATTACHMENT.LoadFromFile(odOpenDialog.Files[i]);
        zqAttachmentsTITLE.Value :=
          StringReplace(ExtractFileName(odOpenDialog.Files[i]),
          #39, '', [rfReplaceAll]);
        zqAttachments.Post;
      end;
    end;
    lbSize.Caption := sb004 + ': ' + GetDbSize(zcConnection.Database) + '.';
  end
  else
  begin
    MessageDlg(msg004, mtWarning, [mbOK], 0);
  end;
end;

procedure TfmMain.miNotesAttachmentsDeleteClick(Sender: TObject);
begin
  if zqAttachments.RecordCount > 0 then
  begin
    zqAttachments.Delete;
  end;
end;

procedure TfmMain.miNotesAttachmentsOpenClick(Sender: TObject);
begin
  if zqAttachments.RecordCount > 0 then
  begin
    zqAttachmentsATTACHMENT.SaveToFile(GetNotexTempDir + zqAttachmentsTITLE.Value);
    OpenDocument(GetNotexTempDir + zqAttachmentsTITLE.Value);
  end;
end;

procedure TfmMain.miNotesAttachmentsSaveAsClick(Sender: TObject);
begin
  if zqAttachments.RecordCount > 0 then
  begin
    sdSaveDialog.DefaultExt := '';
    sdSaveDialog.Filter := fileext002;
    sdSaveDialog.FileName := zqAttachmentsTITLE.Value;
    if sdSaveDialog.Execute then
    begin
      zqAttachmentsATTACHMENT.SaveToFile(sdSaveDialog.FileName);
    end;
  end;
end;

procedure TfmMain.miNotesTagsNewClick(Sender: TObject);
begin
  if grTags.Visible = True then
  begin
    if grTags.Focused = False then
    begin
      if MessageDlg(msg044, mtConfirmation, [mbOK, mbcancel], 0) = mrCancel then
      begin
        Exit;
      end;
    end;
    zqTags.Append;
    grTags.EditorMode := True;
    grTags.SetFocus;
  end;
end;

procedure TfmMain.miNotesTagsDeleteClick(Sender: TObject);
begin
  if zqTags.RecordCount > 0 then
  begin
    zqTags.Delete;
  end;
end;

procedure TfmMain.miNotesTagsRenameClick(Sender: TObject);
begin
  if fmRenameTags.ShowModal = mrCancel then
    Abort;
  if ((fmRenameTags.edOldTag.Text <> '') and (fmRenameTags.edNewTag.Text <> '')) then
  begin
    with zqRenameTags do
    begin
      SQL.Clear;
      SQL.Add('Select * from Tags where Tag = ' + #39 +
        fmRenameTags.edOldTag.Text + #39);
      Open;
      while not zqRenameTags.EOF do
      begin
        Edit;
        zqRenameTags.FieldByName('Tag').AsString := fmRenameTags.edNewTag.Text;
        Post;
        Next;
      end;
      ApplyUpdates;
      Close;
    end;
    zqTags.Refresh;
  end;
end;

procedure TfmMain.miNotesLinksNewClick(Sender: TObject);
begin
  if zqNotes.RecordCount = 0 then
  begin
    MessageDlg(msg004, mtWarning, [mbOK], 0);
    Abort;
  end;
  pcPageControl.PageIndex := 0;
  fmInsertID.Caption := msg052;
  fmInsertID.lbIDKind.Caption := msg037;
  if blChangeIDSectionNote <> 2 then
  begin
    fmInsertID.edID.Clear;
    fmInsertID.lbTitle.Caption := '';
    blChangeIDSectionNote := 2;
  end;
  fmInsertID.iNoteSect := 2;
  if fmInsertID.ShowModal = mrOK then
  try
    if zqLinks.Locate('Link_Note', fmInsertID.edID.Text, []) = True then
    begin
      MessageDlg(msg053, mtWarning, [mbOK], 0);
      Exit;
    end;
    zqLinks.Append;
    zqLinks.Edit;
    zqLinksLINK_NOTE.Value := StrToInt(fmInsertID.edID.Text);
    zqLinks.Post;
    zqLinks.ApplyUpdates;
    zqLinks.Append;
    zqLinks.Edit;
    zqLinksID_NOTES.Value := StrToInt(fmInsertID.edID.Text);
    zqLinksLINK_NOTE.Value := zqNotesID.Value;
    zqLinks.Post;
    zqLinks.ApplyUpdates;
    zqLinks.Refresh;
  except
    zqLinks.CancelUpdates;
    MessageDlg(msg003, mtWarning, [mbOK], 0);
  end;
end;

procedure TfmMain.miNotesLinksDeleteClick(Sender: TObject);
begin
  if zqLinks.RecordCount > 0 then
  begin
    zqLinks.Delete;
  end;
end;

procedure TfmMain.miNotesLinksLocateClick(Sender: TObject);
var
  iNotebook, iSection, iNote: integer;
begin
  if zqLinks.RecordCount > 0 then
  begin
    with zqGetLink do
    begin
      iNote := zqLinksLINK_NOTE.Value;
      SQL.Clear;
      SQL.Add('Select ID_SECTIONS from Notes where ID = ' + IntToStr(iNote));
      Open;
      iSection := zqGetLink.FieldByName('ID_SECTIONS').AsInteger;
      Close;
      SQL.Clear;
      SQL.Add('Select ID_NOTEBOOKS from Sections where ID = ' +
        IntToStr(iSection));
      Open;
      iNotebook := zqGetLink.FieldByName('ID_NOTEBOOKS').AsInteger;
      Close;
      blLoadNotes := False;
      zqNotebooks.Locate('ID', IntToStr(iNotebook), []);
      zqSections.Locate('ID', IntToStr(iSection), []);
      zqNotes.Locate('ID', IntToStr(iNote), []);
      blLoadNotes := True;
      zqNotesAfterScroll(nil);
    end;
  end;
end;

procedure TfmMain.miNotesTasksNewClick(Sender: TObject);
begin
  pcPageControl.PageIndex := 1;
  grTasks.SetFocus;
  grTasks.SelectedField := zqTasksTITLE;
  zqTasks.Append;
  grTasks.EditorMode := True;
end;

procedure TfmMain.miNotesTasksDeleteClick(Sender: TObject);
begin
  pcPageControl.PageIndex := 1;
  if zqTasks.RecordCount > 0 then
  begin
    zqTasks.Delete;
  end;
end;

procedure TfmMain.miNotesTasksHideClick(Sender: TObject);
begin
  pcPageControl.PageIndex := 1;
  miNotesTasksHide.Checked := not miNotesTasksHide.Checked;
  with zqTasks do
    try
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('Select * from Tasks where  ID_Notes = :ID');
      if miNotesTasksHide.Checked = True then
      begin
        SQL.Add('and DONE = 0');
      end;
      SQL.Add('order by END_DATE, START_DATE');
      Open
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miNotesShowAllTasksClick(Sender: TObject);
begin
  SaveAll;
  zqAllTasks.Open;
  fmShowAllTasks.ShowModal;
  if zqAllTasks.UpdatesPending = True then
  begin
    zqAllTasks.ApplyUpdates;
  end;
  zqAllTasks.Close;
  zqTasks.Refresh;
end;

procedure TfmMain.miNotesImportClick(Sender: TObject);
var
  myZip: TUnZipper;
  myList, stFileOrig: TStringList;
  i, iFile: integer;
begin
  pcPageControl.PageIndex := 0;
  if zqSections.RecordCount = 0 then
  begin
    MessageDlg(msg018, mtWarning, [mbOK], 0);
    Abort;
  end;
  odOpenDialog.Filter := fileext001;
  if odOpenDialog.Execute then
  try
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    for iFile := 0 to odOpenDialog.Files.Count - 1 do
    try
      zqNotes.Append;
      if ((UTF8LowerCase(ExtractFileExt(odOpenDialog.Files[iFile])) = '.txt') or
        (UTF8LowerCase(ExtractFileExt(odOpenDialog.Files[iFile])) = '')) then
      begin
        zqNotes.Edit;
        dbText.Lines.LoadFromFile(odOpenDialog.Files[iFile]);
        blChangedText := True;
        zqNotesTITLE.Value :=
          ExtractFileName(LazFileUtils.ExtractFileNameWithoutExt(odOpenDialog.Files[iFile]));
        zqNotes.Post;
        zqNotes.ApplyUpdates;
      end
      else if UTF8LowerCase(ExtractFileExt(odOpenDialog.Files[iFile])) = '.odt' then
      begin
        try
          myZip := TUnZipper.Create;
          myList := TStringList.Create;
          stFileOrig := TStringList.Create;
          myList.Add('content.xml');
          myZip.OutputPath := GetNotexTempDir;
          myZip.FileName := odOpenDialog.Files[iFile];
          myZip.UnZipFiles(myList);
          stFileOrig.LoadFromFile(GetNotexTempDir + DirectorySeparator + 'content.xml');
          stFileOrig.Text := StringReplace(stFileOrig.Text,
            '<text:note-citation>', ' [^', [rfReplaceAll]);
          stFileOrig.Text := StringReplace(stFileOrig.Text,
            '</text:p></text:note-body></text:note>', ']', [rfReplaceAll]);
          stFileOrig.Text := StringReplace(stFileOrig.Text, '<text:note-body>',
            ': ', [rfReplaceAll]);
          stFileOrig.Text := StringReplace(stFileOrig.Text, '</text:h>',
            LineEnding + LineEnding, [rfReplaceAll]);
          stFileOrig.Text := StringReplace(stFileOrig.Text, '</text:p>',
            LineEnding, [rfReplaceAll]);
          stFileOrig.Text := StringReplace(stFileOrig.Text, '&apos;',
            #39, [rfReplaceAll]);
          zqNotes.Edit;
          blChangedText := True;
          dbText.Text := CleanXML(stFileOrig.Text);
          zqNotesTITLE.Value :=
            ExtractFileName(LazFileUtils.ExtractFileNameWithoutExt(odOpenDialog.Files[iFile]));
          zqNotes.Post;
          zqNotes.ApplyUpdates;
          DeleteFileUTF8(GetNotexTempDir + DirectorySeparator + 'content.xml');
          zqAttachments.Append;
          zqAttachments.Edit;
          zqAttachmentsATTACHMENT.LoadFromFile(odOpenDialog.Files[iFile]);
          zqAttachmentsTITLE.Value :=
            StringReplace(ExtractFileName(odOpenDialog.Files[iFile]),
            #39, '', [rfReplaceAll]);
          zqAttachments.Post;
          zqAttachments.ApplyUpdates;
        finally
          myZip.Free;
          myList.Free;
          stFileOrig.Free;
        end;
      end
      else
      if UTF8LowerCase(ExtractFileExt(odOpenDialog.Files[iFile])) = '.docx' then
      begin
        try
          zqNotes.Edit;
          blChangedText := True;
          myZip := TUnZipper.Create;
          myList := TStringList.Create;
          stFileOrig := TStringList.Create;
          myZip.OutputPath := GetNotexTempDir;
          myZip.FileName := odOpenDialog.Files[iFile];
          myZip.UnZipAllFiles;
          if FileExistsUTF8(GetNotexTempDir + 'word/document.xml') = True then
          begin
            stFileOrig.LoadFromFile(GetNotexTempDir + 'word/document.xml');
            stFileOrig.Text :=
              StringReplace(stFileOrig.Text, '</w:p>', LineEnding, [rfReplaceAll]);
            i := 0;
            while Pos('<w:footnoteReference w:id="', stFileOrig.Text) > 0 do
            begin
              Inc(i);
              stFileOrig.Text :=
                StringReplace(stFileOrig.Text, '<w:footnoteReference w:id="',
                '[^' + IntToStr(i) + ']<', []);
            end;
            i := 0;
            while Pos('<w:endnoteReference w:id="', stFileOrig.Text) > 0 do
            begin
              Inc(i);
              stFileOrig.Text :=
                StringReplace(stFileOrig.Text, '<w:endnoteReference w:id="',
                '[^endnote' + IntToStr(i) + ']<', []);
            end;
            dbText.Text := dbText.Text + CleanXML(stFileOrig.Text) + LineEnding;
          end;
          if FileExistsUTF8(GetNotexTempDir + 'word/footnotes.xml') = True then
          begin
            stFileOrig.LoadFromFile(GetNotexTempDir + 'word/footnotes.xml');
            stFileOrig.Text :=
              StringReplace(stFileOrig.Text, '</w:p>', LineEnding, [rfReplaceAll]);
            i := 0;
            while Pos('<w:footnoteRef/>', stFileOrig.Text) > 0 do
            begin
              Inc(i);
              stFileOrig.Text :=
                StringReplace(stFileOrig.Text, '<w:footnoteRef/>',
                '>[^' + IntToStr(i) + ']: ', []);
            end;
            dbText.Text := dbText.Text + CleanXML(stFileOrig.Text) + LineEnding;
          end;
          if FileExistsUTF8(GetNotexTempDir + 'word/endnotes.xml') = True then
          begin
            stFileOrig.LoadFromFile(GetNotexTempDir + 'word/endnotes.xml');
            stFileOrig.Text :=
              StringReplace(stFileOrig.Text, '</w:p>', LineEnding, [rfReplaceAll]);
            i := 0;
            while Pos('<w:endnoteRef/>', stFileOrig.Text) > 0 do
            begin
              Inc(i);
              stFileOrig.Text :=
                StringReplace(stFileOrig.Text, '<w:endnoteRef/>',
                '>[^endnote: ' + IntToStr(i) + ']: ', []);
            end;
            dbText.Text := dbText.Text + CleanXML(stFileOrig.Text) + LineEnding;
          end;
          if DirectoryExistsUTF8(GetNotexTempDir + 'word') = True then
          begin
            DeleteDirectory(GetNotexTempDir + 'word', True);
            RemoveDirUTF8(GetNotexTempDir + 'word');
          end;
          zqNotesTITLE.Value :=
            ExtractFileName(LazFileUtils.ExtractFileNameWithoutExt(odOpenDialog.Files[iFile]));
          zqNotes.Post;
          zqNotes.ApplyUpdates;
          zqAttachments.Append;
          zqAttachments.Edit;
          zqAttachmentsATTACHMENT.LoadFromFile(odOpenDialog.Files[iFile]);
          zqAttachmentsTITLE.Value :=
            StringReplace(ExtractFileName(odOpenDialog.Files[iFile]),
            #39, '', [rfReplaceAll]);
          zqAttachments.Post;
          zqAttachments.ApplyUpdates;
        finally
          myZip.Free;
          myList.Free;
          stFileOrig.Free;
        end;
      end;
    except
      zqAttachments.CancelUpdates;
      zqNotes.CancelUpdates;
      MessageDlg(msg042 + ' ' + odOpenDialog.Files[iFile] + '.',
        mtWarning, [mbOK], 0);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
  ListAndFormatTitle;
end;

procedure TfmMain.miNoteschangeSectionClick(Sender: TObject);
begin
  if zqNotes.RecordCount = 0 then
  begin
    Exit;
  end;
  pcPageControl.PageIndex := 0;
  fmInsertID.Caption := msg038;
  fmInsertID.lbIDKind.Caption := msg039;
  if blChangeIDSectionNote <> 1 then
  begin
    fmInsertID.edID.Clear;
    fmInsertID.lbTitle.Caption := '';
    blChangeIDSectionNote := 1;
  end;
  fmInsertID.iNoteSect := 1;
  if fmInsertID.ShowModal = mrOk then
  try
    zqNotes.Edit;
    zqNotesID_SECTIONS.Value := StrToInt(fmInsertID.edID.Text);
    zqNotes.Post;
    zqNotes.ApplyUpdates;
    blLoadNotes := True;
    zqNotesAfterScroll(nil);
  except
    zqNotes.CancelUpdates;
    MessageDlg(msg003, mtWarning, [mbOK], 0);
  end;
end;

procedure TfmMain.miNotesCopyIDClick(Sender: TObject);
begin
  Clipboard.AsText := zqNotesID.AsString;
end;

procedure TfmMain.miNotesSearchClick(Sender: TObject);
begin
  pcPageControl.PageIndex := 0;
  if ((miNotesFind.Checked = True) and
    (cbFields.ItemIndex = 1) and
    (edFind.Text <> '')) then
  begin
    fmSearch.edFind.Text := edFind.Text;
  end;
  fmSearch.Show;
end;

procedure TfmMain.miNotesFindClick(Sender: TObject);
begin
  pcPageControl.PageIndex := 0;
  miNotesFind.Checked := not miNotesFind.Checked;
  if miNotesFind.Checked = True then
  begin
    if miToolsShowEditor.Checked = True then
    begin
      miToolsShowEditorClick(nil);
      miNotesFind.Checked := True;
    end;
    pnBottom.Visible := True;
    spBottom.Visible := True;
    edFind.SetFocus;
  end
  else
  begin
    spBottom.Visible := False;
    pnBottom.Visible := False;
  end;
end;

procedure TfmMain.miToolsShowEditorClick(Sender: TObject);
begin
  pcPageControl.PageIndex := 0;
  miToolsShowEditor.Checked := not miToolsShowEditor.Checked;
  if miNotesFind.Checked = True then
  begin
    miNotesFindClick(nil);
  end;
  if miToolsShowEditor.Checked = True then
  begin
    pnLeft.Visible := False;
    pnRight.Visible := False;
    pnTitle.Visible := False;
    pcPageControl.ShowTabs := False;
    sgTitles.Width := 300;
    dbText.SetFocus;
  end
  else
  begin
    pnLeft.Visible := True;
    pnRight.Visible := True;
    pnTitle.Visible := True;
    pcPageControl.ShowTabs := True;
    sgTitles.Width := 200;
    dbText.SetFocus;
  end;
end;

procedure TfmMain.miToolsBackupClick(Sender: TObject);
begin
  if stBackupFile = '' then
  begin
    MessageDlg(msg049, mtWarning, [mbOK], 0);
    Exit;
  end;
  if MessageDlg(msg005 + ' (' + GetDbSize(zcConnection.Database) + ')?',
    mtConfirmation, [mbOK, mbCancel], 0) = mrOk then
    try
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;
      try
        if FileExistsUTF8(stBackupFile) then
        begin
          if FileExistsUTF8(stBackupFile + '.bak') = True then
          begin
            DeleteFileUTF8(stBackupFile + '.bak');
          end;
          CopyFile(stBackupFile, stBackupFile + '.bak', [cffOverwriteFile], False);
          DeleteFileUTF8(stBackupFile);
        end;
        if CopyFile(zcConnection.Database, stBackupFile, [cffOverwriteFile],
          False) = False then
        begin
          Screen.Cursor := crDefault;
          MessageDlg(msg006, mtWarning, [mbOK], 0);
        end
        else
        begin
          Screen.Cursor := crDefault;
          lbBackup.Visible := False;
          MessageDlg(msg007, mtInformation, [mbOK], 0);
          edPassword.SetFocus;
        end;
      except
        Screen.Cursor := crDefault;
        MessageDlg(msg008, mtWarning, [mbOK], 0);
      end;
    finally
      Screen.Cursor := crDefault;
    end;
end;

procedure TfmMain.miToolsRestoreClick(Sender: TObject);
  var myFormat: String;
begin
  if FileExistsUTF8(stBackupFile) = False then
  begin
    MessageDlg(msg009, mtWarning, [mbOK], 0);
    Abort;
  end
  else
  begin
    if dateformat = 'en' then
    begin
      myFormat := 'dddd mmmm dd yyyy';
    end
    else
    begin
      myFormat := 'dddd dd mmmm yyyy';
    end;
    if MessageDlg(msg010 + ' ' + formatDateTime(myFormat + ' "' +
      msg011 + '" hh.nn', FileDateToDateTime(FileAgeUTF8(stBackupFile))) +
      ' (' + GetDbSize(stBackupFile) + ')?',
      mtConfirmation, [mbOK, mbCancel], 0) = mrOk then
      try
        Screen.Cursor := crHourGlass;
        Application.ProcessMessages;
        try
          CopyFile(zcConnection.Database, zcConnection.Database + '.bak',
            [cffOverwriteFile], False);
          if CopyFile(stBackupFile, zcConnection.Database, [cffOverwriteFile],
            False) = False then
          begin
            Screen.Cursor := crDefault;
            MessageDlg(msg012, mtWarning, [mbOK], 0);
          end
          else
          begin
            Screen.Cursor := crDefault;
            lbBackup.Visible := False;
            MessageDlg(msg013, mtInformation, [mbOK], 0);
            edPassword.SetFocus;
          end;
        except
          Screen.Cursor := crDefault;
          MessageDlg(msg014, mtWarning, [mbOK], 0);
        end;
      finally
        Screen.Cursor := crDefault;
      end;
  end;
end;

procedure TfmMain.miToolsCompactClick(Sender: TObject);
  var
    myFileDate: TDateTime;
begin
  if fmPassword.ShowModal = mrOK then
  begin
    if ((fmPassword.edSudoPwd.Text <> '') and
      (fmPassword.edSysPwd.Text <> ''))then
    begin
      if FileExistsUTF8(zcConnection.Database + '.backup.fdb') = True then
      begin
        DeleteFileUTF8(zcConnection.Database + '.backup.fdb');
      end;
      CopyFile(zcConnection.Database, zcConnection.Database + '.bak',
        [cffOverwriteFile], False);
      myFileDate := FileDateToDateTime(FileAgeUTF8(zcConnection.Database));
      try
        Screen.Cursor := crHourGlass;
        Application.ProcessMessages;
        Unix.fpSystem('echo ' + fmPassword.edSudoPwd.Text  + ' | ' +
          'sudo -S -k ' + stGBackDir + ' -USER sysdba -PAS ' + fmPassword.edSysPwd.Text +
          ' ' + zcConnection.Database + ' ' + zcConnection.Database + '.backup.fdb');
        if FileExistsUTF8(zcConnection.Database + '.backup.fdb') = False then
        begin
          fmPassword.edSudoPwd.Text := '';
          fmPassword.edSysPwd.Text := '';
          MessageDlg(msg051, mtWarning, [mbOK], 0);
        end
        else
        begin
          Unix.fpSystem('echo ' + fmPassword.edSudoPwd.Text  + ' | ' +
            'sudo -S -k ' + stGBackDir + ' -USER sysdba -PAS ' + fmPassword.edSysPwd.Text +
            ' -rep ' + zcConnection.Database + '.backup.fdb ' + zcConnection.Database);
          fmPassword.edSudoPwd.Text := '';
          fmPassword.edSysPwd.Text := '';
          if myFileDate < FileDateToDateTime(
            FileAgeUTF8(zcConnection.Database)) then
          begin
            Screen.Cursor := crDefault;
            MessageDlg(msg050, mtWarning, [mbOK], 0);
          end
          else
          begin
            Screen.Cursor := crDefault;
            MessageDlg(msg051, mtWarning, [mbOK], 0);
          end;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end
    else
    begin
      fmPassword.edSudoPwd.Text := '';
      fmPassword.edSysPwd.Text := '';
    end;
  end;
end;

procedure TfmMain.miToolsFullScreenClick(Sender: TObject);
begin
  if fmMain.WindowState = wsFullScreen then
  begin
    fmMain.WindowState := wsNormal;
  end
  else
  begin
    fmMain.WindowState := wsFullScreen;
    // Due a bug...
    fmMain.WindowState := wsFullScreen;
  end
end;

procedure TfmMain.miToolsHideMarColClick(Sender: TObject);
begin
  miToolsHideMarCol.Checked := not miToolsHideMarCol.Checked;
  if miToolsHideMarCol.Checked = True then
  begin
    blHideMarCol := True;
    sgTitles.RowCount := 0;
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      setRichText(False);
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      setTextColor(ColorToNSColor(dbText.Font.Color));
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      setContinuousSpellCheckingEnabled(True);
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      setAutomaticQuoteSubstitutionEnabled(True);
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      setSmartInsertDeleteEnabled(True);
  end
  else
  begin
    blHideMarCol := False;
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      setRichText(False);
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      setContinuousSpellCheckingEnabled(True);
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      setAutomaticQuoteSubstitutionEnabled(True);
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      setSmartInsertDeleteEnabled(True);
    ListAndFormatTitle;
    FormatMarkers(2);
  end;
end;

procedure TfmMain.miToolsOptionsClick(Sender: TObject);
begin
  with fmOptions do
  begin
    cbStFonts.Text := dbText.Font.Name;
    edStSize.Text := IntToStr(dbText.Font.Size);
    edStSizeTitles.Text := IntToStr(sgTitles.Font.Size);
    ShowModal;
  end;
end;

procedure TfmMain.miFBManualClick(Sender: TObject);
begin
  OpenDocument(ExtractFilePath(Application.ExeName) + pdfmanual);
end;

procedure TfmMain.miFBCopyrightClick(Sender: TObject);
begin
  fmCopyright.ShowModal;
end;

procedure TfmMain.pmInsertTagClick(Sender: TObject);
begin
  if ((miNotesFind.Checked = True) and (zqTagsList.RecordCount > 0) and
    (zqNotes.RecordCount > 0)) then
  begin
    if zqTags.Locate('Tag', zqTagsListTAG.Value, []) = True then
    begin
      MessageDlg(msg054, mtWarning, [mbOK], 0);
    end
    else
    begin
      zqTags.Append;
      zqTags.Edit;
      zqTagsTAG.Value := zqTagsListTAG.Value;
      zqTags.Post;
      zqTags.ApplyUpdates;
    end;
  end;
end;

// *****************************************************
// ************** Data access procedures ***************
// *****************************************************

procedure TfmMain.StateChange(Sender: TObject);
begin
  if ((dsNotebooks.State in [dsInsert, dsEdit]) or
    (dsSections.State in [dsInsert, dsEdit]) or
    (dsNotes.State in [dsInsert, dsEdit]) or
    (dsAttachments.State in [dsInsert, dsEdit]) or
    (dsTags.State in [dsInsert, dsEdit]) or
    (dsLinks.State in [dsInsert, dsEdit]) or
    (dsTasks.State in [dsInsert, dsEdit])) then
  begin
    miFileSave.Enabled := True;
    miFileUndo.Enabled := True;
    shSave.Brush.Color := clRed;
  end
  else
  begin
    miFileSave.Enabled := False;
    miFileUndo.Enabled := False;
    shSave.Brush.Color := TColor($76CF76);
  end;
end;

// ******************** Notebooks ********************

procedure TfmMain.zqNotebooksAfterInsert(DataSet: TDataSet);
begin
  zqNotebooksID.Value := GenID('GEN_NOTEBOOKS_ID');
  zqNotebooksORD.Value := zqNotebooksID.Value;
  zqNotebooks.Post;
  zqNotebooks.ApplyUpdates;
  zqNotesAfterScroll(nil);
end;

procedure TfmMain.zqNotebooksAfterScroll(DataSet: TDataSet);
begin
  if zqNotes.Active = True then
  begin
    if blLoadNotes = True then
    begin
      zqNotesAfterScroll(nil);
    end;
  end;
end;

procedure TfmMain.zqNotebooksBeforeDelete(DataSet: TDataSet);
begin
  if zqNotebooks.RecordCount = 0 then
  begin
    Abort;
  end
  else
  if MessageDlg(msg015, mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
  begin
    Abort;
  end;
end;

procedure TfmMain.zqNotebooksAfterDelete(DataSet: TDataSet);
begin
  zqNotebooks.ApplyUpdates;
end;

// ******************** Sections ********************

procedure TfmMain.zqSectionsBeforeInsert(DataSet: TDataSet);
begin
  if zqNotebooks.RecordCount = 0 then
  begin
    MessageDlg(msg016, mtInformation, [mbOK], 0);
    Abort;
  end;
end;

procedure TfmMain.zqSectionsAfterInsert(DataSet: TDataSet);
begin
  zqSectionsID.Value := GenID('GEN_SECTIONS_ID');
  zqSectionsORD.Value := zqSectionsID.Value;
  zqSectionsID_NOTEBOOKS.AsInteger :=
    zqNotebooksID.AsInteger;
  zqSections.Post;
  zqSections.ApplyUpdates;
  zqNotesAfterScroll(nil);
end;

procedure TfmMain.zqSectionsAfterScroll(DataSet: TDataSet);
begin
  if zqNotes.Active = True then
  begin
    if blLoadNotes = True then
    begin
      zqNotesAfterScroll(nil);
    end;
  end;
end;

procedure TfmMain.zqSectionsBeforeDelete(DataSet: TDataSet);
begin
  if zqSections.RecordCount = 0 then
  begin
    Abort;
  end
  else
  if MessageDlg(msg017, mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
  begin
    Abort;
  end;
end;

procedure TfmMain.zqSectionsAfterDelete(DataSet: TDataSet);
begin
  zqSections.ApplyUpdates;
end;

// ******************** Notes ********************

procedure TfmMain.zqNotesBeforeInsert(DataSet: TDataSet);
begin
  if zqSections.RecordCount = 0 then
  begin
    MessageDlg(msg018, mtInformation, [mbOK], 0);
    Abort;
  end;
end;

procedure TfmMain.zqNotesBeforePost(DataSet: TDataSet);
begin
  if blChangedText = True then
  begin
    zqNotesTEXT.Value := dbText.Text;
    blChangedText := False;
  end;
  zqNotesMODIFICATION_DATE.Value := Now;
end;

procedure TfmMain.zqNotesAfterInsert(DataSet: TDataSet);
begin
  zqNotesID.Value := GenID('GEN_NOTES_ID');
  zqNotesORD.Value := zqNotesID.Value;
  zqNotesID_SECTIONS.Value :=
    zqSectionsID.Value;
  zqNotes.Post;
  zqNotes.ApplyUpdates;
end;

procedure TfmMain.zqNotesBeforeScroll(DataSet: TDataSet);
begin
  SetNotePos(zqNotesID.Value, dbText.SelStart);
end;

procedure TfmMain.zqNotesAfterScroll(DataSet: TDataSet);
begin
  blModNote := True;
  if zqNotes.RecordCount > 0 then
  begin
    dbText.Text := zqNotesTEXT.Value;
    SetLineParagraph;
    if UTF8Length(dbText.Text) > iSimpleTextFrom then
    begin
      if miToolsHideMarCol.Checked = False then
      begin
        miToolsHideMarColClick(nil);
      end;
    end
    else
    begin
      ListAndFormatTitle;
      FormatMarkers(2);
    end;
    dbText.SelStart := GoToNotePos(zqNotesID.Value);
  end
  else
  begin
    dbText.Text := '';
    sgTitles.Clear;
  end;
  UpdateInfo;
  blModNote := False;
end;

procedure TfmMain.zqNotesBeforeDelete(DataSet: TDataSet);
begin
  if zqNotes.RecordCount = 0 then
  begin
    Abort;
  end
  else
  if MessageDlg(msg019, mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
  begin
    Abort;
  end;
end;

procedure TfmMain.zqNotesAfterDelete(DataSet: TDataSet);
begin
  zqNotes.ApplyUpdates;
end;

procedure TfmMain.dsNotesDataChange(Sender: TObject; Field: TField);
begin
  UpdateInfo;
end;

procedure TfmMain.dsTasksDataChange(Sender: TObject; Field: TField);
begin
  tsTasks.Caption := sb003 + ' [' + IntToStr(zqTasks.RecordCount) + ']';
end;

// ********************** Attachments ************************//

procedure TfmMain.zqAttachmentsBeforeInsert(DataSet: TDataSet);
begin
  if zqNotes.RecordCount = 0 then
  begin
    MessageDlg(msg020, mtInformation, [mbOK], 0);
    Abort;
  end;
end;

procedure TfmMain.zqAttachmentsAfterInsert(DataSet: TDataSet);
begin
  zqAttachmentsID.Value := GenID('GEN_ATTACHMENTS_ID');
  zqAttachmentsORD.Value := zqAttachmentsID.Value;
  zqAttachmentsID_NOTES.Value :=
    zqNotesID.Value;
  zqAttachments.Post;
  zqAttachments.ApplyUpdates;
end;

procedure TfmMain.zqAttachmentsBeforeDelete(DataSet: TDataSet);
begin
  if zqAttachments.RecordCount = 0 then
  begin
    Abort;
  end
  else
  if MessageDlg(msg021, mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
  begin
    Abort;
  end;
end;

procedure TfmMain.zqAttachmentsAfterDelete(DataSet: TDataSet);
begin
  zqAttachments.ApplyUpdates;
end;

// ******************** Tags ********************

procedure TfmMain.zqTagsBeforeInsert(DataSet: TDataSet);
begin
  if zqNotes.RecordCount = 0 then
  begin
    MessageDlg(msg022, mtInformation, [mbOK], 0);
    Abort;
  end;
end;

procedure TfmMain.zqTagsAfterInsert(DataSet: TDataSet);
begin
  zqTagsID.Value := GenID('GEN_TAGS_ID');
  zqTagsID_NOTES.Value := zqNotesID.Value;
  zqTags.Post;
  zqTags.ApplyUpdates;
end;

procedure TfmMain.zqTagsBeforeDelete(DataSet: TDataSet);
begin
  if zqTags.RecordCount = 0 then
  begin
    Abort;
  end
  else
  if MessageDlg(msg023, mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
  begin
    Abort;
  end;
end;

procedure TfmMain.zqTagsAfterDelete(DataSet: TDataSet);
begin
  zqTags.ApplyUpdates;
end;

// ******************** Links ********************

procedure TfmMain.zqLinksBeforeInsert(DataSet: TDataSet);
begin
  if zqNotes.RecordCount = 0 then
  begin
    MessageDlg(msg024, mtInformation, [mbOK], 0);
    Abort;
  end;
end;

procedure TfmMain.zqLinksAfterInsert(DataSet: TDataSet);
begin
  zqLinksID.Value := GenID('GEN_LINKS_ID');
  zqLinksID_NOTES.Value := zqNotesID.Value;
  zqLinks.Post;
  zqLinks.ApplyUpdates;
end;

procedure TfmMain.zqLinksBeforeDelete(DataSet: TDataSet);
   var myDataset: TZQuery;
begin
  if zqLinks.RecordCount = 0 then
  begin
    Abort;
  end
  else
  if MessageDlg(msg025, mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
  begin
    Abort;
  end
  else
  try
    myDataset := TZQuery.Create(Self);
    myDataset.Connection := fmMain.zqNotebooks.Connection;
    myDataset.Sql.Add('Select Links.ID from Links');
    myDataset.Sql.Add('where Links.ID_Notes = ' + zqLinksLINK_NOTE.AsString);
    myDataset.Sql.Add('and Links.Link_Note = ' + zqNotesID.AsString);
    myDataSet.Open;
    if myDataset.RecordCount > 0 then
    begin
      myDataset.Delete;
      myDataset.ApplyUpdates;
    end;
    myDataset.Close;
  finally
    myDataset.Free;
  end;
end;

procedure TfmMain.zqLinksAfterDelete(DataSet: TDataSet);
begin
  zqLinks.ApplyUpdates;
end;

// ******************** Tasks ********************

procedure TfmMain.zqTasksBeforeInsert(DataSet: TDataSet);
begin
  if zqNotes.RecordCount = 0 then
  begin
    MessageDlg(msg026, mtInformation, [mbOK], 0);
    Abort;
  end;
end;

procedure TfmMain.zqTasksAfterInsert(DataSet: TDataSet);
begin
  zqTasksID.Value := GenID('GEN_TASKS_ID');
  zqTasksID_NOTES.Value := zqNotesID.Value;
  zqTasksDONE.Value := 0;
  zqTasksPRIORITY.Value := prior4;
  zqTasks.Post;
  zqTasks.ApplyUpdates;
end;

procedure TfmMain.zqTasksAfterPost(DataSet: TDataSet);
begin
  if ((zqTasksSTART_DATE.IsNull = False) and (zqTasksEND_DATE.IsNull = False) and
    (zqTasksSTART_DATE.Value > zqTasksEND_DATE.Value)) then
  begin
    zqTasks.Edit;
    zqTasksEND_DATE.Value := zqTasksSTART_DATE.Value;
    zqTasks.Post;
  end;
  zqTasks.Refresh;
end;

procedure TfmMain.zqTasksBeforeDelete(DataSet: TDataSet);
begin
  if zqTasks.RecordCount = 0 then
  begin
    Abort;
  end
  else
  if MessageDlg(msg027, mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
  begin
    Abort;
  end;
end;

procedure TfmMain.zqTasksAfterDelete(DataSet: TDataSet);
begin
  zqTasks.ApplyUpdates;
end;

procedure TfmMain.zqAllTasksAfterDelete(DataSet: TDataSet);
begin
  zqAllTasks.ApplyUpdates;
end;

procedure TfmMain.zqAllTasksBeforeDelete(DataSet: TDataSet);
begin
  if zqAllTasks.RecordCount = 0 then
  begin
    Abort;
  end
  else
  if MessageDlg(msg027, mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
  begin
    Abort;
  end;
end;

// *****************************************************
// ***************** Common procedures *****************
// *****************************************************

procedure TfmMain.Disconnect;
begin
  if zcConnection.Connected = True then
  begin
    iLastNotebook := zqNotebooksID.Value;
    iLastSection := zqSectionsID.Value;
    iLastNote := zqNotesID.Value;
    zcConnection.Disconnect;
  end;
  edPassword.Clear;
  miFileSave.Enabled := False;
  miFileUndo.Enabled := False;
  miFileRefresh.Enabled := False;
  miFileExport.Enabled := False;
  miFileImport.Enabled := False;
  miFileClose.Enabled := False;
  miEditCut.Enabled := False;
  miEditCopy.Enabled := False;
  miEditPaste.Enabled := False;
  miEditSelectAll.Enabled := False;
  miEditReformat.Enabled := False;
  miEditPreview.Enabled := False;
  miEditOpenCurrWord.Enabled := False;
  miEditOpenAllWord.Enabled := False;
  miEditOpenCurrWriter.Enabled := False;
  miEditOpenAllWriter.Enabled := False;
  miEditBookmarks.Enabled := False;
  miNotebooksNew.Enabled := False;
  miNotebooksDelete.Enabled := False;
  miNotebooksSortby.Enabled := False;
  miNotebooksSortbyCustom.Enabled := False;
  miNotebooksSortbyTitle.Enabled := False;
  miNotebooksMove.Enabled := False;
  miNotebooksMoveUp.Enabled := False;
  miNotebooksMoveDown.Enabled := False;
  miNotebooksComments.Enabled := False;
  miNotebooksCopyID.Enabled := False;
  miSectionsNew.Enabled := False;
  miSectionsDelete.Enabled := False;
  miSectionsSortby.Enabled := False;
  miSectionsSortbyCustom.Enabled := False;
  miSectionsSortbyTitle.Enabled := False;
  miSectionsMove.Enabled := False;
  miSectionsMoveUp.Enabled := False;
  miSectionsMoveDown.Enabled := False;
  miSectionsComments.Enabled := False;
  miSectionsChangeNotebook.Enabled := False;
  miSectionsCopyID.Enabled := False;
  miNotesNew.Enabled := False;
  miNotesDelete.Enabled := False;
  miNotesSortBy.Enabled := False;
  miNotesSortByCustom.Enabled := False;
  miNotesSortByTitle.Enabled := False;
  miNotesSortByModificationDate.Enabled := False;
  miNotesMove.Enabled := False;
  miNotesMoveUp.Enabled := False;
  miNotesMoveDown.Enabled := False;
  miNotesAttachments.Enabled := False;
  miNotesAttachmentsNew.Enabled := False;
  miNotesAttachmentsDelete.Enabled := False;
  miNotesAttachmentsOpen.Enabled := False;
  miNotesAttachmentsSaveAs.Enabled := False;
  miNotesTags.Enabled := False;
  miNotesTagsNew.Enabled := False;
  miNotesTagsDelete.Enabled := False;
  miNotesTagsRename.Enabled := False;
  miNotesLinks.Enabled := False;
  miNotesLinksNew.Enabled := False;
  miNotesLinksDelete.Enabled := False;
  miNotesLinksLocate.Enabled := False;
  miNotesTasks.Enabled := False;
  miNotesTasksNew.Enabled := False;
  miNotesTasksDelete.Enabled := False;
  miNotesTasksHide.Enabled := False;
  miNotesShowAllTasks.Enabled := False;
  miNotesImport.Enabled := False;
  miNoteschangeSection.Enabled := False;
  miNotesCopyID.Enabled := False;
  miNotesSearch.Enabled := False;
  miNotesFind.Enabled := False;
  miToolsShowEditor.Enabled := False;
  if UTF8LowerCase(zcConnection.HostName) = 'localhost' then
  begin
    miToolsBackup.Enabled := True;
    miToolsRestore.Enabled := True;
    miToolsCompact.Enabled := True;
    bnBackup.Enabled := True;
    bnRestore.Enabled := True;
  end
  else
  begin
    miToolsBackup.Enabled := False;
    miToolsRestore.Enabled := False;
    miToolsCompact.Enabled := False;
    bnBackup.Enabled := False;
    bnRestore.Enabled := False;
  end;
  fmMain.KeyPreview := False;
  shSave.Brush.Color := clForm;
  pnMain.Visible := False;
  if fmMain.WindowState = wsMaximized then
  begin
    pnlogin.Left := (Screen.Width - pnLogin.Width) div 2;
    pnLogin.Top := (Screen.Height - PnLogin.Height) div 2;
  end
  else
  begin
    pnlogin.Left := (fmMain.Width - pnLogin.Width) div 2;
    pnLogin.Top := (fmMain.Height - PnLogin.Height) div 2;
  end;
  pnLogin.Visible := True;
  lbInfo.Caption := '';
  lbSize.Caption := '';
  if ((FileExistsUTF8(stBackupFile) = True) and
    (FileDateToDateTime(FileAgeUTF8(stBackupFile)) >
    FileDateToDateTime(FileAgeUTF8(zcConnection.Database)) +
    1 / 24 / 60 * 2)) then
  begin
    lbBackup.Visible := True;
  end
  else
  begin
    lbBackup.Visible := False;
  end;
  if fmMain.Visible = True then
  begin
    fmMain.Refresh;
  end;
end;

procedure TfmMain.Connect;
begin
  zcConnection.User := edUserName.Text;
  zcConnection.Password := edPassword.Text;
  try
    zcConnection.Connect;
  except
    MessageDlg(msg028, mtWarning, [mbOK], 0);
    edPassword.Clear;
    edPassword.SetFocus;
    Abort;
  end;
  edPassword.Clear;
  pnMain.Visible := True;
  pnLogin.Visible := False;
  zqNotebooks.Open;
  zqSections.Open;
  zqNotes.Open;
  zqAttachments.Open;
  zqTags.Open;
  zqTagsList.Open;
  zqLinks.Open;
  zqTasks.Open;
  miFileSave.Enabled := False;
  miFileUndo.Enabled := False;
  miFileRefresh.Enabled := True;
  miFileExport.Enabled := True;
  miFileImport.Enabled := True;
  miFileClose.Enabled := True;
  miEditCut.Enabled := True;
  miEditCopy.Enabled := True;
  miEditPaste.Enabled := True;
  miEditSelectAll.Enabled := True;
  miEditReformat.Enabled := True;
  miEditPreview.Enabled := True;
  miEditOpenCurrWord.Enabled := True;
  miEditOpenAllWord.Enabled := True;
  miEditOpenCurrWriter.Enabled := True;
  miEditOpenAllWriter.Enabled := True;
  miEditBookmarks.Enabled := True;
  miNotebooksNew.Enabled := True;
  miNotebooksDelete.Enabled := True;
  miNotebooksSortby.Enabled := True;
  miNotebooksSortbyCustom.Enabled := True;
  miNotebooksSortbyTitle.Enabled := True;
  miNotebooksMove.Enabled := True;
  miNotebooksMoveUp.Enabled := True;
  miNotebooksMoveDown.Enabled := True;
  miNotebooksComments.Enabled := True;
  miNotebooksCopyID.Enabled := True;
  miSectionsNew.Enabled := True;
  miSectionsDelete.Enabled := True;
  miSectionsSortby.Enabled := True;
  miSectionsSortbyCustom.Enabled := True;
  miSectionsSortbyTitle.Enabled := True;
  miSectionsMove.Enabled := True;
  miSectionsMoveUp.Enabled := True;
  miSectionsMoveDown.Enabled := True;
  miSectionsComments.Enabled := True;
  miSectionsChangeNotebook.Enabled := True;
  miSectionsCopyID.Enabled := True;
  miNotesNew.Enabled := True;
  miNotesDelete.Enabled := True;
  miNotesSortBy.Enabled := True;
  miNotesSortByCustom.Enabled := True;
  miNotesSortByTitle.Enabled := True;
  miNotesSortByModificationDate.Enabled := True;
  miNotesMove.Enabled := True;
  miNotesMoveUp.Enabled := True;
  miNotesMoveDown.Enabled := True;
  miNotesAttachments.Enabled := True;
  miNotesAttachmentsNew.Enabled := True;
  miNotesAttachmentsDelete.Enabled := True;
  miNotesAttachmentsOpen.Enabled := True;
  miNotesAttachmentsSaveAs.Enabled := True;
  miNotesTags.Enabled := True;
  miNotesTagsNew.Enabled := True;
  miNotesTagsDelete.Enabled := True;
  miNotesTagsRename.Enabled := True;
  miNotesLinks.Enabled := True;
  miNotesLinksNew.Enabled := True;
  miNotesLinksDelete.Enabled := True;
  miNotesLinksLocate.Enabled := True;
  miNotesTasks.Enabled := True;
  miNotesTasksNew.Enabled := True;
  miNotesTasksDelete.Enabled := True;
  miNotesTasksHide.Enabled := True;
  miNotesShowAllTasks.Enabled := True;
  miNotesImport.Enabled := True;
  miNoteschangeSection.Enabled := True;
  miNotesCopyID.Enabled := True;
  miNotesSearch.Enabled := True;
  miNotesFind.Enabled := True;
  miToolsShowEditor.Enabled := True;
  miToolsBackup.Enabled := False;
  miToolsRestore.Enabled := False;
  miToolsCompact.Enabled := False;
  blLoadNotes := False;
  zqNotebooks.Locate('ID', iLastNotebook, []);
  zqSections.Locate('ID', iLastSection, []);
  zqNotes.Locate('ID', iLastNote, []);
  blLoadNotes := True;
  zqNotesAfterScroll(nil);
  pcPageControl.ActivePageIndex := 0;
  shSave.Brush.Color := TColor($76CF76);
  fmMain.KeyPreview := True;
  if FileExistsUTF8(zcConnection.Database) = True then
  begin
    lbSize.Caption := sb004 + ': ' + GetDbSize(zcConnection.Database) + '.';
  end;
  // Do not add dbText.SetFocus here because it adds
  // an empty line in the text of the note.
end;

procedure TfmMain.SaveAll;
begin
  try
    if dsNotebooks.State in [dsEdit, dsInsert] then
    begin
      zqNotebooks.Post;
    end;
    if zqNotebooks.UpdatesPending = True then
    begin
      zqNotebooks.ApplyUpdates;
    end;
    if dsSections.State in [dsEdit, dsInsert] then
    begin
      zqSections.Post;
    end;
    if zqSections.UpdatesPending = True then
    begin
      zqSections.ApplyUpdates;
    end;
    if dsNotes.State in [dsEdit, dsInsert] then
    begin
      zqNotes.Post;
    end;
    if zqNotes.UpdatesPending = True then
    begin
      zqNotes.ApplyUpdates;
    end;
    if dsAttachments.State in [dsEdit, dsInsert] then
    begin
      zqAttachments.Post;
    end;
    if zqAttachments.UpdatesPending = True then
    begin
      zqAttachments.ApplyUpdates;
    end;
    if dsTags.State in [dsEdit, dsInsert] then
    begin
      zqTags.Post;
    end;
    if zqTags.UpdatesPending = True then
    begin
      zqTags.ApplyUpdates;
    end;
    if dsLinks.State in [dsEdit, dsInsert] then
    begin
      zqLinks.Post;
    end;
    if zqLinks.UpdatesPending = True then
    begin
      zqLinks.ApplyUpdates;
    end;
    if dsTasks.State in [dsEdit, dsInsert] then
    begin
      zqTasks.Post;
    end;
    if zqTasks.UpdatesPending = True then
    begin
      zqTasks.ApplyUpdates;
    end;
    if FileExistsUTF8(zcConnection.Database) = True then
    begin
      lbSize.Caption := sb004 + ': ' + GetDbSize(zcConnection.Database) + '.';
    end;
  except
    MessageDlg(msg029, mtWarning, [mbOK], 0);
  end;
end;

procedure TfmMain.ResetChanges;
begin
  if MessageDlg(msg030, mtConfirmation, [mbOK, mbCancel], 0) = mrOk then
    try
      if dsNotebooks.State in [dsEdit, dsInsert] then
      begin
        zqNotebooks.CancelUpdates;
      end;
      if dsSections.State in [dsEdit, dsInsert] then
      begin
        zqSections.CancelUpdates;
      end;
      if dsNotes.State in [dsEdit, dsInsert] then
      begin
        zqNotes.CancelUpdates;
      end;
      if dsAttachments.State in [dsEdit, dsInsert] then
      begin
        zqAttachments.CancelUpdates;
      end;
      if dsTags.State in [dsEdit, dsInsert] then
      begin
        zqTags.CancelUpdates;
      end;
      if dsLinks.State in [dsEdit, dsInsert] then
      begin
        zqLinks.CancelUpdates;
      end;
      if dsTasks.State in [dsEdit, dsInsert] then
      begin
        zqTasks.CancelUpdates;
      end;
      zqNotesAfterScroll(nil);
    except
      MessageDlg(msg031, mtError, [mbOK], 0);
    end;
end;

procedure TfmMain.RefreshData;
begin
  try
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    try
      zqNotebooks.Refresh;
      zqSections.Refresh;
      zqNotes.Refresh;
      zqAttachments.Refresh;
      zqTags.Refresh;
      zqTagsList.Refresh;
      zqLinks.Refresh;
      zqTasks.Refresh;
      zqNotesAfterScroll(nil);
    except
      MessageDlg(msg032, mtWarning, [mbOK], 0);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfmMain.FindNotes;
var
  stDateIni, stDateEnd, stTags, stCapVal: string;
  dtDate: TDate;
  myDateFormat: TFormatSettings;
begin
  SaveAll;
  if edFind.Text <> '' then
  begin
    lbFound.Caption := msg041 + ' 0.';
    stCapVal := UTF8UpperString(UTF8Copy(edFind.Text, 1, 1)) +
      UTF8Copy(edFind.Text, 2, UTF8Length(edFind.Text));
    if cbFields.ItemIndex < 3 then
    begin
      zqFind.Close;
      zqFind.Sql.Clear;
      zqFind.SQL.Add('Select Notebooks.ID as IDNotebooks,');
      zqFind.SQL.Add('Sections.ID as IDSections,');
      zqFind.SQL.Add('Notes.ID as IDNotes,');
      zqFind.SQL.Add('Notebooks.Title as TitleNotebooks,');
      zqFind.SQL.Add('Sections.Title as TitleSections,');
      zqFind.SQL.Add('Notes.Title as TitleNotes');
      zqFind.SQL.Add('from Notebooks, Sections, Notes');
      zqFind.SQL.Add('where Notebooks.ID = Sections.ID_Notebooks');
      zqFind.SQL.Add('and Sections.ID = Notes.ID_Sections');
      if cbNotebooksOnly.Checked = True then
      begin
        zqFind.SQL.Add('and Notebooks.ID = ' + zqNotebooksID.AsString);
      end;
      if cbFields.ItemIndex = 0 then
      begin
        zqFind.SQL.Add('and ' + '((Notes.Title like ' + #39 +
          '%' + edFind.Text + '%' + #39 + ')' + ' or ' +
          '(Notes.Title like ' + #39 + '%' + stCapVal + '%' + #39 + '))');
      end
      else if cbFields.ItemIndex = 1 then
      begin
        zqFind.SQL.Add('and ' + '((Notes.Text like ' + #39 + '%' +
          edFind.Text + '%' + #39 + ')' + ' or ' + '(Notes.Text like ' +
          #39 + '%' + stCapVal + '%' + #39 + '))');
      end
      else if cbFields.ItemIndex = 2 then
      begin
        myDateFormat.ShortDateFormat := 'yyyy-mm-dd';
        if UpperCase(edFind.Text) = 'TODAY' then
        begin
          zqFind.SQL.Add('and Notes.Modification_Date >= ' + #39 +
            DateToStr(Date, myDateFormat) + #39);
        end
        else
        if UpperCase(edFind.Text) = 'YESTERDAY' then
        begin
          zqFind.SQL.Add('and Notes.Modification_Date >= ' + #39 +
            DateToStr(Date - 1, myDateFormat) + #39);
          zqFind.SQL.Add('and Notes.Modification_Date < ' + #39 +
            DateToStr(Date, myDateFormat) + #39);
        end
        else
        begin
          stDateIni := Copy(edFind.Text, 1, Pos(' - ', edFind.Text) - 1);
          if TryStrToDate(stDateIni, dtDate) = False then
          begin
            MessageDlg(msg033, mtWarning, [mbOK], 0);
            Abort;
          end;
          stDateIni := #39 + DateToStr(dtDate, myDateFormat) + #39;
          stDateEnd := Copy(edFind.Text, Pos(' - ', edFind.Text) +
            3, Length(edFind.Text));
          if TryStrToDate(stDateEnd, dtDate) = False then
          begin
            MessageDlg(msg034, mtWarning, [mbOK], 0);
            Abort;
          end;
          stDateEnd := #39 + DateToStr(dtDate, myDateFormat) + #39;
          zqFind.SQL.Add('and Notes.Modification_Date >= ' + stDateIni);
          zqFind.SQL.Add('and Notes.Modification_Date <= ' + stDateEnd);
        end;
      end;
      zqFind.SQL.Add('order by Notebooks.Ord, Sections.Ord, Notes.Ord');
      zqFind.Open;
    end
    else
    if cbFields.ItemIndex = 3 then
    begin
      stTags := #39 + edFind.Text + #39;
      stTags := StringReplace(stTags, '  ', ' ', [rfReplaceAll]);
      stTags := StringReplace(stTags, ', ', #39 + ', ' + #39, [rfReplaceAll]);
      zqFind.Close;
      zqFind.Sql.Clear;
      zqFind.SQL.Add('Select distinct Notebooks.ID as IDNotebooks,');
      zqFind.SQL.Add('Sections.ID as IDSections,');
      zqFind.SQL.Add('Notes.ID as IDNotes,');
      zqFind.SQL.Add('Notebooks.Title as TitleNotebooks,');
      zqFind.SQL.Add('Sections.Title as TitleSections,');
      zqFind.SQL.Add('Notes.Title as TitleNotes');
      zqFind.SQL.Add('from Notebooks, Sections, Notes, Tags');
      zqFind.SQL.Add('where Notebooks.ID = Sections.ID_Notebooks');
      zqFind.SQL.Add('and Sections.ID = Notes.ID_Sections');
      zqFind.SQL.Add('and Notes.ID = Tags.ID_Notes');
      if cbNotebooksOnly.Checked = True then
      begin
        zqFind.SQL.Add('and Notebooks.ID = ' + zqNotebooksID.AsString);
      end;
      zqFind.SQL.Add('and Tags.Tag in (' + stTags + ')');
      zqFind.SQL.Add('order by Notebooks.Ord, Sections.Ord, Notes.Ord');
      zqFind.Open;
    end
    else
    if cbFields.ItemIndex = 4 then
    begin
      zqFind.Close;
      zqFind.Sql.Clear;
      zqFind.SQL.Add('Select distinct Notebooks.ID as IDNotebooks,');
      zqFind.SQL.Add('Sections.ID as IDSections,');
      zqFind.SQL.Add('Notes.ID as IDNotes,');
      zqFind.SQL.Add('Notebooks.Title as TitleNotebooks,');
      zqFind.SQL.Add('Sections.Title as TitleSections,');
      zqFind.SQL.Add('Notes.Title as TitleNotes');
      zqFind.SQL.Add('from Notebooks, Sections, Notes, Attachments');
      zqFind.SQL.Add('where Notebooks.ID = Sections.ID_Notebooks');
      zqFind.SQL.Add('and Sections.ID = Notes.ID_Sections');
      zqFind.SQL.Add('and Notes.ID = Attachments.ID_Notes');
      if cbNotebooksOnly.Checked = True then
      begin
        zqFind.SQL.Add('and Notebooks.ID = ' + zqNotebooksID.AsString);
      end;
      zqFind.SQL.Add('and ' + '((Attachments.Title like ' + #39 + '%' +
        edFind.Text + '%' + #39 + ')' + ' or ' + '(Attachments.Title like ' +
        #39 + '%' + stCapVal + '%' + #39 + '))');
      zqFind.SQL.Add('order by Notebooks.Ord, Sections.Ord, Notes.Ord');
      zqFind.Open;
    end
    else
    if cbFields.ItemIndex = 5 then
    begin
      zqFind.Close;
      zqFind.Sql.Clear;
      zqFind.SQL.Add('Select distinct Notebooks.ID as IDNotebooks,');
      zqFind.SQL.Add('Sections.ID as IDSections,');
      zqFind.SQL.Add('Notes.ID as IDNotes,');
      zqFind.SQL.Add('Notebooks.Title as TitleNotebooks,');
      zqFind.SQL.Add('Sections.Title as TitleSections,');
      zqFind.SQL.Add('Notes.Title as TitleNotes');
      zqFind.SQL.Add('from Notebooks, Sections, Notes, Tasks');
      zqFind.SQL.Add('where Notebooks.ID = Sections.ID_Notebooks');
      zqFind.SQL.Add('and Sections.ID = Notes.ID_Sections');
      zqFind.SQL.Add('and Notes.ID = Tasks.ID_Notes');
      if cbNotebooksOnly.Checked = True then
      begin
        zqFind.SQL.Add('and Notebooks.ID = ' + zqNotebooksID.AsString);
      end;
      zqFind.SQL.Add('and ' + '((Tasks.Title like ' + #39 + '%' +
        edFind.Text + '%' + #39 + ')' + ' or ' + '(tasks.Title like ' +
        #39 + '%' + stCapVal + '%' + #39 + '))');
      zqFind.SQL.Add('order by Notebooks.Ord, Sections.Ord, Notes.Ord');
      zqFind.Open;
    end
    else
    if cbFields.ItemIndex = 6 then
    begin
      zqFind.Close;
      zqFind.Sql.Clear;
      zqFind.SQL.Add('Select distinct Notebooks.ID as IDNotebooks,');
      zqFind.SQL.Add('Sections.ID as IDSections,');
      zqFind.SQL.Add('Notes.ID as IDNotes,');
      zqFind.SQL.Add('Notebooks.Title as TitleNotebooks,');
      zqFind.SQL.Add('Sections.Title as TitleSections,');
      zqFind.SQL.Add('Notes.Title as TitleNotes');
      zqFind.SQL.Add('from Notebooks, Sections, Notes');
      zqFind.SQL.Add('left join Attachments on Attachments.ID_Notes = Notes.ID');
      zqFind.SQL.Add('left join Tags on Tags.ID_Notes = Notes.ID');
      zqFind.SQL.Add('left join Tasks on Tasks.ID_Notes = Notes.ID');
      zqFind.SQL.Add('where Notebooks.ID = Sections.ID_Notebooks');
      zqFind.SQL.Add('and Sections.ID = Notes.ID_Sections');
      if cbNotebooksOnly.Checked = True then
      begin
        zqFind.SQL.Add('and Notebooks.ID = ' + zqNotebooksID.AsString);
      end;
      zqFind.SQL.Add('and (' + edFind.Text + ')');
      zqFind.SQL.Add('order by Notebooks.Ord, Sections.Ord, Notes.Ord');
      try
        zqFind.Open;
      except
        MessageDlg(msg043, mtError, [mbOK], 0);
        Exit;
      end;
    end;
    lbFound.Caption := msg041 + ' ' + IntToStr(zqFind.RecordCount) + '.';
    if grFind.Visible = True then
    begin
      grFind.SetFocus;
    end;
  end
end;

function TfmMain.CopyAsHTML(smOutput:SmallInt; blAll: Boolean): string;
var
  myOrigText, myText, myFootnotes: TStringList;
  blNumList1, blNumList2, blBulList1, blBulList2, blQuote, blCode, blLink, blTable: boolean;
  i, n, iTemp, iTask, iLink: integer;
  stLine, stStartDate, stEndDate, stFootnote, stPicture,
  stLink, stTextLink: string;
begin
  if ((dbText.Text = '') and (blAll = False)) then
    Abort;
  myText := TStringList.Create;
  myOrigText := TStringList.Create;
  myFootnotes := TStringList.Create;
  blNumList1 := False;
  blNumList2 := False;
  blBulList1 := False;
  blBulList2 := False;
  blQuote := False;
  blCode := False;
  blTable := False;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  zqImpExpNotes.Open;
  zqImpExpNotes.Locate('ID', zqNotesID.Value, []);
  zqImpExpAttachments.Open;
  zqImpExpTasks.Open;
  // smOutput - 0: browser, 1: Writer, 2: Word
  try
    if blAll = True then
    begin
      zqImpExpNotes.First;
    end;
    while zqImpExpNotes.EOF = False do
    begin
      myOrigText.Text := zqImpExpNotesTEXT.Value;
      for i := 0 to myOrigText.Count - 1 do
      begin
        stLine := myOrigText[i];
        // Escape
        if UTF8copy(stLine, 1, 1) = '>' then
        begin
          stLine := #1 + UTF8copy(stLine, 2, UTF8Length(stLine));
        end;
        stLine := StringReplace(stLine, '&', '&amp;', [rfReplaceAll]);
        stLine := StringReplace(stLine, '<', '&lt;', [rfReplaceAll]);
        stLine := StringReplace(stLine, '>', '&gt;', [rfReplaceAll]);
        if UTF8copy(stLine, 1, 1) = #1 then
        begin
          stLine := '>' + UTF8copy(stLine, 2, UTF8Length(stLine));
        end;
        // Start lists
        if (((UTF8Copy(stLine, 1, 2) = '*'#9) or
          (UTF8Copy(stLine, 1, 2) = '-'#9) or
          (UTF8Copy(stLine, 1, 2) = '+'#9)) and
          (UTF8Copy(stLine, 3, 1) <> ' ')) then
        begin
          if blBulList1 = False then
          begin
            myText.Add('<ul>');
            blBulList1 := True;
          end;
        end
        else
        begin
          if blBulList1 = True then
          begin
            if ((TryStrToInt(UTF8Copy(stLine, 1,
              UTF8Pos('.'#9' ', stLine) - 1), iTemp) = False) and
              (UTF8Copy(stLine, 1, 3) <> '*'#9' ') and
              (UTF8Copy(stLine, 1, 3) <> '+'#9' ') and
              (UTF8Copy(stLine, 1, 3) <> '-'#9' ')) then
            begin
              myText.Add('</ul>');
              blBulList1 := False;
            end;
          end;
        end;
        if ((UTF8Copy(stLine, 1, 3) = '*'#9' ') or
          (UTF8Copy(stLine, 1, 3) = '-'#9' ') or
          (UTF8Copy(stLine, 1, 3) = '+'#9' ')) then
        begin
          if blBulList2 = False then
          begin
            myText.Add('<ul>');
            blBulList2 := True;
          end;
        end
        else
        begin
          if blBulList2 = True then
          begin
            myText.Add('</ul>');
            blBulList2 := False;
          end;
        end;
        if ((UTF8Length(stLine) > 0) and
          (TryStrToInt(UTF8Copy(stLine, 1, UTF8Pos('.'#9' ',
            stLine) - 1), iTemp))) then
        begin
          if blNumList2 = False then
          begin
            myText.Add('<ol>');
            blNumList2 := True;
          end;
        end
        else
        begin
          if blNumList2 = True then
          begin
            myText.Add('</ol>');
            blNumList2 := False;
          end;
          if ((UTF8Length(stLine) > 0) and
            (TryStrToInt(UTF8Copy(stLine, 1,
            UTF8Pos('.'#9, stLine) - 1), iTemp))) then
          begin
            if blNumList1 = False then
            begin
              myText.Add('<ol>');
              blNumList1 := True;
            end;
          end
          else
          begin
            if blNumList1 = True then
            begin
              if ((UTF8Copy(stLine, 1, 3) <> '*'#9' ') and
                (UTF8Copy(stLine, 1, 3) <> '-'#9' ') and
                (UTF8Copy(stLine, 1, 3) <> '+'#9' ') and
                (TryStrToInt(UTF8Copy(stLine, 1,
                UTF8Pos('.'#9' ', stLine) - 1), iTemp) = False)) then
              begin
                myText.Add('</ol>');
                blNumList1 := False;
              end;
            end;
          end;
        end;
        // Header
        if UTF8Copy(stLine, 1, 3) = '---' then
        begin
          myText.Add('<hr>');
        end
        else
        // Quote
        if UTF8Copy(stLine, 1, 2) = '> ' then
        begin
          if smOutput = 2 then
          begin;
            myText.Add('<p class=MsoQuote>');
          end;
          if blQuote = False then
          begin
            if smOutput < 2 then
            begin
              myText.Add('<blockquote>');
            end;
            blQuote := True;
          end;
        end
        else
        begin
          if blQuote = True then
          begin
            if smOutput < 2 then
            begin
              myText.Add('</blockquote>');
            end;
            blQuote := False;
          end;
        end;
        // Code
        if UTF8Copy(stLine, 1, 3) = '```' then
        begin
          if blCode = False then
          begin
            myText.Add('<code>');
            blCode := True;
          end
          else
          begin
            myText.Add('</code>');
            blCode := False;
          end;
        end;
        // Table
        if UTF8Copy(stLine, 1, 1) = '|' then
        begin
          if blTable = False then
          begin
            myText.Add('<table align="center" style="width:100%">');
            blTable := True;
          end;
        end
        else
        begin
          if blTable = True then
          begin
            myText.Add('</table>');
            blTable := False;
          end;
        end;
        // Headings
        if UTF8Copy(stLine, 1, 7) = '###### ' then
        begin
          stLine := UTF8Copy(stLine, 8, UTF8Length(stLine));
          myText.Add('<h6>' + stLine + '</h6>');
        end
        else if UTF8Copy(stLine, 1, 6) = '##### ' then
        begin
          stLine := UTF8Copy(stLine, 7, UTF8Length(stLine));
          myText.Add('<h5>' + stLine + '</h5>');
        end
        else if UTF8Copy(stLine, 1, 5) = '#### ' then
        begin
          stLine := UTF8Copy(stLine, 6, UTF8Length(stLine));
          myText.Add('<h4>' + stLine + '</h4>');
        end
        else if UTF8Copy(stLine, 1, 4) = '### ' then
        begin
          stLine := UTF8Copy(stLine, 5, UTF8Length(stLine));
          myText.Add('<h3>' + stLine + '</h3>');
        end
        else if UTF8Copy(stLine, 1, 3) = '## ' then
        begin
          stLine := UTF8Copy(stLine, 4, UTF8Length(stLine));
          myText.Add('<h2>' + stLine + '</h2>');
        end
        else if UTF8Copy(stLine, 1, 2) = '# ' then
        begin
          stLine := UTF8Copy(stLine, 3, UTF8Length(stLine));
          myText.Add('<h1>' + stLine + '</h1>');
        end
        // Lists quotes and code
        else if ((UTF8Copy(stLine, 1, 2) = '*'#9) or
          (UTF8Copy(stLine, 1, 2) = '-'#9) or
          (UTF8Copy(stLine, 1, 2) = '+'#9)) then
        begin
          stLine := UTF8Copy(stLine, 3, UTF8Length(stLine));
          myText.Add('<li>' + stLine + '</li>');
        end
        else if ((UTF8Length(stLine) > 0) and
          (TryStrToInt(UTF8Copy(stLine, 1, UTF8Pos('.', stLine) - 1), iTemp))) then
        begin
          stLine := UTF8Copy(stLine, UTF8Pos('.', stLine) + 2, UTF8Length(stLine));
          myText.Add('<li>' + stLine + '</li>');
        end
        else if UTF8Copy(stLine, 1, 2) = '> ' then
        begin
          stLine := UTF8Copy(stLine, 3, UTF8Length(stLine));
          myText.Add(stLine + '<p>');
        end
        // Tables
        else if ((UTF8Copy(stLine, 1, 4) = '|---') or
          (UTF8Copy(stLine, 1, 5) = '| ---')) then
        begin
          stLine := '<tr><td align="left" style="font-weight: normal;">&nbsp;</td>';
          myText.Add(stLine);
        end
        else if UTF8Copy(stLine, 1, 1) = '|' then
        begin
          stLine := '<tr><td align="left" style="font-weight: normal;"> ' +
            UTF8Copy(stLine, 2, UTF8Length(stLine));
          stLine := StringReplace(stLine, '|',
            ' </td><td align="left" style="font-weight: normal;">', [rfReplaceAll]) +
            ' </td></tr>';
          myText.Add(stLine);
        end
        // Last tags of the text of the footnotes
        else if ((UTF8Copy(stLine, 1, 2) = '[^') and
          (UTF8Pos(']: ', stLine) > 0) and (smOutput > 0)) then
        begin
          stLine := stLine + '</div>';
          myText.Add(stLine);
        end
        // Complete
        else if ((UTF8Copy(stLine, 1, 3) <> '```') and
          (UTF8Copy(stLine, 1, 3) <> '---')) then
        begin
          if smOutput < 2 then
          begin
            myText.Add('<p>' + stLine + '</p>');
          end
          else
          begin
            myText.Add('<p class=MsoNormal>' + stLine + '</p>');
          end;
        end;
        Application.ProcessMessages;
      end;
      if blBulList1 = True then
      begin
        myText.Add('</ul>');
      end;
      if blBulList2 = True then
      begin
        myText.Add('</ul>');
      end;
      if blNumList1 = True then
      begin
        myText.Add('</ol>');
      end;
      if blNumList2 = True then
      begin
        myText.Add('</ol>');
      end;
      if blQuote = True then
      begin
        myText.Add('</blockquote>');
      end;
      if blCode = True then
      begin
        myText.Add('</code>');
      end;
      if blTable = True then
      begin
        myText.Add('</table>');
      end;
      myText[0] := ' ' + myText[0];
      myText[myText.Count - 1] := myText[myText.Count - 1] + ' ';
      // Save the normal use of characters
      myText.Text := StringReplace(myText.Text, ' * ', ' ' + #1 + ' ', [rfReplaceAll]);
      myText.Text := StringReplace(myText.Text, ' / ', ' ' + #2 + ' ', [rfReplaceAll]);
      myText.Text := StringReplace(myText.Text, ' _ ', ' ' + #3 + ' ', [rfReplaceAll]);
      myText.Text := StringReplace(myText.Text, ' ~ ', ' ' + #4 + ' ', [rfReplaceAll]);
      myText.Text := StringReplace(myText.Text, ' ` ', ' ' + #5 + ' ', [rfReplaceAll]);
      myText.Text := StringReplace(myText.Text, '</', #6, [rfReplaceAll]);
      // Replace markers in links
      blCode := False;
      blLink := False;
      for n := 0 to myText.Count - 1 do
      begin
        stLine := myText[n];
        i := 0;
        while i < UTF8Length(stLine) do
        begin
          if UTF8Copy(stLine, i, 1) = '`' then
          begin
            if blCode = False then
            begin
              blCode := True;
            end
            else
            begin
              blCode := False;
            end;
          end
          else
          if UTF8Copy(stLine, i, 6) = '<code>' then
          begin
            blCode := True;
          end
          else
          if UTF8Copy(stLine, i, 6) = #6 + 'code>' then
          begin
            blCode := False;
          end
          else
          if UTF8Copy(stLine, i, 1) = '(' then
          begin
            if UTF8Copy(stLine, i - 1, 1) = ']' then
            begin
              blLink := True;
            end;
          end
          else
          if UTF8Copy(stLine, i, 1) = ')' then
          begin
            blLink := False;
          end
          else
          if UTF8Copy(stLine, i, 1) = '*' then
          begin
            if ((blCode = True) or (blLink = True)) then
            begin
              stLine := UTF8Copy(stLine, 1, i - 1) + #1 +
                UTF8Copy(stLine, i + 1, UTF8Length(stLine));
            end
            else
            if UTF8Pos('*', stLine, i + 1) > 0 then
            begin
              stLine := UTF8Copy(stLine, 1, i - 1) + '<b>' +
                UTF8Copy(stLine, i + 1, UTF8Length(stLine));
              stLine := UTF8Copy(stLine, 1, UTF8Pos('*', stLine, i + 1) - 1) +
                #6'b>' + UTF8Copy(stLine, UTF8Pos('*', stLine, i + 1) + 1,
                UTF8Length(stLine));
            end;
          end
          else
          if UTF8Copy(stLine, i, 1) = '/' then
          begin
            if ((blCode = True) or (blLink = True)) then
            begin
              stLine := UTF8Copy(stLine, 1, i - 1) + #2 +
                UTF8Copy(stLine, i + 1, UTF8Length(stLine));
            end
            else
            if UTF8Pos('/', stLine, i + 1) > 0 then
            begin
              stLine := UTF8Copy(stLine, 1, i - 1) + '<i>' +
                UTF8Copy(stLine, i + 1, UTF8Length(stLine));
              stLine := UTF8Copy(stLine, 1, UTF8Pos('/', stLine, i + 1) - 1) +
                #6'i>' + UTF8Copy(stLine, UTF8Pos('/', stLine, i + 1) + 1,
                UTF8Length(stLine));
            end;
          end
          else
          if UTF8Copy(stLine, i, 1) = '_' then
          begin
            if ((blCode = True) or (blLink = True)) then
            begin
              stLine := UTF8Copy(stLine, 1, i - 1) + #3 +
                UTF8Copy(stLine, i + 1, UTF8Length(stLine));
            end
            else
            if UTF8Pos('_', stLine, i + 1) > 0 then
            begin
              stLine := UTF8Copy(stLine, 1, i - 1) + '<u>' +
                UTF8Copy(stLine, i + 1, UTF8Length(stLine));
              stLine := UTF8Copy(stLine, 1, UTF8Pos('_', stLine, i + 1) - 1) +
                #6'u>' + UTF8Copy(stLine, UTF8Pos('_', stLine, i + 1) + 1,
                UTF8Length(stLine));
            end;
          end
          else
          if UTF8Copy(stLine, i, 1) = '~' then
          begin
            if ((blCode = True) or (blLink = True)) then
            begin
              stLine := UTF8Copy(stLine, 1, i - 1) + #4 +
                UTF8Copy(stLine, i + 1, UTF8Length(stLine));
            end
            else
            if UTF8Pos('~', stLine, i + 1) > 0 then
            begin
              stLine := UTF8Copy(stLine, 1, i - 1) + '<strike>' +
                UTF8Copy(stLine, i + 1, UTF8Length(stLine));
              stLine := UTF8Copy(stLine, 1, UTF8Pos('~', stLine, i + 1) - 1) +
                #6'strike>' + UTF8Copy(stLine, UTF8Pos('~', stLine, i + 1) + 1,
                UTF8Length(stLine));
            end;
          end;
          Inc(i);
        end;
        while UTF8Pos('::', stLine, 1) > 0 do
        begin
          if UTF8Pos('::', stLine,
            UTF8Pos('::', stLine, 1) + 2) > 0 then
          begin
            stLine := StringReplace(stLine, '::',
              '<span style="background-color:' + ColorToHtml(clYellow) + ';">', []);
            stLine := StringReplace(stLine, '::', '</span>', []);
          end
          else
          begin
            stLine := StringReplace(stLine, '::', '', []);
          end;
        end;
        myText[n] := stLine;
        Application.ProcessMessages;
      end;
      while UTF8Pos('`', myText.Text, 1) > 0 do
      begin
        if UTF8Pos('`', myText.Text,
          UTF8Pos('`', myText.Text, 1) + 1) > 0 then
        begin
          myText.Text := StringReplace(myText.Text, '`', '<code>', []);
          myText.Text := StringReplace(myText.Text, '`', '</code>', []);
        end
        else
        begin
          myText.Text := StringReplace(myText.Text, '`', '', []);
        end;
      end;
      // Save the normal use of characters
      myText.Text := StringReplace(myText.Text, #1, '*', [rfReplaceAll]);
      myText.Text := StringReplace(myText.Text, #2, '/', [rfReplaceAll]);
      myText.Text := StringReplace(myText.Text, #3, '_', [rfReplaceAll]);
      myText.Text := StringReplace(myText.Text, #4, '~', [rfReplaceAll]);
      myText.Text := StringReplace(myText.Text, #5, '`', [rfReplaceAll]);
      myText.Text := StringReplace(myText.Text, #6, '</', [rfReplaceAll]);
      myText.Text := StringReplace(myText.Text, #7, '/', [rfReplaceAll]);
      // Footnotes in the text
      while UTF8Pos('[^', myText.Text, 1) > 0 do
      begin
        stFootnote := UTF8Copy(myText.Text, UTF8Pos('[^', myText.Text, 1) +
          2, UTF8Pos(']', myText.Text, UTF8Pos('[^', myText.Text, 1)) -
          UTF8Pos('[^', myText.Text, 1) - 2);
        if ((UTF8Copy(myText.Text, UTF8Pos(']', myText.Text,
          UTF8Pos('[^', myText.Text, 1)) + 1, 1) = ':') and
          (myFootnotes.IndexOf(stFootnote) > -1)) then
        begin
          if smOutput = 0 then
          begin
            myText.Text := StringReplace(myText.Text, '[^' + stFootnote + ']: ',
              // Code for HTML standard
              '<sup id="fn' + stFootnote + '">' + stFootnote +
              '<a href="#ref' + stFootnote + '" title="Jump back to footnote.">' +
              '</a></sup> ', []);
          end
          else
          if smOutput = 1 then
          begin
            myText.Text := StringReplace(myText.Text, '[^' + stFootnote + ']: ',
              // Code for Writer
              '<div id="sdfootnote' + stFootnote + '"><p class="sdfootnote">' +
              '<a class="sdfootnotesym" name="sdfootnote' + stFootnote +
              'sym" ' + 'href="#sdfootnote' + stFootnote + 'anc">' +
              stFootnote + '</a>', []); // the </div> tag are already set
          end
          else
          if smOutput = 2 then
          begin
            myText.Text := StringReplace(myText.Text, '[^' + stFootnote + ']: ',
              // Code for Word
              '<div style=''mso-element:footnote'' id=ftn' + stFootnote + '> ' +
              '<p class=MsoFootnoteText><a style=''mso-footnote-id:ftn' +
              stFootnote + ''' href="#_ftnref' + stFootnote + '" name="_ftn' +
              stFootnote + '" title=""><span class=MsoFootnoteReference> ' +
              '<span style=''mso-special-character: footnote''></span></span></a> ',
              []) + '</p>'; // the </div> tag are already set
          end;
        end
        else
        begin
          if smOutput = 0 then
          begin
            myText.Text := StringReplace(myText.Text, '[^' + stFootnote + ']',
              // Code for HTML standard
              '<sup><a href="#fn' + stFootnote + '" id="ref' + stFootnote +
              '">' + stFootnote + '</a></sup>', []);
          end
          else
          if smOutput = 1 then
          begin
            myText.Text := StringReplace(myText.Text, '[^' + stFootnote + ']',
              // Code for Writer
              '<a class="sdfootnoteanc" name="sdfootnote' + stFootnote +
              'anc" href="#sdfootnote' + stFootnote + 'sym"><sup>' +
              stFootnote + '</sup></a>', []);
          end
          else
          if smOutput = 2 then
          begin
            myText.Text := StringReplace(myText.Text, '[^' + stFootnote + ']',
              // Code for Word
              '<a style=''mso-footnote-id:ftn' + stFootnote + ''' href="#_ftn' +
              stFootnote + '" name="_ftnref' + stFootnote + '" ' +
              'title=""><span class=MsoFootnoteReference><span ' +
              'style=''mso-special-character:footnote''></span></span></a>', []);
          end;
        end;
        myFootnotes.Add(stFootnote);
      end;
      // Pictures
      while UTF8Pos('![', myText.Text, 1) > 0 do
      begin
        stPicture := UTF8Lowercase(UTF8Copy(myText.Text,
          UTF8Pos('(', myText.Text, UTF8Pos('![', myText.Text, 1)) +
          1, UTF8Pos(')', myText.Text, UTF8Pos('![', myText.Text, 1)) -
          UTF8Pos('(', myText.Text, UTF8Pos('![', myText.Text, 1)) - 1));
        with zqImpExpAttachments do
        begin
          First;
          while not EOF do
          begin
            if UTF8LowerCase(zqImpExpAttachmentsTITLE.Value) = stPicture then
            begin
              zqImpExpAttachmentsATTACHMENT.SaveToFile(GetNotexTempDir +
                zqImpExpNotesID.AsString + stPicture);
            end;
            Next;
          end;
          myText.Text := StringReplace(myText.Text,
            UTF8Copy(myText.Text, UTF8Pos('![', myText.Text, 1),
            UTF8Pos(')', myText.Text, UTF8Pos('![', myText.Text, 1)) -
            UTF8Pos('![', myText.Text, 1) + 1), '<img src="' +
            zqImpExpNotesID.AsString + stPicture + '">', []);
        end;
      end;
      // Links
      iLink := 1;
      while UTF8Pos('[', myText.Text, iLink) > 0 do
      begin
        iLink := UTF8Pos('[', myText.Text, iLink) + 1;
        if UTF8Pos(']', myText.Text, iLink) > 0 then
        begin
          if UTF8Copy(myText.Text, UTF8Pos(']', myText.Text, iLink) +
            1, 1) = '(' then
          begin
            stLink := UTF8Copy(myText.Text, UTF8Pos(']', myText.Text, iLink) +
              2, UTF8Pos(')', myText.Text, iLink) - 1 -
              UTF8Pos(']', myText.Text, iLink) - 1);
            stTextLink := UTF8Copy(myText.Text, UTF8Pos('[',
              myText.Text, iLink - 1) + 1, UTF8Pos(']', myText.Text, iLink) -
              UTF8Pos('[', myText.Text, iLink - 1) - 1);
            myText.Text := StringReplace(myText.Text, '[' +
              stTextLink + '](' + stLink + ')', '<a href="' + stLink +
              '">' + stTextLink + '</a>', []);
          end;
        end;
      end;
      // Clear spaces
      myText[0] := UTF8Copy(myText[0], 2, UTF8Length(myText[0]));
      myText[myText.Count - 1] :=
        UTF8Copy(myText[myText.Count - 1], 1, UTF8Length(myText[myText.Count - 1]) - 1);
      // Tasks
      if zqImpExpTasks.RecordCount > 0 then
      begin
        myText.Add('<hr><center><h2>' + sb003 + '</h2></center>');
        myText.Add('<table align="center" style="width:100%"><tr>' +
          '<th>' +
          ts001 + '</th>' +
          '<th>' +
          ts002 + '</th>' +
          '<th>' +
          ts003 + '</th>' +
          '<th>' +
          ts004 + '</th>' +
          '<th>' +
          ts005 + '</th>' +
          '<th>' +
          ts006 + '</th></tr>');
        zqImpExpTasks.First;
        for iTask := 0 to zqImpExpTasks.RecordCount - 1 do
        begin
          if zqImpExpTasksSTART_DATE.IsNull = False then
          begin
            if dateformat = 'en' then
            begin
              stStartDate := FormatDateTime('dddd mmmm dd yyyy',
                zqImpExpTasksSTART_DATE.Value);
            end
            else
            begin
              stStartDate := FormatDateTime('dddd dd mmmm yyyy',
                zqImpExpTasksSTART_DATE.Value);
            end;
          end
          else
          begin
            stStartDate := '';
          end;
          if zqImpExpTasksEND_DATE.IsNull = False then
          begin
            if dateformat = 'en' then
            begin
              stStartDate := FormatDateTime('dddd mmmm dd yyyy',
                zqImpExpTasksEND_DATE.Value);
            end
            else
            begin
              stStartDate := FormatDateTime('dddd dd mmmm yyyy',
                zqImpExpTasksEND_DATE.Value);
            end;
          end
          else
          begin
            stEndDate := '';
          end;
          if zqImpExpTasksDONE.Value = 1 then
          begin
            myText.Add('<tr>' +
              '<td align="center">•</td>' +
              '<td>' +
              zqImpExpTasksTITLE.Value + '</td>' +
              '<td>' +
              stStartDate + '</td>' +
              '<td>' +
              stEndDate + '</td>' +
              '<td>' +
              zqImpExpTasksPRIORITY.AsString + '</td>' +
              '<td>' +
              zqImpExpTasksRESOURCES.AsString + '</td></tr>');
          end
          else
          begin
            myText.Add('<tr><th></th>' +
              '<td>' +
              zqImpExpTasksTITLE.Value + '</td>' +
              '<td>' +
              stStartDate + '</td>' +
              '<td>' +
              stEndDate + '</td>' +
              '<td>' +
              zqImpExpTasksPRIORITY.AsString + '</td>' +
              '<td>' +
              zqImpExpTasksRESOURCES.AsString + '</td></tr>');
          end;
          zqImpExpTasks.Next;
        end;
        myText.Add('</table>');
      end;
      if blAll = True then
      begin
        zqImpExpNotes.Next;
      end
      else
      begin
        Break;
      end;
    end;
    // Finalize
    if smOutput < 2 then
    begin
      myText.Insert(0, '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> ' +
        '<html><head><meta http-equiv="content-type" content="text/html; ' +
        'charset=UTF-8"><style type="text/css"> @page { margin-left: 2cm; ' +
        'margin-right: 2cm; margin-top: 2cm; margin-bottom: 2cm;}</style></head>' +
        '<style>h1 {text-align: center; font-size: 16pt; font-weight: bold; ' +
        'margin-top: 0cm; margin-bottom: 2cm;page-break-before:always} ' +
        'h2 {font-size: 14pt; font-weight: bold;} ' +
        'h3 {font-size: 14pt; font-weight: normal;font-style: italic;} ' +
        'h4 {font-size: 12pt;font-weight: normal} ' +
        'h5 {font-size: 12pt;font-weight: normal} ' +
        'h6 {font-size: 12pt;font-weight: normal} ' +
        'blockquote {font-size: 10pt;margin-left:1cm;margin-right:1cm;' +
          'margin-top: 0.5cm;margin-bottom: 0.5cm;font-weight: normal} ' +
        'th {text-align:left;font-size: 12pt;font-weight: ' +
          'bold;margin-top: 0cm;margin-bottom: 0cm;} ' +
        'td {font-size: 12pt;font-weight: normal;' +
          'margin-top: 0cm;margin-bottom: 0cm} ' +
        '</style><body>');
    end
    else
    begin
      myText.Insert(0, '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> ' +
        '<html><head><meta http-equiv="content-type" content="text/html; ' +
        'charset=UTF-8"><style>' +
        'h1{font-family:"Calibri",serif;font-weight:bold;font-size:16.0pt;' +
          'text-align:center;mso-margin-bottom-alt:2cm;page-break-before:always} ' +
        'h2{font-family:"Calibri",serif;font-weight:bold;font-size:14.0pt;' +
          'text-align:left} ' +
        'h3{font-family:"Calibri",serif;font-weight:italics;font-size:12.0pt;' +
          'text-align:left} ' +
        'h4{font-family:"Calibri",serif;font-weight:italics;font-size:12.0pt;' +
          'text-align:left} ' +
        'h5{font-family:"Calibri",serif;font-weight:normal;font-size:12.0pt;' +
          'text-align:left} ' +
        'h6{font-family:"Calibri",serif;font-weight:normal;font-size:12.0pt;' +
          'text-align:left} ' +
        'td{font-family:"Calibri",serif;font-weight:normal;font-size:12.0pt;' +
          'text-align:left} ' +
        'ul{font-family:"Calibri",serif;font-weight:normal;font-size:12.0pt;' +
          'text-align:left} ' +
        'ol{font-family:"Calibri",serif;font-weight:normal;font-size:12.0pt;' +
          'text-align:left} ' +
        'p.MsoNormal{mso-margin-top-alt:0;mso-margin-bottom-alt:0;' +
          'font-size:12.0pt;font-family:"Calibri",serif;} ' +
        'p.MsoFootnoteText{font-family:"Calibri",serif;font-size:10.0pt;' +
          'mso-margin-top-alt:0;mso-margin-bottom-alt:0;} ' +
        'span.MsoFootnoteReference{vertical-align:super;} ' +
        'p.MsoQuote{font-family:"Calibri",serif;margin-top:10.0pt;' +
          'margin-right:40.0pt;margin-bottom:10.0pt;margin-left:40.0pt;' +
          'font-size:10.0pt;} ' +
        '</style><body>');
    end;
    myText.Insert(myText.Count, '</body></html>');
    Result := myText.Text;
  finally
    Screen.Cursor := crDefault;
    myText.Free;
    myOrigText.Free;
    myFootnotes.Free;
    zqImpExpNotes.Close;
    zqImpExpAttachments.Close;
    zqImpExpTasks.Close;
  end;
end;

procedure TfmMain.ListAndFormatTitle;
var
  i, iPos: integer;
begin
  if blHideMarCol = True then
  begin
    Exit;
  end;
  if dbText.Text = '' then
  begin
    sgTitles.RowCount := 0;
  end
  else
  begin
    iPos := 0;
    sgTitles.RowCount := 0;
    for i := 0 to dbText.Lines.Count - 1 do
    begin
      if UTF8Copy(dbText.Lines[i], 1, 2) = '# ' then
      begin
        sgTitles.RowCount := sgTitles.RowCount + 1;
        sgTitles.Cells[0, sgTitles.RowCount - 1] :=
          UTF8Copy(dbText.Lines[i], 3, UTF8Length(dbText.Lines[i]));
      end
      else
      if UTF8Copy(dbText.Lines[i], 1, 3) = '## ' then
      begin
        sgTitles.RowCount := sgTitles.RowCount + 1;
        sgTitles.Cells[0, sgTitles.RowCount - 1] :=
          Space(3) + UTF8Copy(dbText.Lines[i], 4, UTF8Length(dbText.Lines[i]));
      end
      else
      if UTF8Copy(dbText.Lines[i], 1, 4) = '### ' then
      begin
        sgTitles.RowCount := sgTitles.RowCount + 1;
        sgTitles.Cells[0, sgTitles.RowCount - 1] :=
          Space(6) + UTF8Copy(dbText.Lines[i], 5, UTF8Length(dbText.Lines[i]));
      end
      else
      if UTF8Copy(dbText.Lines[i], 1, 5) = '#### ' then
      begin
        sgTitles.RowCount := sgTitles.RowCount + 1;
        sgTitles.Cells[0, sgTitles.RowCount - 1] :=
          Space(9) + UTF8Copy(dbText.Lines[i], 6, UTF8Length(dbText.Lines[i]));
      end
      else
      if UTF8Copy(dbText.Lines[i], 1, 6) = '##### ' then
      begin
        sgTitles.RowCount := sgTitles.RowCount + 1;
        sgTitles.Cells[0, sgTitles.RowCount - 1] :=
          Space(12) + UTF8Copy(dbText.Lines[i], 7, UTF8Length(dbText.Lines[i]));
      end
      else
      if UTF8Copy(dbText.Lines[i], 1, 7) = '###### ' then
      begin
        sgTitles.RowCount := sgTitles.RowCount + 1;
        sgTitles.Cells[0, sgTitles.RowCount - 1] :=
          Space(15) + UTF8Copy(dbText.Lines[i], 8, UTF8Length(dbText.Lines[i]));
      end;
      iPos := iPos + UTF8Length(dbText.Lines[i]) + UTF8Length(LineEnding);
    end;
  end;
end;

procedure TfmMain.SetLineParagraph;
  var
    iTab: integer;
    rng: NSRange;
    par: NSMutableParagraphStyle;
    tabs: NSMutableArray;
    tab: NSTextTab;
begin
  if dbText.Text = '' then
  begin
    Exit;
  end;
  par := GetWritePara(TCocoaTextView(NSScrollView(dbText.Handle).
    documentView).textStorage, 1);
  rng.location := 0;
  rng.length:= UTF8Length(dbText.Text) - 1;
  par.setParagraphSpacing(iParagraphSpacing);
  par.setLineSpacing(iLineSpacing);
  tabs := NSMutableArray.alloc.init;
  for iTab := 1 to 10 do
  begin
    if iTab = 3 then
    begin
      tab := NSTextTab.alloc.initWithType_location(NSLeftTabStopType,
        iTab * 50 - GetSpaceWidth);
    end
    else
    begin
      tab := NSTextTab.alloc.initWithType_location(NSLeftTabStopType, iTab * 50);
    end;
    tabs.addObject(tab);
    tab.release;
  end;
  par.setTabStops(tabs);
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    textStorage.addAttribute_value_range(NSParagraphStyleAttributeName,
    par, rng);
end;

procedure TfmMain.FormatMarkers(iAll: SmallInt);
var
  iPos, iPosLine, iPosCode, i, iTest: integer;
  blCode, blLineCode: boolean;
  stLine: String;
  rng: NSRange;
  par: NSMutableParagraphStyle;
begin
  if blHideMarCol = True then
  begin
    Exit;
  end;
  if dbText.Text = '' then
  begin
    Exit;
  end;
  blCode := False;
  iPos := 0;
  for i := 0 to dbText.Lines.Count - 1 do
  begin
    if iAll = 1 then
    begin
      // the last character is within the last line, but
      // dbText.CaretPos.y is one more line that dbText.Lines.Count - 1;
      if not ((i = dbText.Lines.Count - 1) and (dbText.CaretPos.y > i)) then
      begin
        if i <> dbText.CaretPos.Y then
        begin
          iPos := iPos + UTF8Length(dbText.Lines[i]) + UTF8Length(LineEnding);
          Continue;
        end;
      end;
    end;
    stLine := dbText.Lines[i];
    rng.location := iPos;
    if i < dbText.Lines.Count - 1 then
    begin
      rng.length := UTF8Length(stLine) + UTF8Length(LineEnding);
    end
    else
    begin
      rng.length := UTF8Length(stLine);
    end;
    if IsHeader(stLine) = True then
    begin
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        setTextColor_range(ColorToNSColor(clMarker), rng);
    end
    else
    begin
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        setTextColor_range(ColorToNSColor(dbText.Font.Color), rng);
    end;
    iPosLine := 1;
    while UTF8Pos('::', stLine, iPosLine) > 0 do
    begin
      iPosLine := UTF8Pos('::', stLine, iPosLine);
      if UTF8Pos('::', stLine, iPosLine + 2) > 0 then
      begin
        rng.location := iPos + iPosLine - 1;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
        rng.location := iPos + iPosLine;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
        rng.location := iPos + iPosLine + 1;
        rng.length := UTF8Pos('::', stLine, iPosLine + 2) - iPosLIne - 2;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clHighlight), rng);
        iPosLine := UTF8Pos('::', stLine, iPosLine + 2) + 2;
        rng.location := iPos + iPosLine - 3;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
        rng.location := iPos + iPosLine - 2;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
      end
      else
      begin
        iPosLine := iPosLine + 2;
      end;
    end;
    iPosLine := 1;
    while UTF8Pos('*', stLine, iPosLine) > 0 do
    begin
      iPosLine := UTF8Pos('*', stLine, iPosLine);
      if (not((UTF8Copy(stLine, iPosLine - 1, 1) = ' ') and
        (UTF8Copy(stLine, iPosLine + 1, 1) = ' ')) and
        (blCode = False)) then
      begin
        rng.location := iPos + iPosLine - 1;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
      end;
      Inc(iPosLine);
    end;
    iPosLine := 1;
    while UTF8Pos('/', stLine, iPosLine) > 0 do
    begin
      iPosLine := UTF8Pos('/', stLine, iPosLine);
      if (not((UTF8Copy(stLine, iPosLine - 1, 1) = ' ') and
        (UTF8Copy(stLine, iPosLine + 1, 1) = ' ')) and
        (blCode = False)) then
      begin
        rng.location := iPos + iPosLine - 1;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
      end;
      Inc(iPosLine);
    end;
    iPosLine := 1;
    while UTF8Pos('_', stLine, iPosLine) > 0 do
    begin
      iPosLine := UTF8Pos('_', stLine, iPosLine);
      if (not((UTF8Copy(stLine, iPosLine - 1, 1) = ' ') and
        (UTF8Copy(stLine, iPosLine + 1, 1) = ' ')) and
        (blCode = False)) then
      begin
        rng.location := iPos + iPosLine - 1;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
      end;
      Inc(iPosLine);
    end;
    iPosLine := 1;
    while UTF8Pos('~', stLine, iPosLine) > 0 do
    begin
      iPosLine := UTF8Pos('~', stLine, iPosLine);
      if (not((UTF8Copy(stLine, iPosLine - 1, 1) = ' ') and
        (UTF8Copy(stLine, iPosLine + 1, 1) = ' ')) and
        (blCode = False)) then
      begin
        rng.location := iPos + iPosLine - 1;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
      end;
      Inc(iPosLine);
    end;
    iPosLine := 1;
    while UTF8Pos('|', stLine, iPosLine) > 0 do
    begin
      iPosLine := UTF8Pos('|', stLine, iPosLine);
      if blCode = False then
      begin
        rng.location := iPos + iPosLine - 1;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
      end;
      Inc(iPosLine);
    end;
    iPosLine := 1;
    if UTF8Copy(stLine, 1, 3) = '```' then
    begin
      rng.location := iPos + iPosLine - 1;
      rng.length := 1;
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        setTextColor_range(ColorToNSColor(clMarker), rng);
      rng.location := iPos + iPosLine;
      rng.length := 1;
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        setTextColor_range(ColorToNSColor(clMarker), rng);
      rng.location := iPos + iPosLine + 1;
      rng.length := 1;
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        setTextColor_range(ColorToNSColor(clMarker), rng);
      if blCode = True then
      begin
        blCode := False;
      end
      else
      begin
        blCode := True;
      end;
    end
    else
    begin
      blLineCode := False;
      while UTF8Pos('`', stLine, iPosLine) > 0 do
      begin
        iPosLine := UTF8Pos('`', stLine, iPosLine);
        rng.location := iPos + iPosLine - 1;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
        if blLineCode = False then
        begin
          iPosCode := iPosLine;
          blLineCode := True;
        end
        else
        begin
          rng.location := iPos + iPosCode;
          rng.length := iPosLine - iPosCode - 1;
          TCocoaTextView(NSScrollView(dbText.Handle).documentView).
            setTextColor_range(ColorToNSColor(dbText.Font.Color), rng);
          blLineCode := False;
        end;
        Inc(iPosLine);
      end;
    end;
    iPosLine := 1;
    while UTF8Pos('!', stLine, iPosLine) > 0 do
    begin
      iPosLine := UTF8Pos('!', stLine, iPosLine);
      if ((UTF8Copy(stLine, iPosLine + 1, 1) = '[')) then
      begin
        rng.location := iPos + iPosLine - 1;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
      end;
      Inc(iPosLine);
    end;
    iPosLine := 1;
    while UTF8Pos('[', stLine, iPosLine) > 0 do
    begin
      iPosLine := UTF8Pos('[', stLine, iPosLine);
      if ((UTF8Copy(stLine, iPosLine + 1, 1) = '^') or
        (UTF8Copy(stLine, UTF8Pos(']', stLine, iPosLine) + 1, 1) = '(')) then
      begin
        rng.location := iPos + iPosLine - 1;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
        if UTF8Pos(']', stLine, iPosLine) > 0 then
        begin
          rng.location := iPos + UTF8Pos(']', stLine, iPosLine) - 1;
          rng.length := 1;
          TCocoaTextView(NSScrollView(dbText.Handle).documentView).
            setTextColor_range(ColorToNSColor(clMarker), rng);
        end;
      end;
      Inc(iPosLine);
    end;
    iPosLine := 1;
    while UTF8Pos('(', stLine, iPosLine) > 0 do
    begin
      iPosLine := UTF8Pos('(', stLine, iPosLine);
      if UTF8Copy(stLine, iPosLine - 1, 1) =']' then
      begin
        rng.location := iPos + iPosLine - 1;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
        if UTF8Pos(')', stLine, iPosLine) > 0 then
        begin
          rng.location := iPos + iPosLine;
          rng.length := UTF8Pos(')', stLine, iPosLine) - iPosLine;
          TCocoaTextView(NSScrollView(dbText.Handle).documentView).
            setTextColor_range(ColorToNSColor(dbText.Font.Color), rng);
          rng.location := iPos + UTF8Pos(')', stLine, iPosLine) - 1;
          rng.length := 1;
          TCocoaTextView(NSScrollView(dbText.Handle).documentView).
            setTextColor_range(ColorToNSColor(clMarker), rng);
        end;
      end;
      Inc(iPosLine);
    end;
    iPosLine := 1;
    while UTF8Pos('^', stLine, iPosLine) > 0 do
    begin
      iPosLine := UTF8Pos('^', stLine, iPosLine);
      if UTF8Copy(stLine, iPosLine - 1, 1) = '[' then
      begin
        rng.location := iPos + iPosLine - 1;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
      end;
      Inc(iPosLine);
    end;
    iPosLine := 1;
    while UTF8Pos(':', stLine, iPosLine) > 0 do
    begin
      iPosLine := UTF8Pos(':', stLine, iPosLine);
      if ((UTF8Copy(stLine, iPosLine - 1, 1) = ']') and
        (UTF8copy(stLine, 1, 2) = '[^')) then
      begin
        rng.location := iPos + iPosLine - 1;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
      end;
      Inc(iPosLine);
    end;
    iPosLine := 1;
    if UTF8Pos('.', stLine, iPosLine) > 0 then
    begin
      iPosLine := UTF8Pos('.', stLine);
      if ((TryStrToInt(UTF8Copy(stLine, 1, iPosLine - 1), iTest) = True) and
        (UTF8copy(stLine, 1, 1) <> ' ') and
        (UTF8Copy(stLine, iPosLine + 1, 1) = #9) and
        (UTF8Copy(stLine, iPosLine - 1, 1) <> ' ')) then
      begin
        rng.location := iPos;
        rng.length := iPosLine;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
      end;
    end;
    iPosLine := 1;
    while UTF8Pos('>', stLine, iPosLine) > 0 do
    begin
      if ((iPosLine = 1) and (UTF8Copy(stLine, 2, 1) = ' ')) then
      begin
        rng.location := iPos + iPosLine - 1;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
      end;
      Inc(iPosLine);
    end;
    iPosLine := 1;
    while UTF8Pos('+', stLine, iPosLine) > 0 do
    begin
      iPosLine := UTF8Pos('+', stLine, iPosLine);
      if ((iPosLine = 1) and (UTF8Copy(stLine, 2, 1) = #9)) then
      begin
        rng.location := iPos + iPosLine - 1;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
      end;
      Inc(iPosLine);
    end;
    iPosLine := 1;
    while UTF8Pos('-', stLine, iPosLine) > 0 do
    begin
      iPosLine := UTF8Pos('-', stLine, iPosLine);
      if ((iPosLine = 1) and (UTF8Copy(stLine, 2, 1) = #9)) then
      begin
        rng.location := iPos + iPosLine - 1;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
      end;
      Inc(iPosLine);
    end;
    iPosLine := 1;
    if UTF8Pos('---', stLine, iPosLine) = 1 then
    begin
      begin
        rng.location := iPos + iPosLine - 1;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
        rng.location := iPos + iPosLine;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
        rng.location := iPos + iPosLine + 1;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clMarker), rng);
      end;
    end;
    par := GetWritePara(TCocoaTextView(NSScrollView(dbText.Handle).
      documentView).textStorage, 1);
    if ((UTF8Copy(stLine, 1, 3) = '*'#9' ') or
      (UTF8Copy(stLine, 1, 3) = '+'#9' ') or
      (UTF8Copy(stLine, 1, 3) = '-'#9' ') or
      (UTF8Copy(stLine, 2, 3) = '.'#9' ') or
      (UTF8Copy(stLine, 3, 3) = '.'#9' ')) then
    begin
      par.setFirstLineHeadIndent(100);
      par.setHeadIndent(150);
    end
    else
    if ((UTF8Copy(stLine, 1, 2) = '*'#9) or
      (UTF8Copy(stLine, 1, 2) = '+'#9) or
      (UTF8Copy(stLine, 1, 2) = '-'#9) or
      (UTF8Copy(stLine, 2, 2) = '.'#9) or
      (UTF8Copy(stLine, 3, 2) = '.'#9)) then
    begin
      par.setFirstLineHeadIndent(50);
      par.setHeadIndent(100);
    end
    else
    begin
      par.setFirstLineHeadIndent(0);
      par.setHeadIndent(0);
    end;
    rng.location := iPos;
    rng.length:= UTF8Length(dbText.Lines[i]);
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      textStorage.addAttribute_value_range(NSParagraphStyleAttributeName,
      par, rng);
    iPos := iPos + UTF8Length(dbText.Lines[i]) + UTF8Length(LineEnding);
  end;
end;

procedure TfmMain.SelectTitle;
var
  i, iCharCount, iTitleCount: integer;
begin
  if ((sgTitles.RowCount = 0) or (dbText.Text = '')) then
    Abort;
  iCharCount := 0;
  iTitlecount := 0;
  for i := 0 to dbText.Lines.Count - 1 do
  begin
    if UTF8Copy(dbText.Lines[i], 1, 1) = '#' then
    begin
      Inc(iTitleCount);
    end;
    if iTitleCount = sgTitles.Row + 1 then
    begin
      Break;
    end;
    iCharCount := iCharCount + UTF8Length(dbText.Lines[i]) + UTF8Length(LineEnding);
  end;
  dbText.SelStart := iCharCount;
  dbText.SelLength := UTF8Length(dbText.Lines[dbText.CaretPos.Y]);
  pcPageControl.ActivePageIndex := 0;
  begin
    dbText.SetFocus;
  end;
end;

procedure TfmMain.RenumberList;
  var i, iTest, iNum1, iNum2: integer;
    blIsList1, blIsList2: boolean;
begin
  blIsList1 := False;
  blIsList2 := False;
  iNum1 := 1;
  iNum2 := 1;
  for i := 0 to dbText.Lines.Count - 1 do
  begin
    if TryStrToInt(UTF8Copy(dbText.Lines[i], 1,
      UTF8Pos('.'#9' ', dbText.Lines[i]) - 1), iTest) = True then
    begin
      if blIsList2 = False then
      begin
        iNum2 := 1;
        blIsList2 := True;
      end;
      dbText.Lines[i] := IntToStr(iNum2) +
        (UTF8Copy(dbText.Lines[i], UTF8Pos('.', dbText.Lines[i]),
        UTF8Length(dbText.Lines[i])));
      Inc(iNum2);
    end
    else
    begin
      blIsList2 := False;
      if TryStrToInt(UTF8Copy(dbText.Lines[i], 1,
        UTF8Pos('.'#9, dbText.Lines[i]) - 1), iTest) = True then
      begin
        if blIsList1 = False then
        begin
          iNum1 := 1;
          blIsList1 := True;
        end;
        dbText.Lines[i] := IntToStr(iNum1) +
          (UTF8Copy(dbText.Lines[i], UTF8Pos('.', dbText.Lines[i]),
          UTF8Length(dbText.Lines[i])));
        Inc(iNum1);
      end
      else
      begin
        if ((UTF8Copy(dbText.Lines[i], 1, 3) <> '*'#9' ') and
          (UTF8Copy(dbText.Lines[i], 1, 3) <> '+'#9' ') and
          (UTF8Copy(dbText.Lines[i], 1, 3) <> '-'#9' ')) then
        begin
          blIsList1 := False;
        end;
      end;
    end;
  end;
end;

procedure TfmMain.RenumberFootnotes;
  var iPos, iOld, iNew: integer;
    stOld: String;
begin
  iPos := 1;
  while UTF8Pos('[^', dbText.Text, iPos) > 0 do
  begin
    iPos := UTF8Pos('[^', dbText.Text, iPos) + 2;
    stOld := UTF8Copy(dbText.Text, iPos,
      UTF8Pos(']', dbText.Text, iPos) - iPos);
    if TryStrToInt(stOld, iOld) = True then
    begin
      dbText.Text := StringReplace(dbText.Text, '[^' + IntToStr(iOld) + ']',
        '[^' + IntToStr(iOld + 10000) + ']', []);
      dbText.Text := StringReplace(dbText.Text, LineEnding +
        '[^' + IntToStr(iOld) + ']:',
        LineEnding + '[^' + IntToStr(iOld + 10000) + ']:', []);
    end;
  end;
  iNew := 1;
  iPos := 1;
  while UTF8Pos('[^', dbText.Text, iPos) > 0 do
  begin
    iPos := UTF8Pos('[^', dbText.Text, iPos) + 2;
    if UTF8Copy(dbText.Text, iPos - 2 - UTF8Length(LineEnding),
      UTF8Length(LineEnding)) = LineEnding then
    begin
      Break;
    end;
    stOld := UTF8Copy(dbText.Text, iPos,
      UTF8Pos(']', dbText.Text, iPos) - iPos);
    if TryStrToInt(stOld, iOld) = True then
    begin
      dbText.Text := StringReplace(dbText.Text, '[^' + IntToStr(iOld) + ']',
        '[^' + IntToStr(iNew) + ']', []);
      dbText.Text := StringReplace(dbText.Text, LineEnding +
        '[^' + IntToStr(iOld) + ']:',
        LineEnding + '[^' + IntToStr(iNew) + ']:', []);
      Inc(iNew);
    end;
  end;
end;

procedure TfmMain.SelectInsertFootnote;
  var i, iPos, iOld, iNew, iStart, iEnd: integer;
    stLine, stOld: String;
begin
  if zqNotes.RecordCount = 0 then
  begin
    Exit;
  end
  else
  if dbText.SelStart = UTF8Length(dbText.Text) then
  begin
    dbText.SelStart := dbText.SelStart - 1;
  end
  else
  if dbText.SelStart = 0 then
  begin
    dbText.SelStart := 1;
  end;
  if UTF8Copy(dbText.Lines[dbText.CaretPos.y], 1, 2) = '[^' then
  begin
    iPos := UTF8Pos(']', dbText.Lines[dbText.CaretPos.y]);
    dbText.SelStart := UTF8Pos(UTF8Copy(dbText.Lines[dbText.CaretPos.y], 1, iPos),
      dbText.Text) + iPos - 1;
  end
  else
  begin
    iStart := dbText.SelStart;
    while iStart > 0 do
    begin
      if UTF8Copy(dbText.Text, iStart, 2) = '[^' then
      begin
        Break;
      end;
      Dec(iStart);
    end;
    iEnd := dbText.SelStart;
    while iEnd < UTF8Length(dbText.Text) do
    begin
      if UTF8Copy(dbText.Text, iEnd, 1) = ']' then
      begin
        Break;
      end;
      Inc(iEnd);
    end;
    if TryStrToInt(UTF8Copy(dbText.Text, iStart + 2,
      iEnd -iStart - 2), iNew) = True then
    begin
      if UTF8Pos('[^' + IntToStr(iNew) + ']:',
        dbText.Text, iEnd) > 0 then
      begin
        dbText.SelStart := UTF8Pos('[^' + IntToStr(iNew) + ']:',
          dbText.Text, iEnd) + UTF8Length(IntToStr(iNew)) + 4;
      end;
    end
    else
    try
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;
      iNew := 0;
      for i := 0 to dbText.Lines.Count - 1 do
      begin
        iPos := 2;
        stLine := dbText.Lines[i];
        while UTF8Pos('[^', stLine, iPos) > 0 do
        begin
          iPos := UTF8Pos('[^', stLine, iPos) + 2;
          stOld := UTF8Copy(stLine, iPos,
            UTF8Pos(']', stLine, iPos) - iPos);
          if TryStrToInt(stOld, iOld) = True then
          begin
            if iNew < iOld then
            begin
              iNew := iOld;
            end;
          end;
        end;
      end;
      InsText('[^' + IntToStr(iNew + 1) + ']');
      dbText.SelStart := UTF8Length(dbText.Text);
      InsText(LineEnding + '[^' + IntToStr(iNew + 1) + ']: ');
      FormatMarkers(2);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfmMain.SetLists;
  var i, iStart, iEnd, iNum1, iNum2, iPos: integer;
    stHeader: String;
    blInd: boolean;
begin
  iPos := dbText.SelStart - dbText.CaretPos.x;
  iStart := dbText.CaretPos.y;
  while iStart > 0 do
  begin
    Dec(iStart);
    if ((UTF8Length(dbText.Lines[iStart]) = 0) or
      (UTF8Copy(dbText.Lines[iStart], 1, 1) = '#')) then
    begin
      Inc(iStart);
      Break;
    end;
    iPos := iPos - UTF8Length(dbText.Lines[iStart] + LineEnding);
  end;
  iEnd := dbText.CaretPos.y;
  while iEnd < dbText.Lines.Count - 1 do
  begin
    Inc(iEnd);
    if ((UTF8Length(dbText.Lines[iEnd]) = 0) or
      (UTF8Copy(dbText.Lines[iEnd], 1, 1) = '#')) then
    begin
      Dec(iEnd);
      Break;
    end;
  end;
  stHeader := UTF8Copy(dbText.Lines[iStart], 1, 1);
  if stHeader = '*' then
  begin
    stHeader := '+';
  end
  else
  if stHeader = '+' then
  begin
    stHeader := '-';
  end
  else
  if stHeader = '-' then
  begin
    stHeader := '1';
  end
  else
  if stHeader = '1' then
  begin
    stHeader := '';
  end
  else
  begin
    stHeader := '*';
  end;
  if stHeader = '1' then
  begin
    iNum1 := 1;
    iNum2 := 1;
    for i := iStart to iEnd do
    begin
      if ((UTF8Copy(dbText.Lines[i], 1, 3) = '*'#9' ') or
        (UTF8Copy(dbText.Lines[i], 1, 3) = '+'#9' ') or
        (UTF8Copy(dbText.Lines[i], 1, 3) = '-'#9' ')) then
      begin
        blInd := True;
        dbText.Lines[i] := IntToStr(iNum2) + '.' + #9 +
          UTF8Copy(dbText.Lines[i], 3, UTF8Length(dbText.Lines[i]));
        Inc(iNum2);
        iPos := iPos + UTF8Length(IntToStr(iNum2)) + 2;
      end
      else
      begin
        if blInd = True then
        begin
          blInd := False;
          iNum2 := 1;
        end;
        if ((UTF8Copy(dbText.Lines[i], 1, 2) = '*'#9) or
          (UTF8Copy(dbText.Lines[i], 1, 2) = '+'#9) or
          (UTF8Copy(dbText.Lines[i], 1, 2) = '-'#9)) then
        begin
          dbText.Lines[i] := IntToStr(iNum1) + '.' + #9 +
            UTF8Copy(dbText.Lines[i], 3, UTF8Length(dbText.Lines[i]));
        end
        else
        begin
          dbText.Lines[i] := IntToStr(iNum1) + '.' + #9 + dbText.Lines[i];
        end;
        Inc(iNum1);
        iPos := iPos + UTF8Length(IntToStr(iNum1)) + 2;
      end;
    end;
  end
  else
  if stHeader = '' then
  begin
    for i := iStart to iEnd do
    begin
      dbText.Lines[i] := UTF8Copy(dbText.Lines[i], UTF8Pos(#9, dbText.Lines[i]) + 1,
        UTF8Length(dbText.Lines[i]));
    end;
  end
  else
  begin
    for i := iStart to iEnd do
    begin
      if ((UTF8Copy(dbText.Lines[i], 2, 1) = '.') or
        (UTF8Copy(dbText.Lines[i], 3, 1) = '.')) then
      begin
        dbText.Lines[i] := stHeader + #9 +
          UTF8Copy(dbText.Lines[i], UTF8Pos('.', dbText.Lines[i]) + 2,
          UTF8Length(dbText.Lines[i]));
      end
      else
      if ((UTF8Copy(dbText.Lines[i], 1, 1) = '*') or
        (UTF8Copy(dbText.Lines[i], 1, 1) = '+') or
        (UTF8Copy(dbText.Lines[i], 1, 1) = '-')) then
      begin
        dbText.Lines[i] := stHeader + #9 +
          UTF8Copy(dbText.Lines[i], 3, UTF8Length(dbText.Lines[i]));
      end
      else
      begin
        dbText.Lines[i] := stHeader + #9 + dbText.Lines[i];
      end;
    end;
    iPos := iPos + Utf8Length(stHeader);
  end;
  dbText.SelStart := iPos;
end;

function TfmMain.IsHeader(stLine: String): boolean;
begin
  Result := False;
  if ((UTF8Copy(stLine, 1, 2) = '# ') or
  (UTF8Copy(stLine, 1, 3) = '## ') or
  (UTF8Copy(stLine, 1, 4) = '### ') or
  (UTF8Copy(stLine, 1, 5) = '#### ') or
  (UTF8Copy(stLine, 1, 6) = '##### ') or
  (UTF8Copy(stLine, 1, 7) = '###### ')) then
  begin
    Result := True;
  end;
end;

procedure TfmMain.UpdateInfo;
begin
  if zqNotes.RecordCount > 0 then
  begin
    if dateformat = 'en' then
    begin
      lbInfo.Caption := sb001 + ' ' + FormatDateTime('dddd mmmm dd yyyy',
        zqNotesMODIFICATION_DATE.Value) + ' ' + sb002 + ' ' +
        FormatDateTime('hh.nn', zqNotesMODIFICATION_DATE.Value) + '. ' +
        sb005 + ': ' + FormatFloat('#,##0', UTF8Length(dbText.Text)) + '.';
    end
    else
    begin
      lbInfo.Caption := sb001 + ' ' + FormatDateTime('dddd dd mmmm yyyy',
        zqNotesMODIFICATION_DATE.Value) + ' ' + sb002 + ' ' +
        FormatDateTime('hh.nn', zqNotesMODIFICATION_DATE.Value) + '  •  ' +
        sb005 + ': ' + FormatFloat('#,##0', UTF8Length(dbText.Text)) + '.';
    end;
  end
  else
  begin
    lbInfo.Caption := msg040;
  end;
end;

procedure TfmMain.InsText(stText: string);
begin
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    insertText(NSStringUtf8(stText));
end;

function TfmMain.CleanXML(stXMLText: string): string;
var
  blTag: boolean;
  i: integer;
begin
  blTag := False;
  Result := '';
  for i := 1 to Length(stXMLText) do
  begin
    if Copy(stXMLText, i, 1) = '<' then
    begin
      blTag := True;
    end
    else if Copy(stXMLText, i, 1) = '>' then
    begin
      blTag := False;
    end
    else if blTag = False then
    begin
      Result := Result + Copy(stXMLText, i, 1);
    end;
    Application.ProcessMessages;
  end;
  while Copy(Result, 1, 1) = LineEnding do
  begin
    Result := Copy(Result, 2, Length(Result));
  end;
end;

function TfmMain.GoToNotePos(IDNote: integer): integer;
  var i: integer;
begin
  Result := 0;
  for i := 0 to Length(myNotePos) - 1 do
  begin;
    if IDNote = myNotePos[i].IDNote then
    begin
      Result := myNotePos[i].Pos;
      Break;
    end;
  end;
end;

procedure TfmMain.SetNotePos(IDNote, iPos: integer);
  var i: integer;
begin
  for i := 0 to Length(myNotePos) - 1 do
  begin;
    if IDNote = myNotePos[i].IDNote then
    begin
      myNotePos[i].Pos := iPos;
      Exit;
    end;
  end;
  SetLength(myNotePos, Length(myNotePos) + 1);
  myNotePos[Length(myNotePos) - 1].IDNote := IDNote;
  myNotePos[Length(myNotePos) - 1].Pos := iPos;
end;

function TfmMain.ColorToHtml(clColor: TColor): string;
begin
  Result := IntToHex(clColor, 6);
  Result := '#' + Copy(Result, 5, 2) + Copy(Result, 3, 2) + Copy(Result, 1, 2);
end;

function TfmMain.GetDbSize(stDatabase: String): String;
begin
  if FileSizeUtf8(stDatabase) < 1000000000 then
  begin
    Result := FormatFloat('#,0.#',
      FileSizeUtf8(stDatabase) / 1000000) + ' MB'
  end
  else
  begin
    Result := FormatFloat('#,0.#',
      FileSizeUtf8(stDatabase) / 1000000000) + ' GB'
  end;
end;

function TfmMain.GetNotexTempDir: String;
begin
  Result := GetTempDir + 'fbnotex' + DirectorySeparator;
end;

function TfmMain.GenID(GenName: string): integer;
begin
  with zqGenID do
  begin
    Sql.Add('Select GEN_ID(' + GenName + ', 1) from rdb$database');
    Open;
    First;
    Result := zqGenID.FieldByName('GEN_ID').AsInteger;
    Close;
    Sql.Clear;
  end;
end;

function TfmMain.GetSpaceWidth: Integer;
var
  bmp: TBitmap;
begin
  Result := 0;
  bmp := TBitmap.Create;
  try
    bmp.Canvas.Font.Assign(dbText.Font);
    Result := bmp.Canvas.TextWidth(' ');
  finally
    bmp.Free;
  end;
end;

// Source code taken from wiki.freepascal.org/RichMemo

function TfmMain.GetPara(txt: NSTextStorage; textOffset:
  integer; isReadOnly, useDefault: Boolean): NSParagraphStyle;
var
  dict: NSDictionary;
  op: NSParagraphStyle;
begin
  Result := nil;
  if not Assigned(txt) then Exit;
  dict := GetDict(txt, textOffset);
  op := nil;
  if Assigned(dict) then
    op := NSParagraphStyle(dict.objectForKey(NSParagraphStyleAttributeName));
  if not Assigned(op) then
  begin
    if not useDefault then Exit;
    op := NSParagraphStyle.defaultParagraphStyle;
  end;
  if isReadOnly then
    Result := op
  else
    Result := op.mutableCopyWithZone(nil)
end;

function TfmMain.GetWritePara(txt: NSTextStorage; textOffset: integer):
  NSMutableParagraphStyle;
begin
  Result := NSMutableParagraphStyle(GetPara(txt, textOffset, false, true));
end;

function TfmMain.GetDict(txt: NSTextStorage; textOffset: integer): NSDictionary;
begin
  if textOffset >= txt.string_.length then
  begin
    textOffset := txt.string_.length - 1;
  end;
  Result := txt.attributesAtIndex_effectiveRange(textOffset, nil);
end;

end.
