unit uCadVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmCadVeiculo = class(TForm)
    edtCod: TDBEdit;
    qryVeiculo: TADOQuery;
    qryVeiculoVEIIdVeiculo: TAutoIncField;
    qryVeiculoVEIMarca: TStringField;
    qryVeiculoVEIModelo: TStringField;
    qryVeiculoVEIPlaca: TStringField;
    qryVeiculoVEICapacidade: TIntegerField;
    qryVeiculoVEIAno: TIntegerField;
    qryVeiculoVEIRenavam: TIntegerField;
    qryVeiculoVEIChassi: TStringField;
    qryVeiculoVEICor: TStringField;
    qryVeiculoVEITipo: TStringField;
    qryVeiculoVEIStatus: TStringField;
    qryVeiculoVEIQuilometragem: TIntegerField;
    Label1: TLabel;
    edtModelo: TDBEdit;
    Label2: TLabel;
    dsVeiculo: TDataSource;
    edtMarca: TDBEdit;
    Label3: TLabel;
    edtPlaca: TDBEdit;
    Label4: TLabel;
    edtCapacidade: TDBEdit;
    Label5: TLabel;
    edtAno: TDBEdit;
    Label6: TLabel;
    edtRenavam: TDBEdit;
    Label7: TLabel;
    edtChassi: TDBEdit;
    Label8: TLabel;
    edtCor: TDBEdit;
    Label9: TLabel;
    edtTipo: TDBEdit;
    Label10: TLabel;
    edtQuilometragem: TDBEdit;
    Label11: TLabel;
    cbAtivo: TDBCheckBox;
    btnIncluir: TBitBtn;
    btnEditar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    Label12: TLabel;
    imgBgTopo: TImage;
    imgVoltar: TImage;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsVeiculoStateChange(Sender: TObject);
    procedure qryVeiculoAfterScroll(DataSet: TDataSet);
    procedure imgVoltarClick(Sender: TObject);
    procedure edtAnoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCapacidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtRenavamKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Visualizar : Boolean;
  end;

var
  frmCadVeiculo: TfrmCadVeiculo;

implementation

{$R *.dfm}

uses uPrincipal, uConVeiculo;

procedure TfrmCadVeiculo.btnCancelarClick(Sender: TObject);
begin
  qryVeiculo.Cancel;
  qryVeiculo.AfterScroll(qryVeiculo);
end;

procedure TfrmCadVeiculo.btnEditarClick(Sender: TObject);
begin
  qryVeiculo.Edit;
  qryVeiculo.AfterScroll(qryVeiculo);
end;

procedure TfrmCadVeiculo.btnIncluirClick(Sender: TObject);
begin
  qryVeiculo.Open;
  qryVeiculo.insert;
  qryVeiculo.AfterScroll(qryVeiculo);
end;

procedure TfrmCadVeiculo.btnSalvarClick(Sender: TObject);
begin
  qryVeiculo.Post;
  qryVeiculo.AfterScroll(qryVeiculo);
end;

procedure TfrmCadVeiculo.dsVeiculoStateChange(Sender: TObject);
begin
  btnSalvar.Enabled   := (qryVeiculo.State in [dsInsert, dsEdit]) and not Visualizar;
  btnCancelar.Enabled := (qryVeiculo.State in [dsInsert, dsEdit]) and not Visualizar;

  btnIncluir.Enabled := (qryVeiculo.State in [dsBrowse]) and not Visualizar;
  btnEditar.Enabled  := (qryVeiculo.State in [dsBrowse]) and not Visualizar;
 end;

procedure TfrmCadVeiculo.edtAnoKeyPress(Sender: TObject; var Key: Char);
begin
  if (not (Key in ['1'..'9'])) and (Key <> Chr(VK_DELETE)) and (Key <> Chr(VK_BACK)) then
  begin
    Key := #0;
  end;
end;

procedure TfrmCadVeiculo.edtCapacidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if (not (Key in ['1'..'9'])) and (Key <> Chr(VK_DELETE)) and (Key <> Chr(VK_BACK)) then
  begin
    Key := #0;
  end;
end;

procedure TfrmCadVeiculo.edtRenavamKeyPress(Sender: TObject; var Key: Char);
begin
  if (not (Key in ['1'..'9'])) and (Key <> Chr(VK_DELETE)) and (Key <> Chr(VK_BACK)) then
  begin
    Key := #0;
  end;
end;

procedure TfrmCadVeiculo.imgVoltarClick(Sender: TObject);
begin
  frmConVeiculo := TfrmConVeiculo.Create(self);
  frmConVeiculo.Parent := frmprincipal.pnlForms;
  frmConVeiculo.Show;

  frmCadVeiculo.close;
end;

procedure TfrmCadVeiculo.qryVeiculoAfterScroll(DataSet: TDataSet);
begin
  if  not (qryVeiculo.State in [dsInsert, dsEdit]) then
  begin
    edtModelo.Color        := clInactiveCaption;
    edtMarca.Color         := clInactiveCaption;
    edtPlaca.Color         := clInactiveCaption;
    edtCapacidade.Color    := clInactiveCaption;
    edtAno.Color           := clInactiveCaption;
    edtRenavam.Color       := clInactiveCaption;
    edtChassi.Color        := clInactiveCaption;
    edtCor.Color           := clInactiveCaption;
    edtTipo.Color          := clInactiveCaption;
    edtQuilometragem.Color := clInactiveCaption;
  end
  else
  begin
    edtModelo.Color        := clWindow;
    edtMarca.Color         := clWindow;
    edtPlaca.Color         := clWindow;
    edtCapacidade.Color    := clWindow;
    edtAno.Color           := clWindow;
    edtRenavam.Color       := clWindow;
    edtChassi.Color        := clWindow;
    edtCor.Color           := clWindow;
    edtTipo.Color          := clWindow;
    edtQuilometragem.Color := clWindow;
  end;
end;

end.
