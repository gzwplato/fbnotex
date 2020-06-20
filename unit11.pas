unit Unit11;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

  { TfmHacks }

  TfmHacks = class(TForm)
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  fmHacks: TfmHacks;

implementation

{$R *.lfm}

{ TfmHacks }

procedure TfmHacks.FormShow(Sender: TObject);
begin
  Close;
end;

end.

