unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxStatusBar,
  cxPCdxBarPopupMenu, cxPC, cxContainer, cxEdit, cxGroupBox, Vcl.StdCtrls,
  cxLabel, Activex, System.Win.Registry, System.Inifiles, Data.DB,
  Data.Win.ADODB, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxClasses, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Ini,
  cxCurrencyEdit, cxGridStrs, cxMaskEdit, cxTextEdit, Vcl.ImgList,
  Vcl.Touch.Keyboard, Vcl.Menus, cxButtons, Rel, Datasnap.DBClient, Wait,
  cxSchedulerStorage, cxSchedulerCustomControls, cxSchedulerDateNavigator,
  cxDateNavigator, dxCore, cxDateUtils, cxDropDownEdit, cxCalendar, Vcl.Imaging.GIFImg,
  ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppPrnabl,
  ppCtrls, ppBands, ppCache, ppDesignLayer, ppParameter, ppArchiv, ppDBArchiv,
  ppEndUsr, ppViewr, Pedido, Vcl.Buttons, cxEditRepositoryItems, cxCheckBox, WaitR,
  Vcl.Samples.Gauges;

type
  TMyObj = class(TObject)
  Index: Integer;
  Text: String;
end;

type
  tE = class(TThread)
  private
    function pesquisaPedidos: TDataSource;
  protected
    procedure Execute; override;
  public
    srcP: TDataSource;
end;

type
  tE1 = class(TThread)
  private
    procedure pegaRepresentanteZ;
  protected
    procedure Execute; override;
  public
end;

type
  tE2 = class(TThread)
  private
    procedure pegaPedidosZipping;
  protected
    procedure Execute; override;
  public
end;

type
  TfrmMain = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    imgs: TImageList;
    menu: TMainMenu;
    Imprimir1: TMenuItem;
    Sair1: TMenuItem;
    Metas1: TMenuItem;
    Faixas1: TMenuItem;
    report: TppReport;
    pipe: TppDBPipeline;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppDBText2: TppDBText;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ppLine2: TppLine;
    Panel1: TPanel;
    stBar: TdxStatusBar;
    page: TcxPageControl;
    tabCo: TcxTabSheet;
    Panel4: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    gridCo: TcxGrid;
    tableCo: TcxGridDBTableView;
    fRepresentanteCo: TcxGridDBColumn;
    fMesreferencia: TcxGridDBColumn;
    fMetames: TcxGridDBColumn;
    fTotalvendas: TcxGridDBColumn;
    fTotalfaturado: TcxGridDBColumn;
    fPercentualcomissao: TcxGridDBColumn;
    fComissaopaga: TcxGridDBColumn;
    fComissaoretida: TcxGridDBColumn;
    gridCoLevel1: TcxGridLevel;
    cmbRepC: TComboBoxEx;
    txtMes: TcxMaskEdit;
    btnPesqC: TcxButton;
    tabR: TcxTabSheet;
    panelTabM: TPanel;
    gridR: TcxGrid;
    tableR: TcxGridDBTableView;
    fRepresentante: TcxGridDBColumn;
    fMeta: TcxGridDBColumn;
    fIdRepresentante: TcxGridDBColumn;
    gridRgridRLevel1: TcxGridLevel;
    tabF: TcxTabSheet;
    panelTabF: TPanel;
    gridF: TcxGrid;
    tableF: TcxGridDBTableView;
    fFaixa: TcxGridDBColumn;
    fPercentual: TcxGridDBColumn;
    fComissao: TcxGridDBColumn;
    gridFLevel1: TcxGridLevel;
    TabC: TcxTabSheet;
    Panel2: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    gridC: TcxGrid;
    tableC: TcxGridDBTableView;
    fPedido: TcxGridDBColumn;
    fCliente: TcxGridDBColumn;
    fDtemissao: TcxGridDBColumn;
    fStatus: TcxGridDBColumn;
    fVlpedido: TcxGridDBColumn;
    fIdpedido: TcxGridDBColumn;
    gridCLevel1: TcxGridLevel;
    data: TDateTimePicker;
    btnPesq: TcxButton;
    cxGroupBox1: TcxGroupBox;
    lblTA: TLabel;
    lblTF: TLabel;
    lblT: TLabel;
    lblM: TLabel;
    lblBm: TLabel;
    lblP: TLabel;
    lblTaTxt: TLabel;
    lblTfTxt: TLabel;
    lblTvTxt: TLabel;
    lblMaTxt: TLabel;
    lblBmTxt: TLabel;
    lblPmTxt: TLabel;
    lblFaTxt: TLabel;
    lblCeTxt: TLabel;
    lblVcTxt: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lblCpTxt: TLabel;
    lblCrTxt: TLabel;
    cxGroupBox2: TcxGroupBox;
    Label11: TLabel;
    Label15: TLabel;
    chkNf: TCheckBox;
    txtDesc: TEdit;
    Memo1: TMemo;
    btnCalc: TcxButton;
    btnFc: TcxButton;
    cmbRep: TComboBoxEx;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    tabRz: TcxTabSheet;
    Panel5: TPanel;
    cxButton1: TcxButton;
    tableRz: TcxGridDBTableView;
    gridRzLevel1: TcxGridLevel;
    gridRz: TcxGrid;
    fIdrepresentanteZ: TcxGridDBColumn;
    fNmrepresentante: TcxGridDBColumn;
    rI: TcxEditRepository;
    cmbRepG: TcxEditRepositoryComboBoxItem;
    fIdrepresentanteG: TcxGridDBColumn;
    tabPz: TcxTabSheet;
    Panel6: TPanel;
    tabGu: TcxTabSheet;
    Panel7: TPanel;
    tableGu: TcxGridDBTableView;
    gridGuLevel1: TcxGridLevel;
    gridGu: TcxGrid;
    fUf: TcxGridDBColumn;
    fNmgerente: TcxGridDBColumn;
    cmbGerente: TcxEditRepositoryComboBoxItem;
    tacCg: TcxTabSheet;
    Panel8: TPanel;
    cxButton2: TcxButton;
    btnCpz: TcxButton;
    cxGroupBox3: TcxGroupBox;
    Label18: TLabel;
    dataZ: TDateTimePicker;
    barP: TGauge;
    Label19: TLabel;
    lblRep: TLabel;
    label25: TLabel;
    lblPe: TLabel;
    Label20: TLabel;
    lblPp: TLabel;
    barPp: TGauge;
    Label21: TLabel;
    procedure pageDrawTabEx(AControl: TcxCustomTabControl; ATab: TcxTab;
      Font: TFont);
    procedure FormCreate(Sender: TObject);
    procedure tabFShow(Sender: TObject);
    procedure btnPesqClick(Sender: TObject);
    procedure Metas1Click(Sender: TObject);
    procedure cmbRepSelect(Sender: TObject);
    procedure fStatusGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure tableCDblClick(Sender: TObject);
    procedure chkNfClick(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
    procedure cmbRepCSelect(Sender: TObject);
    procedure txtMesKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesqCClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure fIdrepresentanteGPropertiesEditValueChanged(Sender: TObject);
    procedure cmbRepGPropertiesCloseUp(Sender: TObject);
    procedure tabGuShow(Sender: TObject);
    procedure cmbGerentePropertiesEditValueChanged(Sender: TObject);
    procedure btnCpzClick(Sender: TObject);

  private
    procedure mostra(Sender: TObject);
  { Private declarations }
  public
    tA, tF, tV, cP, cR, ptC: Double;
    pA, pF: String;
    Conexao: TADOConnection;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}


