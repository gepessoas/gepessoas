program pCargaDescarga;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uCadVeiculo in 'uCadVeiculo.pas' {frmCadVeiculo},
  uConVeiculo in 'uConVeiculo.pas' {frmConVeiculo},
  uLogin in 'uLogin.pas' {frmLogin},
  uMenuPrincipal in 'uMenuPrincipal.pas' {frmMenuPrincipal},
  uConUsuario in 'uConUsuario.pas' {frmConUsuario},
  uCadUsuario in 'uCadUsuario.pas' {frmCadUsuario},
  uConProduto in 'uConProduto.pas' {frmConProduto},
  uCadProduto in 'uCadProduto.pas' {frmCadProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmCadUsuario, frmCadUsuario);
  Application.CreateForm(TfrmConProduto, frmConProduto);
  Application.CreateForm(TfrmCadProduto, frmCadProduto);
  Application.Run;
end.
