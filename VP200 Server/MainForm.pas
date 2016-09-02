unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Win.ScktComp;

type
  TForm1 = class(TForm)
    ButtonStartStop: TButton;
    MemoLog: TMemo;
    ServerSocket1: TServerSocket;
    Label1: TLabel;
    MemoData: TMemo;
    Label2: TLabel;
    procedure ButtonStartStopClick(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
//criado por Genilton Souza
{$R *.dfm}
uses VP200Commands;

//inicia o socket do servidor
procedure TForm1.ButtonStartStopClick(Sender: TObject);
begin
if(ServerSocket1.Active=false) then
begin
  ServerSocket1.Active := True;
  MemoLog.Text :=MemoLog.Text+'Servidor iniciado'+#13+#10;
  ButtonStartStop.Caption:='Parar';
end
else
begin
ServerSocket1.Active :=False;
MemoLog.Text:=MemoLog.Text+'Servidor parado'+#13+#10;
ButtonStartStop.Caption:='Inciar';
end;

end;

//mostra o ip do cliente conectado, estou mostrando somente o ip do primeiro vp200 conectado.
procedure TForm1.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
MemoLog.Text :=MemoLog.Text+'Cliente conectado, esperando por requisições...'+#13+#10;
MemoLog.Text :=MemoLog.Text+'ip conectado:'+ServerSocket1.Socket.Connections[0].RemoteAddress +#13+#10;
end;

procedure TForm1.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
if ServerSocket1.Socket.ActiveConnections-1=0 then
begin
MemoLog.Text :='Sem clientes ativos conectados'+#13+#10;
end;

end;

//quando há dados recebidos do cliente
procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
  var
  i:integer;
  Str:string;
  ipHost:string;
  portHost:Integer;
  begin
MemoData.Text:=MemoData.Text+'Cliente:'+Socket.RemoteAddress+#13+#10+'dados recebidos: '+Socket.ReceiveText+#13+#10;
//ipHost:=ServerSocket1.Socket.RemoteAddress;
//portHost:=ServerSocket1.Socket.RemotePort;

ipHost:=  Socket.RemoteAddress;
portHost:= Socket.RemotePort;
//monta a resposta exemplo,  para usa-lo comente o trecho abaixo e descomente esse trecho
//-------------------------------------------------------------------------------
{str:=VP200Commands.clearScreen();
str:=str+VP200Commands.normalFontSize();
str:=str+VP200Commands.text('Queijo');
str:=str+VP200Commands.enter();
str:=str+VP200Commands.text('500 mg');
str:=str+VP200Commands.largeFontSize();
str:=str+VP200Commands.alignRightBottom();
str:=str+VP200Commands.text('R$ 5.99');}
//------------------------------------------------------------------------------

//exemplo de resposta 2, para usa-lo comente o trecho acima e descomente o trecho abaixo
//-------------------------------------------------------------------------------
str:=VP200Commands.clearScreen();
str:=str+VP200Commands.largeFontSize();
str:=str+VP200Commands.alignCenterTop();
str:=str+VP200Commands.text('Oferta Especial');
str:=str+VP200Commands.normalFontSize();
str:=str+VP200Commands.alignCenter();
str:=str+VP200Commands.text('Agua 500 ml');
str:=str+VP200Commands.largeFontSize();
str:=str+VP200Commands.alignCenterBottom();
str:=str+VP200Commands.text('R$ 0.69');

//-------------------------------------------------------------------------------

MemoLog.Text :=MemoLog.Text +'Dado enviado'+#13+#10;

//envia a mensagem para  o host que enviou os dados...

for i:=0 to ServerSocket1.Socket.ActiveConnections-1 do
      if( (ServerSocket1.Socket.Connections[i].RemoteAddress = ipHost)
      and (ServerSocket1.Socket.Connections[i].RemotePort = portHost) )then
      begin
      ServerSocket1.Socket.Connections[i].SendText(str);
      end;
end;

end.
