unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.CategoryButtons,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, REST.Types, System.JSON, REST.Client,
  Vcl.OleCtrls, SHDocVw, Data.DB, Data.Win.ADODB;

type
  TfrmPrincipal = class(TForm)
    svMenuLateral: TSplitView;
    imgBgLogo: TImage;
    imgBgTopo: TImage;
    imgLogo: TImage;
    Label1: TLabel;
    Label2: TLabel;
    imgBgMenuLateral: TImage;
    pnlBotao1: TPanel;
    lblInicio: TLabel;
    imgInicio: TImage;
    pnlRiscoBranco1: TPanel;
    pnlBotao2: TPanel;
    lblCadastro: TLabel;
    imgCadastro: TImage;
    pnlRiscoBranco2: TPanel;
    pnlBotao3: TPanel;
    lblConsulta: TLabel;
    imgCarga: TImage;
    pnlRiscoBranco3: TPanel;
    pnlBotao4: TPanel;
    lblRelatorio: TLabel;
    imgConfiguracoes: TImage;
    pnlRiscoBranco4: TPanel;
    Panel2: TPanel;
    imgClima: TImage;
    lblClima: TLabel;
    Panel1: TPanel;
    Label7: TLabel;
    lblTemp: TLabel;
    lblEstado: TLabel;
    lblCidade: TLabel;
    Timer: TTimer;
    pnlTopo: TRelativePanel;
    pnlRelogio: TRelativePanel;
    RelativePanel1: TRelativePanel;
    lblRelogio: TLabel;
    imgMinimizar: TImage;
    imgFechar: TImage;
    pnlForms: TRelativePanel;
    Conexao: TADOConnection;
    pnlMenu1: TPanel;
    imgMenu1: TImage;
    pnlArmazem: TPanel;
    pnlLinhaArmazem: TPanel;
    pnlCliente: TPanel;
    pnlLinhaCliente: TPanel;
    pnlMotorista: TPanel;
    pnlLinhaMotorista: TPanel;
    pnlProduto: TPanel;
    pnlLinhaProduto: TPanel;
    pnlVeiculo: TPanel;
    pnlLinhaVeiculo: TPanel;
    pnlUsuario: TPanel;
    pnlLinhaUsuario: TPanel;
    procedure imgBgMenuLateralMouseEnter(Sender: TObject);
    procedure pnlBotao1MouseEnter(Sender: TObject);
    procedure pnlBotao1MouseLeave(Sender: TObject);
    procedure TrocarCorBotaoLateral(painel: TPanel; risco: TPanel; focado: Boolean);
    procedure imgInicioMouseEnter(Sender: TObject);
    procedure lblInicioMouseEnter(Sender: TObject);
    procedure lblInicioMouseLeave(Sender: TObject);
    procedure imgInicioMouseLeave(Sender: TObject);
    procedure pnlBotao2MouseEnter(Sender: TObject);
    procedure imgCadastroMouseEnter(Sender: TObject);
    procedure imgCadastroMouseLeave(Sender: TObject);
    procedure lblCadastroMouseEnter(Sender: TObject);
    procedure lblCadastroMouseLeave(Sender: TObject);
    procedure pnlBotao3MouseEnter(Sender: TObject);
    procedure pnlBotao3MouseLeave(Sender: TObject);
    procedure lblConsultaMouseEnter(Sender: TObject);
    procedure lblConsultaMouseLeave(Sender: TObject);
    procedure imgCargaMouseEnter(Sender: TObject);
    procedure imgCargaMouseLeave(Sender: TObject);
    procedure imgConfiguracoesMouseEnter(Sender: TObject);
    procedure imgConfiguracoesMouseLeave(Sender: TObject);
    procedure lblRelatorioMouseEnter(Sender: TObject);
    procedure lblRelatorioMouseLeave(Sender: TObject);
    procedure pnlBotao4MouseEnter(Sender: TObject);
    procedure pnlBotao4MouseLeave(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure imgFecharClick(Sender: TObject);
    procedure imgMinimizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnlBotao2Click(Sender: TObject);
    procedure pnlBotao3Click(Sender: TObject);
    procedure pnlBotao1Click(Sender: TObject);
    procedure lblCadastroClick(Sender: TObject);
    procedure imgCadastroClick(Sender: TObject);
    procedure pnlRiscoBranco2Click(Sender: TObject);
    procedure pnlMenu1MouseEnter(Sender: TObject);
    procedure pnlRiscoBranco2MouseEnter(Sender: TObject);
    procedure pnlRiscoBranco2MouseLeave(Sender: TObject);
    procedure pnlArmazemMouseEnter(Sender: TObject);
    procedure pnlClienteClick(Sender: TObject);
    procedure pnlMotoristaMouseEnter(Sender: TObject);
    procedure pnlProdutoMouseEnter(Sender: TObject);
    procedure pnlUsuarioMouseEnter(Sender: TObject);
    procedure pnlVeiculoMouseEnter(Sender: TObject);
    procedure pnlClienteMouseEnter(Sender: TObject);
    procedure imgMenu1MouseEnter(Sender: TObject);
    procedure pnlBotao2MouseLeave(Sender: TObject);
    procedure pnlFormsClick(Sender: TObject);
    procedure pnlBotao4Click(Sender: TObject);
    procedure imgConfiguracoesClick(Sender: TObject);
    procedure imgCargaClick(Sender: TObject);
    procedure imgInicioClick(Sender: TObject);
    procedure pnlFormsMouseEnter(Sender: TObject);
    procedure pnlVeiculoClick(Sender: TObject);
    procedure pnlLinhaClienteClick(Sender: TObject);
    procedure pnlLinhaVeiculoClick(Sender: TObject);
    procedure pnlArmazemMouseLeave(Sender: TObject);
    procedure pnlClienteMouseLeave(Sender: TObject);
    procedure pnlMotoristaMouseLeave(Sender: TObject);
    procedure pnlProdutoMouseLeave(Sender: TObject);
    procedure pnlUsuarioMouseLeave(Sender: TObject);
    procedure pnlVeiculoMouseLeave(Sender: TObject);
    procedure lblInicioClick(Sender: TObject);
    procedure pnlRiscoBranco1Click(Sender: TObject);
    procedure pnlUsuarioClick(Sender: TObject);
    procedure pnlProdutoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Latitude, Longitude, Clima, Temperatura, Cidade, Estado, URL: String;
  public
    { Public declarations }
    Codigo: integer;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadVeiculo, uConVeiculo, uMenuPrincipal, uCadastros, uConUsuario,
  uConProduto;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  region : hrgn;
begin
  region:= CreateRoundRectRgn(0, 0, width, height, 20, 20);
  setwindowrgn(handle, region, true);
end;

procedure TfrmPrincipal.imgInicioClick(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, false);
  pnlMenu1.Visible := False;

  frmMenuPrincipal := TfrmMenuPrincipal.Create(self);
  frmMenuPrincipal.Parent := pnlForms;
  frmMenuPrincipal.Show;
end;

procedure TfrmPrincipal.imgInicioMouseEnter(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao1, pnlRiscoBranco1, true);
end;

procedure TfrmPrincipal.imgInicioMouseLeave(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao1, pnlRiscoBranco1, false);
end;

procedure TfrmPrincipal.imgMenu1MouseEnter(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, true);
  pnlMenu1.Visible := True;
end;

procedure TfrmPrincipal.imgMinimizarClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TfrmPrincipal.imgConfiguracoesClick(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, false);
  pnlMenu1.Visible := False;
end;

procedure TfrmPrincipal.imgConfiguracoesMouseEnter(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao4, pnlRiscoBranco4, true);
end;

procedure TfrmPrincipal.imgConfiguracoesMouseLeave(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao4, pnlRiscoBranco4, true);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
  Client: TRESTClient;
  Request: TRESTRequest;
  Response: TRESTResponse;
  GeoIPResponse: TJSONObject;
  Weather, Daily: TJSONObject;
  ArrayDaily : TJSONArray;
  Lat, Lon : String;
  ClimaInt, i : Integer;
begin

  Client := TRESTClient.Create(nil);
  Request := TRESTRequest.Create(nil);
  Response := TRESTResponse.Create(nil);
  try
    Client.BaseURL := 'http://ip-api.com/json';
    Client.Authenticator := nil;
    Client.ContentType := 'application/json';
    Request.Client := Client;
    Request.Response := Response;
    Request.Resource := '';
    Request.Method := TRESTRequestMethod.rmGET;
    Request.Params.AddItem('ipAddress', 'me', TRESTRequestParameterKind.pkGETorPOST);
    Request.Execute;
    GeoIPResponse := TJSONObject.ParseJSONValue(Response.Content) as TJSONObject;
    try
      Latitude := GeoIPResponse.Get('lat').JsonValue.Value;
      Longitude := GeoIPResponse.Get('lon').JsonValue.Value;
      Cidade := GeoIPResponse.Get('city').JsonValue.Value;
      Estado := GeoIPResponse.Get('region').JsonValue.Value;
    finally
      GeoIPResponse.Free;
    end;
  finally
    Client.Free;
    Request.Free;
    Response.Free;
  end;

  Client := TRESTClient.Create(nil);
  Request := TRESTRequest.Create(nil);
  Response := TRESTResponse.Create(nil);
  try
    Lat:= StringReplace(Latitude, ',', '.', []);
    Lon:= StringReplace(Longitude, ',', '.', []);

    Client.BaseURL := 'api.open-meteo.com/v1/forecast?latitude=' + Lat + '&longitude=' + Lon + '&daily=weathercode&current_weather=true&forecast_days=1&timezone=auto';
    Client.Authenticator := nil;
    Client.ContentType := 'application/json';
    Request.Client := Client;
    Request.Response := Response;
    Request.Resource := '';
    Request.Method := TRESTRequestMethod.rmGET;
    Request.Execute;
    GeoIPResponse := TJSONObject.ParseJSONValue(Response.Content) as TJSONObject;
    try
      Weather     := GeoIPResponse.Get('current_weather').JsonValue as TJSONObject;
      Daily       := GeoIPResponse.Get('daily').JsonValue as TJSONObject;
      Temperatura := Weather.Get('temperature').JsonValue.value;
      ArrayDaily  := Daily.GetValue('weathercode') as TJSONArray;

      if ArrayDaily <> nil then
      begin
        for i := 0 to Pred(ArrayDaily.Count) do
        begin
          Clima := ArrayDaily.Items[i].Value;
        end;
      end;

    finally
      GeoIPResponse.Free;
    end;
  finally
    Client.Free;
    Request.Free;
    Response.Free;
  end;

  lblCidade.Caption := Cidade;
  lblEstado.Caption := Estado;
  lblTemp.Caption   := StringReplace(Temperatura, ',', '.', []);

  ClimaInt := StrtoInt(Clima);

  if (ClimaInt <= 1) then
  begin
    lblClima.caption := 'Céu Limpo';
    imgClima.Picture.LoadFromFile('../../Logos/Clima/ensolarado.png');
  end
  else
  if (ClimaInt = 2) or (ClimaInt = 3) then
  begin
    lblClima.caption := 'Nublado';
    imgClima.Picture.LoadFromFile('../../Logos/Clima/nublado.png');
  end
  else
  if (ClimaInt = 45) or (ClimaInt = 48) then
  begin
    lblClima.caption := 'Névoa';
    imgClima.Picture.LoadFromFile('../../Logos/Clima/nevoa.png');
  end
  else
  if (ClimaInt >= 51) or (ClimaInt <= 57) then
  begin
    lblClima.caption := 'Garoa';
    imgClima.Picture.LoadFromFile('../../Logos/Clima/garoa.png');
  end
  else
  if (ClimaInt >= 61) or (ClimaInt <= 67) then
  begin
    lblClima.caption := 'Chuva moderada';
    imgClima.Picture.LoadFromFile('../../Logos/Clima/chuva.png');
  end
  else
  if (ClimaInt >= 80) or (ClimaInt <= 82) then
  begin
    lblClima.caption := 'Pancadas de Chuva';
    imgClima.Picture.LoadFromFile('../../Logos/Clima/garoa.png');
  end
    else
  if (ClimaInt > 82) then
  begin
    lblClima.caption := 'Tempestade';
    imgClima.Picture.LoadFromFile('../../Logos/Clima/tempestade.png');
  end;


end;

procedure TfrmPrincipal.imgBgMenuLateralMouseEnter(Sender: TObject);
begin
  svMenuLateral.Open;
end;

procedure TfrmPrincipal.imgCadastroClick(Sender: TObject);
begin
  if pnlMenu1.Visible = False then
    pnlMenu1.Visible := True
  else
    pnlMenu1.Visible := False;
end;

procedure TfrmPrincipal.imgCadastroMouseEnter(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, true);
end;

procedure TfrmPrincipal.imgCadastroMouseLeave(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, false);
end;

procedure TfrmPrincipal.imgCargaClick(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, false);
  pnlMenu1.Visible := False;
end;

procedure TfrmPrincipal.imgCargaMouseEnter(Sender: TObject);
begin
    TrocarCorBotaoLateral(pnlBotao3, pnlRiscoBranco3, true);
end;

procedure TfrmPrincipal.imgCargaMouseLeave(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao3, pnlRiscoBranco3, false);
end;

procedure TfrmPrincipal.imgFecharClick(Sender: TObject);
begin
  Application.Terminate;
  Halt;
end;

procedure TfrmPrincipal.lblCadastroClick(Sender: TObject);
begin
  if pnlMenu1.Visible = False then
    pnlMenu1.Visible := True
  else
    pnlMenu1.Visible := False;
end;

procedure TfrmPrincipal.lblCadastroMouseEnter(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, true);
end;

procedure TfrmPrincipal.lblCadastroMouseLeave(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, false);
end;

procedure TfrmPrincipal.lblConsultaMouseEnter(Sender: TObject);
begin
    TrocarCorBotaoLateral(pnlBotao3, pnlRiscoBranco3, true);
end;

procedure TfrmPrincipal.lblConsultaMouseLeave(Sender: TObject);
begin
    TrocarCorBotaoLateral(pnlBotao3, pnlRiscoBranco3, false);
end;

procedure TfrmPrincipal.lblInicioClick(Sender: TObject);
begin
  frmMenuPrincipal := TfrmMenuPrincipal.Create(self);
  frmMenuPrincipal.Parent := pnlForms;
  frmMenuPrincipal.Show;
end;

procedure TfrmPrincipal.lblInicioMouseEnter(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao1, pnlRiscoBranco1, true);
end;

procedure TfrmPrincipal.lblInicioMouseLeave(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao1, pnlRiscoBranco1, false);
end;

procedure TfrmPrincipal.lblRelatorioMouseEnter(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao4, pnlRiscoBranco4, true);
end;

procedure TfrmPrincipal.lblRelatorioMouseLeave(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao4, pnlRiscoBranco4, false);
end;

procedure TfrmPrincipal.pnlArmazemMouseEnter(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, true);
  pnlMenu1.Visible := True;
  pnlLinhaArmazem.Visible := True;
end;

procedure TfrmPrincipal.pnlArmazemMouseLeave(Sender: TObject);
begin
  pnlLinhaArmazem.Visible := False;
end;

procedure TfrmPrincipal.pnlBotao1Click(Sender: TObject);
begin
  frmMenuPrincipal := TfrmMenuPrincipal.Create(self);
  frmMenuPrincipal.Parent := pnlForms;
  frmMenuPrincipal.Show;

  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, false);
  pnlMenu1.Visible := False;
