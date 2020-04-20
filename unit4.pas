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

unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ExtCtrls, LazUTF8, CocoaThemes;

type

  { TfmOptions }

  TfmOptions = class(TForm)
    bnClose: TButton;
    bnStFontColorDef: TButton;
    bnStFontColorDef1: TButton;
    bnStFontColorMod: TButton;
    bnStMarkColorMod: TButton;
    edStMaxLess: TButton;
    edStSizePlus: TButton;
    edStSizeLess: TButton;
    edStMaxChar: TEdit;
    edStMaxPlus: TButton;
    edStSizeTitlesPlus: TButton;
    edStSizeTitlesLess: TButton;
    cbStFonts: TComboBox;
    cdColorDialog: TColorDialog;
    edBackup: TEdit;
    edFBgbakPath: TEdit;
    edFBLibPath: TEdit;
    edServer: TEdit;
    edPath: TEdit;
    edPort: TEdit;
    edStSize: TEdit;
    edStSizeTitles: TEdit;
    lbBackup: TLabel;
    lbFBgbakPath: TLabel;
    lbFBLibPath: TLabel;
    lbServer: TLabel;
    lbPath: TLabel;
    lbPort: TLabel;
    lbStSize: TLabel;
    lbStSizeTitles: TLabel;
    lbStMaxChar: TLabel;
    lnStFonts: TLabel;
    procedure bnCloseClick(Sender: TObject);
    procedure bnStFontColorDef1Click(Sender: TObject);
    procedure bnStFontColorDefClick(Sender: TObject);
    procedure bnStFontColorModClick(Sender: TObject);
    procedure bnStMarkColorModClick(Sender: TObject);
    procedure cbStFontsChange(Sender: TObject);
    procedure edStMaxLessClick(Sender: TObject);
    procedure edStMaxPlusClick(Sender: TObject);
    procedure edStSizeChange(Sender: TObject);
    procedure edStSizeLessClick(Sender: TObject);
    procedure edStSizePlusClick(Sender: TObject);
    procedure edStSizeTitlesChange(Sender: TObject);
    procedure edStSizeTitlesLessClick(Sender: TObject);
    procedure edStSizeTitlesPlusClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  fmOptions: TfmOptions;

implementation

Uses Unit1;

{$R *.lfm}

{ TfmOptions }

procedure TfmOptions.FormCreate(Sender: TObject);
begin
  cbStFonts.Items := Screen.Fonts;
  cbStFonts.ItemIndex := 0;
end;

procedure TfmOptions.FormShow(Sender: TObject);
begin
  if fmMain.zcConnection.Connected = False then
  begin
    edFBLibPath.ReadOnly := False;
    edFBgbakPath.ReadOnly := False;
    edServer.ReadOnly := False;
    edPort.ReadOnly := False;
    edPath.ReadOnly := False;
  end
  else
  begin
    edFBLibPath.ReadOnly := True;
    edFBgbakPath.ReadOnly := True;
    edServer.ReadOnly := True;
    edPort.ReadOnly := True;
    edPath.ReadOnly := True;
  end;
  edStSize.Text := IntToStr(fmMain.dbText.Font.Size);
  edStSizeTitles.Text := IntToStr(fmMain.sgTitles.Font.Size);
  edStMaxChar.Text := IntToStr(iSimpleTextFrom);
  edFBLibPath.Text := fmMain.zcConnection.LibraryLocation;
  edFBgbakPath.Text := stGBackDir;
  edServer.Text := fmMain.zcConnection.HostName;
  edPort.Text := IntToStr(fmMain.zcConnection.Port);
  edPath.Text := fmMain.zcConnection.Database;
  edBackup.Text := stBackupFile;
end;

procedure TfmOptions.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  with fmMain do
  begin
    if zcConnection.Connected = False then
    begin
      fmMain.zcConnection.LibraryLocation := edFBLibPath.Text;
      stGBackDir := edFBgbakPath.Text;
      zcConnection.HostName := edServer.Text;
      zcConnection.Port := StrToInt(edPort.Text);
      zcConnection.Database := edPath.Text;
    end;
    stBackupFile := edBackup.Text;
    if edStMaxChar.Text = '' then
    begin
      edStMaxChar.Text := '100000';
    end;
    iSimpleTextFrom := StrToInt(edStMaxChar.Text);
    if UTF8LowerCase(edServer.Text) <> 'localhost' then
    begin
      fmMain.miToolsBackup.Enabled := False;
      fmMain.miToolsRestore.Enabled := False;
      fmMain.miToolsCompact.Enabled := False;
      fmMain.bnBackup.Enabled := False;
      fmMain.bnRestore.Enabled := False;
    end
    else
    if fmMain.zcConnection.Connected = False then
    begin
      fmMain.miToolsBackup.Enabled := True;
      fmMain.miToolsRestore.Enabled := True;
      fmMain.miToolsCompact.Enabled := True;
      fmMain.bnBackup.Enabled := True;
      fmMain.bnRestore.Enabled := True;
    end;
  end;
