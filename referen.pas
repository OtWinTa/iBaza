unit Referen;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, BufDataset, FileUtil, Forms, Controls, Graphics,
  Dialogs, DBGrids, StdCtrls, Filtres;

type

  { TReferenForm }

  TReferenForm = class(TForm)
    Datasource: TDatasource;
    DBGrid: TDBGrid;
    SQLQuery: TSQLQuery;
    procedure FormCreate(Sender: TObject);
    procedure MakeQuery (AIndex: integer);
  private
    Filters : TFilters;
  public
    TableIndex : integer;
  end;

var
  ReferenForm: TReferenForm;

implementation

{$R *.lfm}

{ TReferenForm }

procedure TReferenForm.FormCreate(Sender: TObject);
begin
  Filters:= TFilters.Create(Self, 0, 0, Width, TableIndex );
end;

procedure TReferenForm.MakeQuery(AIndex: integer);
var
  rows, innerjoins: String;
  i: Integer;
begin
  ReferenForm.SQLQuery.SQL.Text := 'SELECT ' + rows + ' FROM ' + Name + ' ' + innerjoins;
  ReferenForm.SQLQuery.Open;
  for i := 0 to High(Fields) do begin
    ReferenForm.DBGrid.Columns[i].Title.Caption := Fields[i].Caption;
    ReferenForm.DBGrid.Columns[i].Width := Fields[i].Width * 10;
  end;
end;

end.

