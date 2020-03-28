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

unit Unit7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  Clipbrd, ExtCtrls, ZDataset;

type

  { TfmInsertID }

  TfmInsertID = class(TForm)
    bnOK: TButton;
    bnCancel: TButton;
    bnPaste: TButton;
    edID: TEdit;
    lbTitle: TLabel;
    lbIDKind: TLabel;
    pmMenu: TPopupMenu;
    Shape1: TShape;
    procedure bnPasteClick(Sender: TObject);
    procedure edIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private

  public
    iNoteSect: SmallInt;

  end;

var
  fmInsertID: TfmInsertID;

implementation

uses Unit1;

{$R *.lfm}

{ TfmInsertID }

procedure TfmInsertID.edIDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((key = Ord('V')) and (Shift = [ssMeta])) then
  begin
    key := 0;
    if bnPaste.Enabled = True then
    begin
      bnPasteClick(nil);
    end;
  end
  else
  if key = 13 then
  begin
    ModalResult := mrOK;
  end
  else
  if (((key < 48) or (key > 57)) and (key <> 8)) then
  begin
    key := 0;
  end
  else
  begin
    key := 0;
    lbTitle.Caption := '';
  end;
end;

procedure TfmInsertID.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then
  begin
    key := 0;
    ModalResult := mrCancel;
  end;
end;

procedure TfmInsertID.bnPasteClick(Sender: TObject);
  var myDataset: TZQuery;
begin
  edID.Clear;
  lbTitle.Caption := '';
  edID.PasteFromClipboard;
  try
    myDataset := TZQuery.Create(Self);
    myDataset.Connection := fmMain.zqNotebooks.Connection;
    if iNoteSect = 0 then
    begin
      myDataset.Sql.Add('Select Notebooks.Title from Notebooks');
      myDataset.Sql.Add('where Notebooks.ID = ' + edID.Text);
    end
    else
    if iNoteSect = 1 then
    begin
      myDataset.Sql.Add('Select Sections.Title from Sections');
      myDataset.Sql.Add('where Sections.ID = ' + edID.Text);
    end
    else
    if iNoteSect = 2 then
    begin
      myDataset.Sql.Add('Select Notes.Title from Notes');
      myDataset.Sql.Add('where Notes.ID = ' + edID.Text);
    end;
    myDataSet.Open;
    lbTitle.Caption := myDataset.FieldByName('Title').Value;
    myDataset.Close;
  finally
    myDataset.Free;
  end;
end;

procedure TfmInsertID.FormShow(Sender: TObject);
  var i: integer;
begin
  edID.SetFocus;
  edID.SelectAll;
  if TryStrToInt(Clipboard.AsText, i) = True then
  begin
    bnPaste.Enabled := True;
  end
  else
  begin
    bnPaste.Enabled := False;
  end;
end;

end.