end;

procedure TfrmPrincipal.pnlBotao1MouseEnter(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao1, pnlRiscoBranco1, true);
  pnlMenu1.Visible := False;
end;

procedure TfrmPrincipal.pnlBotao1MouseLeave(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao1, pnlRiscoBranco1, false);
end;

procedure TfrmPrincipal.pnlBotao2Click(Sender: TObject);
begin
  if pnlMenu1.Visible = False then
    pnlMenu1.Visible := True
  else
    pnlMenu1.Visible := False;
end;

procedure TfrmPrincipal.pnlBotao2MouseEnter(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, true);
end;

procedure TfrmPrincipal.pnlBotao2MouseLeave(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, false);

end;

procedure TfrmPrincipal.pnlBotao3Click(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, false);
  pnlMenu1.Visible := False;
end;

procedure TfrmPrincipal.pnlBotao3MouseEnter(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao3, pnlRiscoBranco3, true);
  pnlMenu1.Visible := False;
end;

procedure TfrmPrincipal.pnlBotao3MouseLeave(Sender: TObject);
begin
    TrocarCorBotaoLateral(pnlBotao3, pnlRiscoBranco3, false);
end;

procedure TfrmPrincipal.pnlBotao4Click(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, false);
  pnlMenu1.Visible := False;
