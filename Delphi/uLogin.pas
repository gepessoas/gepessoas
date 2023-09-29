unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXCtrls, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Vcl.Buttons, Data.DB,
  Data.Win.ADODB;

type
  TfrmLogin = class(TForm)
    RelativePanel1: TRelativePanel;
    edtLogin: TEdit;
    pnlUser: TPanel;
    logoUser: TImage;
    edtSenha: TEdit;
    pnlSenha: TPanel;
    logoPassword: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Conexao: TADOConnection;
    qryLogin: TADOQuery;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    RelativePanel2: TRelativePanel;
    Edit1: TEdit;
    Image1: TImage;
    Panel1: TPanel;
    Image2: TImage;
    Edit2: TEdit;
    Panel2: TPanel;
    Image3: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    RelativePanel3: TRelativePanel;
    Edit3: TEdit;
    Image4: TImage;
    Panel3: TPanel;
    Image5: TImage;
    Edit4: TEdit;
    Panel4: TPanel;
    Image6: TImage;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    RelativePanel4: TRelativePanel;
    Edit5: TEdit;
    Image7: TImage;
    Panel5: TPanel;
    Image8: TImage;
    Edit6: TEdit;
    Panel6: TPanel;
    Image9: TImage;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    RelativePanel5: TRelativePanel;
    Edit7: TEdit;
    Image10: TImage;
    Panel7: TPanel;
    Image11: TImage;
    Edit8: TEdit;
    Panel8: TPanel;
    Image12: TImage;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    qryAdmin: TADOQuery;
    qryLoginID_Pessoa: TAutoIncField;
    qryLoginCD_Pessoa: TStringField;
    qryLoginNM_Pessoa: TStringField;
    qryLoginID_Cargo: TIntegerField;
    qryLoginVL_Salario: TBCDField;
    qryLoginNM_Email: TStringField;
    qryLoginNM_Senha: TStringField;
    qryLoginNO_Celular: TStringField;
    qryLoginSN_Primeiro_Acesso: TStringField;
    qryAdminID_Pessoa: TAutoIncField;
    qryAdminCD_Pessoa: TStringField;
    qryAdminNM_Pessoa: TStringField;
    qryAdminID_Cargo: TIntegerField;
    qryAdminVL_Salario: TBCDField;
    qryAdminNM_Email: TStringField;
    qryAdminNM_Senha: TStringField;
    qryAdminNO_Celular: TStringField;
    qryAdminSN_Primeiro_Acesso: TStringField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    UserAdmin: integer;
    IdUsuario: integer;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfrmLogin.Button1Click(Sender: TObject);
begin
  try
    qryLogin.close;
    qryLogin.Parameters.ParamByName('Login').value := edtLogin.text;
    qryLogin.Parameters.ParamByName('Senha').value := edtSenha.text;
    qryLogin.Open;

    if qryLogin.RecordCount = 0 then
    begin
      ShowMessage('Login ou senha incorretos!');
      Exit;
    end;

    qryAdmin.close;
    qryAdmin.Parameters.ParamByName('Login').value := edtLogin.text;
    qryAdmin.Parameters.ParamByName('Senha').value := edtSenha.text;
    qryAdmin.Open;

    if qryAdmin.RecordCount = 0 then
      UserAdmin := 0
    else
      UserAdmin := 1;

    IdUsuario := qryLogin.Fields.FieldByName('ID_Pessoa').asInteger;

    frmPrincipal := TfrmPrincipal.Create(Application);
    frmPrincipal.Show;

    Except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message );
  end;
end;

end.
