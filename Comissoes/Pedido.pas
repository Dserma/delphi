unit Pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ExtCtrls, Ini, cxCurrencyEdit, cxContainer, cxGroupBox,
  Vcl.StdCtrls, cxLabel;

type
  TfrmPedido = class(TForm)
    Panel1: TPanel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    gridI: TcxGrid;
    tableI: TcxGridDBTableView;
    fProduto: TcxGridDBColumn;
    fVlunitario: TcxGridDBColumn;
    fQuantidade: TcxGridDBColumn;
    fVltotal: TcxGridDBColumn;
    gridILevel1: TcxGridLevel;
    cxLabel1: TcxLabel;
    lblC: TLabel;
    lblDt: TLabel;
    lblD: TLabel;
    Label1: TLabel;
    lblP: TLabel;
    Label2: TLabel;
    lblS: TLabel;
    procedure FormShow(Sender: TObject);
  private
    idPedido: String;
  public
    constructor Create(AOwner : TComponent; idPed: String );
  end;

var
  frmPedido: TfrmPedido;

implementation

uses
  Data.Win.ADODB;

{$R *.dfm}

constructor TfrmPedido.Create(AOwner: TComponent; idPed: string);
begin

  inherited Create(AOwner);
  idPedido:= idPed;

end;

procedure TfrmPedido.FormShow(Sender: TObject);
var
  sql: TADOQuery;
  src: TDataSource;
  pedido, status: String;
begin

   sql:= TADOQuery.Create(Self);
   sql.Connection:= frmIni.Conexao;

   sql.SQL.Text:= 'SELECT PV.CdChamada, PV.DtEmissao, PV.StPedidoDeVenda, P.NmPessoa, PZ.DsPrazo FROM PedidoDeVenda PV JOIN Pessoa P ON P.IdPessoa = PV.IdPessoaCliente '+
   ' LEFT JOIN Prazo PZ ON PZ.IdPrazo = PV.IdPrazo WHERE PV.IdPedidoDeVenda = ''' + idPedido + ''' ';
   sql.Open;

   pedido:= sql.FieldByName('CdChamada').AsString;

   cxGroupBox1.Caption:= '  Pedido Nº: ' + pedido;

   lblC.Caption:= sql.FieldByName('NmPessoa').AsString;
   lblD.Caption:= DateToStr( sql.FieldByName('DtEmissao').AsDateTime );
   lblP.Caption:= sql.FieldByName('DsPrazo').AsString;


   if sql.FieldByName('StPedidoDeVenda').AsString = 'A' then
   begin

    status:= 'ABERTO';

   end
   else
   begin

    status:= 'FATURADO';

   end;

   lblS.Caption:= status;


   sql.SQL.Clear;
   sql.SQL.Text:= 'SELECT PD.NmProduto, P.IdPedidoDeVendaItem, P.VlUnitario, P.QtPedida, P.VlItem FROM PedidoDeVendaItem P JOIN Produto PD ON PD.IdProduto = P.IdProduto WHERE P.IdPedidoDeVenda = ''' + idPedido + ''' ';
   sql.Open;

   src:= TDataSource.Create(Self);
   src.DataSet:= sql;

   tableI.DataController.DataSource:= src;

   fProduto.DataBinding.FieldName:= 'NmProduto';
   fProduto.DataBinding.ValueType:= 'String';

   fVlunitario.DataBinding.FieldName:= 'VlUnitario';
   fVlunitario.DataBinding.ValueType:= 'Currency';
   fVlunitario.PropertiesClassName:= 'CurrencyEdit';
   fVlunitario.PropertiesClass:= TcxCurrencyEditProperties;

   fQuantidade.DataBinding.FieldName:= 'QtPedida';
   fQuantidade.DataBinding.ValueType:= 'Float';

   fVltotal.DataBinding.FieldName:= 'VlItem';
   fVltotal.DataBinding.ValueType:= 'Currency';
   fVltotal.PropertiesClassName:= 'CurrencyEdit';
   fVltotal.PropertiesClass:= TcxCurrencyEditProperties;


end;

end.
