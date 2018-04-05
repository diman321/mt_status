unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, Menus, dm;

type

  { TForm1 }

  TForm1 = class(TForm)
    ControlBar1: TControlBar;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    procedure FormActivate(Sender: TObject);
  private

    procedure AppStart;

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormActivate(Sender: TObject);
begin
  AppStart;
end;

procedure TForm1.AppStart;
begin
  //Запуск приложения
  DMain.dbfilename := GetCurrentDir+'\main.db';
  DMain.SQLite3Con1.DatabaseName := DMain.dbfilename;
  DMain.dbcreate;
end;

end.

