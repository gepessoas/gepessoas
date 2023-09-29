unit uConUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TfrmConUsuario = class(TForm)
    qryUsuario: TADOQuery;
    dsUsuario: TDataSource;
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
    qryUsuarioUSUIdUsuario: TAutoIncField;
    qryUsuarioUSUNome: TStringField;
    qryUsuarioUSULogin: TStringField;
    qryUsuarioUSUSenha: TStringField;
    qryUsuarioUSUNivelAcesso: TStringField;
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
  frmConUsuario: TfrmConUsuario;

implementation

{$R *.dfm}

uses uPrincipal, uMenuPrincipal, uCadUsuario;

procedure TfrmConUsuario.btnEditarClick(Sender: TObject);
begin
  if not qryUsuario.IsEmpty then
  begin
    frmPrincipal.Codigo := qryUsuario.fields.FieldByName('USUIDUSUARIO').asinteger;

    frmCadUsuario := TfrmCadUsuario.Create(self);
    frmCadUsuario.Parent := frmprincipal.pnlForms;
    frmCadUsuario.Visualizar := False;
    frmCadUsuario.Show;

    frmCadUsuario.qryUsuario.Open;
    frmCadUsuario.qryUsuario.Locate('USUIDUSUARIO', frmPrincipal.codigo, [loCaseInsensitive, loPartialKey]);

    frmCadUsuario.btnEditar.Click;

    frmConUsuario.close;
  end;
end;

procedure TfrmConUsuario.btnExcluirClick(Sender: TObject);
begin
  if (not qryUsuario.IsEmpty) and (qryUsuarioUSUIDUSUARIO.value > 0) then
  begin
    if MessageDlg('Deseja deletar esse registro?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
    begin
      qryUsuario.delete;
    end;
  end;
end;

procedure TfrmConUsuario.btnFiltrarClick(Sender: TObject);
begin
  qryUsuario.Close;

  if Trim(edtFiltro.Text) <> '' then
  begin
    qryUsuario.SQL.Strings[3] := 'AND ' + ColunaFiltro + ' LIKE ''%' + edtFiltro.Text + '%''';
  end
  else
  begin
    qryUsuario.SQL.Strings[3] := '';
  end;

  qryUsuario.Open;
end;

procedure TfrmConUsuario.btnIncluirClick(Sender: TObject);
begin
  frmCadUsuario := TfrmCadUsuario.Create(self);
  frmCadUsuario.Parent := frmprincipal.pnlForms;
  frmCadUsuario.Visualizar := False;
  frmCadUsuario.Show;

  frmCadUsuario.btnIncluir.Click;
end;

procedure TfrmConUsuario.btnVisualizarClick(Sender: TObject);
begin
  if not qryUsuario.IsEmpty then
  begin
    frmPrincipal.Codigo := qryUsuario.fields.FieldByName('USUIDUSUARIO').asinteger;

    frmCadUsuario := TfrmCadUsuario.Create(self);
    frmCadUsuario.Parent := frmprincipal.pnlForms;
    frmCadUsuario.Visualizar := True;
    frmCadUsuario.dsUsuarioStateChange(self);
    frmCadUsuario.Show;

    frmCadUsuario.qryUsuario.Open;
    frmCadUsuario.qryUsuario.Locate('USUIDUSUARIO', frmPrincipal.codigo, [loCaseInsensitive, loPartialKey]);

    frmConUsuario.close;
  end;
end;

procedure TfrmConUsuario.cbFiltroChange(Sender: TObject);
begin
  case cbFiltro.ItemIndex of
    0: ColunaFiltro := 'USUIDUSUARIO';
    1: ColunaFiltro := 'USUNOME';
  end;
end;

procedure TfrmConUsuario.edtFiltroKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  qryUsuario.Close;

  if Trim(edtFiltro.Text) <> '' then
  begin
    qryUsuario.SQL.Strings[3] := 'AND ' + ColunaFiltro + ' LIKE ''%' + edtFiltro.Text + '%''';
  end
  else
  begin
    qryUsuario.SQL.Strings[3] := '';
  end;

  qryUsuario.Open;
end;

procedure TfrmConUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryUsuario.close;
end;

procedure TfrmConUsuario.FormShow(Sender: TObject);
begin
  qryUsuario.open;

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
    0: ColunaFiltro := 'USUIDUSUARIO';
    1: ColunaFiltro := 'USUNOME';
  end;
end;

procedure TfrmConUsuario.imgVoltarClick(Sender: TObject);
begin
  frmMenuPrincipal := TfrmMenuPrincipal.Create(self);
  frmMenuPrincipal.Parent := frmprincipal.pnlForms;
  frmMenuPrincipal.Show;

  frmConUsuario.close;
end;

end.
