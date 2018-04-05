unit dm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, FileUtil;

type

  { TDMain }

  TDMain = class(TDataModule)
    SQLite3Con1: TSQLite3Connection;
    SQLTransaction1: TSQLTransaction;
  private

  public
    dbfilename: string;


    procedure dbcreate;

  end;

var
  DMain: TDMain;

implementation

{$R *.lfm}

{ TDMain }

procedure TDMain.dbcreate;
var newFile : Boolean;
begin
  //Создание базы данных
  SQLite3Con1.Close();
    try
    // Проверяем наличие файла базы
    newFile := not FileExists(SQLite3Con1.DatabaseName);

    if newFile then
    begin
      // Создаём базу и таблицу
      try
        SQLite3Con1.Open;
        SQLTransaction1.Active := true;

        // Создаём таблицу "DATA" в новой базе
        SQLite3Con1.ExecuteDirect('CREATE TABLE "DATA"('+
                    ' "id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,'+
                    ' "Device_Name" Char(128) NOT NULL,'+
                    ' "Device_Type" Char(128),'+
                    ' "Device_OS" Char(128),'+
                    ' "Device_OS_current" Char(128),'+
                    ' "Device_Update_Time" DateTime,'+
                    ' "Device_IP" Char(15),'+
                    ' "User_Name" Char(128),'+
                    ' "User_Pass" Char(128));');

        // Создаём индекс по id в таблице DATA
        SQLite3Con1.ExecuteDirect('CREATE UNIQUE INDEX "Data_id_idx" ON "DATA"( "id" );');

        SQLTransaction1.Commit;

        //ShowMessage('База данных создана.');
      except
        //ShowMessage('Не могу создать базу данных');
      end;
    end;
  except
    //ShowMessage('Не могу проверить есть база или нет');
  end;
end;

end.