end;

procedure TfrmPrincipal.pnlBotao4MouseEnter(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao4, pnlRiscoBranco4, true);
  pnlMenu1.Visible := False;
end;

procedure TfrmPrincipal.pnlBotao4MouseLeave(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao4, pnlRiscoBranco4, false);
  pnlMenu1.Visible := False;
end;

procedure TfrmPrincipal.pnlClienteClick(Sender: TObject);
begin
  frmConVeiculo := TfrmConVeiculo.Create(self);
  frmConVeiculo.Parent := pnlForms;

  frmConVeiculo.Show;
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, true);
end;

procedure TfrmPrincipal.pnlClienteMouseEnter(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, true);
  pnlMenu1.Visible := True;

  pnlLinhaCliente.Visible := True;
end;

procedure TfrmPrincipal.pnlClienteMouseLeave(Sender: TObject);
begin
  pnlLinhaCliente.Visible := False;
end;

procedure TfrmPrincipal.pnlFormsClick(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, false);
  pnlMenu1.Visible := False;
end;

procedure TfrmPrincipal.pnlFormsMouseEnter(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, false);
  pnlMenu1.Visible := False;
end;

procedure TfrmPrincipal.pnlLinhaClienteClick(Sender: TObject);
begin
  frmConVeiculo := TfrmConVeiculo.Create(self);
  frmConVeiculo.Parent := pnlForms;
  frmConVeiculo.Show;
