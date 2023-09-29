unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmCadProduto = class(TForm)
    edtCod: TDBEdit;
    qryProduto: TADOQuery;
    Label1: TLabel;
    edtNome: TDBEdit;
    Label2: TLabel;
    dsProduto: TDataSource;
    edtTipo: TDBEdit;
    Label3: TLabel;
    edtUnidade: TDBEdit;
    Label4: TLabel;
    edtPreco: TDBEdit;
    Label5: TLabel;
    btnIncluir: TBitBtn;
    btnEditar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    Label12: TLabel;
    imgBgTopo: TImage;
    imgVoltar: TImage;
    qryProdutoPROIdProduto: TAutoIncField;
    qryProdutoPRONome: TStringField;
    qryProdutoPROTipo: TStringField;
    qryProdutoPROUnidadeMedida: TStringField;
    qryProdutoPROPrecoUnitario: TBCDField;
    qryProdutoPRODescricao: TStringField;
    Label6: TLabel;
    edtDescricao: TDBMemo;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsProdutoStateChange(Sender: TObject);
    procedure qryProdutoAfterScroll(DataSet: TDataSet);
    procedure imgVoltarClick(Sender: TObject);
    procedure edtPrecoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Visualizar : Boolean;
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

uses uPrincipal, uConProduto;

procedure TfrmCadProduto.btnCancelarClick(Sender: TObject);
begin
  qryProduto.Cancel;
  qryProduto.AfterScroll(qryProduto);
end;

procedure TfrmCadProduto.btnEditarClick(Sender: TObject);
begin
  qryProduto.Edit;
  qryProduto.AfterScroll(qryProduto);
end;

procedure TfrmCadProduto.btnIncluirClick(Sender: TObject);
begin
  qryProduto.Open;
  qryProduto.insert;
  qryProduto.AfterScroll(qryProduto);
end;

procedure TfrmCadProduto.btnSalvarClick(Sender: TObject);
begin
  qryProduto.Post;
  qryProduto.AfterScroll(qryProduto);
end;

procedure TfrmCadProduto.dsProdutoStateChange(Sender: TObject);
begin
  btnSalvar.Enabled   := (qryProduto.State in [dsInsert, dsEdit]) and not Visualizar;
  btnCancelar.Enabled := (qryProduto.State in [dsInsert, dsEdit]) and not Visualizar;

  btnIncluir.Enabled := (qryProduto.State in [dsBrowse]) and not Visualizar;
  btnEditar.Enabled  := (qryProduto.State in [dsBrowse]) and not Visualizar;
 end;

procedure TfrmCadProduto.edtPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  if (not (Key in ['0'..'9'])) and (Key <> Chr(VK_DELETE)) and (Key <> Chr(VK_BACK)) and (Key <> Chr(44)) then
  begin
    Key := #0;
  end;
end;

procedure TfrmCadProduto.imgVoltarClick(Sender: TObject);
begin
  frmConProduto := TfrmConProduto.Create(self);
  frmConProduto.Parent := frmprincipal.pnlForms;
  frmConProduto.Show;

  frmCadProduto.close;
end;

procedure TfrmCadProduto.qryProdutoAfterScroll(DataSet: TDataSet);
begin
  if  not (qryProduto.State in [dsInsert, dsEdit]) then
  begin
    edtNome.Color        := clInactiveCaption;
    edtTipo.Color        := clInactiveCaption;
    edtUnidade.Color     := clInactiveCaption;
    edtPreco.Color       := clInactiveCaption;
    edtDescricao.Color   := clInactiveCaption;
  end
  else
  begin
    edtNome.Color        := clWindow;
    edtTipo.Color        := clWindow;
    edtUnidade.Color     := clWindow;
    edtPreco.Color       := clWindow;
    edtDescricao.Color   := clWindow;
  end;
end;

end.
