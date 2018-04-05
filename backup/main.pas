unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, Menus, Buttons, DBGrids, dm, device_manage;

type

  { TForm1 }

  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    SpB_Add_Device: TSpeedButton;
    StatusBar1: TStatusBar;
    procedure FormActivate(Sender: TObject);
    procedure SpB_Add_DeviceClick(Sender: TObject);
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

procedure TForm1.SpB_Add_DeviceClick(Sender: TObject);
begin
  //Редактирование/добавление устройства

  Device_manage.Frm_Dev_Mng.ShowModal;

end;

procedure TForm1.AppStart;
begin
  //Запуск приложения
  DMain.dbfilename := GetCurrentDir+'\main.db';
  DMain.SQLite3Con1.DatabaseName := DMain.dbfilename;
  DMain.dbcreate;
  DMain.SQLite3Con1.Connected := true;
end;

end.

