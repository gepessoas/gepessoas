unit uConVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TfrmConVeiculo = class(TForm)
    grdVeiculos: TDBGrid;
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
    dsVeiculo: TDataSource;
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
  frmConVeiculo: TfrmConVeiculo;

implementation

{$R *.dfm}

uses uPrincipal, uCadVeiculo, uMenuPrincipal;

procedure TfrmConVeiculo.btnEditarClick(Sender: TObject);
begin
  if not qryVeiculo.IsEmpty then
  begin
    frmPrincipal.Codigo := qryVeiculo.fields.FieldByName('VEIIDVEICULO').asinteger;

    frmCadVeiculo := TfrmCadVeiculo.Create(self);
    frmCadVeiculo.Parent := frmprincipal.pnlForms;
    frmCadVeiculo.Visualizar := False;
    frmCadVeiculo.Show;

    frmCadVeiculo.qryVeiculo.Open;
    frmCadVeiculo.qryVeiculo.Locate('VEIIDVEICULO', frmPrincipal.codigo, [loCaseInsensitive, loPartialKey]);

    frmCadVeiculo.btnEditar.Click;

    frmConveiculo.close;
  end;
end;

procedure TfrmConVeiculo.btnExcluirClick(Sender: TObject);
begin
  if (not qryVeiculo.IsEmpty) and (qryVeiculoVEIIDVEICULO.value > 0) then
  begin
    if MessageDlg('Deseja deletar esse registro?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
    begin
      qryveiculo.delete;
    end;
  end;
end;

procedure TfrmConVeiculo.btnFiltrarClick(Sender: TObject);
begin
  qryVeiculo.Close;

  if Trim(edtFiltro.Text) <> '' then
  begin
    qryVeiculo.SQL.Strings[3] := 'AND ' + ColunaFiltro + ' LIKE ''%' + edtFiltro.Text + '%''';
  end
  else
  begin
    qryVeiculo.SQL.Strings[3] := '';
  end;

  qryVeiculo.Open;
end;

procedure TfrmConVeiculo.btnIncluirClick(Sender: TObject);
begin
  frmCadVeiculo := TfrmCadVeiculo.Create(self);
  frmCadVeiculo.Parent := frmprincipal.pnlForms;
  frmCadVeiculo.Visualizar := False;
  frmCadVeiculo.Show;

  frmCadVeiculo.btnIncluir.Click;
end;

procedure TfrmConVeiculo.btnVisualizarClick(Sender: TObject);
begin
  if not qryVeiculo.IsEmpty then
  begin
    frmPrincipal.Codigo := qryVeiculo.fields.FieldByName('VEIIDVEICULO').asinteger;

    frmCadVeiculo := TfrmCadVeiculo.Create(self);
    frmCadVeiculo.Parent := frmprincipal.pnlForms;
    frmCadVeiculo.Visualizar := True;
    frmCadVeiculo.dsVeiculoStateChange(self);
    frmCadVeiculo.Show;

    frmCadVeiculo.qryVeiculo.Open;
    frmCadVeiculo.qryVeiculo.Locate('VEIIDVEICULO', frmPrincipal.codigo, [loCaseInsensitive, loPartialKey]);

    frmConveiculo.close;
  end;
end;

procedure TfrmConVeiculo.cbFiltroChange(Sender: TObject);
begin
  case cbFiltro.ItemIndex of
    0: ColunaFiltro := 'VEIIDVEICULO';
    1: ColunaFiltro := 'VEIMARCA';
    2: ColunaFiltro := 'VEIMODELO';
    3: ColunaFiltro := 'VEIPLACA';
    4: ColunaFiltro := 'VEICHASSI';
  end;
end;

procedure TfrmConVeiculo.edtFiltroKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  qryVeiculo.Close;

  if Trim(edtFiltro.Text) <> '' then
  begin
    qryVeiculo.SQL.Strings[3] := 'AND ' + ColunaFiltro + ' LIKE ''%' + edtFiltro.Text + '%''';
  end
  else
  begin
    qryVeiculo.SQL.Strings[3] := '';
  end;

  qryVeiculo.Open;
end;

procedure TfrmConVeiculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryVeiculo.close;
end;

procedure TfrmConVeiculo.FormShow(Sender: TObject);
begin
  qryVeiculo.open;

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
    0: ColunaFiltro := 'VEIIDVEICULO';
    1: ColunaFiltro := 'VEIMARCA';
    2: ColunaFiltro := 'VEIMODELO';
    3: ColunaFiltro := 'VEIPLACA';
    4: ColunaFiltro := 'VEICHASSI';
  end;
end;

procedure TfrmConVeiculo.imgVoltarClick(Sender: TObject);
begin
  frmMenuPrincipal := TfrmMenuPrincipal.Create(self);
  frmMenuPrincipal.Parent := frmprincipal.pnlForms;
  frmMenuPrincipal.Show;

  frmConVeiculo.close;
end;

end.
