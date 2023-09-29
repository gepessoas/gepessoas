unit uConProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TfrmConProduto = class(TForm)
    qryProduto: TADOQuery;
    dsProduto: TDataSource;
    imgBgTopo: TImage;
    Label12: TLabel;
    btnExcluir: TBitBtn;
    btnIncluir: TBitBtn;
    edtFiltro: TEdit;
    Label1: TLabel;
    imgVoltar: TImage;
    cbFiltro: TComboBox;
    DBGrid1: TDBGrid;
    btnAprovar: TBitBtn;
    qryProdutoID_Solicitacao: TAutoIncField;
    qryProdutoNM_Solicitacao: TStringField;
    qryProdutoID_Pessoa: TIntegerField;
    qryProdutoID_Cargo: TIntegerField;
    qryProdutoObjetivo: TStringField;
    qryProdutoVL_Pretencao_Sal: TBCDField;
    qryProdutoSN_Aprovado: TStringField;
    qryProdutoRS_Aplicacao: TStringField;
    qryProdutoDH_Inclusao: TDateTimeField;
    qryProdutoDT_Vigencia_Vaga: TDateTimeField;
    qryProdutoNM_Pessoa: TStringField;
    qryProdutoNM_Cargo: TStringField;
    qryExcluir: TADOQuery;
    qryExcluirID_Solicitacao: TAutoIncField;
    qryExcluirNM_Solicitacao: TStringField;
    qryExcluirID_Pessoa: TIntegerField;
    qryExcluirID_Cargo: TIntegerField;
    qryExcluirObjetivo: TStringField;
    qryExcluirVL_Pretencao_Sal: TFloatField;
    qryExcluirSN_Aprovado: TStringField;
    qryExcluirRS_Aplicacao: TStringField;
    qryExcluirDH_Inclusao: TDateTimeField;
    qryExcluirDT_Vigencia_Vaga: TDateTimeField;
    qryExcluirDT_Conclusao: TDateTimeField;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
    procedure cbFiltroChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure edtFiltroKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAprovarClick(Sender: TObject);
  private
    { Private declarations }
    ColunaFiltro : String;

  public
    { Public declarations }
  end;

var
  frmConProduto: TfrmConProduto;

implementation

{$R *.dfm}

uses uPrincipal, uCadProduto, uMenuPrincipal, uLogin, uAprovacao;

procedure TfrmConProduto.btnAprovarClick(Sender: TObject);
begin

  if not qryProduto.IsEmpty then
  begin
    frmPrincipal.Codigo := qryProduto.fields.FieldByName('ID_Solicitacao').asinteger;

    frmAprovacao := TfrmAprovacao.Create(self);
    frmAprovacao.Parent := frmprincipal.pnlForms;
    frmAprovacao.Visualizar := False;
    frmAprovacao.Show;

    frmAprovacao.qrySolicitacao.Open;
    frmAprovacao.qrySolicitacao.Locate('ID_Solicitacao', frmPrincipal.codigo, [loCaseInsensitive, loPartialKey]);
  end;
end;

