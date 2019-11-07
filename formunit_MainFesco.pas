unit formunit_MainFesco; {$R *.dfm}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, TntDBGrids, StdCtrls, TntStdCtrls,
  XPMan, DBCtrls, TntDBCtrls;

const
  UI_UPDATE_MODE = 0;
  PROGRAM_UPDATE_MODE = 1;

type
  Tform_MainFesco = class(TForm)
    adoconnection_FescoDB1: TADOConnection;
    adoquery_Query1: TADOQuery;
    TntDBGrid1: TTntDBGrid;
    dbsource_Fesco1: TDataSource;
    TntButton1: TTntButton;
    TntGroupBox1: TTntGroupBox;
    XPManifest1: TXPManifest;
    TntGroupBox2: TTntGroupBox;
    dbgrid_FactList: TTntDBGrid;
    dbgrid_PlanList: TTntDBGrid;
    TntGroupBox3: TTntGroupBox;
    TntDBGrid2: TTntDBGrid;
    adoquery_FactAgentsList: TADOQuery;
    adoquery_PlanList: TADOQuery;
    btn_LoadLists: TTntButton;
    dbsource_FactAgentsList: TDataSource;
    dbsource_PlanList: TDataSource;
    combo_AgentList: TTntDBComboBox;
    TntLabel1: TTntLabel;
    TntDBComboBox2: TTntDBComboBox;
    TntLabel2: TTntLabel;
    adoquery_FactList: TADOQuery;
    dbsource_FactList: TDataSource;
    edit_AgentFilter: TTntEdit;
    TntLabel3: TTntLabel;
    TntButton2: TTntButton;
    memo_SQLDebug1: TTntMemo;
    TntComboBox1: TTntComboBox;
    procedure UpdateData();
    procedure TntButton1Click(Sender: TObject);
    procedure btn_LoadListsClick(Sender: TObject);
    procedure edit_AgentFilterChange(Sender: TObject);
    procedure combo_AgentListChange(Sender: TObject);
    procedure TntButton2Click(Sender: TObject);
    procedure TntComboBox1Change(Sender: TObject);
    procedure TntComboBox1Select(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_MainFesco: Tform_MainFesco;

implementation

uses
  Unit1;



procedure Tform_MainFesco.TntButton1Click(Sender: TObject);
begin
  with adoquery_Query1 do begin
    Close();
    SQL.Text := 'SELECT ' + 
                  'Fact_Id ' +
                  '* ' +
                  '* ' +                  
                  '* ' +                  
                  '* ' +                  
                  '* ' +                  
                'FROM Planned';
    Open();
  end;
end;



procedure Tform_MainFesco.UpdateData;
var
  //I: Integer;
  filter_agent_data: string;
  
begin
  with adoquery_FactAgentsList do begin
    Close();
    SQL.Text := 'SELECT DISTINCT ag.Agent_Name + '' ( '' + ag.Agent_code + '')'' AS AgentInfo FROM Agent AS ag;';
    Open();
  end;
  //combo_AgentList.DataSource := dbsource_FactAgentsList;
  //combo_AgentList.DataField := 'AgentInfo';
  
  combo_AgentList.Tag := PROGRAM_UPDATE_MODE;
  combo_AgentList.Items.BeginUpdate();
  combo_AgentList.Items.Clear();
  combo_AgentList.Items.Add('< без фильтра >');

  try
    dbsource_FactAgentsList.DataSet.First();
    while not dbsource_FactAgentsList.DataSet.Eof do begin
      combo_AgentList.Items.Add( dbsource_FactAgentsList.DataSet.FieldValues['AgentInfo'] );
    
      dbsource_FactAgentsList.DataSet.Next();
    end;
  finally
    combo_AgentList.Items.EndUpdate();
    combo_AgentList.Tag := UI_UPDATE_MODE;  
  end;

  TntComboBox1.Items.Clear();
  TntComboBox1.Items.AddStrings(combo_AgentList.Items);


  if (Length(Trim(edit_AgentFilter.Text)) > 0) then begin
    filter_agent_data := Trim(edit_AgentFilter.Text);
  end else if (combo_AgentList.ItemIndex > 0) then begin
    filter_agent_data := combo_AgentList.Items[combo_AgentList.ItemIndex];
  end else begin
    filter_agent_data := '';
  end;

  with adoquery_FactList do begin
    Close();

    ParamCheck := true;

    SQL.Text := 'SELECT ' +
                    'f.Fact_Id AS ФКод, ' +
                    'ag.Agent_Name + '' ( '' + ag.Agent_code + '')'' AS Агент, ' +
                    'opr.Op_Name + '' ( '' + opr.Op_code + '' )'' As Опер, ' +
                    'f.Fact_Id, ' +                    
                    'f.Fact_Id, ' +                    
                    'ag.Agent_code ' + 
                'FROM Fact AS f ' +
                'INNER JOIN Agent AS ag ON ' + 
                    'f.Fact_Agent_code = ag.Agent_code ' + 
                'INNER JOIN Operation AS opr ON ' +
                    'f.Fact_Op_Code = opr.Op_code ';

    if (Length(filter_agent_data) > 0) then begin
      filter_agent_data := '%' + filter_agent_data + '%';
    
      SQL.Text := SQL.Text + ' ' + 
                'WHERE ' +
                    'ag.Agent_Name LIKE :AgentFilter' + ' OR ' +
                    'ag.Agent_code LIKE :AgentFilter';

      Parameters.ParamByName('AgentFilter').DataType := ftString;
      Parameters.ParamByName('AgentFilter').Value := filter_agent_data;
    end;

    //memo_SQLDebug1.Text := '[' + SQL.Text + ']';
    //MessageBox(Self.Handle, PAnsiChar( '[' + SQL.Text + ']' ), '', 0);
    
    Open();
  end;

  dbgrid_FactList.Columns[0].Width := 40;
  dbgrid_FactList.Columns[1].Width := 110;  
  dbgrid_FactList.Columns[2].Width := 190;  
  
  
(*
  with adoquery_PlanAgentsList do begin
    Close();
    SQL.Text := 'SELECT * FROM Planned';
    Open();
  end;
*)
end;



procedure Tform_MainFesco.btn_LoadListsClick(Sender: TObject);
begin
  UpdateData();
end;



procedure Tform_MainFesco.edit_AgentFilterChange(Sender: TObject);
begin
  if ((Sender is TTntEdit) and ((Sender as TTntEdit).Tag = PROGRAM_UPDATE_MODE)) then begin
    //  Событие вызвано не пользователем приложения. 
    Exit;
  end;

  UpdateData();
end;



procedure Tform_MainFesco.combo_AgentListChange(Sender: TObject);
begin
  memo_SQLDebug1.Lines.Add('Combobox OnChange Event');

  if ((Sender is TTntDBComboBox) and ((Sender as TTntDBComboBox).Tag = PROGRAM_UPDATE_MODE)) then begin
    //  Событие вызвано не пользователем приложения. 
    memo_SQLDebug1.Lines.Add('Combobox OnChange Event : Non User Change');
    Exit;
  end;

  memo_SQLDebug1.Lines.Add('Combobox OnChange Event : User Change');

  edit_AgentFilter.Tag := PROGRAM_UPDATE_MODE;
  edit_AgentFilter.Text := '';
  edit_AgentFilter.Tag := UI_UPDATE_MODE;
  
  UpdateData();
end;



procedure Tform_MainFesco.TntButton2Click(Sender: TObject);
begin
  Unit1.Form1.Show();
end;



procedure Tform_MainFesco.TntComboBox1Change(Sender: TObject);
begin
  memo_SQLDebug1.Lines.Add('Ch' + IntToStr((Sender as TTntComboBox).ItemIndex));
end;

procedure Tform_MainFesco.TntComboBox1Select(Sender: TObject);
begin
  memo_SQLDebug1.Lines.Add('Sel' + IntToStr((Sender as TTntComboBox).ItemIndex));
end;



procedure Tform_MainFesco.FormShow(Sender: TObject);
begin
  UpdateData();
end;



end.

