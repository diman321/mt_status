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
    // Since we're making this database for the first time,
    // check whether the file already exists
    newFile := not FileExists(SQLite3Con1.DatabaseName);

    if newFile then
    begin
      // Create the database and the tables
      try
        SQLite3Con1.Open;
        SQLTransaction1.Active := true;

        // Here we're setting up a table named "DATA" in the new database
        SQLite3Con1.ExecuteDirect('CREATE TABLE "DATA"('+
                    ' "id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,'+
                    ' "Device_Name" Char(128) NOT NULL,'+
                    ' "Device_Type" Char(128),'+
                    ' "Device_OS" Char(128),'+
                    ' "Device_Update_Time" DateTime,'+
                    ' "Device_IP" Char(15),'+
                    ' "User_Name" Char(128),'+
                    ' "User_Pass" Char(128));');

        // Creating an index based upon id in the DATA Table
        SQLite3Con1.ExecuteDirect('CREATE UNIQUE INDEX "Data_id_idx" ON "DATA"( "id" );');

        SQLTransaction1.Commit;

        //ShowMessage('Succesfully created database.');
      except
        //ShowMessage('Unable to Create new Database');
      end;
    end;
  except
    //ShowMessage('Unable to check if database file exists');
  end;
end;

end.