procedure TfrmConProduto.btnExcluirClick(Sender: TObject);
begin
  if (not qryProduto.IsEmpty) and (qryProdutoID_Solicitacao.value > 0) and (qryProdutoSN_Aprovado.value <> 'S')  then
  begin
    if MessageDlg('Deseja deletar esse registro?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
    begin
      qryExcluir.Close;
      qryExcluir.Open;
      qryExcluir.Locate('ID_Solicitacao', qryProdutoID_Solicitacao.value, [loCaseInsensitive, loPartialKey]);
      qryExcluir.Delete;

      qryProduto.Close;

      if Trim(edtFiltro.Text) <> '' then
      begin
        qryProduto.SQL.Strings[27] := 'AND ' + ColunaFiltro + ' LIKE ''%' + edtFiltro.Text + '%''';
        qryProduto.SQL.Strings[50] := 'AND ' + ColunaFiltro + ' LIKE ''%' + edtFiltro.Text + '%''';
      end
      else
      begin
        qryProduto.SQL.Strings[27] := '';
        qryProduto.SQL.Strings[50] := '';
      end;

      qryProduto.Open;
    end;
  end;
end;

procedure TfrmConProduto.btnFiltrarClick(Sender: TObject);
begin
  qryProduto.Close;

  if Trim(edtFiltro.Text) <> '' then
  begin
    qryProduto.SQL.Strings[27] := 'AND ' + ColunaFiltro + ' LIKE ''%' + edtFiltro.Text + '%''';
    qryProduto.SQL.Strings[50] := 'AND ' + ColunaFiltro + ' LIKE ''%' + edtFiltro.Text + '%''';
  end
  else
  begin
    qryProduto.SQL.Strings[27] := '';
    qryProduto.SQL.Strings[50] := '';
  end;

  qryProduto.Open;
end;

procedure TfrmConProduto.btnIncluirClick(Sender: TObject);
begin
  frmCadProduto := TfrmCadProduto.Create(self);
  frmCadProduto.Parent := frmprincipal.pnlForms;
  frmCadProduto.Visualizar := False;
  frmCadProduto.Show;
end;

procedure TfrmConProduto.btnVisualizarClick(Sender: TObject);
begin
  if not qryProduto.IsEmpty then
  begin
    frmPrincipal.Codigo := qryProduto.fields.FieldByName('ID_Solicitacao').asinteger;

    frmCadProduto := TfrmCadProduto.Create(self);
    frmCadProduto.Parent := frmprincipal.pnlForms;
    frmCadProduto.Visualizar := True;
    //frmCadProduto.dsProdutoStateChange(self);
    frmCadProduto.Show;

    frmCadProduto.qryProduto.Open;
    frmCadProduto.qryProduto.Locate('ID_Solicitacao', frmPrincipal.codigo, [loCaseInsensitive, loPartialKey]);

    frmConProduto.close;
  end;
end;

procedure TfrmConProduto.cbFiltroChange(Sender: TObject);
begin
  case cbFiltro.ItemIndex of
    0: ColunaFiltro := 'ID_Solicitacao';
    1: ColunaFiltro := 'NM_Solicitacao';
  end;
end;

procedure TfrmConProduto.edtFiltroKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  qryProduto.Close;

  if Trim(edtFiltro.Text) <> '' then
  begin
    qryProduto.SQL.Strings[27] := 'AND ' + ColunaFiltro + ' LIKE ''%' + edtFiltro.Text + '%''';
    qryProduto.SQL.Strings[50] := 'AND ' + ColunaFiltro + ' LIKE ''%' + edtFiltro.Text + '%''';
  end
  else
  begin
    qryProduto.SQL.Strings[27] := '';
    qryProduto.SQL.Strings[50] := '';
  end;

  qryProduto.Open;
end;

procedure TfrmConProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryProduto.close;
end;

procedure TfrmConProduto.FormShow(Sender: TObject);
begin
  qryProduto.close;
  qryProduto.Parameters.ParamByName('ID_Pessoa').value := frmLogin.IdUsuario;
  qryProduto.open;

  case cbFiltro.ItemIndex of
    0: ColunaFiltro := 'ID_Solicitacao';
    1: ColunaFiltro := 'NM_Solicitacao';
  end;

  if frmLogin.UserAdmin = 1 then
  begin
    btnIncluir.Visible := False;
    btnAprovar.Visible := True;
  end
  else
  begin
    btnIncluir.Visible := True;
    btnAprovar.Visible := False;
  end;
end;

procedure TfrmConProduto.imgVoltarClick(Sender: TObject);
begin
  frmMenuPrincipal := TfrmMenuPrincipal.Create(self);
  frmMenuPrincipal.Parent := frmprincipal.pnlForms;
  frmMenuPrincipal.Show;

  frmConProduto.close;
end;

end.