procedure tE.Execute;
begin
  pesquisaPedidos();
end;

procedure TfrmMain.chkNfClick(Sender: TObject);
var
  m: Integer;
  tC: Double;
begin

  if chkNf.Checked = true then
  begin

    m:= Application.MessageBox('ATENÇÃO! Isso fará com que o sistema abata 1,5% da Comissão a Pagar, devido ao IR.' + #13 + 'Confirma?', 'Gerenciamento de Comissões', MB_YESNO + MB_ICONINFORMATION);
    if m = 6 then
    begin

        cP:= (cP - ( ( cP / 100) * 1.5 ) );
        lblCpTxt.Caption:= FloatToStrF( cP , ffCurrency, 10,2 );

    end
    else
    begin

      chkNf.Checked:= false;

    end;

  end
  else
    begin

      cP:= (( tF * ( 5 + ptC ) / 100) );

      if txtDesc.Text <> '' then
      begin

        cP:= ( cP - StrToFloat( txtDesc.Text ) );

      end;

      lblCpTxt.Caption:= FloatToStrF( cP , ffCurrency, 10,2 );

    end;

end;

procedure TfrmMain.cmbGerentePropertiesEditValueChanged(Sender: TObject);
var
  obj: TMyObj;
  i,z: Integer;
  row: Integer;
  valor: String;
  sql: TADOQuery;
begin

  row:= tableGu.ViewData.DataController.GetSelectedRowIndex(0);
  valor:= tableGu.ViewData.Records[Row].Values[tableGu.GetColumnByFieldName('IdUf').Index];
  i:= TcxComboBox(sender).ItemIndex;
  obj:= TMyObj( TcxComboBox(sender).ItemObject );

  if obj.Text <> '' then
  begin

    sql:= TADOQuery.Create(Self);
    sql.Connection:= frmIni.Conexao;
    sql.SQL.Text:= 'UPDATE GerenteUF SET IdGerente = ''' + obj.Text + ''' WHERE IdUf = ''' + valor + ''' ';
    sql.ExecSQL;

  end;


end;

procedure TfrmMain.cmbRepCSelect(Sender: TObject);
begin

  btnPesqC.Enabled:= true;
  txtMes.SetFocus;

end;

procedure TfrmMain.cmbRepGPropertiesCloseUp(Sender: TObject);
var
  obj: TMyObj;
  i,z: Integer;
  row: Integer;
  valor: String;
  sql: TADOQuery;
begin



  row:= tableRz.ViewData.DataController.GetSelectedRowIndex(0);
  valor:= tableRz.ViewData.Records[Row].Values[tableRz.GetColumnByFieldName('IdRepresentanteZ').Index];
  i:= TcxComboBox(sender).ItemIndex;
  obj:= TMyObj( TcxComboBox(sender).ItemObject );

  sql:= TADOQuery.Create(Self);
  sql.Connection:= frmIni.Conexao;
  sql.SQL.Text:= 'UPDATE RepresentanteZipping SET IdRepresentante = ''' + obj.Text + ''' WHERE IdRepresentanteZ = ''' + valor + ''' ';
  sql.ExecSQL;


end;

procedure TfrmMain.cmbRepSelect(Sender: TObject);
begin

  data.Enabled:= true;
  btnPesq.Enabled:= true;
  data.SetFocus;

end;

procedure TfrmMain.cxButton1Click(Sender: TObject);
var
  tZ: tE1;
  sql: TADOQuery;
  src: TDataSource;

begin

  frmWaitR := TfrmWaitR.Create(nil);
  frmWaitR.Show;
  frmWaitR.Repaint;
  frmWaitR.Refresh;
  tZ:= tE1.Create(false);
  tZ.Resume;
  while WaitForSingleObject(tZ.Handle, 50) = WAIT_TIMEOUT do
  Application.ProcessMessages;

  sql:= TADOQuery.Create(Self);
  sql.Connection:= frmIni.Conexao;
  sql.SQL.Text:= 'SELECT * FROM RepresentanteZipping ORDER BY NmRepresentanteZ';
  sql.Open;

  src:= TDataSource.Create(Self);
  src.DataSet:= sql;

  tableRz.DataController.DataSource:= src;

  fIdrepresentanteZ.DataBinding.FieldName:= 'IdRepresentanteZ';
  fIdrepresentanteZ.DataBinding.ValueType:= 'String';

  fNmrepresentante.DataBinding.FieldName:= 'NmRepresentanteZ';
  fNmrepresentante.DataBinding.ValueType:= 'String';

  frmWaitR.Close;


end;

procedure TfrmMain.fIdrepresentanteGPropertiesEditValueChanged(Sender: TObject);
var
  obj: TMyObj;
  i: Integer;
  row: Integer;
  valor: String;
  sql: TADOQuery;
begin

  row:= tableRz.ViewData.DataController.GetSelectedRowIndex(0);
  valor:= tableRz.ViewData.Records[Row].Values[tableRz.GetColumnByFieldName('IdRepresentanteZ').Index];
  i:= TcxComboBox(sender).ItemIndex;
  obj:= TMyObj( TcxComboBox(sender).ItemObject );

  sql:= TADOQuery.Create(Self);
  sql.Connection:= frmIni.Conexao;
  sql.SQL.Text:= 'UPDATE RepresentanteZipping SET IdRepresentante = ''' + obj.Text + ''' WHERE IdRepresentanteZ = ''' + valor + ''' ';
  sql.ExecSQL;

end;

procedure tE1.Execute;
begin

  pegaRepresentanteZ();

end;

procedure tE1.pegaRepresentanteZ();
var
  conn: TADOConnection;
  sql, sql1, sql2, sql3, sqlR: TADOQuery;
  conStr: String;
  i: integer;
begin

  conStr:= 'Provider=SQLOLEDB.1;Password=zipping@01;Persist Security Info=True;User ID=sa;Initial Catalog=ZIPPING;Data Source=zipping.ddns.net,9090;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;'+
        'Use Encryption for Data=False;Tag with column collation when possible=False';

  conn                   := TADOConnection.Create(frmMain);
  conn.Name              := 'Conexao';
  conn.LoginPrompt       := false;
  conn.KeepConnection    := true;
  conn.Provider          := 'SQLOLEDB.1';
  conn.ConnectionString  := conStr;
  conn.Open();

  sql:= TADOQuery.Create(frmMain);
  sql.Connection:= conn;
  sql.SQL.Text:= 'SELECT TOP 1 P.IdPessoa, P.NmCurto FROM Pessoa P JOIN Representante R ON R.IdPessoaRepresentante = P.IdPessoa WHERE P.NmPessoa LIKE ''GERA TAPETES%'' ORDER BY P.IdPessoa DESC ';
  sql.Open;

  sqlR:= TADOQuery.Create(frmMain);
  sqlR.Connection:= frmIni.Conexao;
  sqlR.SQL.Text:= 'SELECT TOP 1 IdRepresentanteZ FROM RepresentanteZipping ORDER BY IdRepresentanteZ DESC';
  sqlR.Open;

  if (sql.FieldByName('IdPessoa').AsString <> sqlR.FieldByName('IdRepresentanteZ').AsString ) then
  begin

    sql2:= TADOQuery.Create(frmMain);
    sql2.Connection:= conn;
    sql2.SQL.Text:= 'SELECT P.IdPessoa, P.NmCurto FROM Pessoa P JOIN Representante R ON R.IdPessoaRepresentante = P.IdPessoa WHERE P.NmPessoa LIKE ''GERA TAPETES%'' AND IdPessoa > ''' + sqlR.FieldByName('IdRepresentanteZ').AsString + ''' ORDER BY P.IdPessoa DESC';
    sql2.Open;
    sql2.First;

    frmWaitR.bar.MaxValue:= sql2.RecordCount;
    i:= 0;

    sql3:= TADOQuery.Create(frmMain);
    sql3.Connection:= frmIni.Conexao;

    while not sql2.Eof do
    begin

        sql3.SQL.Text:= 'INSERT INTO RepresentanteZipping ( IdRepresentanteZ, NmRepresentanteZ ) VALUES (''' + sql2.FieldByName('IdPessoa').AsString + ''', ''' + sql2.FieldByName('NmCurto').AsString + ''' )';
        sql3.ExecSQL;
        frmWaitR.bar.Progress:= i;
        i:= i + 1;
        sql2.Next;

    end;


  end;

  conn.Destroy;

end;

procedure TfrmMain.btnCalcClick(Sender: TObject);
var
  txt: String;
  dc: Double;
begin

  txt:= txtDesc.Text;

  if txt <> '' then
  begin

    dc:= StrToFloat(txt);
    cP:= (cP - dc);
    lblCpTxt.Caption:= FloatToStrF( cP, ffCurrency, 10,2 );

  end
  else
  begin

    cP:= (( tF * ( 5 + ptC ) / 100) );

    if chkNf.Checked = true then
    begin

      cP:= (cP - ( ( cP / 100) * 1.5 ) );

    end;

    lblCpTxt.Caption:= FloatToStrF( cP, ffCurrency, 10,2 );

  end;

end;

procedure TfrmMain.btnCpzClick(Sender: TObject);
var
  tPz: tE2;
  m: Integer;
begin

  m:= Application.MessageBox('ATENÇÃO! Este processo pode demorar! ' + #13 + 'Confirma?', 'Gerenciamento de Comissões', MB_YESNO + MB_ICONQUESTION);

  if m = 6 then
  begin

    tPz:= tE2.Create(false);
    tPz.Resume;
    while WaitForSingleObject(tPz.Handle, 50) = WAIT_TIMEOUT do
    Application.ProcessMessages;

  end;

end;

procedure tE2.Execute;
begin

  pegaPedidosZipping;

end;

procedure tE2.pegaPedidosZipping();
var
  conn: TADOConnection;
  i: Integer;
  v: TMyObj;
  sql, sqlP, sqlPd, sqlPdi, sqlIp, sqlIpi: TADOQuery;
  conStr: String;
  m, pg, pg1: Integer;
  lista, d, di, df, dia: String;
  list: TStringList;
begin

  CoInitializeEx (nil, 0);

  conStr:= 'Provider=SQLOLEDB.1;Password=zipping@01;Persist Security Info=True;User ID=sa;Initial Catalog=ZIPPING;Data Source=zipping.ddns.net,9090;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;'+
        'Use Encryption for Data=False;Tag with column collation when possible=False';

  conn                   := TADOConnection.Create(frmMain);
  conn.Name              := 'Conexao';
  conn.LoginPrompt       := false;
  conn.KeepConnection    := true;
  conn.Provider          := 'SQLOLEDB.1';
  conn.ConnectionString  := conStr;
  conn.Open();

  sql:= TADOQuery.Create(frmMain);
  sql.Connection:= frmIni.Conexao;
  sql.SQL.Text:= 'SELECT IdRepresentanteZ, NmRepresentanteZ FROM RepresentanteZipping WHERE IdRepresentante <> '''' ';
  sql.Open;
  sql.First;

  frmMain.barP.MaxValue:= sql.RecordCount;
  pg1:= 0;

  sqlP:= TADOQuery.Create(frmMain);
  sqlP.Connection:= Conn;

  while not sql.Eof do
  begin

    frmMain.lblRep.Caption:= sql.FieldByName('NmRepresentanteZ').AsString;
    sqlP.SQL.Text:= 'SELECT IdPessoa FROM PessoaRelacionada WHERE IdCategoriaPessoaRelacionada = ''0000000004'' AND IdCategoriaPessoa = ''0000000005'' AND IdPessoaRelacionada = '''+sql.FieldByName('IdRepresentanteZ').AsString+''' ';
    sqlP.Open;
    sqlP.First;
    lista:= '';

    while not sqlP.Eof do
    begin

      lista:= lista + '''' + sqlP.FieldByName('IdPessoa').AsString + ''',';
      sqlP.Next;

    end;

    if lista.Length > 0 then
    begin

      lista:= '(' + lista;
      lista:= Copy(lista,0, (lista.Length - 1));
      lista:= lista + ')';

      d:= DateToStr( frmMain.dataZ.Date );

      List := TStringList.Create;
      List.Clear;
      ExtractStrings(['/'],[], PChar(d), List);

      di:= List[2] + '-' + List[1] + '-' + '01';

      if (List[1] = '01') OR (List[1] = '03') OR (List[1] = '05') OR (List[1] = '07') OR (List[1] = '08') OR (List[1] = '10') OR (List[1] = '12')then
      begin

       dia:= '31';

      end;

      if (List[1] = '02') then
      begin

        if IsLeapYear( StrToInt( List[2] ) ) then
        begin

           dia:= '29';

        end
        else
        begin

          dia:= '28';

        end;

      end;

      if (List[1] = '04') OR (List[1] = '06') OR (List[1] = '09') OR (List[1] = '11')then
      begin

       dia:= '30';

      end;


      df:= List[2] + '-' + List[1] + '-' + dia;

      sqlPd:= TADOQuery.Create(frmMain);
      sqlPd.Connection:= Conn;
      SqlPd.SQL.Clear;
      sqlPd.SQL.Text:= 'SELECT PV.IdPedidoDeVenda, PV.CdChamada, PV.StPedidoDeVenda, PV.DtEmissao, SUM(PVI.VlItem) as Total, P.NmPessoa FROM PedidoDeVenda PV JOIN Pessoa P ON PV.IdPessoaCLiente = P.IdPessoa '+
      'JOIN PedidoDeVendaItem PVI ON PVI.IdPedidoDeVenda = PV.IdPedidoDeVenda WHERE DtEmissao BETWEEN ''' + di + ''' AND ''' + df + ''' '+
      ' AND PV.StPedidoDeVenda <> ''C'' AND IdPessoaCliente IN ' + lista + ' GROUP BY PV.IdPedidoDeVenda, PV.CdChamada,	PV.DtEmissao,	P.NmPessoa, PV.StPedidoDeVenda ORDER BY PV.DtEmissao ';
      sqlPd.Open;

      frmMain.lblPe.Caption:= IntToStr( sqlPd.RecordCount );
      frmMain.barPp.MaxValue:= sqlPd.RecordCount;

      pg:= 0;

      sqlPdi:= TADOQuery.Create(frmMain);
      sqlPdi.Connection:= Conn;

      while not sqlpD.Eof do
      begin

        sqlPdi.SQL.Text:= 'SELECT P.NmProduto, PVI.QtPedida23, PVI.VlUnitario, PVI.VlItem FROM PedidoDeVendaItem PVI JOIN Produto P ON P.IdProduto = PVI.IdProduto WHERE PVI.IdPedidoDeVenda = ''' + sqlPd.FieldByName('IdPedidoDeVenda').AsString + ''' ';
        sqlPdi.Open;

        sqlIp:= TADOQuery.Create(frmMain);
        sqlIp.Connection:= frmIni.Conexao;
        sqlIp.SQL.Text:= 'SELECT * FROM FaixasMetas';
        sqlIp.Open;

        sqlIpi:= TADOQuery.Create(frmMain);
        sqlIpi.Connection:= frmIni.Conexao;
        sqlIpi.SQL.Text:= 'SELECT * FROM FaixasMetas';
        sqlIpi.Open;

        frmMain.barPp.Progress:= pg+1;
        pg:= pg + 1;
        frmMain.lblPp.Caption:= IntToStr(pg);
        sqlPd.Next;

      end;

    end
    else
    begin

      frmMain.lblPe.Caption:= '0';
      frmMain.lblPp.Caption:= '0';

    end;

    frmMain.barP.Progress:= pg1+1;
    pg1:= pg1 + 1;
    sql.Next;

  end;

  conn.Destroy;
  Application.MessageBox('Pedidos importados com sucesso!', 'Gerenciamento de Comissões', MB_OK + MB_ICONINFORMATION);

end;

procedure TfrmMain.btnPesqCClick(Sender: TObject);
begin

  if (cmbRepC.Text = '-- REPRESENTANTE --') AND (txtMes.Text = '  /    ') then
  begin

    Application.MessageBox('Nenhum filtro foi selecionado. Isso trará todas as comissões pagas até a presente data!' + #13 + 'Confirma?', 'Gerenciamento de Comissões', MB_YESNO + MB_ICONQUESTION);

  end;


end;

procedure TfrmMain.btnPesqClick(Sender: TObject);
var
  tt: tE;
  r,i, i1, i2: Integer;
  sql: TADOQuery;
  ind: Integer;
  vl: TMyObj;
  m, pm, cm, ce, ct: Double;
  ct1: String;
  Row: Integer;
begin

  frmWait := TfrmWait.Create(nil);
  frmWait.Show;
  frmWait.Repaint;
  frmWait.Refresh;
  tt:= tE.Create(false);
  tt.Resume;
  while WaitForSingleObject(tt.Handle, 50) = WAIT_TIMEOUT do
  Application.ProcessMessages;


    if tt.srcP.DataSet.RecordCount > 0 then
    begin

      tA:= 0;
      tF:= 0;
      pA:= '';
      pF:= '';

      tableC.DataController.DataSource:= tt.srcP;

      fPedido.DataBinding.FieldName:= 'CdChamada';
      fPedido.DataBinding.ValueType:= 'Float';

      fCliente.DataBinding.FieldName:= 'NmPessoa';
      fCliente.DataBinding.ValueType:= 'String';

      fDtemissao.DataBinding.FieldName:= 'DtEmissao';
      fDtemissao.DataBinding.ValueType:= 'DateTime';

      fVlpedido.DataBinding.FieldName:= 'Total';
      fVlpedido.DataBinding.ValueType:= 'Currency';

      fStatus.DataBinding.FieldName:= 'StPedidoDeVenda';
      fSTatus.DataBinding.ValueType:= 'String';

      fIdpedido.DataBinding.FieldName:= 'IdPedidoDeVenda';
      fIdPedido.DataBinding.ValueType:= 'String';

      while not tableC.DataController.DataSet.Eof do
      begin

        if tableC.DataController.DataSet.FieldByName('StPedidoDeVenda').AsString = 'A' then
        begin

          pA:= pA + tableC.DataController.DataSet.FieldByName('IdPedidoDeVenda').AsString + ';';

        end
        else
        begin

          pF:= pF + tableC.DataController.DataSet.FieldByName('IdPedidoDeVenda').AsString + ';';

        end;

        tableC.DataController.DataSet.Next;

      end;


      fStatus.GroupIndex:= 1;


      if tableC.DataController.Groups.ChildCount[0] > 0 then
      begin

        if tableC.ViewData.Records[0].Values[tableC.GetColumnByFieldName('StPedidoDeVenda').Index] = 'A' then
        begin

          tA:= tableC.DataController.Summary.GroupSummaryValues[0,1];
          lblTaTxt.Caption:= FloatToStrF( tA, ffCurrency, 10,2 );
          lblTfTxt.Caption:= 'R$ -';

        end
        else
        begin

           tF:= tableC.DataController.Summary.GroupSummaryValues[0,1];
           lblTfTxt.Caption:= FloatToStrF( tF, ffCurrency, 10,2 );
           lblTaTxt.Caption:= 'R$ -';

        end;

      end;

      if tableC.DataController.Groups.ChildCount[1] > 0 then
      begin

        tF:= tableC.DataController.Summary.GroupSummaryValues[1,1];
        lblTfTxt.Caption:= FloatToStrF( tF, ffCurrency, 10,2 );

      end;

      tV:= tableC.DataController.Summary.FooterSummaryValues[1];
      lblTvTxt.Caption:= FloatToStrF( tV, ffCurrency, 10,2 );


      ind := cmbRep.ItemIndex;
      vl := TMyObj(cmbRep.Items.Objects[ind]);

      sql:= TADOQuery.Create(Self);
      sql.Connection:= frmIni.Conexao;
      sql.SQL.Text:= 'SELECT VlMeta FROM Metas WHERE IdRepresentante = ''' + vl.Text + ''' ';
      sql.Open;

      m:= sql.FieldByName('VlMeta').AsFloat;
      lblMaTxt.Caption:= FloatToStrF( m, ffCurrency, 10,2 );

      if m > 0 then
      begin

        if tV > m then
        begin

          lblBmTxt.Caption:= 'SIM';
          lblBmTxt.Font.Color:= clGreen;

          pm:= ( ( tV - m ) / m );
          lblPmTxt.Caption:= FloatToStrF( (pm * 100), ffNumber, 10,4 ) + ' %';

          sql.SQL.Clear;
          sql.SQL.Text:= 'SELECT TOP 1 * FROM FaixasMetas WHERE VlPercFaixa >= ' + StringReplace( FloatToStrF( (pm * 100), ffFixed, 10,4 ), ',', '.', [rfReplaceAll] )+ ' ORDER BY VlPercFaixa ';
          sql.Open;

          lblFaTxt.Caption:= sql.FieldByName('NmFaixa').AsString;
          lblCeTxt.Caption:= FloatToStr( sql.FieldByName('VlComissao').AsFloat )+ ' %';
          lblVcTxt.Caption:= FloatToStr( 5 + sql.FieldByName('VlComissao').AsFloat ) + ' %';

          ptC:= sql.FieldByName('VlComissao').AsFloat;

          cR:= (( tA * ( 5 + ptC ) / 100) );
          cP:= (( tF * ( 5 + ptC ) / 100) );

          lblCrTxt.Caption:= FloatToStrF( cR , ffCurrency, 10,2);
          lblCpTxt.Caption:= FloatToStrF( cP , ffCurrency, 10,2);

        end
        else
        begin

          lblBmTxt.Caption:= 'NÃO';
          lblBmTxt.Font.Color:= clRed;
          lblPmTxt.Caption:= '-';

          lblFaTxt.Caption:= ' - ';
          lblCeTxt.Caption:= ' - ';
          lblVcTxt.Caption:= '5 %';

          lblCrTxt.Caption:= FloatToStrF( ( ( tA * 5 ) / 100) , ffCurrency, 10,2);
          lblCpTxt.Caption:= FloatToStrF( ( ( tF * 5 ) / 100) , ffCurrency, 10,2);;

        end;


        btnFc.Enabled:= true;

      end
      else
      begin

        Application.MessageBox('Representante SEM meta cadastrada!' + #13 + 'Por favor, cadastre uma meta para ele antes de efetuar os cálculos.', 'Gerenciamento de Comissões', mb_ok+MB_ICONINFORMATION);

      end;

      tableC.ViewData.Collapse(true);
      frmWait.Close;


    end
    else
    begin

      frmWait.Close;
      Application.MessageBox('NENHUM pedido encontrado para este representante, no período selecionado!', 'Gerenciamento de Comissões', mb_ok+MB_ICONINFORMATION);
      tableC.DataController.DataSource:= tt.srcP;
      tt.srcP.Destroy;
      frmMain.Refresh;

    end;


end;



procedure TfrmMain.FormCreate(Sender: TObject);
var
  sql, sql1, sqlR: TADOQuery;
  src, src1: TDataSource;
  idP, idR: String;
  sql2: TADOQuery;
  obj: TMyObj;
  i: Integer;
  col: TcxGridDBColumn;
begin

    stBar.Panels.Add;
    StBar.Panels[0].Text:= Copy(ParamStr(2),3, Length(ParamStr(2)));
    StBar.Panels[0].Width:= 200;
    TdxStatusBarTextPanelStyle(stBar.Panels[0].PanelStyle).ImageIndex:= 4;

    stBar.Panels.Add;
    StBar.Panels[1].Text:=  Copy(ParamStr(1),3, Length(ParamStr(1)));
    StBar.Panels[1].Width:= 200;
    TdxStatusBarTextPanelStyle(stBar.Panels[1].PanelStyle).ImageIndex:= 5;

    stBar.Panels.Add;
    StBar.Panels[2].Text:= FormatDateTime('dd/mm/yyyy',now);
    StBar.Panels[2].Width:= 100;
    TdxStatusBarTextPanelStyle(stBar.Panels[2].PanelStyle).ImageIndex:= 7;

    stBar.Panels.Add;
    StBar.Panels[3].Width:= 100;
    TdxStatusBarTextPanelStyle(stBar.Panels[3].PanelStyle).ImageIndex:= 6;

    sqlR:= TADOQuery.Create(Self);
    sqlR.Connection:= frmIni.Conexao;
    sqlR.SQL.Text:= 'SELECT P.NmCurto, M.IdRepresentante FROM Pessoa P JOIN Metas M ON P.IdPessoa = M.IdRepresentante ORDER BY P.NmCurto';
    sqlR.Open;

    i:= 0;

    while not sqlR.Eof do
    begin

      obj:= TMyObj.Create;
      obj.Index:= i;
      obj.Text:=  sqlR.FieldByName('IdRepresentante').AsString;
      cmbRep.items.AddObject(sqlR.FieldByName('NmCurto').AsString, obj );
      cmbRepC.items.AddObject(sqlR.FieldByName('NmCurto').AsString, obj );

      i:= i+1;
      sqlR.next;

    end;


    sql:= TADOQuery.Create(Self);
    sql.Connection:= frmIni.Conexao;
    sql.SQL.Text:= 'SELECT M.IdRepresentante, M.VlMeta, P.NmCurto FROM Metas M JOIN Pessoa P ON P.IdPessoa = M.IdRepresentante ORDER BY P.NmCurto';
    sql.Open;

    src:= TDataSource.Create(Self);
    src.DataSet:= sql;

    tableR.DataController.DataSource:= src;
    tableR.DataController.KeyFieldNames:= 'IdRepresentante';

    fIdRepresentante.DataBinding.FieldName:= 'IdRepresentante';
    fIdRepresentante.DataBinding.ValueType:= 'String';

    fRepresentante.DataBinding.FieldName:= 'NmCurto';
    fRepresentante.DataBinding.ValueType:= 'String';

    fMeta.DataBinding.FieldName:= 'VlMeta';
    fMeta.DataBinding.ValueType:= 'Currency';

    sql1:= TADOQuery.Create(Self);
    sql1.Connection:= frmIni.Conexao;
    sql1.SQL.Text:= 'SELECT * FROM RepresentanteZipping ORDER BY NmRepresentanteZ';
    sql1.Open;

    src1:= TDataSource.Create(Self);
    src1.DataSet:= sql1;

    tableRz.DataController.DataSource:= src1;

    fIdrepresentanteZ.DataBinding.FieldName:= 'IdRepresentanteZ';
    fIdrepresentanteZ.DataBinding.ValueType:= 'String';

    fNmrepresentante.DataBinding.FieldName:= 'NmRepresentanteZ';
    fNmrepresentante.DataBinding.ValueType:= 'String';

    fIdrepresentanteG.DataBinding.FieldName:= 'NmRepresentanteG';
    fIdrepresentanteG.DataBinding.ValueType:= 'String';

    sql2:= TADOQuery.Create(frmMain);
    sql2.Connection:= frmIni.Conexao;
    sql2.SQL.Text:= 'SELECT M.IdRepresentante, P.NmCurto FROM Metas M JOIN Pessoa P ON P.IdPessoa = M.IdRepresentante ORDER BY P.NmCurto';
    sql2.Open;
    sql2.First;

    i:= 0;

    while not sql2.Eof do
    begin

        obj:= TMyObj.Create;
        obj.Index:= i;
        obj.Text:=  sql2.FieldByName('IdRepresentante').AsString;
        cmbRepG.Properties.Items.AddObject(sql2.FieldByName('NmCurto').AsString, obj );

        i:= i+1;
        sql2.next;

      end;


end;

procedure TfrmMain.mostra(Sender: TObject);
begin



end;

procedure TfrmMain.fStatusGetDataText(Sender: TcxCustomGridTableItem;
  ARecordIndex: Integer; var AText: string);
begin

  if (AText = 'T') OR (AText = 'L') then
  begin

    AText:= 'FATURADO';

  end
  else
  begin

     AText:= 'ABERTO';

  end;

end;

procedure TfrmMain.Metas1Click(Sender: TObject);
var
  sql: TADOQuery;
  src: TDataSource;
  idP, idR: String;
begin

  sql:= TADOQuery.Create(Self);
  sql.Connection:= frmIni.Conexao;
  sql.SQL.Text:= 'SELECT M.IdRepresentante, M.VlMeta, P.NmCurto FROM Metas M JOIN Pessoa P ON P.IdPessoa = M.IdRepresentante ORDER BY P.NmCurto';
  sql.Open;

  src:= TDataSource.Create(Self);
  src.DataSet:= sql;

   pipe.DataSource:= src;
   report.Print;

end;

procedure TfrmMain.pageDrawTabEx(AControl: TcxCustomTabControl; ATab: TcxTab;
  Font: TFont);
begin

  Atab.Color:= $00EEF0DC;
  AControl.Brush.Color:= $00EEF0DC;

end;

procedure TfrmMain.tabFShow(Sender: TObject);
var
  sql: TADOQuery;
  src: TDataSource;
begin


  sql:= TADOQuery.Create(Self);
  sql.Connection:= frmIni.Conexao;
  sql.SQL.Text:= 'SELECT * FROM FaixasMetas ORDER BY NmFaixa';
  sql.Open;

  src:= TDataSource.Create(Self);
  src.DataSet:= sql;

  tableF.DataController.DataSource:= src;

  fFaixa.DataBinding.FieldName:= 'NmFaixa';
  fFaixa.DataBinding.ValueType:= 'String';

  fPercentual.DataBinding.FieldName:= 'VlPercFaixa';
  fPercentual.DataBinding.ValueType:= 'Float';

  fComissao.DataBinding.FieldName:= 'VlComissao';
  fComissao.DataBinding.ValueType:= 'Float';


end;

procedure TfrmMain.tabGuShow(Sender: TObject);
var
  sql, sql1: TADOQuery;
  src: TDataSource;
  obj: TMyobj;
  i: integer;
begin

  sql:= TADOQuery.Create(Self);
  sql.Connection:= frmIni.Conexao;
  sql.SQL.Text:= 'SELECT * FROM GerenteUF';
  sql.Open;

  src:= TDataSource.Create(Self);
  src.DataSet:= sql;

  tableGu.DataController.DataSource:= src;
  fUf.DataBinding.FieldName:= 'IdUF';
  fNmgerente.DataBinding.FieldName:= 'NmGerente';

  sql1:= TADOQuery.Create(Self);
  sql1.Connection:= frmIni.Conexao;
  sql1.SQL.Text:= 'SELECT P.IdPessoa, P.NmPessoa FROM Pessoa P JOIN Representante R ON R.IdPessoaRepresentante = P.IdPessoa WHERE R.StGerente = ''S'' ORDER BY P.NmPessoa';
  sql1.Open;

  i:= 0;
  cmbGerente.Properties.Items.Clear;

  while not sql1.Eof do
  begin

    obj:= TMyObj.Create;
    obj.Index:= i;
    obj.Text:= sql1.FieldByName('IdPessoa').AsString;
    cmbGerente.Properties.Items.AddObject( Trim( sql1.FieldByName('NmPessoa').AsString ), obj);
    i:= i + 1;
    sql1.Next;

  end;

end;

procedure TfrmMain.tableCDblClick(Sender: TObject);
var
  I : Integer;
  Selecionados: Integer;
  Row : Integer;
  cdPed: String;
begin

  Selecionados := tableC.ViewData.DataController.GetSelectedCount;
  for I := 0 to Selecionados - 1 do
  begin

    Row := tableC.ViewData.DataController.GetSelectedRowIndex(I);
    cdPed:= tableC.ViewData.Records[Row].Values[tableC.GetColumnByFieldName('IdPedidoDeVenda').Index];

    if ( cdPed <> 'T' ) AND ( cdPed <> 'A' ) then
    begin

      frmPedido:= TfrmPedido.Create(Self, cdPed );
      frmPedido.Show;

    end;

  end;

end;

procedure TfrmMain.txtMesKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    btnPesqC.SetFocus;

  end;

end;

function  tE.pesquisaPedidos(): TDataSource;
var
  i: Integer;
  v: TMyObj;
  sql, sql1: TADOQuery;
  lista: String;
  m: Integer;
  d, di, df, dia: String;
  List: TStringList;
begin

  tE.SetReturnValue(1);
  CoInitializeEx (nil, 0);

  i := frmMain.cmbRep.ItemIndex;
  v := TMyObj(frmMain.cmbRep.Items.Objects[i]);

  sql:= TADOQuery.Create(frmMain);
  sql.Connection:= frmIni.Conexao;
  sql.SQL.Text:= 'SELECT IdPessoa FROM PessoaRelacionada WHERE IdCategoriaPessoaRelacionada = ''0000000004'' AND IdCategoriaPessoa = ''0000000005'' AND IdPessoaRelacionada = '''+v.Text+''' ';
  sql.Open;
  sql.First;

  while not sql.Eof do
  begin

    lista:= lista + '''' + sql.FieldByName('IdPessoa').AsString + ''',';
    sql.Next;

  end;

  if lista.Length > 0 then
  begin

    lista:= '(' + lista;
    lista:= Copy(lista,0, (lista.Length - 1));
    lista:= lista + ')';

    d:= DateToStr( frmMain.data.Date );

    List := TStringList.Create;
    List.Clear;
    ExtractStrings(['/'],[], PChar(d), List);

    di:= List[2] + '-' + List[1] + '-' + '01';

    if (List[1] = '01') OR (List[1] = '03') OR (List[1] = '05') OR (List[1] = '07') OR (List[1] = '08') OR (List[1] = '10') OR (List[1] = '12')then
    begin

     dia:= '31';

    end;

    if (List[1] = '02') then
    begin

      if IsLeapYear( StrToInt( List[2] ) ) then
      begin

         dia:= '29';

      end
      else
      begin

        dia:= '28';

      end;

    end;

    if (List[1] = '04') OR (List[1] = '06') OR (List[1] = '09') OR (List[1] = '11')then
    begin

     dia:= '30';

    end;


    df:= List[2] + '-' + List[1] + '-' + dia;

    sql1:= TADOQuery.Create(frmMain);
    sql1.Connection:= frmIni.Conexao;
    sql1.SQL.Text:= 'SELECT PV.IdPedidoDeVenda, PV.CdChamada, PV.StPedidoDeVenda, PV.DtEmissao, SUM(PVI.VlItem) as Total, P.NmPessoa FROM PedidoDeVenda PV JOIN Pessoa P ON PV.IdPessoaCLiente = P.IdPessoa '+
    'JOIN PedidoDeVendaItem PVI ON PVI.IdPedidoDeVenda = PV.IdPedidoDeVenda WHERE DtEmissao BETWEEN ''' + di + ''' AND ''' + df + ''' '+
    ' AND PV.StPedidoDeVenda <> ''C'' AND IdPessoaCliente IN ' + lista + ' GROUP BY PV.IdPedidoDeVenda, PV.CdChamada,	PV.DtEmissao,	P.NmPessoa, PV.StPedidoDeVenda ORDER BY PV.DtEmissao ';
    sql1.Open;

    srcP:= TDataSource.Create(frmMain);
    srcP.DataSet:= sql1;

    result:= srcP;

  end
  else
  begin

    srcP:= TDataSource.Create(frmMain);
    srcP.DataSet:= sql;
    result:= srcP;

  end;


end;



end.



