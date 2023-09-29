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
    btnEditar: TBitBtn;
    edtFiltro: TEdit;
    Label1: TLabel;
    imgVoltar: TImage;
    cbFiltro: TComboBox;
    btnVisualizar: TBitBtn;
    qryProdutoPROIdProduto: TAutoIncField;
    qryProdutoPRONome: TStringField;
    qryProdutoPROTipo: TStringField;
    qryProdutoPROUnidadeMedida: TStringField;
    qryProdutoPROPrecoUnitario: TBCDField;
    qryProdutoPRODescricao: TStringField;
    DBGrid1: TDBGrid;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
    procedure cbFiltroChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure edtFiltroKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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

uses uPrincipal, uCadProduto, uMenuPrincipal;

procedure TfrmConProduto.btnEditarClick(Sender: TObject);
begin
  if not qryProduto.IsEmpty then
  begin
    frmPrincipal.Codigo := qryProduto.fields.FieldByName('PROIDPRODUTO').asinteger;

    frmCadProduto := TfrmCadProduto.Create(self);
    frmCadProduto.Parent := frmprincipal.pnlForms;
    frmCadProduto.Visualizar := False;
    frmCadProduto.Show;

    frmCadProduto.qryProduto.Open;
    frmCadProduto.qryProduto.Locate('PROIDPRODUTO', frmPrincipal.codigo, [loCaseInsensitive, loPartialKey]);

    frmCadProduto.btnEditar.Click;

    frmConProduto.close;
  end;
end;

procedure TfrmConProduto.btnExcluirClick(Sender: TObject);
begin
  if (not qryProduto.IsEmpty) and (qryProdutoPROIDPRODUTO.value > 0) then
  begin
    if MessageDlg('Deseja deletar esse registro?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
    begin
      qryProduto.delete;
    end;
  end;
end;

procedure TfrmConProduto.btnFiltrarClick(Sender: TObject);
begin
  qryProduto.Close;

  if Trim(edtFiltro.Text) <> '' then
  begin
    qryProduto.SQL.Strings[3] := 'AND ' + ColunaFiltro + ' LIKE ''%' + edtFiltro.Text + '%''';
  end
  else
  begin
    qryProduto.SQL.Strings[3] := '';
  end;

  qryProduto.Open;
end;

procedure TfrmConProduto.btnIncluirClick(Sender: TObject);
begin
  frmCadProduto := TfrmCadProduto.Create(self);
  frmCadProduto.Parent := frmprincipal.pnlForms;
  frmCadProduto.Visualizar := False;
  frmCadProduto.Show;

  frmCadProduto.btnIncluir.Click;
end;

procedure TfrmConProduto.btnVisualizarClick(Sender: TObject);
begin
  if not qryProduto.IsEmpty then
  begin
    frmPrincipal.Codigo := qryProduto.fields.FieldByName('PROIDPRODUTO').asinteger;

    frmCadProduto := TfrmCadProduto.Create(self);
    frmCadProduto.Parent := frmprincipal.pnlForms;
    frmCadProduto.Visualizar := True;
    frmCadProduto.dsProdutoStateChange(self);
    frmCadProduto.Show;

    frmCadProduto.qryProduto.Open;
    frmCadProduto.qryProduto.Locate('PROIDPRODUTO', frmPrincipal.codigo, [loCaseInsensitive, loPartialKey]);

    frmConProduto.close;
  end;
end;

procedure TfrmConProduto.cbFiltroChange(Sender: TObject);
begin
  case cbFiltro.ItemIndex of
    0: ColunaFiltro := 'PROIDPRODUTO';
    1: ColunaFiltro := 'PRONOME';
    2: ColunaFiltro := 'PROTIPO';
    3: ColunaFiltro := 'PRODESCRICAO';
  end;
end;

procedure TfrmConProduto.edtFiltroKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  qryProduto.Close;

  if Trim(edtFiltro.Text) <> '' then
  begin
    qryProduto.SQL.Strings[3] := 'AND ' + ColunaFiltro + ' LIKE ''%' + edtFiltro.Text + '%''';
  end
  else
  begin
    qryProduto.SQL.Strings[3] := '';
  end;

  qryProduto.Open;
end;

procedure TfrmConProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryProduto.close;
end;

procedure TfrmConProduto.FormShow(Sender: TObject);
begin
  qryProduto.open;

  if cbFiltro.ItemIndex = 0 then
  begin
    edtFiltro.Clear;
    edtFiltro.Readonly := True;
  end
  else
  begin
    edtFiltro.Readonly := False;
  end;

  case cbFiltro.ItemIndex of
    0: ColunaFiltro := 'PROIDPRODUTO';
    1: ColunaFiltro := 'PRONOME';
    2: ColunaFiltro := 'PROTIPO';
    3: ColunaFiltro := 'PRODESCRICAO';
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
