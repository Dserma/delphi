unit Ini;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Data.DB,
  Data.Win.ADODB, System.Win.Registry, System.IniFiles, Vcl.Samples.Gauges,
  Vcl.StdCtrls, Vcl.ExtCtrls, Activex, WaitI, RLConsts;

type
  TfrmIni = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Conexao: TADOConnection;
  end;

type
  tE = class(TThread)
  private
  protected
    procedure Execute; override;
  public
    procedure atualizaRepresentantes();

end;

var
  frmIni: TfrmIni;

implementation

{$R *.dfm}

uses Main;

procedure tE.Execute;
begin
  atualizaRepresentantes();
end;


procedure tE.atualizaRepresentantes;
var
  sql, sql1, sql2, sql3: TADOQuery;
  idP, idR: String;

begin

  tE.SetReturnValue(1);
  CoInitializeEx (nil, 0);

  sql:= TADOQuery.Create(frmIni);
  sql.Connection:= frmIni.Conexao;
  sql.SQL.Text:= 'SELECT TOP 1 P.IdPessoa FROM Pessoa P JOIN PessoaCategoria PC ON Pc.IdPessoa = P.IdPessoa WHERE PC.IdCategoria = ''0000000004''  AND P.NmCurto <> '''' ORDER BY IdPessoa DESC';
  sql.Active:= true;
  sql.Open;

  idP:= sql.FieldByName('Idpessoa').AsString;

  sql1:= TADOQuery.Create(frmIni);
  sql1.Connection:= frmIni.Conexao;
  sql1.SQL.Text:= 'SELECT TOP 1 IdRepresentante FROM Metas ORDER BY IdRepresentante DESC';
  sql1.Active:= true;
  sql1.Open;

  idR:= sql1.FieldByName('IdRepresentante').AsString;

  if idP <> idR then
  begin

    sql2:= TADOQuery.Create(frmIni);
    sql2.Connection:= frmIni.Conexao;
    sql2.SQL.Text:= 'SELECT P.IdPessoa, P.NmCurto FROM Pessoa P JOIN PessoaCategoria PC ON Pc.IdPessoa = P.IdPessoa WHERE P.IdPessoa > '''+idR+''' AND PC.IdCategoria = ''0000000004'' AND P.NmCurto <> '''' ORDER BY IdPessoa DESC';
    sql2.Active:= true;
    sql2.Open;

    frmWaitI.lblV.Refresh;
    frmWaitI.bar.MaxValue:= sql2.RecordCount;

    sql3:= TADOQuery.Create(frmIni);
    sql3.Connection:= frmIni.Conexao;

    sql2.First;

    while not sql2.Eof do
    begin

      sql3.SQL.Text:= 'INSERT INTO Metas ( IdRepresentante ) VALUES ('''+sql2.FieldByName('IdPessoa').AsString+''' )';
      sql3.ExecSQL;
      frmWaitI.bar.Progress:= sql2.RecNo;
      sql2.Next;
     
    end;

  end;

end;





procedure TfrmIni.FormCreate(Sender: TObject);
var
  Reg: TRegistry;
  ini: TIniFile;
  tt: tE;
  r: Integer;
  caminho: String;
  conStr: String;
  server, banco, user: String;
begin

  rlconsts.setversion(3,71,'B');

  Reg:= TRegistry.Create;
  Reg.RootKey:= HKEY_CURRENT_USER;
  if Reg.OpenKey('Software\Alterdata\ERP', false) then
  begin

    if ParamCount > 0 then
    begin

      caminho:= Reg.ReadString('DiretorioERP');

      if caminho = '' then
      begin

        Application.MessageBox('Caminho do banco de dados em branco!', 'Gerenciamento de Comissões', MB_OK + MB_ICONEXCLAMATION);
        Application.ShowMainForm:= false;
        Application.Terminate;

      end
      else
      begin

        ini:= TIniFile.Create(caminho + '\ERP.ini');

        server:= ini.ReadString(Copy(ParamStr(1),3, Length(ParamStr(1))), 'SERVER NAME', '');
        banco:= ini.ReadString(Copy(ParamStr(1),3, Length(ParamStr(1))), 'DATABASE NAME', '');
        user:= Copy(ParamStr(2),3, Length(ParamStr(2)) );

        if user = 'SUPERVISOR' then
        begin
          user := 'sa';
        end;

        conStr:= 'Provider=SQLOLEDB.1;Password='+Copy(ParamStr(3),3, Length(ParamStr(1)))+';Persist Security Info=True;User ID='+user+';Initial Catalog='+banco+';Data Source='+server+';Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;'+
        'Use Encryption for Data=False;Tag with column collation when possible=False';

        frmIni.Conexao                   := TADOConnection.Create(frmIni);
        frmIni.Conexao.Name              := 'Conexao';
        frmIni.Conexao.LoginPrompt       := false;
        frmIni.Conexao.KeepConnection    := true;
        frmIni.Conexao.Provider          := 'SQLOLEDB.1';
        frmIni.Conexao.ConnectionString  := conStr;
        frmIni.Conexao.Open();

        frmWaitI := TfrmWaitI.Create(nil);
        frmWaitI.Show;
        frmWaitI.Repaint;
        frmWaitI.Refresh;
        tt:= tE.Create(false);
        tt.Resume;
        while WaitForSingleObject(tt.Handle, 50) = WAIT_TIMEOUT do
        Application.ProcessMessages;

          frmWaitI.Close;
          Application.CreateForm(TfrmMain, frmMain);
          frmMain.show;

      end
    end
  else
  begin

    Application.MessageBox('Essa aplicação só pode ser aberta dentro do ERP!', 'Gerenciamento de Comissões', MB_OK + MB_ICONEXCLAMATION);
    Application.ShowMainForm:= false;
    Application.Terminate;

  end;
  end
  else
  begin

    Application.MessageBox('Caminho do servidor não encontrado!'+#13+'A aplicação será fechada.', 'Gerenciamento de Comissões', MB_OK + MB_ICONEXCLAMATION);
    Application.ShowMainForm:= false;
    Application.Terminate;

  end;

end;

end.