end;

procedure TfrmPrincipal.pnlLinhaVeiculoClick(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, false);
  pnlMenu1.Visible := False;
end;

procedure TfrmPrincipal.pnlMenu1MouseEnter(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, true);
  pnlMenu1.Visible := True;
end;

procedure TfrmPrincipal.pnlMotoristaMouseEnter(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, true);
  pnlMenu1.Visible := True;

  pnlLinhaMotorista.Visible := True;
end;

procedure TfrmPrincipal.pnlMotoristaMouseLeave(Sender: TObject);
begin
  pnlLinhaMotorista.Visible := False;
end;

procedure TfrmPrincipal.pnlProdutoClick(Sender: TObject);
begin
  frmConProduto := TfrmConProduto.Create(self);
  frmConProduto.Parent := pnlForms;
  frmConProduto.Show;

  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, false);
  pnlMenu1.Visible := False;
end;

procedure TfrmPrincipal.pnlProdutoMouseEnter(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, true);
  pnlMenu1.Visible := True;

  pnlLinhaProduto.Visible := True;
end;

procedure TfrmPrincipal.pnlProdutoMouseLeave(Sender: TObject);
begin
  pnlLinhaProduto.Visible := False;
end;

procedure TfrmPrincipal.pnlRiscoBranco1Click(Sender: TObject);
begin
  frmMenuPrincipal := TfrmMenuPrincipal.Create(self);
  frmMenuPrincipal.Parent := pnlForms;
  frmMenuPrincipal.Show;
