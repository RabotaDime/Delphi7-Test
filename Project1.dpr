program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  formunit_MainFesco in 'formunit_MainFesco.pas' {form_MainFesco},
  ctrlunit_FilterComboBox in 'ctrlunit_FilterComboBox.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tform_MainFesco, form_MainFesco);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