end;

procedure TfmOptions.cbStFontsChange(Sender: TObject);
begin
  fmMain.dbText.Font.Name := cbStFonts.Text;
  fmMain.sgTitles.Font.Name := cbStFonts.Text;
  fmMain.FormatMarkers(2);
end;

procedure TfmOptions.edStSizeChange(Sender: TObject);
begin
  fmMain.dbText.Font.Size := StrToInt(edStSize.Text);
  fmMain.FormatMarkers(2);
end;

procedure TfmOptions.edStSizeLessClick(Sender: TObject);
begin
  if StrToInt(edStSize.Text) > 7 then
  begin
    edStSize.Text := IntToStr(StrToInt(edStSize.Text) - 1);
  end;
end;

procedure TfmOptions.edStSizePlusClick(Sender: TObject);
begin
  if StrToInt(edStSize.Text) < 256 then
  begin
    edStSize.Text := IntToStr(StrToInt(edStSize.Text) + 1);
  end;
end;

procedure TfmOptions.edStSizeTitlesChange(Sender: TObject);
begin
  fmMain.sgTitles.Font.Size := StrToInt(edStSizeTitles.Text);
end;

procedure TfmOptions.edStSizeTitlesLessClick(Sender: TObject);
begin
  if StrToInt(edStSizeTitles.Text) > 7 then
  begin
    edStSizeTitles.Text := IntToStr(StrToInt(edStSizeTitles.Text) - 1);
  end;
end;

procedure TfmOptions.edStSizeTitlesPlusClick(Sender: TObject);
begin
  if StrToInt(edStSizeTitles.Text) < 256 then
  begin
    edStSizeTitles.Text := IntToStr(StrToInt(edStSizeTitles.Text) + 1);
  end;
end;

procedure TfmOptions.edStMaxLessClick(Sender: TObject);
begin
  if StrToInt(edStMaxChar.Text) > 10000 then
  begin
    edStMaxChar.Text := IntToStr(StrToInt(edStMaxChar.Text) - 5000);
  end;
end;

procedure TfmOptions.edStMaxPlusClick(Sender: TObject);
begin
  if StrToInt(edStMaxChar.Text) < 1000000 then
  begin
    edStMaxChar.Text := IntToStr(StrToInt(edStMaxChar.Text) + 5000);
  end;
end;

procedure TfmOptions.bnStFontColorDefClick(Sender: TObject);
begin
  if IsPaintDark = True then
  begin
    fmMain.dbText.Font.Color := clWhite;
  end
  else
  begin
    fmMain.dbText.Font.Color := clDefault;
  end;
  fmMain.sgTitles.Font.Color := clDefault;
  clMarker := clRed;
  clHighlight := clGreen;
  fmMain.FormatMarkers(2);
end;

procedure TfmOptions.bnStFontColorModClick(Sender: TObject);
begin
  cdColorDialog.Color := fmMain.dbText.Font.Color;
  if cdColorDialog.Execute then
  begin
    fmMain.dbText.Font.Color := cdColorDialog.Color;
    fmMain.sgTitles.Font.Color := cdColorDialog.Color;
    fmMain.FormatMarkers(2);
  end;
end;

procedure TfmOptions.bnStMarkColorModClick(Sender: TObject);
begin
  cdColorDialog.Color := clMarker;
  if cdColorDialog.Execute then
  begin
    clMarker := cdColorDialog.Color;
    fmMain.FormatMarkers(2);
  end;
end;

procedure TfmOptions.bnStFontColorDef1Click(Sender: TObject);
begin
  cdColorDialog.Color := clHighlight;
  if cdColorDialog.Execute then
  begin
    clHighlight := cdColorDialog.Color;
    fmMain.FormatMarkers(2);
  end;
end;

procedure TfmOptions.bnCloseClick(Sender: TObject);
begin
  Close;
end;

end.

