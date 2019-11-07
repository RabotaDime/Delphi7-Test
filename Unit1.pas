unit Unit1; {$R *.dfm}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, TntDBGrids, StdCtrls, TntStdCtrls,
  ADODB, TntClasses;

type
  TFilterFunction = function (search_item: TSearchRec) : Boolean of object;  

  

  TForm1 = class(TForm)
    dbquery_test_1: TQuery;
    dbsource_test_1: TDataSource;
    dbgrid_test_1: TTntDBGrid;
    btn_open_1: TTntButton;
    TntMemo1: TTntMemo;
    ADODataSet1: TADODataSet;
    ADOConnection1: TADOConnection;
    check_UseADO: TCheckBox;
    ADOQuery1: TADOQuery;
    TntMemo2: TTntMemo;
    ADOConnection2: TADOConnection;
    Session1: TSession;
    procedure btn_open_1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function GetFiles (path: string; filter_func: TFilterFunction) : TTntStrings;
    function FilterFiles (search_item: TSearchRec) : Boolean;
    function FilterDirs(search_item: TSearchRec): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;



var
  Form1: TForm1;

implementation

uses
  StrUtils, TntWideStrUtils;



function TForm1.FilterDirs(search_item: TSearchRec): Boolean;
begin
  Result := (search_item.Attr = faDirectory) and
            (search_item.Name <> '.') and
            (search_item.Name <> '..');
end;

function TForm1.FilterFiles(search_item: TSearchRec): Boolean;
const
  SQL_EXT = '.sql';
var
  file_ext: string;
begin
  Result := (search_item.Attr <> faDirectory);

  if (Result) then begin
    file_ext := StrUtils.RightStr(search_item.Name, Length(SQL_EXT));   //(TntWideStrUtils.WStrLower(StrUtils.RightStr(search_item.Name, Length(SQL_EXT))) = SQL_EXT);
    file_ext := StrLower(PAnsiChar(file_ext));
    Result := (file_ext = SQL_EXT);
  end;
end;



function TForm1.GetFiles (path: string; filter_func: TFilterFunction): TTntStrings;
const
  SEARCH_SUCCESS = Windows.ERROR_SUCCESS;

var
  search_record: TSearchRec;
  
begin
  Result := nil;

  if (FindFirst(path + '\*', faAnyFile, search_record) = SEARCH_SUCCESS) then begin
    Result := TTntStringList.Create();
  
    repeat
      if (filter_func(search_record)) then begin
        Result.Add(search_record.Name);
      end;
    until
      (FindNext(search_record) <> SEARCH_SUCCESS);

    FindClose(search_record);
  end;
end;



procedure TForm1.btn_open_1Click(Sender: TObject);
var
  table_names: Classes.TStrings;
begin
  TntMemo1.Text := 'SELECT * FROM Customer';
    
  if (check_UseADO.Checked) then begin
    table_names := TStringList.Create();
    ADOQuery1.Connection.GetTableNames(table_names);

    dbsource_test_1.DataSet := ADOQuery1;

    with ADOQuery1 do begin
      Close();
      SQL.Text := TntMemo1.Text;
      Open();
    end;
  end else begin
    dbsource_test_1.DataSet := dbquery_test_1;

    with dbquery_test_1 do begin
      Close();
      SQL.Text := TntMemo1.Text;
      Open();
    end;
  end;
end;



procedure TForm1.FormCreate(Sender: TObject);
const
  //  чтобы файл читался как UTF-8, включи для него в редакторе BOM 
  //  см. реализацию TntClasses.pas:1405 -> AutoDetectCharacterSet 
  SQL_FILE_1 = 'sql-examples/my-code-1.sql';
  SQL_FILE_2 = 'sql-examples/my-code-2.sql';

  SQLExamples: array[0..3] of string = (
    'my-code-1.sql',
    'my-code-2.sql',
    '',
    ''
  );

var
  code_lines: TntClasses.TTntStrings;
  sql_example_index: integer;
  sql_example_file: string;

  search_list: TTntStrings;
  sql_files: record 
    Shared: TTntStrings;
    ADO: TTntStrings;
    BDE: TTntStrings;
  end;

begin
  sql_example_index := 1;
  sql_example_file := 'sql-examples/' + SQLExamples[sql_example_index];

  sql_files.Shared   := TTntStringList.Create();
  sql_files.ADO      := TTntStringList.Create();
  sql_files.BDE      := TTntStringList.Create();  

  search_list := GetFiles('./sql-examples', Self.FilterFiles);
  sql_files.Shared.AddStrings(search_list);
  search_list := GetFiles('./sql-examples/BDE', Self.FilterFiles);
  sql_files.BDE.AddStrings(search_list);
  search_list := GetFiles('./sql-examples/ADO', Self.FilterFiles);
  sql_files.ADO.AddStrings(search_list);

  TntMemo2.Lines.Clear();
  TntMemo2.Lines.Add('--- Shared ---');
  TntMemo2.Lines.AddStrings(sql_files.Shared);
  TntMemo2.Lines.Add('--- BDE ---');
  TntMemo2.Lines.AddStrings(sql_files.BDE);
  TntMemo2.Lines.Add('--- ADO ---');
  TntMemo2.Lines.AddStrings(sql_files.ADO);

  if (FileExists(sql_example_file)) then begin
    code_lines := TTntStringList.Create();
    code_lines.LoadFromFile(sql_example_file);
  
    TntMemo1.Lines := code_lines;
  end;
end;



end.
