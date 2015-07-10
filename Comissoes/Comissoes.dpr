program Comissoes;

uses
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  Ini in 'Ini.pas' {frmIni},
  WaitI in 'WaitI.pas' {frmWaitI},
  Wait in 'Wait.pas' {frmWait},
  Pedido in 'Pedido.pas' {frmPedido},
  WaitR in 'WaitR.pas' {frmWaitR};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmIni, frmIni);
  Application.CreateForm(TfrmWaitI, frmWaitI);
  Application.CreateForm(TfrmWait, frmWait);
  Application.CreateForm(TfrmPedido, frmPedido);
  Application.CreateForm(TfrmWaitR, frmWaitR);
  Application.Run;
end.