end;

procedure TfrmPrincipal.pnlRiscoBranco2Click(Sender: TObject);
begin
  if pnlMenu1.Visible = False then
    pnlMenu1.Visible := True
  else
    pnlMenu1.Visible := False;
end;

procedure TfrmPrincipal.pnlRiscoBranco2MouseEnter(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, true);
end;

procedure TfrmPrincipal.pnlRiscoBranco2MouseLeave(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, false);
end;

procedure TfrmPrincipal.pnlUsuarioClick(Sender: TObject);
begin
  frmConUsuario := TfrmConUsuario.Create(self);
  frmConUsuario.Parent := pnlForms;
  frmConUsuario.Show;

  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, false);
  pnlMenu1.Visible := False;
end;

procedure TfrmPrincipal.pnlUsuarioMouseEnter(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, true);
  pnlMenu1.Visible := True;

  pnlLinhaUsuario.Visible := True;
end;

procedure TfrmPrincipal.pnlUsuarioMouseLeave(Sender: TObject);
begin
  pnlLinhaUsuario.Visible := False;
end;

procedure TfrmPrincipal.pnlVeiculoClick(Sender: TObject);
begin
  frmConVeiculo := TfrmConVeiculo.Create(self);
  frmConVeiculo.Parent := pnlForms;
  frmConVeiculo.Show;

  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, false);
  pnlMenu1.Visible := False;
end;

procedure TfrmPrincipal.pnlVeiculoMouseEnter(Sender: TObject);
begin
  TrocarCorBotaoLateral(pnlBotao2, pnlRiscoBranco2, true);
  pnlMenu1.Visible := True;

  pnlLinhaVeiculo.Visible := True;
end;

procedure TfrmPrincipal.pnlVeiculoMouseLeave(Sender: TObject);
begin
  pnlLinhaVeiculo.Visible := False;
end;

procedure TfrmPrincipal.TimerTimer(Sender: TObject);
begin
  lblRelogio.Caption := TimeToStr(Time);
end;

procedure TfrmPrincipal.TrocarCorBotaoLateral(painel: TPanel; risco: TPanel; focado: Boolean);
begin
  if focado = true then
  begin
    painel.Color := clWindowFrame;
    risco.Visible := True;

    if (svMenuLateral.Opened = False) then
      svMenuLateral.Open;
  end
  else
  begin
    painel.Color := clGray;
    svMenuLateral.Close;
    risco.Visible := False;
  end;

end;

end.
