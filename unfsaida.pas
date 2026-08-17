unit uNFSaida;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Dialogs, ComCtrls, StdCtrls, Buttons,
  EditBtn, DbCtrls, rxdbgrid, RxVersInfo, rxdbdateedit, rxdbcomb, RxDBCtrls, db,
  ZDataset, ZSqlUpdate, DBGrids, ExtCtrls, Menus, DBExtCtrls, LCLType,
  ACBrNFe,ACBrNFe.Classes, ACBrCEP, ACBrNFeDANFeRLClass, LR_Desgn, DividerBevel, TDIPageControl;

type

  { TfrmNFSaida }

  TfrmNFSaida = class(TForm)
    ACBrCEP1: TACBrCEP;
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    BitBtn5: TBitBtn;
    btAddNFRef: TSpeedButton;
    btAplicar: TBitBtn;
    btCancelarLancamento1: TSpeedButton;
    btDelItem: TBitBtn;
    btEditaItem: TBitBtn;
    btFaltaTemp: TSpeedButton;
    Button1: TButton;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit4: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBMemo1: TDBMemo;
    DBRadioGroup1: TDBRadioGroup;
    DividerBevel1: TDividerBevel;
    dsNFReferencia: TDataSource;
    dsCtaReceber: TDatasource;
    dsListaNotas: TDatasource;
    dsItens: TDatasource;
    dsNota: TDatasource;
    edLimit: TComboBox;
    GroupBox1: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    ImageList1: TImageList;
    imgLancada: TImage;
    imgPendente: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label4: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label5: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbStatusNFe: TStaticText;
    MenuItem1: TMenuItem;
    ImprimirNFe: TMenuItem;
    GerarPDFdaDANFE: TMenuItem;
    ImpimeDanfeRetrato: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    RxDBComboBox2: TRxDBComboBox;
    VisualizarXML_NFD: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    EnviarNFeporemail: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    Adicionarreferenciaobservao: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    mnCartaCorrecaoEmail: TMenuItem;
    mnCartaCorrecao: TMenuItem;
    PopupMenu3: TPopupMenu;
    qryCtaReceberorigem: TStringField;
    qryItenscst_cofins: TLongintField;
    qryItenscst_ipi: TLongintField;
    qryItenscst_pis: TLongintField;
    qryItensestoque_origem: TStringField;
    qryItensindtot: TLongintField;
    qryItensinfadprod: TMemoField;
    qryItenspcofins: TFloatField;
    qryItenspipi: TFloatField;
    qryItensppis: TFloatField;
    qryItensvbc_cofins: TFloatField;
    qryItensvbc_ipi: TFloatField;
    qryItensvbc_pis: TFloatField;
    qryItensvfrete: TFloatField;
    qryItensvlote: TStringField;
    qryItensvlr_flex: TFloatField;
    qryItensvoutras: TFloatField;
    qryNotacadastro_dest: TStringField;
    qryNotacrt: TLongintField;
    qryNotadevolucao_destacar_icms: TBooleanField;
    qryNotadevolucao_st_ipi_outras_desp: TBooleanField;
    qryNotanumero_pedio_online: TLongintField;
    qryNotanumero_ped_cliente: TStringField;
    qryNotavvendedor: TStringField;
    btGerarContas: TSpeedButton;
    RadioGroup1: TRxDBRadioGroup;
    RxDBComboBox1: TRxDBComboBox;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    RxDBGrid3: TRxDBGrid;
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    ScrollBox3: TScrollBox;
    ScrollBox4: TScrollBox;
    ScrollBox5: TScrollBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    TabSheet6: TTabSheet;
    ToolButton1: TToolButton;
    VisualizarXML: TMenuItem;
    mnCancelarNFe: TMenuItem;
    mnConsultarNFe: TMenuItem;
    mnConsultarSEFAZ: TMenuItem;
    mnAutorizarNFe: TMenuItem;
    mnInutilizarNumeracao: TMenuItem;
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    qryCtaReceberbanco_negociado: TStringField;
    qryCtaRecebercliente: TLongintField;
    qryCtaReceberconta: TLongintField;
    qryCtaReceberconta_credito: TLongintField;
    qryCtaReceberconta_debito: TLongintField;
    qryCtaReceberdataconta: TDateField;
    qryCtaReceberdata_pagamento: TDateField;
    qryCtaReceberdata_vencimento: TDateField;
    qryCtaReceberdesconto: TFloatField;
    qryCtaReceberdescricao: TStringField;
    qryCtaReceberdocumento: TStringField;
    qryCtaReceberid: TLongintField;
    qryCtaReceberid_nf: TLongintField;
    qryCtaReceberjuros: TFloatField;
    qryCtaReceberobservacao: TMemoField;
    qryCtaReceberparcela: TLongintField;
    qryCtaRecebertotal_parcelas: TLongintField;
    qryCtaRecebervalor_devido: TFloatField;
    qryCtaRecebervalor_pago: TFloatField;
    qryItensbaseicms: TFloatField;
    qryItensbasesubst: TFloatField;
    qryItenscfop: TStringField;
    qryItenscst: TStringField;
    qryItensdescricao: TStringField;
    qryItensid: TLongintField;
    qryItenslote: TLongintField;
    qryItensmodbc: TLongintField;
    qryItensmodbcst: TLongintField;
    qryItensncm: TStringField;
    qryItensnfsaida: TLongintField;
    qryItensorigem: TStringField;
    qryItenspcomissao: TFloatField;
    qryItenspdesconto: TFloatField;
    qryItenspeso: TFloatField;
    qryItenspicms: TFloatField;
    qryItenspicmsst: TFloatField;
    qryItenspmva: TFloatField;
    qryItenspredst: TFloatField;
    qryItensproduto: TLongintField;
    qryItensquantidade: TFloatField;
    qryItensredbase: TFloatField;
    qryItensunidade: TStringField;
    qryItensvalortotal: TFloatField;
    qryItensvalorunitario: TFloatField;
    qryItensvlricms: TFloatField;
    qryItensvlrsubst: TFloatField;
    qryLotesItens: TZQuery;
    qryLotesItensdata_frabricacao: TDateField;
    qryLotesItensid: TLongintField;
    qryLotesItensitensentrada: TLongintField;
    qryLotesItensnumerolote: TStringField;
    qryLotesItenspmc: TFloatField;
    qryLotesItensquantidade: TLongintField;
    qryLotesItensquantidade_estoque: TLongintField;
    qryLotesItensvencimento: TDateField;
    qryNota: TZQuery;
    qryListaNotas: TZQuery;
    qryNotabairro: TStringField;
    qryListaNotasbairro: TStringField;
    qryNotabaseicms: TFloatField;
    qryListaNotasbaseicms: TFloatField;
    qryNotabaseicmssub: TFloatField;
    qryListaNotasbaseicmssub: TFloatField;
    qryNotacancelada: TBooleanField;
    qryListaNotascancelada: TBooleanField;
    qryNotacep: TStringField;
    qryListaNotascep: TStringField;
    qryNotachave_nfe: TStringField;
    qryListaNotaschave_nfe: TStringField;
    qryNotacidade: TStringField;
    qryListaNotascidade: TStringField;
    qryNotacidadetransp: TStringField;
    qryListaNotascidadetransp: TStringField;
    qryNotacnpjcpf: TStringField;
    qryListaNotascnpjcpf: TStringField;
    qryNotacnpjtransp: TStringField;
    qryListaNotascnpjtransp: TStringField;
    qryNotacodcliente: TLongintField;
    qryListaNotascodcliente: TLongintField;
    qryNotacomplemento: TStringField;
    qryListaNotascomplemento: TStringField;
    qryNotadadosadicionais: TMemoField;
    qryListaNotasdadosadicionais: TMemoField;
    qryNotadataemissao: TDateField;
    qryListaNotasdataemissao: TDateField;
    qryNotadatasaida: TDateField;
    qryListaNotasdatasaida: TDateField;
    qryNotadesconto: TFloatField;
    qryNotadestinatario: TStringField;
    qryListaNotasdestinatario: TStringField;
    qryNotaendereco: TStringField;
    qryListaNotasendereco: TStringField;
    qryNotaendtransp: TStringField;
    qryListaNotasendtransp: TStringField;
    qryNotaentradasaida: TStringField;
    qryListaNotasentradasaida: TStringField;
    qryNotaespecievol: TStringField;
    qryListaNotasespecievol: TStringField;
    qryNotaforma_pgto: TStringField;
    qryListaNotasforma_pgto: TStringField;
    qryNotafreteconta: TStringField;
    qryListaNotasfreteconta: TStringField;
    qryNotahorasaida: TTimeField;
    qryListaNotashorasaida: TTimeField;
    qryNotaid: TLongintField;
    qryListaNotasid: TLongintField;
    qryNotaietransp: TStringField;
    qryListaNotasietransp: TStringField;
    qryNotaimpressa: TBooleanField;
    qryListaNotasimpressa: TBooleanField;
    qryNotainscrestadual: TStringField;
    qryListaNotasinscrestadual: TStringField;
    qryNotainscrestsubtrib: TStringField;
    qryListaNotasinscrestsubtrib: TStringField;
    qryNotamarcavol: TStringField;
    qryListaNotasmarcavol: TStringField;
    qryNotamotivo_erro: TStringField;
    qryListaNotasmotivo_erro: TStringField;
    qryNotanatureza: TStringField;
    qryListaNotasnatureza: TStringField;
    qryNotanometransp: TStringField;
    qryListaNotasnometransp: TStringField;
    qryNotanumeroctlform: TLongintField;
    qryListaNotasnumeroctlform: TLongintField;
    qryNotanumerovol: TStringField;
    qryListaNotasnumerovol: TStringField;
    qryNotanumero_recibo: TStringField;
    qryListaNotasnumero_recibo: TStringField;
    qryNotapesobrutovol: TFloatField;
    qryListaNotaspesobrutovol: TFloatField;
    qryNotapesoliquidovol: TFloatField;
    qryListaNotaspesoliquidovol: TFloatField;
    qryNotaplacaveiculo: TStringField;
    qryListaNotasplacaveiculo: TStringField;
    qryNotaprazo_pgto: TStringField;
    qryListaNotasprazo_pgto: TStringField;
    qryNotaquantvolumes: TLongintField;
    qryListaNotasquantvolumes: TLongintField;
    qryNotaserie: TLongintField;
    qryListaNotasserie: TLongintField;
    qryListaNotasstatus_nfe: TStringField;
    qryNotastatus_nfe: TLongintField;
    qryNotatelefone: TStringField;
    qryListaNotastelefone: TStringField;
    qryNotatipo_nota: TLongintField;
    qryNotauf: TStringField;
    qryListaNotasuf: TStringField;
    qryNotauftransp: TStringField;
    qryListaNotasuftransp: TStringField;
    qryNotaufveiculo: TStringField;
    qryListaNotasufveiculo: TStringField;
    qryNotavalorfrete: TFloatField;
    qryListaNotasvalorfrete: TFloatField;
    qryNotavaloricms: TFloatField;
    qryListaNotasvaloricms: TFloatField;
    qryNotavaloricmssub: TFloatField;
    qryListaNotasvaloricmssub: TFloatField;
    qryNotavaloripi: TFloatField;
    qryListaNotasvaloripi: TFloatField;
    qryNotavaloroutradesp: TFloatField;
    qryListaNotasvaloroutradesp: TFloatField;
    qryNotavalorseguro: TFloatField;
    qryListaNotasvalorseguro: TFloatField;
    qryNotavalortotalnota: TFloatField;
    qryListaNotasvalortotalnota: TFloatField;
    qryNotavalortotalprodutos: TFloatField;
    qryListaNotasvalortotalprodutos: TFloatField;
    qryNotavcofins: TFloatField;
    qryNotavendedor: TLongintField;
    qryListaNotasvendedor: TLongintField;
    qryNotavpis: TFloatField;
    RxVersionInfo1: TRxVersionInfo;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    qryItens: TZQuery;
    qryCtaReceber: TZQuery;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    btImprimirDanfe: TToolButton;
    updItens: TZUpdateSQL;
    updNota: TZUpdateSQL;
    qryNFReferencia: TZReadOnlyQuery;
    procedure ACBrNFe1StatusChange(Sender: TObject);
    procedure AdicionarreferenciaobservaoClick(Sender: TObject);
    procedure btAddNFRefClick(Sender: TObject);
    procedure btAplicarClick(Sender: TObject);
    procedure btDelItemClick(Sender: TObject);
    procedure btEditaItemClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btCancelarLancamento1Click(Sender: TObject);
    procedure btFaltaTempClick(Sender: TObject);
    procedure btImprimirDanfeClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBEdit11DblClick(Sender: TObject);
    procedure dsNotaStateChange(Sender: TObject);
    procedure EnviarNFeporemailClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ImpimeDanfeRetratoClick(Sender: TObject);
    procedure ImprimirNFeClick(Sender: TObject);
    procedure GerarPDFdaDANFEClick(Sender: TObject);
    procedure lbStatusNFeDblClick(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure mnCancelarNFeClick(Sender: TObject);
    procedure mnCartaCorrecaoClick(Sender: TObject);
    procedure mnCartaCorrecaoEmailClick(Sender: TObject);
    procedure mnConsultarNFeClick(Sender: TObject);
    procedure mnConsultarSEFAZClick(Sender: TObject);
    procedure mnAutorizarNFeClick(Sender: TObject);
    procedure mnInutilizarNumeracaoClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1TitleClick(Column: TColumn);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure btGerarContasClick(Sender: TObject);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure VisualizarXMLClick(Sender: TObject);
    procedure VisualizarXML_NFDClick(Sender: TObject);
  private
    { private declarations }
    procedure CalcularItem(qICMS: TZQuery);
    procedure CriarNovaNFeBonificadaDePedido;
    procedure LoadNota;
    function  GerarContasReceber:Boolean;
    procedure SalvarErroNotaFiscal(const idNota: Integer; const xMotivo,StatusNFE: String);
    procedure SomarNota;
    procedure GerarCartadeCorrecao;
    procedure DevolverTudoParaEstoque(const historico : string);
    procedure EnviaMessagePedidoFaturado(const id : Integer);
  public
    { public declarations }
    Order : string;
    procedure CriarNovaNFeVenda;
    procedure CriarNovaNFeDePedido;
    procedure CriarNovaNFeDeNFCe;
    procedure CriarNotaDevolucaoFornecedor;
    procedure AddItensNFDevolucaoFornecedor( id_nfentrada : Integer);
    procedure AddItensNFDevolucaoCliente( id_nfsaida : Integer);
    procedure LancarFlex( id : Integer );
    procedure EstornarFlex(id: Integer);
    procedure OpenNFe( id : Integer);
    procedure SelecionarDestinatario(const destinatario, id: string);
    function  CopiarPedidoParaNota( Const npedido : Integer):Integer;
    procedure CopiarItensPedidoParaNota( Const idPedido,idNota : Integer);
    procedure GerarXml(  ACBrNFe : TACBrNFe );
    procedure AutorizaNFe( ACBrNFe : TACBrNFe );
    function  AddProduto(const idNota, produto, lote: Integer;const quantidade: Double):Integer;
    function  CheckEANItensNota( id : Integer):Boolean;
  end;



var
  frmNFSaida: TfrmNFSaida;

implementation


{$R *.lfm}

{ TfrmNFSaida }

Uses WagVclUtils, udbConnect, DateUtils, strutils, variants, math,
  uEditItemNFSaida, sistema_config, uGerarCtaReceber, uPedidoCliente,
  ufrmStatus, uSelectItensNF, uSearchList, BDSqlUtils,
  uSearch, uUser, uEnviarEmail, uEditMemo, LazFileUtils, pcnConversao, ACBrUtil,
  pcnConversaoNFe, ACBrNFeNotasFiscais,ACBrDfe.Conversao ;

procedure TfrmNFSaida.FormResize(Sender: TObject);
begin
  CenterControl(GroupBox1);
  CenterControl(GroupBox2);
  CenterControl(GroupBox3);
  CenterControl(GroupBox4);
  CenterControl(GroupBox7);
  btCancelarLancamento1.Left := ToolBar1.Width - btCancelarLancamento1.Width;
end;

procedure TfrmNFSaida.ImpimeDanfeRetratoClick(Sender: TObject);
Var xml : Ansistring;
    filename : Ansistring;
begin
  if Length(qryNotachave_nfe.AsString) = 0 then
     Raise Exception.Create('Erro ao tentar recuperar XML, esta NF-e não tem a chave de acesso.');
  filename := GetTempDir(True) + qryNotachave_nfe.AsString + '-nfe.xml';;
  ExportXMLToFile(dbConnect.ZConnection1,'nfsaida_xml','nfsaida',qryNotaid.AsString,'xml_str',filename);
  if Not FileExists(filename) then
     Raise Exception.CreateFmt('Não foi possível gerar/exportar/abrir o arquivo "%s"',[filename]);

  InicializaConfigNFe( ACBrNFe1, StrToInt(getEmpresaPadrao( meCodigo )) );
  ACBrNFe1.NotasFiscais.Clear;
  ACBrNFe1.NotasFiscais.LoadFromFile(filename);
  ACBrNFe1.DANFE.TipoDANFE     := tiPaisagem;
  ACBrNFe1.DANFE.MostraPreview:= True;
    //ACBrNFe1.DANFE.ExibirResumoCanhoto:= True;

  if ACBrNFe1.NotasFiscais[0].NFe.Ide.tpEmis = teDPEC then begin
    filename := obtemPathSistemaNFe(tpsEventos, Date())+'110140'+qryNotachave_nfe.AsString+Format('%.2d-procEventoNFe.xml',[1]);
    ACBrNFe1.EventoNFe.LerXML(filename);//obtemPathSistemaNFe(tpsEventos, date())+'1101404116091197242800011255001000000101400000026801-procEventoNFe.xml');
    ACBrNFe1.Danfe.Protocolo  := ACBrNFe1.EventoNFe.Evento[0].RetInfEvento.nProt;
  end;
  ACBrNFe1.NotasFiscais.Imprimir;
end;

procedure TfrmNFSaida.ImprimirNFeClick(Sender: TObject);
Var xml : Ansistring;
    filename : Ansistring;
begin
  if Length(qryNotachave_nfe.AsString) = 0 then
     Raise Exception.Create('Erro ao tentar recuperar XML, esta NF-e não tem a chave de acesso.');
  filename := GetTempDir(True) + qryNotachave_nfe.AsString + '-nfe.xml';;
  ExportXMLToFile(dbConnect.ZConnection1,'nfsaida_xml','nfsaida',qryNotaid.AsString,'xml_str',filename);
  if Not FileExists(filename) then
     Raise Exception.CreateFmt('Não foi possível gerar/exportar/abrir o arquivo "%s"',[filename]);
  InicializaConfigNFe( ACBrNFe1 , StrToInt(getEmpresaPadrao( meCodigo )));
  ACBrNFe1.NotasFiscais.Clear;
  ACBrNFe1.NotasFiscais.LoadFromFile(filename);
  ACBrNFe1.DANFE.TipoDANFE       := tiSemGeracao;
  //ACBrNFe1.DANFE.TipoDANFE          := tiSimplificado;{tiSimplificado alterado para imprimir com ST}
  ACBrNFe1.DANFE.MostraPreview   := True;
  ACBrNFe1.DANFE.Cancelada       := qryNotacancelada.AsBoolean;
  ACBrNFe1.DANFE.MargemSuperior  := StrtoFloatDef(ReadStringINI(DefaultINFileName,'configuracoes','speMargemSuperior_Value','0'),0);
  ACBrNFe1.DANFE.MargemEsquerda  := StrtoFloatDef(ReadStringINI(DefaultINFileName,'configuracoes','speMargemEsquerda_Value','0'),0);
  ACBrNFe1.DANFE.MargemDireita   := StrtoFloatDef(ReadStringINI(DefaultINFileName,'configuracoes','speMargemDireita_Value','0'),0);
  ACBrNFe1.DANFE.MargemInferior  := StrtoFloatDef(ReadStringINI(DefaultINFileName,'configuracoes','speMargemInferior_Value','0'),0);

  if ACBrNFe1.NotasFiscais[0].NFe.Ide.tpEmis = teDPEC then begin
    filename := obtemPathSistemaNFe(tpsEventos, Date())+'110140'+qryNotachave_nfe.AsString+Format('%.2d-procEventoNFe.xml',[1]);
    ACBrNFe1.EventoNFe.LerXML(filename);//obtemPathSistemaNFe(tpsEventos, date())+'1101404116091197242800011255001000000101400000026801-procEventoNFe.xml');
    ACBrNFe1.Danfe.Protocolo  := ACBrNFe1.EventoNFe.Evento[0].RetInfEvento.nProt;
  end;
  ACBrNFe1.NotasFiscais.Imprimir;
end;

procedure TfrmNFSaida.GerarPDFdaDANFEClick(Sender: TObject);
Var PathDest : Ansistring;
Var filename : Ansistring;
begin
  if Length(qryNotachave_nfe.AsString) = 0 then
     Raise Exception.Create('Erro ao tentar recuperar XML, esta NF-e não tem a chave de acesso.');

  filename := GetTempDir(True) + qryNotachave_nfe.AsString + '-nfe.xml';;
  ExportXMLToFile(dbConnect.ZConnection1,'nfsaida_xml','nfsaida',qryNotaid.AsString,'xml_str',filename);
  if Not FileExists(filename) then
     Raise Exception.CreateFmt('Não foi possível gerar/exportar/abrir o arquivo "%s"',[filename]);

  InicializaConfigNFe( ACBrNFe1, StrToInt(getEmpresaPadrao( meCodigo )) );
  if not SelectDirectory('Salvar PDF', HomeDir, PathDest ) then exit;
  ACBrNFe1.NotasFiscais.Clear;
  ACBrNFe1.NotasFiscais.LoadFromFile( filename );
  ACBrNFe1.DANFE.TipoDANFE     := tiRetrato;
  ACBrNFe1.DANFE.MostraPreview:= False;
  //ACBrNFe1.DANFE.ExibirResumoCanhoto:= True;
  ACBrNFe1.DANFE.PathPDF       := PathDest;
  ACBrNFe1.NotasFiscais.ImprimirPDF;
end;

procedure TfrmNFSaida.lbStatusNFeDblClick(Sender: TObject);
begin
  if Str2StatusNFe(qryNotastatus_nfe.AsString) in [snfErro,snfEPEC] then
     ShowMessage(ExecSql(dbConnect.ZConnection1,'Select erro From nfsaida_erro Where nfsaida=%d',[qryNotaid.AsInteger]));
end;

procedure TfrmNFSaida.MenuItem11Click(Sender: TObject);
begin
  OpenUrl('https://www.sefaz.rs.gov.br/NFE/NFE-SVC.aspx?ambiente=Producao');
end;

procedure TfrmNFSaida.MenuItem5Click(Sender: TObject);
Var xml : Ansistring;
    filename : Ansistring;
begin
  InicializaConfigNFe( ACBrNFe1, StrToInt(getEmpresaPadrao( meCodigo )) );
  ACBrNFe1.NotasFiscais.Clear;
  GerarXml( ACBrNFe1 );

  filename := obtemPathSistemaNFe(tpsTmp);// + ACBrNFe1.NotasFiscais[0].NomeArq + '-nfe.xml';
  ACBrNFe1.NotasFiscais.GravarXML( filename );
  //ACBrNFe1.DANFE.TipoDANFE     := tiSimplificado;{tiSimplificado alterado para imprimir com ST}
  ACBrNFe1.DANFE.MostraPreview:= True;
  ACBrNFe1.DANFE.Cancelada  := qryNotacancelada.AsBoolean;
  //ACBrNFe1.DANFE.ExibirResumoCanhoto:= True;
  ACBrNFe1.NotasFiscais.Imprimir;
end;

procedure TfrmNFSaida.MenuItem6Click(Sender: TObject);
Var filename : Ansistring;
begin
  InicializaConfigNFe( ACBrNFe1, StrToInt(getEmpresaPadrao( meCodigo )) );
  ACBrNFe1.NotasFiscais.Clear;
  GerarXml( ACBrNFe1 );
  filename := obtemPathSistemaNFe(tpsTmp);
  ACBrNFe1.NotasFiscais.GravarXML( filename );
  filename := ACBrNFe1.NotasFiscais[0].NomeArq;
  OpenURL(filename);
end;

procedure TfrmNFSaida.MenuItem7Click(Sender: TObject);
begin
   AddItensNFDevolucaoFornecedor(qryNFReferencia.FieldByName('nfentrada').AsInteger);
end;

procedure TfrmNFSaida.MenuItem9Click(Sender: TObject);
Var filename : Ansistring;
begin
  if Length(qryNotachave_nfe.AsString) = 0 then
     Raise Exception.Create('Erro ao tentar recuperar XML, esta NF-e não tem a chave de acesso.');

  if not SelectDirectory('Salvar xml...',HomeDir(),filename) then exit;
  filename := NormalDir(filename) + qryNotachave_nfe.AsString + '-nfe.xml';;
  ExportXMLToFile(dbConnect.ZConnection1,'nfsaida_xml','nfsaida',qryNotaid.AsString,'xml_str',filename);
  if Not FileExists(filename) then
     Raise Exception.CreateFmt('Não foi possível gerar/exportar/abrir o arquivo "%s"',[filename]);

  ShowMessageFmt('Arquivo salvo com sucesso em : %s',[filename]);
end;

procedure TfrmNFSaida.mnCancelarNFeClick(Sender: TObject);
//var Chave, idLote, CNPJ, Protocolo, Justificativa : string;
var vAux : String;
Var filename, destFile : Ansistring;
  idLote: LongInt;
begin
  PostTable(qryNota);
  //snfIniciada, snfPendente, snfErro, snfDenegada,,  snfContingencia, snfCancelada, snfInutilizada
  if Str2StatusNFe(qryNotastatus_nfe.ASString) <> snfAutorizada then
       Raise Exception.Create('NF-e não pode ser cancelada.');

  if MessageDlg('Você que cancelar a nota fiscal número '+qryNotanumeroctlform.AsString+' agora ?',mtConfirmation,[mbNo,mbYes],0) <> mrYes then exit;

  InicializaConfigNFe( ACBrNFe1, StrToInt(getEmpresaPadrao( meCodigo )) );
  ACBrNFe1.Configuracoes.Geral.AtualizarXMLCancelado:= True;
  ACBrNFe1.Configuracoes.WebServices.Visualizar     := True;

  filename := GetTempDir(True) + qryNotachave_nfe.AsString + '-nfe.xml';;
  ExportXMLToFile(dbConnect.ZConnection1,'nfsaida_xml','nfsaida',qryNotaid.AsString,'xml_str',filename);
  ACBrNFe1.NotasFiscais.Clear;
  ACBrNFe1.NotasFiscais.LoadFromFile(FileName);
  idLote := DateTimeToDosDateTime(Now);//FormatDateTime('yymmddhhnn',Now() );
  if not(InputQuery('Cancelamento', 'Justificativa', vAux)) then
     exit;
  if Length(vAux) < 15 then
     Raise exception.Create('Justificativa deve ter no mínimo 15 caracteres');
  StartWait;
  try
    ACBrNFe1.EventoNFe.Evento.Clear;
    ACBrNFe1.EventoNFe.idLote := idLote;
    with ACBrNFe1.EventoNFe.Evento.Add do begin
         infEvento.dhEvento := now;
         infEvento.tpEvento := teCancelamento;
         infEvento.detEvento.xJust := vAux;
    end;
    if ACBrNFe1.EnviarEvento( idLote ) then begin
      //ShowMessageFmt('%d   -   %d',[
      //ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat,
      //ACBrNFe1.WebServices.EnvEvento.cStat]);

      if ACBrNFe1.CstatCancelada(ACBrNFe1.WebServices.EnvEvento.cStat) then
         //Raise Exception.Create(ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo);
      destFile  := obtemPathSistemaNFe(tpsXMLAnoMes, ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi ) +
                    ExtractFileName(filename);
      ACBrNFe1.NotasFiscais[0].GravarXML(destFile);
      //CopyFile(filename, destFile);
      //if FileExists(destFile) then
         //DeleteFile(filename);
      ExecSql(dbConnect.ZConnection1,'Delete From contas_receber Where id_nf=%d',[qryNotaid.AsInteger]);
      ExecSql(dbConnect.ZConnection1,'Update nfsaida Set status_nfe=%s Where id=%d',
                                     [StatusNFe2Str( snfCancelada ),qryNotaid.AsInteger]);
      ImportaXMLToDBFromStr(dbConnect.ZConnection1,'nfsaida_xml_canceladas','nfsaida',qryNotaid.AsString,'xml_str',ACBrNFe1.NotasFiscais[0].XMLAssinado);
      OpenNFe( qryNotaid.AsInteger );
      EstornarFlex( qryNotaid.AsInteger );
      RefreshTable( qryListaNotas );
      if qryNotanumero_pedio_online.AsInteger <> 0 then begin
         if MessageDlg('Você quer disponibilizar o pedido desta nota novamente ?',mtConfirmation,[mbNo,mbYes],0) = mrYes then begin
           ExecSql(dbConnect.ZConnection1,'Update pedido_venda Set status=%d Where id=%d',[STATUS_PEDIDO_PENDENTE, qryNotanumero_pedio_online.AsInteger]);
         end;
         StopWait;
         Exit;
      end;
      DevolverTudoParaEstoque('Cancelamento Nota fiscal');
    end;
  except
    StopWait;
    Raise;
  end;
end;

procedure TfrmNFSaida.mnCartaCorrecaoClick(Sender: TObject);
Var qry : TZQuery;
    xmlCarta,xmlNFe : String;
begin
  qry := ExecSqlQuery( dbConnect.ZConnection1, 'Select nfsaida, sequencia, datahora, xml_str::::Text from nfsaida_carta_correcao '+
                                               'Where nfsaida=%d and '+
                                               'sequencia=(select max(sequencia) from nfsaida_carta_correcao where nfsaida=%d)',
                                               [qryNotaid.AsInteger,
                                                qryNotaid.AsInteger]);
  if qry.EOF and qry.bof then
     Raise Exception.Create('Não há carta de correção para esta nota.');
  InicializaConfigNFe(ACBrNFe1, StrToInt(getEmpresaPadrao( meCodigo )));
  xmlCarta := ExportXMLToFile(dbConnect.ZConnection1,'nfsaida_carta_correcao',['nfsaida','sequencia'],
                                         [qryNotaid.AsString,qry.FieldByName('sequencia').AsString],
                                         'xml_str');

  xmlNFe   := ExportXMLToFile(dbConnect.ZConnection1,'nfsaida_xml',['nfsaida'],[qryNotaid.AsString],'xml_str');
  ACBrNFe1.NotasFiscais.Clear;
  ACBrNFe1.NotasFiscais.LoadFromString(xmlNFe);
  ACBrNFe1.EventoNFe.Evento.Clear;
  ACBrNFe1.EventoNFe.LerXMLFromString( xmlCarta );
  ACBrNFe1.ImprimirEvento;
end;
//Var qry : TZQuery;
//    xml : String;
//begin
//  qry := ExecSqlQuery( dbConnect.ZConnection1, 'Select nfsaida, sequencia, datahora, xml_str::::Text from nfsaida_carta_correcao '+
//                                               'Where nfsaida=%d and '+
//                                               'sequencia=(select max(sequencia) from nfsaida_carta_correcao where nfsaida=%d)',
//                                               [qryNotaid.AsInteger,
//                                                qryNotaid.AsInteger]);
//  if qry.EOF and qry.bof then
//     Raise Exception.Create('Não há carta de correção para esta nota.');
//  InicializaConfigNFe(ACBrNFe1, StrToInt(getEmpresaPadrao( meCodigo )));
//  xml := ExportXMLToFile(dbConnect.ZConnection1,'nfsaida_carta_correcao',['nfsaida','sequencia'],
//                                         [qryNotaid.AsString,qry.FieldByName('sequencia').AsString],
//                                         'xml_str');
//
//  //qry.FieldByName('xml_str').AsString;
//  {xml := ExecSql( dbConnect.ZConnection1, 'Select xml_str From nfsaida_carta_correcao '+
//                                          'Where nfsaida=%d and sequencia=%d',
//                                          [qryNotaid.AsInteger,
//                                           qry.FieldByName('sequencia').AsInteger]);
//                                           }
//  ACBrNFe1.NotasFiscais.Clear;
//
//  ACBrNFe1.EventoNFe.LerXMLFromString( xml );
//  ACBrNFe1.ImprimirEvento;


procedure TfrmNFSaida.mnCartaCorrecaoEmailClick(Sender: TObject);
Var sxml,filename, email : Ansistring;
    msg : TStringList;
    SMTPConfig : TSMTPConfig;
    qry : TZQuery;
    xml: Ansistring;
begin
  qry := ExecSqlQuery( dbConnect.ZConnection1, 'Select nfsaida, sequencia, datahora, xml_str from nfsaida_carta_correcao '+
                                               'Where nfsaida=%d and '+
                                               'sequencia=(select max(sequencia) from nfsaida_carta_correcao where nfsaida=%d)',
                                               [qryNotaid.AsInteger,
                                                qryNotaid.AsInteger]);
  if qry.EOF and qry.bof then
     Raise Exception.Create('Não há carta de correção para esta nota.');

  if Length(qryNotachave_nfe.AsString) = 0 then
     Raise Exception.Create('Erro ao tentar recuperar XML, esta NF-e não tem a chave de acesso.');

  email := ExecSql(dbConnect.ZConnection1,'Select email From clientes Where id=%d',[qryNotacodcliente.asInteger]);
  if Not InputQuery('Enviar e-mail','Digite o e-mail de destino',email) then exit;
  filename := '110110';
  filename += qryNotachave_nfe.AsString;
  filename += Format('%.2d',[qry.FieldByName('sequencia').AsInteger]);
  filename += '-procEventoNFe.xml';
                //GetTempDir(True) +
  ExportXMLToFile(dbConnect.ZConnection1,'nfsaida_carta_correcao',['nfsaida','sequencia'],
                                         [qryNotaid.AsString,qry.FieldByName('sequencia').AsString],
                                         'xml_str',GetTempDir(True) + filename);
  if Not FileExists(GetTempDir(True) + filename) then
     Raise Exception.CreateFmt('Não foi possível gerar/exportar/abrir o arquivo "%s"',[GetTempDir(True) + filename]);

  InicializaConfigNFe( ACBrNFe1, StrToInt(getEmpresaPadrao( meCodigo )) );
  ACBrNFe1.NotasFiscais.Clear;
  ACBrNFe1.EventoNFe.LerXML(GetTempDir(True) + filename);

  msg := TStringList.Create;
  msg.Add('Segue em anexo Carta de correção Referente a nota ' + qryNotanumeroctlform.AsString );
  ACBrNFe1.MAIL := dbConnect.ACBrMail1;
  SMTPConfig := getSmtpConfig();
  ACBrNFe1.MAIL.Host    := SMTPConfig.smtpserver;
  ACBrNFe1.MAIL.Port    := SMTPConfig.smtpporta;
  ACBrNFe1.MAIL.SetSSL  := SMTPConfig.smtpssl;
  ACBrNFe1.MAIL.SetTLS  := SMTPConfig.smtptls;
  ACBrNFe1.MAIL.From    := SMTPConfig.smtpusuario;
  ACBrNFe1.MAIL.FromName:= getEmpresaPadrao(meNome);
  ACBrNFe1.MAIL.Username:= SMTPConfig.smtpusuario;
  ACBrNFe1.MAIL.Password:= SMTPConfig.smtpsenha;
  ACBrNFe1.EnviarEmailEvento(email,'Carta de correção',msg);
end;

procedure TfrmNFSaida.mnConsultarNFeClick(Sender: TObject);
Var filename , chave_nfe, recibo, sourceFile, destFile: String;
begin
  //(length(qryNotachave_nfe.AsString) = 0) or
  if (qryNotanumeroctlform.IsNull )          then
     Raise Exception.Create('Não é possível consultar a NF-e');
  try
    StartWait;
    PostTable(qryNota);
    InicializaConfigNFe( ACBrNFe1, StrToInt(getEmpresaPadrao( meCodigo )) );
    ACBrNFe1.Configuracoes.Geral.AtualizarXMLCancelado:= True;
    ACBrNFe1.Configuracoes.WebServices.Visualizar     := True;
    filename := GetTempDir(True) + qryNotachave_nfe.AsString + '-nfe.xml';
    DeleteFile(filename);
    if Length(qryNotachave_nfe.AsString) > 0 then
    begin
      ExportXMLToFile(dbConnect.ZConnection1,'nfsaida_xml','nfsaida',qryNotaid.AsString,'xml_str',filename);
      if FileExists(filename) and (FileSizeUtf8(filename) > 0) then begin
         ACBrNFe1.NotasFiscais.Clear;
         ACBrNFe1.NotasFiscais.LoadFromFile(filename);
         if OnlyNumber(ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID) <> qryNotachave_nfe.AsString then
            Raise Exception.Create('Não é possível consultar a NF-e');
         if Not ACBrNFe1.Consultar then
            Raise Exception.Create('Não foi possível consultar a NF-e');
         //ShowMessage(ACBrNFe1.WebServices.Consulta.XMotivo);
         ACBrNFe1.NotasFiscais[0].GravarXML(filename);
         chave_nfe := OnlyNumber(ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID);
         //chave := OnlyNumber(ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID);
         //ImportaXMLToDBFromFile(dbConnect.ZConnection1,'nfsaida_xml','nfsaida',qryNotaid.AsString,'xml_str',filename);
      end else
      begin
        ACBrNFe1.NotasFiscais.Clear;
        GerarXml(ACBrNFe1);
        ACBrNFe1.NotasFiscais.Assinar;
        ACBrNFe1.NotasFiscais.GerarNFe;
        ACBrNFe1.NotasFiscais[0].GravarXML(filename);
        chave_nfe := OnlyNumber(ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID);
        if Not ACBrNFe1.Consultar then
           Raise Exception.Create('Não foi possível consultar a NF-e');
      end;
    end else
    begin
       ACBrNFe1.NotasFiscais.Clear;
       GerarXml(ACBrNFe1);
       ACBrNFe1.NotasFiscais.GerarNFe;
       ACBrNFe1.Configuracoes.Arquivos.PathSalvar := obtemPathSistemaNFe(tpsTmp );
       //sourceFile := obtemPathSistemaNFe(tpsTmp ) + OnlyNumber(ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID) + '-nfe.xml';
       ACBrNFe1.NotasFiscais.Assinar;
       ACBrNFe1.NotasFiscais.Validar;
       ACBrNFe1.NotasFiscais.GravarXML(filename);
       if Not ACBrNFe1.Consultar then
         Raise Exception.Create('Não foi possível consultar a NF-e');
       chave_nfe := ACBrNFe1.NotasFiscais[0].NFe.procNFe.chNFe;
       recibo    := ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt;
       destFile  := obtemPathSistemaNFe(tpsXMLAnoMes, ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi ) +
                     ExtractFileName(sourceFile);
       CopyFileTo(filename, destFile);
       ExecSql(dbConnect.ZConnection1,'Update nfsaida Set chave_nfe=''%s'', status_nfe=%s,'+
                                      'numero_recibo=%s Where id=%d',
                                      [chave_nfe,
                                       StatusNFe2Str( snfAutorizada ),
                                       recibo,
                                       qryNotaid.AsInteger]);
       ImportaXMLToDBFromStr(dbConnect.ZConnection1,'nfsaida_xml','nfsaida',qryNotaid.AsString,'xml_str',ACBrNFe1.NotasFiscais[0].XMLAssinado);
       RefreshTable( qryNota );
       Exit;
    end;
//     ShowMessage(ACBrNFe1.WebServices.Consulta.XMotivo);
    if ACBrNFe1.CstatCancelada( ACBrNFe1.WebServices.Consulta.cStat ) then begin
       EditTable(qryNota);
       qryNotastatus_nfe.AsString:= StatusNFe2Str( snfCancelada );
       PostTable(qryNota);
    end;
    if ACBrNFe1.CstatConfirmada( ACBrNFe1.WebServices.Consulta.cStat ) then begin
       ImportaXMLToDBFromFile(dbConnect.ZConnection1,'nfsaida_xml','nfsaida',qryNotaid.AsString,'xml_str',filename);
       EditTable(qryNota);
       qryNotastatus_nfe.AsString:= ifthen(ACBrNFe1.WebServices.Consulta.cStat in [110,301,302,303],StatusNFe2Str( snfDenegada ),StatusNFe2Str( snfAutorizada ));
       qryNotachave_nfe.AsString := ACBrNFe1.NotasFiscais[0].NFe.procNFe.chNFe;
       PostTable(qryNota);
    end;

    OpenNFe( qryNotaid.AsInteger );
    RefreshTable( qryListaNotas );
  finally
    StopWait;
  end;
end;

procedure TfrmNFSaida.mnConsultarSEFAZClick(Sender: TObject);
var
  qry: TZQuery;
begin
  PostTable(qryNota);
  qry := InicializaConfigNFe( ACBrNFe1, StrToInt(getEmpresaPadrao( meCodigo )) );

  ACBrNFe1.Configuracoes.WebServices.Visualizar:= True;
  ACBrNFe1.WebServices.StatusServico.Executar;
end;

procedure TfrmNFSaida.mnAutorizarNFeClick(Sender: TObject);
Var cnf, id : integer;
    filename : String;
begin
  PostTable(qryNota);
  if Str2StatusNFe(qryNotastatus_nfe.ASString) in [snfDenegada, snfAutorizada, snfCancelada, snfInutilizada ] then
     Raise Exception.Create('NF-e não pode ser enviada novamente.');

  if Not CheckEANItensNota(qryNotaid.AsInteger) then
     Raise Exception.Create('Erro de codigo de barras.');

  InicializaConfigNFe( ACBrNFe1, StrToInt(getEmpresaPadrao( meCodigo )) );
  //ACBrNFe.Configuracoes.Geral.FormaEmissao = teDPEC
  if (Str2StatusNFe(qryNotastatus_nfe.ASString) = snfEPEC)
     and (ACBrNFe1.Configuracoes.Geral.FormaEmissao = teNormal) then begin
    filename := obtemPathSistemaNFe(tpsEventos, qryNotadataemissao.AsDateTime )+
                '110140'+qryNotachave_nfe.AsString+'01-procEventoNFe.xml';
    ACBrNFe1.EventoNFe.LerXML(filename);
    ACBrNFe1.Configuracoes.Geral.FormaEmissao := teDPEC;
    GerarXml( ACBrNFe1 );
    ACBrNFe1.Configuracoes.Geral.FormaEmissao := teNormal;
    AutorizaNFe( ACBrNFe1 );
    OpenNFe( qryNotaid.AsInteger );
    exit;
  end;

  id := qryNotaid.AsInteger;
  if qryNotanumeroctlform.AsInteger = 0 then begin
//    cnf := StrToIntDef(ExecSql( dbConnect.ZConnection1, 'Select max(numeroctlform)+1 From nfsaida Where id <> %d',[qryNotaid.AsInteger]),1);
    cnf := StrToIntDef(ExecSql( dbConnect.ZConnection1, 'Select max(ultima_nfe_autorizada)+1 From empresa Where id=%s',[ getEmpresaPadrao(meCodigo)]),1);
    qryNota.Edit;
    qryNotanumeroctlform.AsInteger := cnf;
    qryNota.Post;
    ExecSql( dbConnect.ZConnection1, 'Update empresa SET ultima_nfe_autorizada=ultima_nfe_autorizada+1 Where id=%s',[ getEmpresaPadrao(meCodigo)]);
    if not GerarContasReceber then
       Exit;
  end;
  GerarXml( ACBrNFe1 );
  AutorizaNFe( ACBrNFe1 );
  OpenNFe( id );
  RefreshTable( qryListaNotas );
{
  LancarFlex( id );
  EnviaMessagePedidoFaturado(id);
  }
end;

procedure TfrmNFSaida.mnInutilizarNumeracaoClick(Sender: TObject);
var
 Modelo, Serie, Ano, NumeroInicial, NumeroFinal, Justificativa : String;
 qry : TZQuery;
begin
 PostTable(qryNota);
 Ano := IntToStr( YearOf(Date()) );
 if not(InputQuery('WebServices Inutilização ', 'Ano',    Ano)) then
    exit;
 Modelo := '55';
 if not(InputQuery('WebServices Inutilização ', 'Modelo', Modelo)) then
    exit;
 Serie := '1';
 if not(InputQuery('WebServices Inutilização ', 'Serie',  Serie)) then
    exit;
 if not(InputQuery('WebServices Inutilização ', 'Número Inicial', NumeroInicial)) then
    exit;
 //if not(InputQuery('WebServices Inutilização ', 'Número Final', NumeroFinal)) then
    //exit;
 Justificativa := 'Falha do sistema ao concluir venda.';
 if not(InputQuery('WebServices Inutilização ', 'Justificativa', Justificativa)) then
    exit;
 NumeroFinal := NumeroInicial;
 qry := InicializaConfigNFe(ACBrNFe1, StrToInt(getEmpresaPadrao( meCodigo )));
 ACBrNFe1.Configuracoes.WebServices.Visualizar:= True;
 //StrToInt(Modelo)
 StartWait;
 try
   if ACBrNFe1.Inutilizar(qry.FieldByname('cnpj').ASString, Justificativa,
                                    StrToInt(Ano), StrToInt(Serie), StrToInt(NumeroInicial), StrToInt(NumeroFinal)) then begin
     ExecSql(dbConnect.ZConnection1,'INSERT INTO nfe_inutilizacao(modelo,numero,serie,ano,justificativa,nprot) '+
                                    'VALUES(%s,%s,%s,%s,''%s'',''%s'')',
                                    [Modelo,NumeroInicial,Serie,Ano,Justificativa,
                                     ACBrNFe1.WebServices.Inutilizacao.Protocolo]);
     ExecSql(dbConnect.ZConnection1,'Update nfsaida Set status_nfe=''%s'' Where numeroctlform=%s',[StatusNFe2Str(snfInutilizada),NumeroInicial]);//snfInutilizada, snfIniciada

     ImportaXMLToDBFromStr(dbConnect.ZConnection1,'nfe_inutilizacao',['modelo','numero','serie'],
                           [Modelo,NumeroInicial,Serie],
                           'xml',
                           ACBrNFe1.WebServices.Inutilizacao.XML_ProcInutNFe);

     DeleteFiles(obtemPathSistemaNFe(tpsInutilizadas,Date())+'*-ped-inu.xml');
     DeleteFiles(obtemPathSistemaNFe(tpsInutilizadas,Date())+'*-inu.xml');
     ExecSql(dbConnect.ZConnection1,'Delete From nfsaida Where numeroctlform=%s',[NumeroInicial]);
     RefreshTable( qryListaNotas );
     OpenNFe(0);
   end;
 finally
   StopWait;
 end;
end;

procedure TfrmNFSaida.PageControl1Change(Sender: TObject);
begin
  CenterControl(GroupBox1);
  CenterControl(GroupBox2);
  CenterControl(GroupBox3);
  CenterControl(GroupBox4);
  CenterControl(GroupBox7);
  if PageControl1.ActivePageIndex = 1 then
     LoadNota;
  btCancelarLancamento1.Enabled:= (PageControl1.ActivePageIndex = 1);
end;

procedure TfrmNFSaida.PageControl2Change(Sender: TObject);
begin
  CenterControl(GroupBox1);
  CenterControl(GroupBox2);
  CenterControl(GroupBox3);
  CenterControl(GroupBox4);
  CenterControl(GroupBox7);
  OpenTable( qryNFReferencia );
end;

procedure TfrmNFSaida.RxDBGrid1DblClick(Sender: TObject);
begin
  StartWait;
  try
    OpenNFe(qryListaNotasid.AsInteger);
    PageControl1.ActivePageIndex:= 1;
    CenterControl(GroupBox2);
  finally
    StopWait;
  end;
end;

procedure TfrmNFSaida.LoadNota;
begin
  StartWait;
  try
    OpenNFe(qryListaNotasid.AsInteger);
    PageControl1.ActivePageIndex:= 1;
  finally
    StopWait;
  end;
end;

function TfrmNFSaida.GerarContasReceber: Boolean;
Var geraconta : String;
    conta, r : Integer;
begin
  Result := False;
  PostTable( qryNota );
  geraconta := ExecSql(dbConnect.ZConnection1,'Select gera_conta From tabela_forma_pagamento Where nome ilike ''%s''',[qryNotaforma_pgto.AsString]);
  if Not StrToBoolDef(geraconta, False) then Exit;
  with TfrmGerarCtaReceber.Create( Self ) do
  begin
      OpenNotaFiscal(qryNotaid.AsInteger);
      ShowModal;
      if ModalResult = mrCancel then begin
         Free;
         Exit;
      end;
      if qryNotanumeroctlform.AsInteger = 0 then begin
         Raise Exception.Create('Contas a receber não será gerado. Numero da nota esta em zero (0).');
      end;
      ExecSql(dbConnect.ZConnection1,'Delete From contas_receber Where id_nf=%d and origem ilike ''NFSAIDA''',[qryNotaid.AsInteger]);
      mdCtaTemp.First;
      qryCtaReceber.close;
      OpenTable( qryCtaReceber );
      conta := ifthen(mdCtaTemp.RecordCount=1,125,3);
      While Not mdCtaTemp.Eof do begin
          qryCtaReceber.Append;
          qryCtaReceberid_nf.AsInteger         := qryNotaid.AsInteger;
          qryCtaReceberorigem.AsString         := 'NFSAIDA';
          qryCtaReceberparcela.AsInteger       := mdCtaTempparcela.AsInteger;
          qryCtaRecebertotal_parcelas.AsInteger:= mdCtaTemp.RecordCount;
          qryCtaRecebercliente.AsInteger       := qryNotacodcliente.AsInteger;
          //r := mdCtaTemp.recno;
          //r := rgImposto.ItemIndex;
          if ((mdCtaTemp.recno=1) and (rgImposto.ItemIndex=2)) then
             qryCtaReceberdocumento.AsString      := Format('%.d-%s',[qryNotanumeroctlform.AsInteger,
                                                                    'ST'])
          else begin
             if mdCtaTemp.RecordCount > 1 then
                qryCtaReceberdocumento.AsString      := Format('%.d-%s',[qryNotanumeroctlform.AsInteger,
                                                                    Char(64+mdCtaTempparcela.AsInteger)])
             else
                qryCtaReceberdocumento.AsString      := Format('%.d',[qryNotanumeroctlform.AsInteger]);

          end;
          qryCtaReceberdescricao.AsString      := qryNotadestinatario.AsString;
          qryCtaReceberconta.AsInteger         := conta;
          qryCtaReceberconta_credito.AsInteger := conta;
          //qryCtaReceberconta_debito.AsInteger  := 0;
          qryCtaReceberdataconta.AsDateTime    := Date();
          qryCtaRecebervalor_devido.AsCurrency    := mdCtaTempvalor.AsCurrency;
          qryCtaReceberdata_vencimento.AsDateTime := mdCtaTempdtvcto.AsDateTime;
          qryCtaReceberdesconto.AsCurrency        := 0.00;
          qryCtaReceberjuros.AsCurrency           := 0.00;
          qryCtaRecebervalor_pago.AsCurrency      := 0.00;
          qryCtaReceber.Post;
          mdCtaTemp.Next;
      end;
      Result := True;
  end;
end;

procedure TfrmNFSaida.CriarNovaNFeVenda;
begin
  OpenNFe( 0 );
  qryNota.Insert;
  qryNotadataemissao.Asdatetime := Now();
  qryNotatipo_nota.AsString     := TipoNFSaida2Str( NOTA_VENDA );
  qryNotanatureza.AsString      := Str2TipoNFSaidaLiteral(qryNotatipo_nota.AsString);
  qryNotastatus_nfe.AsString    := StatusNFe2Str( snfIniciada );
  SelecionarDestinatario('C','0');
  qryNota.Post;
  OpenNFe(qryNotaid.AsInteger);
end;


procedure TfrmNFSaida.CriarNovaNFeBonificadaDePedido;
var res : Variant;
    id  : Integer;
    sql , count: String;
begin
  sql := 'Select p.id,p.data,c.cnpj::::varchar(18),c.nome::::varchar(80),p.status '+
         'from pedido_venda p '+
         'left join clientes c on c.id=p.cliente ';

  res := ShowSearchModalSQL(dbConnect.ZConnection1,sql,'id,data,cnpj,nome','id','nome',true,'status=0');
  if VarIsBlank(res) then exit;
  count := ExecSql(dbConnect.ZConnection1,'Select count(*) From pedido_venda_itens Where quant_estoque < 0 and pedido_venda=%s',[res]);
  if StrToIntDef(count,0) > 0 then
     Raise Exception.CreateFmt('NF-e não pode ser gerada, pedido %s tem itens com faltas. Verifique o pedido.',[res]);
  ExecSql(dbConnect.ZConnection1,'Begin Work');
  try
    id := CopiarPedidoParaNota( res );
    ExecSql(dbConnect.ZConnection1,'Update nfsaida Set natureza=''%s'', tipo_nota=%s where id=%d',
                                [Str2TipoNFSaidaLiteral( TipoNFSaida2Str(NOTA_BONIFICACAO) ),
                                 TipoNFSaida2Str(NOTA_BONIFICACAO),
                                 id]);
    CopiarItensPedidoParaNota( res, id);
    //ExecSql(dbConnect.ZConnection1,'Update nfsaida_itens Set cfop_item=''%s'' where nfsaida=%d',[id]);
    ExecSql(dbConnect.ZConnection1,'Update pedido_venda Set status=%d Where id=%s',[STATUS_PEDIDO_NOTA, res]);
    ExecSql(dbConnect.ZConnection1,'Commit');
    RestoreDecimalSeparator;
    OpenNFe( id );
    SomarNota;
  except
    RestoreDecimalSeparator;
    ExecSql(dbConnect.ZConnection1,'Rollback');
    Raise;
  end;
end;

procedure TfrmNFSaida.CriarNovaNFeDePedido;
var res : Variant;
    id  : Integer;
    sql , count: String;
begin
  sql := 'SELECT p.id,p.data,c.cnpj::::varchar(18),c.nome::::varchar(80),p.status '+
         'FROM pedido_venda p '+
         'LEFT JOIN clientes c on c.id=p.cliente ';

  res := ShowSearchModalSQL(dbConnect.ZConnection1,sql,'id,data,cnpj,nome','id','nome',true,'status=0');
  if VarIsBlank(res) then exit;
  count := ExecSql(dbConnect.ZConnection1,'Select count(*) From pedido_venda_itens Where quant_estoque < 0 and pedido_venda=%s',[res]);
  if StrToIntDef(count,0) > 0 then
     Raise Exception.CreateFmt('NF-e não pode ser gerada, pedido %s tem itens com faltas. Verifique o pedido.',[res]);

  ExecSql(dbConnect.ZConnection1,'Begin Work');
  try
    id := CopiarPedidoParaNota( res );
    CopiarItensPedidoParaNota( res, id);
    ExecSql(dbConnect.ZConnection1,'Update pedido_venda Set status=%d Where id=%s',[STATUS_PEDIDO_NOTA, res]);
    ExecSql(dbConnect.ZConnection1,'Commit');
    RestoreDecimalSeparator;
    OpenNFe( id );
    SomarNota;
  except
    RestoreDecimalSeparator;
    ExecSql(dbConnect.ZConnection1,'Rollback');
    Raise;
  end;
end;

procedure TfrmNFSaida.CriarNovaNFeDeNFCe;
begin
  ShowMessage('Gerar NF-e de NFC-e');
end;

procedure TfrmNFSaida.CriarNotaDevolucaoFornecedor;
Var res : Variant;
begin
  OpenNFe( 0 );
  res := ShowSearchModal(dbConnect.ZConnection1,'fornecedores','id,nome','id','nome',True,'status=''ATIVO''');
  if VarIsBlank(res) then exit;
  qryNota.Insert;
  qryNotadataemissao.Asdatetime := Now();
  qryNotatipo_nota.AsString     := TipoNFSaida2Str( NOTA_DEVOLUCAO_FOR );
  qryNotanatureza.AsString      := Str2TipoNFSaidaLiteral(qryNotatipo_nota.AsString);
  qryNotastatus_nfe.AsString    := StatusNFe2Str( snfIniciada );
  SelecionarDestinatario('F', res);
  qryNota.Post;
  OpenNFe(qryNotaid.AsInteger);
  while true do begin
    res := ShowSearchModal(dbConnect.ZConnection1,'nfentrada','numeronf,fornecedor','id','fornecedor',Format('cliente_forn=%d',[qryNotacodcliente.AsInteger]),'id',true);
    if VarIsBlank(res) then Break;
    ExecSql(dbConnect.ZConnection1,'INSERT INTO nfsaida_referencias(nfsaida_principal, nfsaida, nfentrada) '+
                                   'VALUES (%d, %d, %s)',
                                   [qryNotaid.AsInteger,
                                    0,
                                    res]);
    AddItensNFDevolucaoFornecedor(res);
  end;
end;

procedure TfrmNFSaida.AddItensNFDevolucaoFornecedor( id_nfentrada : Integer);
Var lProds : TStringList;
    linha, csosn : String;
    i, lote: Integer;
    qryItenEnt, qryProd : TZQuery;
    voutras    , quant: Currency;
Begin
  //ACBrNFe1.NotasFiscais.Clear;
  //ACBrNFe1.NotasFiscais.LoadFromString(ExportXMLToString(dbConnect.ZConnection1,'nfentrada_xml','nfentrada',qryNFReferencia.FieldByname('nfentrada').AsString,'xml_str'), true);
  lProds := getItensNFEnt( id_nfentrada );
  For i := 0 to lProds.Count -1 do begin
     linha := lProds[i];
     qryItenEnt := ExecSqlQuery(dbConnect.ZConnection1,'Select * from nfentrada_itens Where id=%s',
                                [ ExtractWord(1,linha,[','])]);
     qryProd    := ExecSqlQuery(dbConnect.ZConnection1,'Select * from produtos Where id=%d',
                                [ qryItenEnt.FieldByName('produto').AsInteger ]);
     if qryItenEnt.eof and qryItenEnt.Bof then
        Raise Exception.Create('Item não encontrada em Nota fiscal de entrada.');


     qryItens.Append;
     qryItensnfsaida.AsInteger  := qryNotaid.AsInteger;
     qryItensproduto.AsInteger  := qryItenEnt.FieldByName('produto').AsInteger;
     qryItensdescricao.AsString := qryItenEnt.FieldByName('descricao').AsString;
     qryItensncm.AsString       := qryProd.FieldByName('ncm').AsString;
     qryItensunidade.AsString   := 'UND';
     lote := StrToIntDef(ExtractWord(3,linha,[',']),0);
     if lote = 0 then begin
        lote := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select id From produtos_estoque Where produto=%d and lote=''0'' Limit 1',[qryItensproduto.AsInteger]),0);
        if lote = 0 then begin
          ExecSql(dbConnect.ZConnection1,'INSERT INTO produtos_estoque(produto, lote, quantidade, empresa, data_entrada) '+
                                         'VALUES(%d,%d,%d,%s, CURRENT_TIMESTAMP)',
                                         [qryItensproduto.AsInteger,
                                          0,0,getEmpresaPadrao()]);
          lote := LastInsertID(dbConnect.ZConnection1,'produtos_estoque_id_seq');
        end;
     end;
     qryItenslote.AsInteger           := lote;//ExtractWord(3,linha,[',']),0);
     //
     //NOTA_DEVOLUCAO_FOR

     qryItensorigem.AsInteger         := qryItenEnt.FieldByName('orig').AsInteger;
     qryItensestoque_origem.AsString  := 'A';
     qryItensvalorunitario.AsCurrency := (qryItenEnt.FieldByName('valortotal').AsCurrency/
                                          qryItenEnt.FieldByName('quant_estoque').AsCurrency);
     quant   := StrToCurr(ExtractWord(2,linha,[',']));
     qryItensquantidade.AsCurrency    := quant;

     if qryNotadevolucao_st_ipi_outras_desp.AsBoolean then begin
        voutras := 0.00;
        csosn   := '00';
        if qryItenEnt.FieldByName('vicmsst').AsCurrency > 0 then begin
          voutras += (qryItenEnt.FieldByName('vicmsst').AsCurrency / qryItenEnt.FieldByName('quant_estoque').AsCurrency )* quant;
        end;
        if qryItenEnt.FieldByName('vipi').AsCurrency > 0 then begin
          voutras += (qryItenEnt.FieldByName('vipi').AsCurrency / qryItenEnt.FieldByName('quant_estoque').AsCurrency) * quant;
        end;
        qryItensvoutras.AsCurrency       := voutras;
        qryItensvalortotal.AsCurrency    := qryItensvalorunitario.AsCurrency * qryItensquantidade.AsCurrency;
        qryItenscst.AsString             := csosn;
        qryItenscst.AsString             := qryItenEnt.FieldByName('cst_csosn').AsString;

     end else begin
         {ICMS}
         qryItenspicms.AsCurrency     := qryItenEnt.FieldByName('p_icms').AsCurrency;
         qryItensredbase.AsCurrency   := qryItenEnt.FieldByName('predbc').AsCurrency;
         qryItensbaseicms.AsCurrency  := RoundABNT(qryItenEnt.FieldByName('vbcicms').AsCurrency/qryItenEnt.FieldByName('quant_estoque').AsCurrency * quant,2);
         qryItensmodbc.AsInteger      := qryItenEnt.FieldByName('modbc').AsInteger;
         {ST}
         qryItenspmva.AsCurrency      := qryItenEnt.FieldByName('pmvast').AsCurrency;
         qryItenspredst.AsCurrency    := qryItenEnt.FieldByName('predbcst').AsCurrency;
         qryItensvlricms.AsCurrency   := RoundABNT(qryItenEnt.FieldByName('vlr_icms').AsCurrency/qryItenEnt.FieldByName('quant_estoque').AsCurrency * quant,2);
         qryItensbasesubst.AsCurrency := RoundABNT(qryItenEnt.FieldByName('vbcst').AsCurrency/qryItenEnt.FieldByName('quant_estoque').AsCurrency * quant,2);
         qryItensvlrsubst.AsCurrency  := RoundABNT(qryItenEnt.FieldByName('vicmsst').AsCurrency/qryItenEnt.FieldByName('quant_estoque').AsCurrency * quant,2);
         qryItenspicmsst.AsCurrency   := qryItenEnt.FieldByName('picmsst').AsCurrency;
         qryItensmodbcst.AsInteger    := qryItenEnt.FieldByName('modbcst').AsInteger;
         qryItenscst.AsString         := qryItenEnt.FieldByName('cst_csosn').AsString;
         {IPI}
         qryItenscst_ipi.AsInteger    := qryItenEnt.FieldByName('cst_ipi').AsInteger;
         qryItensvbc_ipi.AsCurrency   := RoundABNT(qryItenEnt.FieldByName('vbcipi').AsCurrency/qryItenEnt.FieldByName('quant_estoque').AsCurrency * quant,2);
         qryItenspipi.AsCurrency      := qryItenEnt.FieldByName('pipi').AsCurrency;
         {PIS}
         qryItenscst_pis.AsInteger    := qryItenEnt.FieldByName('cst_pis').AsInteger;
         qryItensvbc_pis.AsCurrency   := RoundABNT(qryItenEnt.FieldByName('vbc_pis').AsCurrency/qryItenEnt.FieldByName('quant_estoque').AsCurrency * quant,2);
         qryItensppis.AsCurrency      := qryItenEnt.FieldByName('ppis').AsCurrency;

         {COFINS}
         qryItenscst_cofins.AsInteger := qryItenEnt.FieldByName('cst_cofins').AsInteger;
         qryItensvbc_cofins.AsCurrency:= RoundABNT(qryItenEnt.FieldByName('vbc_cofins').AsCurrency/qryItenEnt.FieldByName('quant_estoque').AsCurrency * quant,2);
         qryItenspcofins.AsCurrency   := qryItenEnt.FieldByName('pcofins').AsCurrency;

     end;
     qryItenscfop.AsString            := getCFOP4TipoMov( qryNotatipo_nota.AsInteger,qryNotauf.AsString,qryItenscst.AsInteger);

     PostTable(qryItens);
  end;
  SomarNota;
end;

procedure TfrmNFSaida.AddItensNFDevolucaoCliente(id_nfsaida: Integer);
begin
  ShowMessage('Ainda não implementado');
end;

procedure TfrmNFSaida.LancarFlex(id: Integer);
Var vlrFlexRepPos, vlrFlexRepNeg, vlrFlexEmp,vlrFlexRep : Currency;
    porcRep, porcEmp : Currency;
    historico,stmp : String;
begin
  // Executa o lancamento do flex
  {FLEX_PORCENTAGEM_REPRESENTANTE}
  stmp := ExecSql(dbConnect.ZConnection1,'Select sum(vlr_flex*quantidade) from nfsaida_itens where nfsaida=%d and vlr_flex > 0',
                                              [id]);
  vlrFlexRepPos := StrToCurrDef(stmp,0.00);

  stmp := ExecSql(dbConnect.ZConnection1,'Select sum(abs(vlr_flex*quantidade)) from nfsaida_itens where nfsaida=%d and vlr_flex < 0',
                                              [id]);
  vlrFlexRepNeg := StrToCurrDef(stmp,0.00);

  if (vlrFlexRepPos = 0)  and (vlrFlexRepNeg = 0) then exit;
  {Calculo}
  porcRep    := StrToCurrDef(getSysParametro('FLEX_PORCENTAGEM_REPRESENTANTE'),0.00);
  porcEmp    := StrToCurrDef(getSysParametro('FLEX_PORCENTAGEM_EMPRESA'),0.00);
  vlrFlexRep := vlrFlexRepPos * porcRep;
  vlrFlexEmp := vlrFlexRepPos * porcEmp;
  {Lancar flex positivo no conta corrente do representante}
  try
    SetDecimalSeparator('.');
    historico  := Format('%.0f%% (%.6d)->%s',[porcRep*100,qryNotanumeroctlform.AsInteger,qryNotadestinatario.AsString]);
    if vlrFlexRep > 0 then
       ExecSql(dbConnect.ZConnection1,'INSERT INTO conta_corrente_flex(nfsaida, representante, historico, credito, debito) '+
                                      'Values(%d,%d,''%s'',%.3f,%.3f) ',
                                      [id,qryNotavendedor.AsInteger,
                                       historico,vlrFlexRep,0.00]);
    {Lancar flex negativo no conta corrente do representante}
    historico  := Format('(%.6d)->%s',[qryNotanumeroctlform.AsInteger,qryNotadestinatario.AsString]);
    if vlrFlexRepNeg > 0 then
       ExecSql(dbConnect.ZConnection1,'INSERT INTO conta_corrente_flex(nfsaida, representante, historico, credito, debito, imediato) '+
                                      'Values(%d,%d,''%s'',%.3f,%.3f, true) ',
                                      [id,qryNotavendedor.AsInteger,
                                       historico,0.00,vlrFlexRepNeg]);
    {Lancar flex positivo no conta corrente da empresa}
    historico  := Format('%.0f%% (%.6d)->%s',[porcEmp*100,qryNotanumeroctlform.AsInteger,qryNotadestinatario.AsString]);
    if vlrFlexEmp > 0 then
       ExecSql(dbConnect.ZConnection1,'INSERT INTO conta_corrente_flex(nfsaida, representante, historico, credito, debito) '+
                                      'Values(%d,%d,''%s'',%.3f,%.3f) ',
                                      [id,1,
                                       historico,vlrFlexEmp,0.00]);

    EnviaMessagePedidoFaturado( qryNotanumero_pedio_online.AsInteger );

  finally
    RestoreDecimalSeparator;
  end;

end;

procedure TfrmNFSaida.EstornarFlex(id: Integer);
Var vlrFlexRepPos, vlrFlexRepNeg, vlrFlexEmp,vlrFlexRep : Currency;
    porcRep, porcEmp : Currency;
    historico,stmp : String;
begin
  // Executa o lancamento do flex
  {FLEX_PORCENTAGEM_REPRESENTANTE}
  stmp := ExecSql(dbConnect.ZConnection1,'Select sum(vlr_flex*quantidade) from nfsaida_itens where nfsaida=%d and vlr_flex > 0',
                                              [id]);
  vlrFlexRepPos := StrToCurrDef(stmp,0.00);

  stmp := ExecSql(dbConnect.ZConnection1,'Select sum(abs(vlr_flex*quantidade)) from nfsaida_itens where nfsaida=%d and vlr_flex < 0',
                                              [id]);
  vlrFlexRepNeg := StrToCurrDef(stmp,0.00);

  if (vlrFlexRepPos = 0)  and (vlrFlexRepNeg = 0) then exit;
  {Calculo}
  porcRep    := StrToCurrDef(getSysParametro('FLEX_PORCENTAGEM_REPRESENTANTE'),0.00);
  porcEmp    := StrToCurrDef(getSysParametro('FLEX_PORCENTAGEM_EMPRESA'),0.00);
  vlrFlexRep := vlrFlexRepPos * porcRep;
  vlrFlexEmp := vlrFlexRepPos * porcEmp;
  {Lancar flex positivo no conta corrente do representante}
  try
    SetDecimalSeparator('.');
    historico  := Format('Estorno credito(%.6d)->%s',[qryNotanumeroctlform.AsInteger,qryNotadestinatario.AsString]);
    if vlrFlexRep > 0 then
       ExecSql( dbConnect.ZConnection1,'INSERT INTO conta_corrente_flex(nfsaida, representante, historico, credito, debito) '+
                                      'Values(%d,%d,''%s'',%.3f,%.3f) ',
                                      [id,qryNotavendedor.AsInteger,
                                       historico,0.00,vlrFlexRep]);
    {Lancar flex negativo no conta corrente do representante}
    historico  := Format('Estorno débito(%.6d)->%s',[qryNotanumeroctlform.AsInteger,qryNotadestinatario.AsString]);
    if vlrFlexRepNeg > 0 then
       ExecSql( dbConnect.ZConnection1,'INSERT INTO conta_corrente_flex(nfsaida, representante, historico, credito, debito, imediato) '+
                                      'Values(%d,%d,''%s'',%.3f,%.3f, true) ',
                                      [id,qryNotavendedor.AsInteger,
                                       historico,vlrFlexRepNeg,0.00]);
    {Lancar flex positivo no conta corrente da empresa}
    historico  := Format('Estorno crédito(%.6d)->%s',[qryNotanumeroctlform.AsInteger,qryNotadestinatario.AsString]);
    if vlrFlexEmp > 0 then
       ExecSql( dbConnect.ZConnection1,'INSERT INTO conta_corrente_flex(nfsaida, representante, historico, credito, debito) '+
                                      'Values(%d,%d,''%s'',%.3f,%.3f) ',
                                      [id,1,
                                       historico,0.00,vlrFlexEmp]);

    EnviaMessagePedidoFaturado( qryNotanumero_pedio_online.AsInteger );

  finally
    RestoreDecimalSeparator;
  end;

end;

procedure TfrmNFSaida.OpenNFe(id: Integer);
Var s : String;
begin
  CloseTable(qryNota);
  qryNota.ParamByName('id').AsInteger := id;
  OpenTable( qryNota );
  s := Inttostr(StrToIntDef(qryNotastatus_nfe.AsString,0));
  case Str2StatusNFe(s) of
     snfIniciada    : lbStatusNFe.Caption := 'NFe Iniciada';
     snfPendente    : lbStatusNFe.Caption := 'NFe Pendente';
     snfErro        : lbStatusNFe.Caption := 'NFe Erro';
     snfDenegada    : lbStatusNFe.Caption := 'NFe Denegada';
     snfAutorizada  : lbStatusNFe.Caption := 'NFe Autorizada';
     snfContingencia: lbStatusNFe.Caption := 'NFe Contingencia';
     snfCancelada   : lbStatusNFe.Caption := 'NFe Cancelada';
     snfEPEC        : lbStatusNFe.Caption := 'NFe EPEC';
  end;
  CloseTable(qryItens);
  qryItens.ParamByName('id').AsInteger := id;
  OpenTable( qryItens );
  s := IfThen(length(qryNotatipo_nota.AsString)=0,'0',qryNotatipo_nota.AsString);
  RxDBGrid2.ReadOnly := Not (Str2TipoNFSaida( s ) in [NOTA_DEVOLUCAO_CLI, NOTA_DEVOLUCAO_FOR]);
 // snfIniciada, snfPendente, snfErro, snfDenegada, snfAutorizada, snfContingencia
end;

procedure TfrmNFSaida.SelecionarDestinatario( const destinatario, id : string);
Var qry : TZQuery;
    //res : variant;
    sql : String;
begin
  if StrToIntDef(id, 0 ) = 0 then exit;
  if CompareText(destinatario,'F') = 0 then begin
     //res := ShowSearchModal(dbConnect.ZConnection1,'fornecedores','id,nome','id','nome',True,'status=''ATIVO''');
     sql := 'Select *,''S/REMESSA'' AS forma_pgto, ''A Vista'' AS prazo_pagamento From fornecedores Where id=%s';
  end;
  if CompareText(destinatario,'C') = 0 then begin
     //res := ShowSearchModal(dbConnect.ZConnection1,'clientes','id,nome','id','nome',True,'status=''ATIVO''');
     sql := 'Select *,''BOLETO ITAU'' AS forma_pgto From clientes Where id=%s';
  end;
  qry:= ExecSqlQuery(dbConnect.ZConnection1,sql,[id]);
  qryNotacodcliente.AsString   := qry.FieldByName('id').AsString;
  qryNotadestinatario.AsString := qry.FieldByName('nome').AsString;
  qryNotacnpjcpf.AsString      := qry.FieldByName('cnpj').AsString;
  qryNotaendereco.AsString     := qry.FieldByName('endereco').AsString;
  qryNotacidade.AsString       := qry.FieldByName('cidade').AsString;
  qryNotabairro.AsString       := qry.FieldByName('bairro').AsString;
  qryNotacep.AsString          := qry.FieldByName('cep').AsString;
  qryNotacomplemento.AsString  := qry.FieldByName('complemento').AsString;
  qryNotauf.AsString           := qry.FieldByName('uf').AsString;
  qryNotatelefone.AsString     := qry.FieldByName('telefone1').AsString;
  qryNotainscrestadual.AsString:= qry.FieldByName('inscestadual').AsString;
  qryNotaforma_pgto.AsString   := qry.FieldByName('forma_pgto').AsString;
  qryNotaprazo_pgto.AsString   := qry.FieldByName('prazo_pagamento').AsString;
  //qryNotaemail.AsString        := qry.FieldByName('email').AsString;

end;

function TfrmNFSaida.CopiarPedidoParaNota(const npedido: Integer): Integer;
Var Sql, obs : String;
    qryE : TZQuery;
begin
    sql := Format('INSERT INTO nfsaida( '+
           'natureza, codcliente, destinatario, cnpjcpf, endereco, cidade, '+
           'bairro, cep, complemento, uf, telefone,inscrestadual,prazo_pgto,forma_pgto,'+
           'numero_pedio_online,numero_ped_cliente,freteconta, vendedor, crt, dadosadicionais ) '+
           'SELECT ''%s'',coalesce(cliente,0), c.nome, cnpj, endereco, cidade, '+
           'bairro, cep, complemento, uf, telefone1,inscestadual,prazo_pgto, forma_pgto, '+
           'p.id,p.numero_ped_cliente,9,representante, crt, tfp.obs_nota_fiscal '+
           'FROM pedido_venda p '+
           'Left join clientes c ON c.id=p.cliente '+
           'LEFT JOIN tabela_forma_pagamento tfp ON tfp.nome = p.forma_pgto '+
           'Where p.id=%d',[Str2TipoNFSaidaLiteral('0'),
                            npedido]);
    ExecSql(dbConnect.ZConnection1,sql);
    Result := LastInsertID(dbConnect.ZConnection1,'nfsaida_id_seq');
end;

procedure TfrmNFSaida.CopiarItensPedidoParaNota(const idPedido, idNota: Integer);
var qryI,qProd, qICMS, qNF  : TZQuery;//qCli
    id : Integer;
    Sql: String;
begin
  Sql    := 'SELECT id, produto, uf_destino, bc_include_ipi, bc_st_include_ipi, coalesce(cst_csosn,0) as cst_csosn,'+
            'mod_bc, mod_bc_st, p_cred_sn, p_cred_sn_valid_until, p_icms,'+
            'p_icms_st, p_mva_st, p_red_bc, p_red_bc_st, fcp, p_red_mvs_sn,'+
            'preco_max_consumidor,'+
            '(Case When %d <> 1 then '+
            '(((1+ p_mva_st/100) * (1 - p_icms/100) / (1- p_icms_st/100) -1 )*100) '+ // ::::numeric(10,2) as pmvast_aj,'+
            'else '+
            '(((1+ (p_mva_st - (p_mva_st * p_red_mvs_sn/100))/100) * (1 - p_icms/100)/(1-p_icms_st/100) -1 )*100) '+//::::numeric(10,2) as pmvast_ajsn '+
            'end)::::numeric(10,2) as pmvast_ajsn '+
            'FROM produto_icms_template '+
            'Where produto=%d and Upper(uf_destino)=''%s'' ';

  qryI:= ExecSqlQuery(dbConnect.ZConnection1,'Select pi.pedido_venda,pi.produto,pi.quantidade,pi.preco_unitario,'+
                                             'pi.desconto, pi.lote, pi.comissao,(pi.preco_unitario * (pi.desconto/100)) as preco_unit_liq, '+
                                             'vlr_flex '+
                                             'From pedido_venda_itens pi '+
                                             'Where pedido_venda=%d '+
                                             'Order by pi.id',[idPedido]);
  qNF := ExecSqlQuery(dbConnect.ZConnection1,'Select nf.uf, nf.tipo_nota, nf.codcliente, nf.cnpjcpf, c.crt '+
                                             'From nfsaida nf '+
                                             'Left Join clientes c ON c.id=nf.codcliente '+
                                             'Where nf.id=%d',
                                             [idNota]);
//  qCli:= ExecSqlQuery(dbConnect.ZConnection1,'Select coalesce(crt,0) as crt,uf From clientes Where id=%d',[qNF.FieldByName('codcliente').AsInteger]);

  While Not qryI.Eof do begin
    qProd  := ExecSqlQuery(dbConnect.ZConnection1,'Select * from produtos Where id=%d',[qryI.FieldByName('produto').AsInteger]);
//    qICMS  := ExecSqlQuery(dbConnect.ZConnection1,'Select * from produto_icms_template Where produto=%d and upper(uf_destino)=''%s''',[qryI.FieldByName('produto').AsInteger,
    qICMS  := ExecSqlQuery(dbConnect.ZConnection1,sql,[qNF.FieldByName('crt').AsInteger,
                                                       qryI.FieldByName('produto').AsInteger,
                                                       UpperCase(qNF.FieldByName('uf').AsString)]);
    if qICMS.EOF and qICMS.Bof then
       Raise Exception.CreateFmt('Erro: Produto %d-%s não tem cadastro de tributação para o %s,nota não pode ser gerada. Verifique o cadastro do produto.',
                                 [qProd.FieldByName('id').AsInteger,
                                  qProd.FieldByName('descricao').AsString,
                                  UpperCase(qNF.FieldByName('uf').AsString)]);
    qryItens.Insert;
    qryItensnfsaida.AsInteger       := idNota;
    qryItensproduto.AsInteger       := qProd.FieldByName('id').AsInteger;
    qryItensdescricao.AsString      := qProd.FieldByName('descricao').AsString;
    qryItensunidade.AsString        := qProd.FieldByName('unidade').AsString;
    qryItenslote.AsInteger          := qryI.FieldByName('lote').AsInteger;
    qryItensquantidade.AsCurrency   := qryI.FieldByName('quantidade').AsCurrency;
    qryItensncm.AsString            := qProd.FieldByName('ncm').AsString;
    qryItensorigem.AsString         := qProd.FieldByName('origem').AsString;
    qryItenspeso.AsCurrency         := qProd.FieldByName('peso').AsCurrency;
    qryItenspcomissao.AsCurrency    := qryI.FieldByName('comissao').AsCurrency;
    qryItensvlr_flex.AsCurrency     := qryI.FieldByName('vlr_flex').AsCurrency;
    qryItensvalorunitario.AsCurrency:= qryI.FieldByName('preco_unitario').AsCurrency -
                                       CalculaPerc(qryI.FieldByName('desconto').AsCurrency,
                                                   qryI.FieldByName('preco_unitario').AsCurrency );
    qryItenspdesconto.AsCurrency    := 0.00;//qryI.FieldByName('desconto').AsCurrency;
    {qryItensvalortotal.AsCurrency   := qryI.FieldByName('preco_unitario').AsCurrency *
                                       qryI.FieldByName('quantidade').AsCurrency;}
    qryItensvalortotal.AsCurrency   := qryItensvalorunitario.AsCurrency * qryItensquantidade.AsCurrency;
    qryItenscst.AsString            := getCSOSN(qNF.FieldByName('crt').AsInteger, qICMS.FieldByName('cst_csosn').AsString);

    {1 Emitente é Simples Nacional ?}
    //qICMS.FieldByName('cst_csosn').AsInteger
    if qryItenscst.AsInteger > 100 then begin
       {1.1 Destinatário é contribuinte ?}
       if qNF.FieldByName('crt').AsInteger > 0 then begin
          qryItenscfop.AsString     := getCFOP4TipoMov( qNF.FieldByName('tipo_nota').AsInteger,
                                                        qNF.FieldByName('uf').AsString,
                                                        qryItenscst.AsInteger);
       end else begin
       {1.2 Destinatário não é contribuinte ?
        CPF ou CNPJ não contribuinte ou isento}
         if Not HaveValueIn(qryItenscst.AsString,['102','103','300','400','500','900']) then
            qryItenscst.AsString     := '102';
         qryItenscfop.AsString       := getCFOP4TipoMov( StrToInt(TipoNFSaida2Str(NOTA_CONSUMIDOR_FINAL)),
                                                         qNF.FieldByName('uf').AsString,
                                                         qryItenscst.AsInteger);
       end;
    end;
    {2 Emitente é Tributação normal ?}
    //qICMS.FieldByName('cst_csosn').AsInteger < 100
    if qryItenscst.AsInteger < 100 then begin
       {2.1 Destinatário é contribuinte ?}
       if qNF.FieldByName('crt').AsInteger > 0 then begin
          qryItenscfop.AsString     := getCFOP4TipoMov( qNF.FieldByName('tipo_nota').AsInteger,
                                                        qNF.FieldByName('uf').AsString,
                                                        qryItenscst.AsInteger);
       end else begin
       {2.2 Destinatário não é contribuinte ?
        CPF ou CNPJ não contribuinte ou isento,
        00-Tributada integralmente
        20-Com redução da Base de Cálculo
        40-Isenta
        41-Não tributada
        60-ICMS cobrado anteriormente por substituição tributária}
         if Not(qryItenscst.AsInteger in [0,20,40,41,60]) then
            qryItenscst.AsInteger  := 0;
         qryItenscfop.AsString     := getCFOP4TipoMov( StrToInt(TipoNFSaida2Str(NOTA_CONSUMIDOR_FINAL)),
                                                       qNF.FieldByName('uf').AsString,
                                                       qryItenscst.AsInteger);
       end;
    end;
    {ICMS}
    qryItensbaseicms.AsCurrency     := qryItensvalortotal.AsCurrency;

    {PIS}
    qryItenscst_pis.AsInteger       := ifthen(qProd.FieldByName('cst_pis').IsNull,99,qProd.FieldByName('cst_pis').AsInteger);
    qryItensppis.AsCurrency         := qProd.FieldByName('p_pis').AsCurrency;
    qryItensvbc_pis.AsCurrency      := ifthen(qryItensppis.AsCurrency > 0,qryItensvalortotal.AsCurrency,0.00);
    {COFINS}
    qryItenscst_cofins.AsInteger    := ifthen(qProd.FieldByName('cst_cofins').IsNull,99,qProd.FieldByName('cst_cofins').AsInteger);
    qryItenspcofins.AsCurrency      := qProd.FieldByName('p_cofins').AsCurrency;
    qryItensvbc_cofins.AsCurrency   := ifthen(qryItensppis.AsCurrency > 0,qryItensvalortotal.AsCurrency,0.00);
    {IPI Tem que buscar do ipi_template_id
     qryItenscst_ipi.AsInteger:= ifthen(qProd.FieldByName('cst_cofins').IsNull,99,qProd.FieldByName('cst_cofins').AsInteger);
     qryItenspipi.AsCurrency     := qProd.FieldByName('p_cofins').AsCurrency;
     qryItensvbc_ipi.AsCurrency  := ifthen(qryItensppis.AsCurrency > 0,qryItensvalortotal.AsCurrency,0.00);
    }
    CalcularItem(qICMS);
    PostTable( qryItens );
    qryI.Next;
  end;
  qryI.close;
  qryI.Free;
end;

procedure TfrmNFSaida.CalcularItem(qICMS  : TZQuery );
Var picms, v1,v2, vTotSemDesc : Currency;
begin
{   101 - Tributada pelo Simples Nacional com permissão de crédito;
    102 - Tributada pelo Simples Nacional sem permissão de crédito;
    103 - Isenção do ICMS no Simples Nacional para faixa de receita bruta;
    201 - Tributada pelo Simples Nacional com permissão de crédito e com cobrança do ICMS por substituição tributária;
    202 - Tributada pelo Simples Nacional sem permissão de crédito e com cobrança do ICMS por substituição tributária;
    203 - Isenção do ICMS no Simples Nacional para faixa de receita bruta e com cobrança do ICMS por substituição tributária;
    300 - Imune;
    400 - Não tributada pelo Simples Nacional;
    500 - ICMS cobrado anteriormente por substituição tributária (substituído) ou por antecipação;
    900 - Outros.
}
  picms := qICMS.FieldByName('p_icms').AsCurrency;
  if qryItenscst.AsInteger > 100 then
     picms := StrToCurrDef(ExecSql(dbConnect.ZConnection1,'Select aliquota_sn From empresa Limit 1'),0);
  if qryItenscst.AsInteger in [101,0] then begin
{   <ICMS>
   <ICMSSN101>
       <orig>0</orig>
       <CSOSN>101</CSOSN>
       <pCredSN>1.25</pCredSN>
       <vCredICMSSN>12.96</vCredICMSSN>
   </ICMSSN101>
</ICMS>}
      qryItensbaseicms.AsCurrency  := qryItensvalortotal.AsCurrency;{Não sera impresso}
      qryItenspicms.AsCurrency     := picms;
      qryItensvlricms.AsCurrency   := CalculaPerc(qryItenspicms.AsCurrency,qryItensvalortotal.AsCurrency);
  end;
  if qryItenscst.AsInteger in [102,103,300,40,41,50,51] then begin
      qryItensbaseicms.AsCurrency  := 0.00;
      qryItensmodbc.AsInteger      := 0;
      qryItenspicms.AsCurrency     := 0.00;
      qryItensredbase.AsCurrency   := 0.00;
      qryItensvlricms.AsCurrency   := 0.00;
  end;

  if qryItenscst.AsInteger in [201,900, 90] then begin
{      <ICMSSN201>
             <orig>0</orig>
             <CSOSN>201</CSOSN>
             <modBCST>4</modBCST>
             <pMVAST>100.00</pMVAST>
             <pRedBCST>10.00</pRedBCST>
             <vBCST>162.00</vBCST>
             <pICMSST>18.00</pICMSST>
             <vICMSST>12.96</vICMSST>
             <pCredSN>1.25</pCredSN>
             <vCredICMSSN>12.96</vCredICMSSN>
         </ICMSSN201>}
    {26/11/2016 Utilizando a aliquota do simples nacional
          qryItenspicms.AsCurrency     := picms;
    }
     qryItenspicms.AsCurrency     := qICMS.FieldByName('p_icms').AsCurrency;
     v1 := qryItensvalortotal.AsCurrency;
     qryItensvlricms.AsCurrency   := CalculaPerc(qryItenspicms.AsCurrency,qryItensvalortotal.AsCurrency);
     qryItensbaseicms.AsCurrency  := qryItensvalortotal.AsCurrency;
     qryItensredbase.AsCurrency   := qICMS.FieldByName('p_red_bc').AsCurrency;
     qryItensmodbc.AsVariant      := Null;
     {ST}
     qryItensmodbcst.AsInteger    := qICMS.FieldByName('mod_bc_st').AsInteger;
     qryItenspredst.AsCurrency    := qICMS.FieldByName('p_red_bc_st').AsCurrency;
//     qryItenspmva.AsCurrency      := qICMS.FieldByName('p_mva_st').AsCurrency;
     qryItenspmva.AsCurrency      := qICMS.FieldByName('pmvast_ajsn').AsCurrency;
     qryItenspicmsst.AsCurrency   := qICMS.FieldByName('p_icms_st').AsCurrency;
     if qICMS.FieldByName('preco_max_consumidor').AsCurrency > 0 then begin
        qryItensbasesubst.AsCurrency := qICMS.FieldByName('preco_max_consumidor').AsCurrency * qryItensquantidade.AsCurrency;
        qryItensbasesubst.AsCurrency := qryItensbasesubst.AsCurrency  - CalculaPerc(qryItenspredst.AsCurrency,qryItensbasesubst.AsCurrency);
     end else begin
        vTotSemDesc := qryItensvalorunitario.AsCurrency * qryItensquantidade.AsCurrency;
        qryItensbasesubst.AsCurrency := vTotSemDesc + CalculaPerc(qryItenspmva.AsCurrency,vTotSemDesc);
        qryItensbasesubst.AsCurrency := qryItensbasesubst.AsCurrency  - CalculaPerc(qryItenspredst.AsCurrency,qryItensbasesubst.AsCurrency);
     end;
     v1 := qryItensbasesubst.AsCurrency;
     v2 := qryItensbaseicms.AsCurrency;
     v1 := qryItensbasesubst.AsCurrency * qryItenspicmsst.AsCurrency/100;
     {26/11/2016 Utilizando a aliquota do simples nacional}
     v2 := qryItensvalortotal.AsCurrency * (qryItenspicms.AsCurrency/100);//qICMS.FieldByName('p_icms').AsCurrency/100;
     qryItensvlrsubst.AsCurrency  := (v1-v2);

     {ICMS p/ Simples Nacional}
     qryItenspicms.AsCurrency     := picms;
     qryItensredbase.AsCurrency   := 0.00;
     qryItensbaseicms.AsCurrency  := qryItensvalortotal.AsCurrency - CalculaPerc(qryItensredbase.AsCurrency,qryItensvalortotal.AsCurrency);

     qryItensvlricms.AsCurrency   := CalculaPerc(qryItenspicms.AsCurrency,qryItensbaseicms.AsCurrency);
     qryItensmodbc.AsVariant      := Null;

  end;
  if qryItenscst.AsInteger = 202 then begin
      {26/11/2016 Utilizando a aliquota do simples nacional
            qryItenspicms.AsCurrency     := picms;
      }
      qryItenspicms.AsCurrency     := qICMS.FieldByName('p_icms').AsCurrency;
      qryItensvlricms.AsCurrency   := CalculaPerc(qryItenspicms.AsCurrency,qryItensvalortotal.AsCurrency);
      qryItensbaseicms.AsCurrency  := qryItensvalortotal.AsCurrency;
      qryItensredbase.AsCurrency   := qICMS.FieldByName('p_red_bc').AsCurrency;
      qryItensmodbc.AsVariant      := Null;
      {ST}
      qryItensmodbcst.AsInteger    := qICMS.FieldByName('mod_bc_st').AsInteger;
      qryItenspredst.AsCurrency    := qICMS.FieldByName('p_red_bc_st').AsCurrency;
//      qryItenspmva.AsCurrency      := qICMS.FieldByName('p_mva_st').AsCurrency;
      qryItenspmva.AsCurrency      := qICMS.FieldByName('pmvast_ajsn').AsCurrency;

      qryItenspicmsst.AsCurrency   := qICMS.FieldByName('p_icms_st').AsCurrency;
      if qICMS.FieldByName('preco_max_consumidor').AsCurrency > 0 then begin
         qryItensbasesubst.AsCurrency := qICMS.FieldByName('preco_max_consumidor').AsCurrency * qryItensquantidade.AsCurrency;
         qryItensbasesubst.AsCurrency := qryItensbasesubst.AsCurrency  - CalculaPerc(qryItenspredst.AsCurrency,qryItensbasesubst.AsCurrency);
      end else begin
         vTotSemDesc := qryItensvalorunitario.AsCurrency * qryItensquantidade.AsCurrency;
         qryItensbasesubst.AsCurrency := vTotSemDesc + CalculaPerc(qryItenspmva.AsCurrency,vTotSemDesc);
         qryItensbasesubst.AsCurrency := qryItensbasesubst.AsCurrency  - CalculaPerc(qryItenspredst.AsCurrency,qryItensbasesubst.AsCurrency);
      end;
      v1 := qryItensbasesubst.AsCurrency*qryItenspicmsst.AsCurrency/100;
      {26/11/2016 Utilizar ? a aliquota do simples nacional
       Ver com contador}
      v2 := qryItensvalortotal.AsCurrency * (qryItenspicms.AsCurrency/100);//qICMS.FieldByName('p_icms').AsCurrency/100;
      qryItensvlrsubst.AsCurrency  := (v1-v2);
      {ICMS simples nacional não mostra icms}
      if qryItenscst.AsInteger > 100 then begin
        qryItenspicms.AsCurrency     := 0.00;
        qryItensvlricms.AsCurrency   := 0.00;
        qryItensbaseicms.AsCurrency  := 0.00;
        qryItensredbase.AsCurrency   := 0.00;
        qryItensmodbc.AsVariant      := Null;
      end;
  end;
  if qryItenscst.AsInteger = 203 then begin

  end;
  if qryItenscst.AsInteger = 400 then begin

  end;
  if qryItenscst.AsInteger in [500,60] then begin
     {<ICMS>
   <ICMSSN500>
       <orig>0</orig>
       <CSOSN>500</CSOSN>
       <vBCSTRet>162.00</vBCSTRet>
       <vICMSSTRet>12.96</vICMSSTRet>
   </ICMSSN500>
</ICMS>}
    qryItenspicms.AsCurrency     := 0.00;
    qryItensvlricms.AsCurrency   := 0.00;
    qryItensbaseicms.AsCurrency  := 0.00;
    qryItensredbase.AsCurrency   := 0.00;
    qryItensmodbc.AsVariant      := Null;
  end;
  if qryItenscst.AsInteger = 900 then begin
     {<ICMS>
   <ICMSSN900>
       <orig>0</orig>
       <CSOSN>900</CSOSN>
       <modBC>3</modBC>
       <pRedBC>10.00</pRedBC>
       <vBC>90.00</vBC>
       <pICMS>7.00</pICMS>
       <vICMS>6.30</vICMS>
   </ICMSSN900>
   </ICMS>}
  end;
end;

procedure TfrmNFSaida.GerarXml(ACBrNFe: TACBrNFe);
Var itens     : TDetCollectionItem;
    nItem     , nParc: Integer;
    ok        : Boolean;
    totvCredICMSSN , DIFAL, soma: Currency;
    nf        : NotaFiscal;
    qryEmpresa, qryNFRef, qryProd, qryLote , qryEndEntrega: TZQuery;
    obs       : TStringList;
    vDesc, FCP, ParteUFOrigem, ParteUFDestino, vlrIBUF: Double;
    obsCST60 , sVlrIBUS: String;
    totVlrIBUF, totVlrCBS, totVlrMun: Extended;
begin
  StartWait;
  SetDecimalSeparator('.');
  try
     ACBrNFe.NotasFiscais.Clear;
     nf         := ACBrNFe.NotasFiscais.Add;
     qryEmpresa := ExecSqlQuery(dbConnect.ZConnection1,'Select * From empresa Where id=%s Order by id desc',[ getEmpresaPadrao()]);
     (*Resp.Técnico*)
     nf.NFe.infRespTec.CNPJ    := '07818282000188';
     nf.NFe.infRespTec.email   := 'contato@walg.com.br';
     nf.NFe.infRespTec.xContato:= 'Wagner Al. Germinari';
     nf.NFe.infRespTec.fone    := '4132484250';

     {IDE}
     nf.NFe.Ide.cUF       := 41;
     nf.NFe.Ide.cNF       := qryNotaid.AsInteger;
     nf.NFe.Ide.natOp     := qryNotanatureza.AsString;

     qryCtaReceber.close;
     OpenTable( qryCtaReceber );
     if qryCtaReceber.RecordCount > 0 then
        nf.NFe.Ide.indPag := ipPrazo
     else   //ipVista, ipPrazo, ipOutras
        nf.NFe.Ide.indPag := ipVista;

     nf.NFe.Ide.modelo    := 55;
     nf.NFe.Ide.serie     := 1;
     nf.NFe.Ide.nNF       := qryNotanumeroctlform.AsInteger;
     nf.NFe.Ide.dEmi      := qryNotadataemissao.AsDateTime;//StrToDateTime(qryNotadataemissao.AsStringqryNotahorasaida.AsString);//Now();//qryNf.FieldByname('dataemissao').AsDateTime;
     nf.NFe.Ide.dSaiEnt   := qryNotadatasaida.AsDateTime;//Now();//qryNf.FieldByname('datasaida').AsDateTime;
     nf.NFe.Ide.tpNF      := StrToTpNF(IfThen(qryNotaentradasaida.AsString='E','0','1'));//   tnSaida;//TpcnTipoNFe (tnEntrada, tnSaida);
     nf.NFe.Ide.cMunFG    := getCodigoMun(qryEmpresa.FieldByname('uf').AsString,qryEmpresa.FieldByname('cidade').AsString);//4106902; // Curitiba//IntToStr(nf.NFe.Ide.

     if qryNota.FieldByname('uf').AsString = qryEmpresa.FieldByName('uf').AsString then
        nf.NFe.Ide.idDest := doInterna
     else
        nf.NFe.Ide.idDest := doInterestadual;//(doInterna, doInterestadual, doExterior);
     if qryNota.FieldByname('uf').AsString = 'EX' then
        nf.NFe.Ide.idDest := doExterior;

     nf.NFe.Ide.tpImp     := tiRetrato;//(tiSemGeracao, tiRetrato, tiPaisagem, tiSimplificado,
                                       //tiNFCe, tiMsgEletronica, tiNFCeA4);
     nf.NFe.Ide.tpEmis    := ACBrNFe.Configuracoes.Geral.FormaEmissao;//teNormal;//(teNormal, teContingencia, teSCAN, teDPEC, teFSDA, teSVCAN, teSVCRS, teSVCSP, teOffLine);
     if (nf.NFe.Ide.tpEmis <> teNormal) and (Str2StatusNFe(qryNotastatus_nfe.AsString) <> snfEPEC) then
     begin
        {Envio para EPPEC AN}
        nf.NFe.Ide.dhCont := StrToDateTime(ExecSql(dbConnect.ZConnection1,'Select datahora From nfe_contingencia Order by id desc Limit 1',[]));// qryEmpresa.FieldByname('datahora').AsDateTime;
        nf.NFe.Ide.xJust  := ExecSql(dbConnect.ZConnection1,'Select motivo From nfe_contingencia Order by id desc Limit 1',[]);//qryEmpresa.FieldByname('motivo').AsString;
     end;
     if (nf.NFe.Ide.tpEmis <> teNormal) and (Str2StatusNFe(qryNotastatus_nfe.AsString) = snfEPEC) then begin
        {Envio da EPEC para SEFAZ normal}
        nf.NFe.Ide.dEmi   := ACBrNFe.EventoNFe.Evento[0].InfEvento.dhEvento;
        nf.NFe.Ide.dSaiEnt:= ACBrNFe.EventoNFe.Evento[0].InfEvento.dhEvento;
        nf.NFe.Ide.dhCont := ACBrNFe.EventoNFe.Evento[0].InfEvento.dhEvento;
        nf.NFe.Ide.xJust  := ExecSql(dbConnect.ZConnection1,'Select motivo From nfe_contingencia Where regime=4 Order by id desc Limit 1',[]);//qryEmpresa.FieldByname('motivo').AsString;
     end;

     //nfe.NFe.Ide.cDV       := automatico;
     nf.NFe.Ide.tpAmb     := ACBrNFe.Configuracoes.WebServices.Ambiente;
     //taHomologacao;//TpcnTipoAmbiente = (taProducao, taHomologacao);
     nf.NFe.Ide.procEmi   := peAplicativoContribuinte;//TpcnProcessoEmissao = (peAplicativoContribuinte, peAvulsaFisco, peAvulsaContribuinte, peContribuinteAplicativoF
     nf.NFe.Ide.verProc   := dbConnect.RxVersionInfo1.FileVersion;

     {Estes dados devem ser informados ver na nota}          //    0       1           2              3                4
     nf.NFe.Ide.indPres   := pcNao;//pcNao, pcPresencial, pcInternet, pcTeleatendimento, pcEntregaDomicilio,
                                                             //              5                      9
                                                             //pcPresencialForaEstabelecimento, pcOutros);
     {NFe sem indicativo do intermediador, Preencher caso indPres = 2,3,4,9}
     //nf.NFe.Ide.indIntermed :=

     {Isto sera definido junto com a Ie do destinatário}
     if Length( DelCharss(qryNota.FieldByname('cnpjcpf').AsString,'./-\') ) = 11 then
        nf.NFe.Ide.indFinal  := cfConsumidorFinal//(cfNao, cfConsumidorFinal);
     else
        nf.NFe.Ide.indFinal  := cfNao;

     {Finalidade da Nota}
     if Str2TipoNFSaida(qryNota.FieldByname('tipo_nota').AsString) = NOTA_VENDA then
        nf.NFe.Ide.finNFe    := fnNormal;
     if Str2TipoNFSaida(qryNota.FieldByname('tipo_nota').AsString) in [NOTA_COMPLEMENTAR_ICMS,NOTA_COMPLEMENTAR_VALOR] then begin
        nf.NFe.Ide.finNFe    := fnComplementar;
        qryNFRef := ExecSqlQuery(dbConnect.ZConnection1,'Select nf.chave_nfe as xml from nfsaida_referencias nr '+
                                                        'left join nfsaida nf on nf.id=nr.nfsaida '+
                                                        'where nfsaida_principal=%d',
                                                        [qryNota.FieldByname('id').AsInteger]);
        while not qryNFRef.Eof do begin
            nf.NFe.Ide.NFref.Add.refNFe:= qryNFRef.FieldByName('xml').AsString;
            qryNFRef.Next;
        end;
     end;
     if Str2TipoNFSaida(qryNota.FieldByname('tipo_nota').AsString) in [NOTA_DEVOLUCAO_CLI] then begin
        nf.NFe.Ide.finNFe    := fnDevolucao;
        qryNFRef := ExecSqlQuery(dbConnect.ZConnection1,'Select nf.chave_nfe as xml from nfsaida_referencias nr '+
                                                        'left join nfsaida nf on nf.id=nr.nfsaida '+
                                                        'where nfsaida_principal=%d',
                                                        [qryNota.FieldByname('id').AsInteger]);
        while not qryNFRef.Eof do begin
            nf.NFe.Ide.NFref.Add.refNFe:= qryNFRef.FieldByName('xml').AsString;
            qryNFRef.Next;
        end;
     end;

     if Str2TipoNFSaida(qryNota.FieldByname('tipo_nota').AsString) in [NOTA_DEVOLUCAO_FOR] then begin
        nf.NFe.Ide.finNFe    := fnDevolucao;
        qryNFRef := ExecSqlQuery(dbConnect.ZConnection1,'Select nf.chave_nfe as xml from nfsaida_referencias nr '+
                                                        'left join nfentrada nf on nf.id=nr.nfentrada '+
                                                        'where nfsaida_principal=%d',
                                                        [qryNota.FieldByname('id').AsInteger]);
        while not qryNFRef.Eof do begin
            nf.NFe.Ide.NFref.Add.refNFe:= qryNFRef.FieldByName('xml').AsString;
            qryNFRef.Next;
        end;
     end;
    {/Finalidade da Nota}

    {Emit}

     nf.NFe.Emit.CNPJCPF          := qryEmpresa.FieldByname('cnpj').AsString;
     nf.NFe.Emit.xNome            := qryEmpresa.FieldByname('nome').AsString;
     nf.NFe.Emit.xFant            := qryEmpresa.FieldByname('fantasia').AsString;
     nf.NFe.Emit.EnderEmit.xLgr   := qryEmpresa.FieldByname('logradouro').AsString;
     nf.NFe.Emit.EnderEmit.nro    := qryEmpresa.FieldByname('numero').AsString;
     nf.NFe.Emit.EnderEmit.xCpl   := qryEmpresa.FieldByname('complemento').AsString;
     nf.NFe.Emit.EnderEmit.xBairro:= qryEmpresa.FieldByname('bairro').AsString;
     nf.NFe.Emit.EnderEmit.cMun   := getCodigoMun(qryEmpresa.FieldByname('uf').AsString,qryEmpresa.FieldByname('cidade').AsString);
     nf.NFe.Emit.EnderEmit.xMun   := qryEmpresa.FieldByname('cidade').AsString;
     nf.NFe.Emit.EnderEmit.UF     := qryEmpresa.FieldByname('uf').AsString;
     nf.NFe.Emit.EnderEmit.CEP    := StrToInt(OnlyNumber(qryEmpresa.FieldByname('cep').AsString));
     nf.NFe.Emit.EnderEmit.fone   := qryEmpresa.FieldByname('fone').AsString;

     nf.NFe.Emit.IE               := qryEmpresa.FieldByname('ie').AsString;
     // nao pode
     nf.NFe.Emit.IEST             := ExecSql(dbConnect.ZConnection1,'SELECT ie_substituto FROM unidade_federacao Where sigla ilike ''%s'' ',[qryNota.FieldByname('uf').AsString]);
     //if qryNota.FieldByname('uf').AsString = 'PR' then
        //nf.NFe.Emit.IEST          := qryEmpresa.FieldByname('ie_substituto').AsString;

     nf.NFe.Emit.IM               := '';
     nf.NFe.Emit.CNAE             := '';
     //crtSimplesNacional, crtSimplesExcessoReceita, crtRegimeNormal
     nf.NFe.Emit.CRT              := StrToCRT(ok,qryEmpresa.FieldByname('crt').AsString);

     {Dest}
     nf.NFe.Dest.CNPJCPF          := qryNota.FieldByname('cnpjcpf').AsString;
     nf.NFe.Dest.xNome            := qryNota.FieldByname('destinatario').AsString;
     nf.NFe.Dest.EnderDest.xLgr   := ExtractWord(1,qryNota.FieldByname('endereco').AsString,[',']);
     nf.NFe.Dest.EnderDest.nro    := ExtractWord(2,qryNota.FieldByname('endereco').AsString,[',']);
     nf.NFe.Dest.EnderDest.nro    := IfThen(Length(nf.NFe.Dest.EnderDest.nro)=0,'s/nro',nf.NFe.Dest.EnderDest.nro);
     nf.NFe.Dest.EnderDest.xCpl   := qryNota.FieldByname('complemento').AsString;
     nf.NFe.Dest.EnderDest.xBairro:= qryNota.FieldByname('bairro').AsString;
     nf.NFe.Dest.EnderDest.cMun   := getCodigoMun(qryNota.FieldByname('uf').AsString,qryNota.FieldByname('cidade').AsString);
     nf.NFe.Dest.EnderDest.xMun   := qryNota.FieldByname('cidade').AsString;
     nf.NFe.Dest.EnderDest.UF     := qryNota.FieldByname('uf').AsString;
     nf.NFe.Dest.EnderDest.CEP    := StrToInt(OnlyNumber(qryNota.FieldByname('cep').AsString));
     nf.NFe.Dest.EnderDest.fone   := qryNota.FieldByname('telefone').AsString;
     nf.NFe.Dest.IE:= '';
     {CRT do destinatário}
     Case qryNota.FieldByname('crt').AsInteger of
        -1 : Begin {ISENTO}
                nf.NFe.Dest.indIEDest   := inIsento;
                nf.NFe.Ide.indFinal     := cfNao;
             end;
        0  : Begin {Não contribuinte, Pessoa física}
                nf.NFe.Dest.indIEDest   := inNaoContribuinte;
                nf.NFe.Ide.indFinal     := cfConsumidorFinal;
             end;
        1  : Begin {Simples nacional}
                nf.NFe.Dest.indIEDest   := inContribuinte;
                nf.NFe.Dest.IE          := qryNota.FieldByname('inscrestadual').AsString;
                nf.NFe.Ide.indFinal     := cfNao;
             end;
      2,3: Begin {Normal}
                nf.NFe.Dest.indIEDest   := inContribuinte;
                nf.NFe.Dest.IE          := qryNota.FieldByname('inscrestadual').AsString;
                nf.NFe.Ide.indFinal     := cfNao;
             end;


     end;
     qryEndEntrega := ExecSqlQuery(dbConnect.ZConnection1,'Select entrega_bairro,entrega_cep,entrega_cidade,'+
                                                          'entrega_complemento,entrega_endereco,'+
                                                          'entrega_cnpjcpf,entrega_uf '+
                                                          'FROM clientes '+
                                                          'Where onlynumber(cnpj)=''%s''',
                                                          [OnlyNumber(qryNota.FieldByname('cnpjcpf').AsString)]);
     if Length(qryEndEntrega.FieldByname('entrega_endereco').AsString) > 0 then
     begin
       nf.NFe.Entrega.CNPJCPF:= qryEndEntrega.FieldByname('entrega_cnpjcpf').AsString;
       nf.NFe.Entrega.xLgr   := ExtractWord(1,qryEndEntrega.FieldByname('entrega_endereco').AsString,[',']);
       nf.NFe.Entrega.nro    := ExtractWord(2,qryEndEntrega.FieldByname('entrega_endereco').AsString,[',']);
       nf.NFe.Entrega.nro    := IfThen(Length(nf.NFe.Dest.EnderDest.nro)=0,'s/nro',nf.NFe.Dest.EnderDest.nro);
       nf.NFe.Entrega.xCpl   := qryEndEntrega.FieldByname('entrega_complemento').AsString;
       nf.NFe.Entrega.xBairro:= qryEndEntrega.FieldByname('entrega_bairro').AsString;
       nf.NFe.Entrega.cMun   := getCodigoMun(qryEndEntrega.FieldByname('entrega_uf').AsString,qryEndEntrega.FieldByname('entrega_cidade').AsString);
       nf.NFe.Entrega.xMun   := qryEndEntrega.FieldByname('entrega_cidade').AsString;
       nf.NFe.Entrega.UF     := qryEndEntrega.FieldByname('entrega_uf').AsString;
     end;

     //nf.NFe.Entrega.cMun:=;
{
     if qryNota.FieldByname('inscrestadual').AsString = 'ISENTO' then
        nf.NFe.Dest.indIEDest        := inIsento
     else if length(qryNota.FieldByname( 'inscrestadual' ).AsString) = 0 then
             nf.NFe.Dest.indIEDest   := inNaoContribuinte
          else begin
             nf.NFe.Dest.indIEDest   := inContribuinte;
             nf.NFe.Dest.IE          := qryNota.FieldByname('inscrestadual').AsString;
          end;
     if nf.NFe.Dest.indIEDest = inNaoContribuinte then
        nf.NFe.Ide.indFinal  := cfConsumidorFinal;
}
     {Itens da nota}
     nItem := 1;
     qryItens.First;
     totvCredICMSSN := 0;
     nf.NFe.Total.ICMSTot.vBC     := 0.00;
     nf.NFe.Total.ICMSTot.vBCST   := 0.00;
     nf.NFe.Total.ICMSTot.vST     := 0.00;
     nf.NFe.Total.ICMSTot.vIPI    := 0.00;
     nf.NFe.Total.ICMSTot.vPIS    := 0.00;
     nf.NFe.Total.ICMSTot.vCOFINS := 0.00;
     nf.NFe.Total.ICMSTot.vTotTrib:= 0.00;
     nf.NFe.Total.ICMSTot.vDesc   := 0.00;
     nf.NFe.Total.ICMSTot.vProd   := 0.00;
     nf.NFe.Total.ICMSTot.vNF     := 0.00;
//     ReformaTributariaCabecalho( nf );
     totVlrIBUF := 0.00;
     totVlrCBS  := 0.00;
     totVlrMun  := 0.00;
     While not qryItens.Eof do begin
         ////////qryProd := ExecSqlQuery(dbConnect.ZConnection1,'SELECT p.*, pit.*, pit_pr.cbenef AS cbenef2, 9 AS motdesicms, '+
         ////////                                             'p.c_class_trib, p.ibscbs_cst '+
         ////////                                             'FROM produtos p '+
         ////////                                             'LEFT JOIN produto_icms_template pit ON pit.produto = p.id AND pit.uf_destino = ''%s'' '+
         ////////                                             'LEFT JOIN produto_icms_template pit_pr ON pit_pr.produto = p.id AND pit_pr.uf_destino = ''PR'' '+
         ////////                                             'WHERE p.id = %d; ',
         ////////                                             [UpperCase(qryNotauf.AsString) ,
         ////////                                              qryItens.FieldByname('produto').AsInteger]);

         qryProd := ExecSqlQuery(dbConnect.ZConnection1,'Select p.*,pit.*, '+
                                                        '(Select cbenef From produto_icms_template Where produto=p.id and uf_destino=''PR'') AS cbenef2, '+
                                                        ' 9 as motdesicms, p.c_class_trib,p.ibscbs_cst '+
                                                        'FROM produtos p '+
                                                        'Left Join produto_icms_template pit on pit.produto=p.id and pit.uf_destino=''%s'' '+
                                                        'Where p.id=%d',
                                  [UpperCase(qryNotauf.AsString) ,
                                   qryItens.FieldByname('produto').AsInteger]);
         itens := nf.NFe.Det.New;
         itens.Prod.nItem := nItem;
         itens.Prod.cProd := AddChar('0',qryItens.FieldByname('produto').AsString,4);
         if Length(qryProd.FieldByName('codigo_barras').AsString) = 0 then
            itens.Prod.cEAN  := 'SEM GTIN'
         else
            itens.Prod.cEAN  := qryProd.FieldByName('codigo_barras').AsString;

         itens.Prod.indEscala := ieNenhum;

         itens.Prod.xProd := qryItens.FieldByname('descricao').AsString;
         itens.Prod.NCM   := DelChars(DelChars(qryItens.FieldByname('ncm').AsString,'.'),'-');
         itens.Prod.EXTIPI:= '';
         itens.Prod.CEST  := DelChars(qryProd.FieldByName('cest').AsString,'.');
         itens.Prod.CFOP  := qryItens.FieldByname('cfop').AsString;//qryItens.FieldByname('cfop_item.AsString;
         itens.Prod.uCom  := qryItens.FieldByname('unidade').AsString;//'und';//LowerCase(qryItens.FieldByname('unidade').AsString);
         {valortotal = Total do produto já com desconto
          valorunitario = Valor unitario bruto}
         itens.Prod.qCom   := qryItens.FieldByname('quantidade').AsCurrency;
         itens.Prod.vUnCom := qryItens.FieldByname('valorunitario').AsCurrency;//Valor unitario sem desconto
         itens.Prod.vProd  := RoundABNT( itens.Prod.vUnCom * itens.Prod.qCom, 2);//Total bruto sem desconto
         vDesc := (itens.Prod.qCom * itens.Prod.vUnCom) - qryItensvalortotal.AsCurrency;
         if vDesc >= 0.001 then
            itens.Prod.vDesc  := (itens.Prod.qCom * itens.Prod.vUnCom) - qryItensvalortotal.AsCurrency;// itens.Prod.vProd - (itens.Prod.qCom * itens.Prod.vUnCom);
         //if itens.Prod.vDesc < 0 then
         //   itens.Prod.vDesc:= 0.00;
         //-----
         itens.Prod.cEANTrib:= itens.Prod.cEAN;
         itens.Prod.vUnTrib := qryItens.FieldByname('valorunitario').AsCurrency;
         itens.Prod.uTrib   := qryItens.FieldByname('unidade').AsString;
         itens.Prod.qTrib   := qryItens.FieldByname('quantidade').AsCurrency;

         {Lote do item}                                                                            // and data_validade is not null
         qryLote := ExecSqlQuery(dbConnect.ZConnection1,'Select * from produtos_estoque where id=%d',
                                 [qryItens.FieldByname('lote').AsInteger]);

         if nf.NFe.Emit.CRT = crtSimplesNacional then
         begin
             itens.Imposto.ICMS.orig   := StrToOrig(qryItens.FieldByname('origem').AsString);
             if nf.NFe.Dest.indIEDest = inContribuinte then begin
                 itens.Imposto.ICMS.CSOSN      := StrToCSOSNIcms(qryItens.FieldByname('cst').AsString);
                 itens.Imposto.ICMS.pCredSN    := qryItenspicms.AsCurrency;//qryEmpresa.FieldbyName('aliquota_sn').AsCurrency;
                 itens.Imposto.ICMS.vCredICMSSN:= qryItensvlricms.AsCurrency;//(itens.Prod.vUnCom*itens.Prod.qCom) * itens.Imposto.ICMS.pCredSN/100;
                 totvCredICMSSN += itens.Imposto.ICMS.vCredICMSSN;
                 {Tem ST ?}
                 itens.Imposto.ICMS.modBCST      := StrTomodBCST(ok,qryItensmodbcst.AsString);
                 itens.Imposto.ICMS.pICMSST      := qryItenspicmsst.AsCurrency;
                 itens.Imposto.ICMS.vBCST        := qryItensbasesubst.AsCurrency;
                 itens.Imposto.ICMS.vICMSST      := qryItensvlrsubst.AsCurrency;
                 //itens.Imposto.ICMS.pMVAST       := qryItenspmva.AsCurrency;
                 itens.Imposto.ICMS.pRedBCST     := qryItenspredst.AsCurrency;
                 itens.Imposto.ICMS.pRedBC       := qryItensredbase.AsCurrency;
                 if itens.Imposto.ICMS.modBCST <> dbisPrecoTabelado then
                 begin
                    itens.Imposto.ICMS.modBCST   := dbisMargemValorAgregado;
                    itens.Imposto.ICMS.pMVAST    := qryItenspmva.AsCurrency;
                 end;
                 if qryNotadevolucao_destacar_icms.AsBoolean then begin
                   //totvCredICMSSN -= itens.Imposto.ICMS.vCredICMSSN;
                    //itens.Imposto.ICMS.pCredSN    := 0.00;
                    //itens.Imposto.ICMS.vCredICMSSN:= 0.00;
                   itens.Imposto.ICMS.vBC        := qryItensbaseicms.AsCurrency;
                   itens.Imposto.ICMS.pICMS      := qryItenspicms.AsCurrency;
                   itens.Imposto.ICMS.vICMS      := qryItensvlricms.AsCurrency;
                 end;
             end else begin
                itens.Imposto.ICMS.CSOSN      := StrToCSOSNIcms(qryItens.FieldByname('cst').AsString);
                itens.Imposto.ICMS.pCredSN    := qryItenspicms.AsCurrency;;
                itens.Imposto.ICMS.vCredICMSSN:= qryItensvlricms.AsCurrency;
             end;
             if itens.Imposto.ICMS.CSOSN = csosn500 then
             begin
                itens.Imposto.ICMS.vBCSTRet  := qryLote.FieldByname('vbcstret').AsCurrency * itens.Prod.qCom;
                itens.Imposto.ICMS.vICMSSTRet:= qryLote.FieldByname('vicmsstret').AsCurrency * itens.Prod.qCom;
                itens.Imposto.ICMS.pST       := qryLote.FieldByname('picmsstret').AsCurrency;
                obsCST60 := IfThen(Length(obsCST60)=0,'SUBSTITUICAO TRIBUTARIA SECAO XII DO ANEXO IX DO RICMS-PR ',obsCST60);
             end;
             EstaVazio(itens.Prod.NCM,'NCM do item "'+itens.Prod.xProd + '" esta vazio.');
             itens.Imposto.vTotTrib      := RoundTo( getvTotTrib( itens.Prod.NCM, itens.Prod.vProd ), -2 );
         end else begin
         {A empresa emitente não é simples nacional}
             itens.Imposto.ICMS.CST          := StrToCSTICMS(qryItens.FieldByname('cst').AsString);
             itens.Imposto.ICMS.vBC          := qryItensbaseicms.AsCurrency;
             itens.Imposto.ICMS.pICMS        := qryItenspicms.AsCurrency;
             itens.Imposto.ICMS.vICMS        := qryItensvlricms.AsCurrency;
             itens.Imposto.ICMS.modBC        := StrTomodBC(ok,qryItensmodbc.AsString);
             itens.Imposto.ICMS.pRedBC       := qryItensredbase.AsCurrency;
             {Tem ST ?}
             itens.Imposto.ICMS.modBCST      := StrTomodBCST(ok,qryItensmodbcst.AsString);
             itens.Imposto.ICMS.pICMSST      := qryItenspicmsst.AsCurrency;
             itens.Imposto.ICMS.vBCST        := qryItensbasesubst.AsCurrency;
             itens.Imposto.ICMS.vICMSST      := qryItensvlrsubst.AsCurrency;
             //itens.Imposto.ICMS.pMVAST       := qryItenspmva.AsCurrency;
             itens.Imposto.ICMS.pRedBCST     := qryItenspredst.AsCurrency;
             if itens.Imposto.ICMS.modBCST <> dbisPrecoTabelado then
             begin
                itens.Imposto.ICMS.modBCST   := dbisMargemValorAgregado;
                itens.Imposto.ICMS.pMVAST    := qryItenspmva.AsCurrency;
             end;
             {Não é simples}
             totvCredICMSSN                  := 0.00;
             itens.Imposto.ICMS.pCredSN      := 0.00;
             itens.Imposto.ICMS.vCredICMSSN  := 0.00;
             if itens.Imposto.ICMS.CST = cst60 then
             begin
                itens.Imposto.ICMS.vBCSTRet  := qryProd.FieldByname('vbcstret').AsCurrency * itens.Prod.qCom;
                itens.Imposto.ICMS.vICMSSTRet:= qryProd.FieldByname('vicmsstret').AsCurrency * itens.Prod.qCom;
                itens.Imposto.ICMS.pST       := qryProd.FieldByname('picmsstret').AsCurrency;
                obsCST60 := IfThen(Length(obsCST60)=0,'SUBSTITUICAO TRIBUTARIA SECAO XII DO ANEXO IX DO RICMS-PR ',obsCST60);
             end;

             if (itens.Imposto.ICMS.CST in [cst40,cst41,cst50,cst51,cst20,cst70,cst90]) then
             begin
                itens.Prod.cBenef  := 'SEM CBENEF';
                //itens.Prod.cBenef  := 'PR819998';
                //if (HaveValueIn(nf.NFE.Dest.EnderDest.UF,['PR','RJ','RS'])) then
                itens.Prod.cBenef  := ifthen(length(qryProd.FieldByName('cbenef2').AsString)=0,'SEM CBENEF',qryProd.FieldByName('cbenef2').AsString);
                if Length(itens.Prod.cBenef) > 0 then begin
                    itens.Imposto.ICMS.vICMSDeson:= RoundABNT(CalculaPerc(qryProd.FieldByName('p_icms').AsFloat,itens.Prod.vProd),2);
                    itens.Imposto.ICMS.motDesICMS:= StrTomotDesICMS(ok,qryProd.FieldByName('motdesicms').AsString);
                end;

             end;

             if (nf.NFe.Ide.idDest = doInterestadual) and (nf.NFe.Ide.indFinal  = cfConsumidorFinal) and
                not (itens.Imposto.ICMS.CST in [cst40, cst41]) then
             begin
                {<ICMSUFDest>
            <vBCUFDest>4298.43</vBCUFDest>
            <pFCPUFDest>0.00</pFCPUFDest>
            <pICMSUFDest>18.00</pICMSUFDest>
            <pICMSInter>7.00</pICMSInter>
            <pICMSInterPart>80.00</pICMSInterPart>
            <vFCPUFDest>0.00</vFCPUFDest>
            <vICMSUFDest>378.26</vICMSUFDest>
            <vICMSUFRemet>94.56</vICMSUFRemet>
        </ICMSUFDest>}
               itens.Imposto.ICMSUFDest.pICMSInterPart := 100.00;//80;//Percentual proviso´rio de partilha do ICMS Interestadual
               itens.Imposto.ICMSUFDest.pFCPUFDest     := qryProd.FieldByName('fcp').AsCurrency;//2;//Percentual do ICMS relativo ao Fundo de Combate a` Pobreza (FCP) na UF de destino
               itens.Imposto.ICMSUFDest.pICMSUFDest    := qryProd.FieldByName('p_icms_st').AsCurrency;//18;//Ali´quota interna da UF de destino
               itens.Imposto.ICMSUFDest.pICMSInter     := qryProd.FieldByName('p_icms').AsCurrency;//Ali´quota interestadual das UF envolvidas

             //calcular o Fundo de Combate à Pobreza
               //FCP = itens.Imposto.ICMS.vBC * (%FCP / 100)
               FCP := RoundABNT(itens.Imposto.ICMS.vBC * (itens.Imposto.ICMSUFDest.pFCPUFDest / 100),2);
               //calcular o DIFAL
               //DIFAL = Base do ICMS * ((%Alíquota do ICMS Intra – %Alíquota do ICMS Inter) / 100)
               DIFAL := itens.Imposto.ICMS.vBC * ((itens.Imposto.ICMSUFDest.pICMSUFDest-itens.Imposto.ICMSUFDest.pICMSInter) / 100);
               //efetuar a partilha do DIFAL
               //Parte que compete a PR – estado de origem:
               //Parte UF Origem = Valor do DIFAL * (%Origem / 100)
               ParteUFOrigem := RoundABNT(DIFAL * ((100-itens.Imposto.ICMSUFDest.pICMSInterPart) / 100),2);
               //Parte que compete a SP – estado de destino:
               //Parte UF Destino = Valor do DIFAL * (%Destino / 100)
               ParteUFDestino:= RoundABNT(DIFAL* (itens.Imposto.ICMSUFDest.pICMSInterPart / 100),2);

               itens.Imposto.ICMSUFDest.vBCUFDest   := itens.Imposto.ICMS.vBC;//Valor da BC do ICMS na UF de destino
               itens.Imposto.ICMSUFDest.vFCPUFDest  := FCP;//Valor do ICMS relativo ao Fundo de Combate a` Pobreza (FCP) da UF de destino
               itens.Imposto.ICMSUFDest.vICMSUFDest := ParteUFDestino;//	Valor do ICMS Interestadual para a UF de destino
               itens.Imposto.ICMSUFDest.vICMSUFRemet:= ParteUFOrigem;//	Valor do ICMS Interestadual para a UF do remetente
             end;
         end;
         {PIS}
         itens.Imposto.PIS.CST       := StrToCSTPIS(PadLeft(qryItens.FieldByname('cst_pis').AsString,2,'0'));//pis99;
         itens.Imposto.PIS.pPIS      := qryItens.FieldByname('ppis').AsCurrency;
         itens.Imposto.PIS.vBC       := qryItens.FieldByname('vbc_pis').AsCurrency;
         itens.Imposto.PIS.vPIS      := RoundABNT(itens.Imposto.PIS.vBC * itens.Imposto.PIS.pPIS/100,2);
         {COFINS}
         itens.Imposto.COFINS.CST    := StrToCSTCOFINS(PadLeft(qryItens.FieldByname('cst_cofins').AsString,2,'0'));//cof99;
         itens.Imposto.COFINS.pCOFINS:= qryItens.FieldByname('pcofins').AsCurrency;
         itens.Imposto.COFINS.vBC    := qryItens.FieldByname('vbc_cofins').AsCurrency;
         itens.Imposto.COFINS.vCOFINS:= RoundABNT(itens.Imposto.COFINS.vBC * itens.Imposto.COFINS.pCOFINS/100,2);
         {IPI}
         if qryItens.FieldByname('cst_ipi').AsString <> '' then begin
             itens.Imposto.IPI.CST    := StrToCSTIPI(ok,qryItens.FieldByname('cst_ipi').AsString);//cof99;
             itens.Imposto.IPI.pIPI   := qryItens.FieldByname('pipi').AsCurrency;
             itens.Imposto.IPI.vBC    := qryItens.FieldByname('vbc_ipi').AsCurrency;
             itens.Imposto.IPI.vIPI   := itens.Imposto.IPI.vBC * itens.Imposto.IPI.pIPI/100;
         end;
         {Positivo, Negativo, Neutro}
         itens.infAdProd := qryItens.FieldByname('infadprod').AsString;
         if Length(qryProd.FieldByName('lista_pis_cofins').AsString) > 0 then
            itens.infAdProd := itens.infAdProd + '('+qryProd.FieldByName('lista_pis_cofins').AsString+')';

         if qryProd.FieldByName('preco_max_consumidor').AsCurrency > 0 then
            itens.infAdProd := itens.infAdProd + Format('P.M.C R$ %.2f',[qryProd.FieldByName('preco_max_consumidor').AsCurrency]);

         { Não precisa segundo Sr. Delfino 26/11/2016
         if itens.Imposto.ICMS.pMVAST > 0 then
            itens.infAdProd := itens.infAdProd + Format(' MVA %.2f',[itens.Imposto.ICMS.pMVAST]);

         if itens.Imposto.ICMS.pRedBCST > 0 then
            itens.infAdProd := itens.infAdProd + Format(' Red.BCST %.2f',[itens.Imposto.ICMS.pRedBCST]);
          }
         itens.Prod.xPed    := qryNota.FieldByname('numero_ped_cliente').AsString;

         if (Not qryLote.FieldbyName('data_validade').IsNull) and  (Not qryLote.FieldbyName('data_fabricacao').IsNull)
            and (Not qryLote.FieldbyName('lote').IsNull) then begin
              if qryProd.FieldByName('tipo_produto').AsInteger = 1 then
              begin
                   itens.Prod.med.Add;
                   itens.Prod.med.Items[0].cProdANVISA := qryProd.FieldByName('numero_reg_ms').AsString;
                   itens.Prod.med.Items[0].vPMC        := qryProd.FieldByName('preco_max_consumidor').AsCurrency;
              end;
              with itens.Prod.rastro.Add do
              begin
                  dFab := qryLote.FieldbyName('data_fabricacao').AsDateTime;
                  dVal := qryLote.FieldbyName('data_validade').AsDateTime;
                  nLote:= qryLote.FieldbyName('lote').AsString;
                  qLote:= qryItens.FieldByname('quantidade').AsCurrency;
                  itens.infAdProd := itens.infAdProd + 'Lote.: '+qryLote.FieldbyName('lote').AsString+
                                                     ' Val.: '+qryLote.FieldbyName('data_validade').AsString;
              end;
         end else begin
            itens.infAdProd := itens.infAdProd + 'Lote.: '+qryLote.FieldbyName('lote').AsString+
                                                 ' Val.: '+qryLote.FieldbyName('data_validade').AsString;
         end;
//         Valor do Produto + Frete + Seguro + Outras Despesas - Descontos.
        {IBS e CBS do item}
          //c_class_trib,cst_ibs_cbs
        itens.Imposto.IBSCBS.CST        := StrToCSTIBSCBS(qryProd.FieldByName('cst_ibs_cbs').AsString);//  cst000;
        itens.Imposto.IBSCBS.cClassTrib := qryProd.FieldByName('c_class_trib').AsString;//'000001';
        itens.Imposto.IBSCBS.gIBSCBS.vBC:= itens.Prod.vProd;

        {Estadual}
        itens.Imposto.IBSCBS.gIBSCBS.gIBSUF.pIBSUF   := qryEmpresa.FieldByName('pibsuf').AsFloat;// 0.10;
        vlrIBUF  := CalculaPerc(itens.Imposto.IBSCBS.gIBSCBS.gIBSUF.pIBSUF, itens.Imposto.IBSCBS.gIBSCBS.vBC);
        sVlrIBUS := FormatFloat('0.000',vlrIBUF);
        sVlrIBUS := FormatarParaDuasCasas( sVlrIBUS, 2);
        itens.Imposto.IBSCBS.gIBSCBS.gIBSUF.vIBSUF   := StringToFloat(sVlrIBUS);
        totVlrIBUF += itens.Imposto.IBSCBS.gIBSCBS.gIBSUF.vIBSUF;

        {Municipal}
        itens.Imposto.IBSCBS.gIBSCBS.gIBSMun.pIBSMun:= qryEmpresa.FieldByName('pibsmun').AsFloat;//0.00;
        vlrIBUF  := CalculaPerc(itens.Imposto.IBSCBS.gIBSCBS.gIBSMun.pIBSMun, itens.Imposto.IBSCBS.gIBSCBS.vBC);
        sVlrIBUS := FormatFloat('0.0000',vlrIBUF);
        sVlrIBUS := FormatarParaDuasCasas( sVlrIBUS, 2);
        itens.Imposto.IBSCBS.gIBSCBS.gIBSMun.vIBSMun:= StringToFloat(sVlrIBUS);
        totVlrMun += itens.Imposto.IBSCBS.gIBSCBS.gIBSMun.vIBSMun;
        {Valor total}
        itens.Imposto.IBSCBS.gIBSCBS.vIBS := itens.Imposto.IBSCBS.gIBSCBS.gIBSUF.vIBSUF+itens.Imposto.IBSCBS.gIBSCBS.gIBSMun.vIBSMun;
        {CBS}
        itens.Imposto.IBSCBS.gIBSCBS.gCBS.pCBS := qryEmpresa.FieldByName('pcbs').AsFloat;//0.90;
        vlrIBUF  := CalculaPerc(itens.Imposto.IBSCBS.gIBSCBS.gCBS.pCBS, itens.Imposto.IBSCBS.gIBSCBS.vBC);
        sVlrIBUS := FormatFloat('0.0000',vlrIBUF);
        sVlrIBUS := FormatarParaDuasCasas( sVlrIBUS, 2);
        itens.Imposto.IBSCBS.gIBSCBS.gCBS.vCBS := StringToFloat(sVlrIBUS);
        totVlrCBS += itens.Imposto.IBSCBS.gIBSCBS.gCBS.vCBS;

         {Totais}
         nf.NFe.Total.ICMSTot.vFCPUFDest  := nf.NFe.Total.ICMSTot.vFCPUFDest + itens.Imposto.ICMSUFDest.vFCPUFDest;//1,07	Valor total do ICMS relativo Fundo de Combate a` Pobreza (FCP) da UF de destino
         nf.NFe.Total.ICMSTot.vICMSUFDest := nf.NFe.Total.ICMSTot.vICMSUFDest + itens.Imposto.ICMSUFDest.vICMSUFDest;//1,93	Valor total do ICMS Interestadual para a UF de destino
         nf.NFe.Total.ICMSTot.vICMSUFRemet:= nf.NFe.Total.ICMSTot.vICMSUFRemet+ itens.Imposto.ICMSUFDest.vICMSUFRemet;//1,29

         nf.NFe.Total.ICMSTot.vICMSDeson  := nf.NFe.Total.ICMSTot.vICMSDeson + itens.Imposto.ICMS.vICMSDeson;

         nf.NFe.Total.ICMSTot.vBC     := nf.NFe.Total.ICMSTot.vBC      + itens.Imposto.ICMS.vBC;
         nf.NFe.Total.ICMSTot.vICMS   := nf.NFe.Total.ICMSTot.vICMS    + itens.Imposto.ICMS.vICMS;
         nf.NFe.Total.ICMSTot.vBCST   := nf.NFe.Total.ICMSTot.vBCST    + itens.Imposto.ICMS.vBCST;
         nf.NFe.Total.ICMSTot.vST     := nf.NFe.Total.ICMSTot.vST      + itens.Imposto.ICMS.vICMSST;
         nf.NFe.Total.ICMSTot.vIPI    := nf.NFe.Total.ICMSTot.vIPI     + itens.Imposto.IPI.vIPI;
         nf.NFe.Total.ICMSTot.vPIS    := nf.NFe.Total.ICMSTot.vPIS     + itens.Imposto.PIS.vPIS;
         //totTrib := nf.NFe.Total.ICMSTot.vCOFINS  + itens.Imposto.COFINS.vCOFINS;
         nf.NFe.Total.ICMSTot.vCOFINS := nf.NFe.Total.ICMSTot.vCOFINS  + itens.Imposto.COFINS.vCOFINS;
         nf.NFe.Total.ICMSTot.vTotTrib:= nf.NFe.Total.ICMSTot.vTotTrib + itens.Imposto.vTotTrib;
         nf.NFe.Total.ICMSTot.vDesc   := nf.NFe.Total.ICMSTot.vDesc    + itens.Prod.vDesc;
         nf.NFe.Total.ICMSTot.vProd   := nf.NFe.Total.ICMSTot.vProd    + itens.Prod.vProd;
         nf.NFe.Total.ICMSTot.vNF     := nf.NFe.Total.ICMSTot.vNF      + (itens.Prod.vProd - itens.Prod.vDesc) +
                                         itens.Imposto.ICMS.vICMSST    + itens.Imposto.IPI.vIPI +
                                         itens.Prod.vFrete +
                                         itens.Prod.vOutro +
                                         itens.Prod.vSeg   - nf.NFe.Total.ICMSTot.vICMSDeson;
         qryItens.Next;
         inc(nItem);
     End;{FIM dos itens}
      {Total CBS IBS}
     nf.NFe.Total.IBSCBSTot.vBCIBSCBS := nf.NFe.Total.ICMSTot.vProd;
     (*Total IBSUF++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
     nf.NFe.Total.IBSCBSTot.gIBS.gIBSUFTot.vDif    := 0.00;
     nf.NFe.Total.IBSCBSTot.gIBS.gIBSUFTot.vDevTrib:= 0.00;
     sVlrIBUS := FormatFloat('0.0000',totVlrIBUF);
     sVlrIBUS := FormatarParaDuasCasas( sVlrIBUS, 2);
     nf.NFe.Total.IBSCBSTot.gIBS.gIBSUFTot.vIBSUF  := StringToFloat(sVlrIBUS);
     (*Total IBSMun+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
     nf.NFe.Total.IBSCBSTot.gIBS.gIBSMunTot.vDif    := 0.00;
     nf.NFe.Total.IBSCBSTot.gIBS.gIBSMunTot.vDevTrib:= 0.00;
     sVlrIBUS := FormatFloat('0.0000',totVlrMun);
     sVlrIBUS := FormatarParaDuasCasas( sVlrIBUS, 2);
     nf.NFe.Total.IBSCBSTot.gIBS.gIBSMunTot.vIBSMun := StringToFloat(sVlrIBUS);
     (*Totalização parcial++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
     nf.NFe.Total.IBSCBSTot.gIBS.vIBS               := FormatMoneyF(totVlrIBUF,2);
     nf.NFe.Total.IBSCBSTot.gIBS.vCredPres          := 0.00;
     nf.NFe.Total.IBSCBSTot.gIBS.vCredPresCondSus   := 0.00;
     (*Total CBS++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
     sVlrIBUS   := FormatFloat('0.0000',totVlrCBS);
     sVlrIBUS   := FormatarParaDuasCasas( sVlrIBUS, 2);
     nf.NFe.Total.IBSCBSTot.gCBS.vDif            := 0.00;
     nf.NFe.Total.IBSCBSTot.gCBS.vDevTrib        := 0.00;
     nf.NFe.Total.IBSCBSTot.gCBS.vCBS            := StringToFloat(sVlrIBUS);
     nf.NFe.Total.IBSCBSTot.gCBS.vCredPres       := 0.00;
     nf.NFe.Total.IBSCBSTot.gCBS.vCredPresCondSus:= 0.00;
     (*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
     //ReformaTributariaTotal(nf);

     if qryCtaReceber.RecordCount > 0 then begin
       nf.NFe.Cobr.Fat.nFat := qryNotanumeroctlform.AsString;
       nf.NFe.Cobr.Fat.vOrig:= qryNotavalortotalnota.AsCurrency;
       nf.NFe.Cobr.Fat.vDesc:= 0.00;
       nf.NFe.Cobr.Fat.vLiq := nf.NFe.Cobr.Fat.vOrig - nf.NFe.Cobr.Fat.vDesc;
       qryCtaReceber.First;
       nParc := 1;
       soma  := 0.00;
       While Not qryCtaReceber.Eof do begin
         with nf.NFe.Cobr.Dup.Add do begin
              nDup := Format('%.3d',[nParc]);//qryCtaReceberdocumento.AsString;
              dVenc:= qryCtaReceberdata_vencimento.AsDateTime;
              vDup := qryCtaRecebervalor_devido.AsCurrency;
              vDesc:= 0.00;
              soma += vDup;
         end;
         qryCtaReceber.Next;
         inc(nParc);
       end;
       nf.NFe.Cobr.Fat.vLiq := soma;
       {NFe Versão 4.00}
       with nf.NFe.pag.Add do begin
         tPag := fpBoletoBancario;
         vPag := nf.NFe.Total.ICMSTot.vNF;
       end;
     end else begin
         {NFe Versão 4.00}
         if nf.NFe.Ide.finNFe <> fnNormal then
         begin
           with nf.NFe.pag.Add do begin
             tPag := fpSemPagamento;
             vPag := 0.00;
           end;
         end else
         begin
           with nf.NFe.pag.Add do begin
             tPag := fpDinheiro;
             vPag := nf.NFe.Total.ICMSTot.vNF;
           end;
         end;
     end;

     nf.NFe.Transp.modFrete := StrTomodFrete(ok,qryNotafreteconta.AsString);
     with nf.NFe.Transp.Vol.Add do begin
         qVol := qryNotaquantvolumes.AsInteger;
         nVol := qryNotanumerovol.AsString;
         esp  := qryNotaespecievol.AsString;
         marca:= qryNotamarcavol.AsString;
         pesoB:= qryNotapesobrutovol.AsCurrency;
         pesoL:= qryNotapesoliquidovol.AsCurrency;
     end;
     if Not qryNotanometransp.IsNull then begin
        nf.NFe.Transp.Transporta.CNPJCPF:= qryNotacnpjtransp.AsString;
        nf.NFe.Transp.Transporta.xNome  := qryNotanometransp.AsString;
        nf.NFe.Transp.Transporta.IE     := qryNotaietransp.AsString;
        nf.NFe.Transp.Transporta.UF     := qryNotauftransp.AsString;
        nf.NFe.Transp.Transporta.xEnder := qryNotaendtransp.AsString;
        nf.NFe.Transp.Transporta.xMun   := qryNotacidadetransp.AsString;
     end;

     {montagem dos Dados adcionais, se nota for transmitida salva na tabela};
     obs  := TStringList.Create;
     obs.Add(qryNotadadosadicionais.AsString);
     if Length(qryNotanumero_ped_cliente.AsString) > 0 then
        obs.Add('N. pedido '+qryNotanumero_ped_cliente.AsString);

     if nf.NFe.Emit.CRT = crtSimplesNacional then begin
       {Empresa emissora é do simples nacional}
       obs.Add('"DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL";');
       obs.Add('"NAO GERA DIREITO A CREDITO FISCAL DE IPI".');
       {Cliente não é consumidor final, e emitente gerar crédito de ICMS}
       if (nf.NFe.Ide.indFinal = cfNao) and (qryEmpresa.FieldByname('gera_direito_credito').AsBoolean) then begin
         {Mensagem dos créditos de ICMS}
         obs.Add(qryEmpresa.FieldByName('dados_adcionais').AsString);
         obs.Text := ReplaceStr(obs.Text,'<VALOR>'   , FormatFloatBr(totvCredICMSSN,',0.00'));
         obs.Text := ReplaceStr(obs.Text,'<PORCENTO>', qryEmpresa.FieldByName('aliquota_sn').Asstring);
         //NF.nfE.InfAdic.infCpl  := NF.nfE.InfAdic.infCpl + ' ' + obs;
       end;
     end;
     {Tributos, para todos}
     obs.Add(qryEmpresa.FieldByName('tributos_totais').AsString);
     obs.Text := ReplaceStr(obs.Text,'<VALOR>' ,Format('%.2f',[nf.NFe.Total.ICMSTot.vTotTrib]));
     obs.Text := obs.Text + obsCST60;
     NF.nfE.InfAdic.infCpl  := ReplaceStr( obs.Text, #13#10,#32);
  finally
    RestoreDecimalSeparator;
    StopWait;
  end;
end;

procedure TfrmNFSaida.AutorizaNFe(ACBrNFe: TACBrNFe);
Var sourceFile, destFile,chave_nfe, recibo,status : String;
    ok : Boolean;
Begin
   ACBrNFe1.NotasFiscais.GerarNFe;
   ACBrNFe.Configuracoes.Arquivos.PathSalvar := obtemPathSistemaNFe(tpsTmp );
   sourceFile := obtemPathSistemaNFe(tpsTmp ) + OnlyNumber(ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID) + '-nfe.xml';
   ACBrNFe1.NotasFiscais.GravarXML(sourceFile);
   if ACBrNFe.Configuracoes.WebServices.Ambiente = taHomologacao then
      ShowMessage('Ambiente de Homologação. Nota não tem valor fiscal.'#10+
                  'SE VOCE ESTA VENDO ESTA MENSAGEM AVISE O RESPONSÁVEL'#10+
                  'PELO SISTEMA IMEDIATAMENTE.');
   StartWait;
   try
      if ACBrNFe1.Configuracoes.Geral.FormaEmissao in [teNormal,teSVCRS] then
      begin
         ACBrNFe1.NotasFiscais.Assinar;
         ACBrNFe1.NotasFiscais.Validar;
         ACBrNFe1.Enviar( qryNotaid.AsInteger ,false,True);
         //showmessagefmt('deu %d',[ACBrNFe1.WebServices.Retorno.cStat]);
         if ACBrNFe1.NotasFiscais[0].Confirmada then
         begin
             chave_nfe := ACBrNFe1.NotasFiscais[0].NFe.procNFe.chNFe;
             recibo    := ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt;
             destFile  := obtemPathSistemaNFe(tpsXMLAnoMes, ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi ) +
                           ExtractFileName(sourceFile);
             CopyFileTo(sourceFile, destFile);
             if FileExists(destFile) then
                DeleteFile(sourceFile);
             status := StatusNFe2Str( snfAutorizada );
             if ACBrNFe1.WebServices.Retorno.cStat in [110,301,302,303] then
                status := StatusNFe2Str( snfDenegada );
             ExecSql(dbConnect.ZConnection1,'Update nfsaida Set chave_nfe=''%s'', status_nfe=%s,'+
                                            'numero_recibo=%s,dadosadicionais=''%s'' Where id=%d',
                                            [chave_nfe,
                                             status,
                                             recibo,
                                             ACBrNFe1.NotasFiscais[0].NFe.InfAdic.infCpl,
                                             qryNotaid.AsInteger]);
             ImportaXMLToDBFromStr(dbConnect.ZConnection1,'nfsaida_xml','nfsaida',qryNotaid.AsString,'xml_str',ACBrNFe1.NotasFiscais[0].XMLAssinado);
             RefreshTable( qryNota );
             EnviarNFeporemail.Click;
         end else begin
             StopWait;
             SalvarErroNotaFiscal(qryNotaid.AsInteger,ACBrNFe1.WebServices.Enviar.xMotivo,qryNotastatus_nfe.AsString);
             RefreshTable( qryNota );
             Raise Exception.Create(ACBrNFe1.WebServices.Enviar.xMotivo);
         end;

      end else begin
        if ACBrNFe.Configuracoes.Geral.FormaEmissao = teDPEC then begin
////////////////////////////////////////////////////////////////////////
          ACBrNFe1.NotasFiscais.Assinar;
          ACBrNFe1.NotasFiscais.Validar;
          ACBrNFe1.Configuracoes.WebServices.Visualizar     := True;
          ACBrNFe1.EventoNFe.Evento.Clear;
          with ACBrNFe1.EventoNFe.Evento.Add do begin
               {}
                infEvento.cOrgao                       := 91;
                infEvento.tpAmb                        := ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.tpAmb;
                infEvento.CNPJ                         := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.CNPJCPF;
                infEvento.chNFe                        := OnlyNumber(ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID);
                infEvento.dhEvento                     := Now;
                infEvento.tpEvento                     := teEPECNFe;
                infEvento.nSeqEvento                   := 1;
                infEvento.detEvento.descEvento         := 'EPEC';
                infEvento.detEvento.cOrgaoAutor        := ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.cUF;
                infEvento.detEvento.tpAutor            := taEmpresaEmitente;
                infEvento.detEvento.verAplic           := ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.verProc;
                infEvento.detEvento.dhEmi              := Now;
                infEvento.detEvento.tpNF               := ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.tpNF;
                infEvento.detEvento.IE                 := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.IE;
                infEvento.detEvento.dest.UF            := ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.EnderDest.UF;
                infEvento.detEvento.dest.CNPJCPF       := ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.CNPJCPF;
                infEvento.detEvento.dest.idEstrangeiro := ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.idEstrangeiro;
                If  (ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.IE <> '')
                or  (ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.IE <> 'ISENTO') then
                begin
                  infEvento.detEvento.dest.IE          := ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.IE;
                end;
                infEvento.detEvento.vNF                := ACBrNFe1.NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF;
                infEvento.detEvento.vICMS              := ACBrNFe1.NotasFiscais.Items[0].NFe.Total.ICMSTot.vICMS;
                infEvento.detEvento.vST                := ACBrNFe1.NotasFiscais.Items[0].NFe.Total.ICMSTot.vST;
               {}
          end;
            ok := ACBrNFe1.EnviarEvento(qryNotaid.AsInteger);
            ok := True;
            if ok then begin
              chave_nfe := OnlyNumber(ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID);
              recibo    := ACBrNFe1.EventoNFe.Evento[0].RetInfEvento.nProt;
              destFile  := obtemPathSistemaNFe( tpsXMLAnoMes, ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi ) + ExtractFileName(sourceFile);
              CopyFileTo(sourceFile, destFile);
              if FileExists(destFile) then
                 DeleteFile(sourceFile);
              ExecSql(dbConnect.ZConnection1,'Update nfsaida Set chave_nfe=''%s'', status_nfe=%s,'+
                                             'numero_recibo=''%s'',dadosadicionais=''%s'' Where id=%d',
                                             [chave_nfe,
                                              StatusNFe2Str( snfEPEC ),
                                              recibo,
                                              ACBrNFe1.NotasFiscais[0].NFe.InfAdic.infCpl,
                                              qryNotaid.AsInteger]);
              ImportaXMLToDBFromStr(dbConnect.ZConnection1,'nfsaida_xml','nfsaida',qryNotaid.AsString,'xml_str',ACBrNFe1.NotasFiscais[0].XMLAssinado);
              RefreshTable( qryNota );
            end else begin
              StopWait;
              SalvarErroNotaFiscal(qryNotaid.AsInteger,ACBrNFe1.EventoNFe.Evento[0].RetInfEvento.xMotivo,qryNotastatus_nfe.AsString);
              RefreshTable( qryNota );
            end;
////////////////////////////////////////////////////////////////////////
        end;
      end;
  except
    StopWait;
    {EPEC não pode alterar status até ser enviada}
    SalvarErroNotaFiscal(qryNotaid.AsInteger,ACBrNFe1.WebServices.Enviar.xMotivo, qryNotastatus_nfe.AsString);
    RefreshTable( qryNota );
    Raise;
  end;
  StopWait;
end;

procedure TfrmNFSaida.SalvarErroNotaFiscal(const idNota : Integer; const xMotivo, StatusNFE : String);
begin
  if Str2StatusNFe( StatusNFE ) = snfEPEC then
    ExecSql(dbConnect.ZConnection1,'Update nfsaida Set motivo_erro=''%.80s'' Where id=%d',
                                   [xMotivo,idNota])
  else
    ExecSql(dbConnect.ZConnection1,'Update nfsaida Set status_nfe=%s,numero_recibo='''',motivo_erro=''%.80s'' Where id=%d',
                                   [StatusNFe2Str( snfErro ),
                                    xMotivo,
                                    idNota]);
  ExecSql(dbConnect.ZConnection1,'Delete From nfsaida_erro Where nfsaida=%d',[idNota]);
  ExecSql(dbConnect.ZConnection1,'Insert Into nfsaida_erro (nfsaida,erro) values(%d,''%s'')',
                                 [idNota,
                                  xMotivo]);
end;

function  TfrmNFSaida.AddProduto(const idNota, produto, lote: Integer; const quantidade: Double):Integer;
var qProd  : TZQuery;
    id : Integer;
begin
   qProd  := ExecSqlQuery(dbConnect.ZConnection1,'Select * from produtos Where id=%d',[produto]);
   qryItens.Insert;
   qryItensnfsaida.AsInteger    := idNota;
   qryItensproduto.AsInteger    := qProd.FieldByName('id').AsInteger;
   qryItensdescricao.AsString   := qProd.FieldByName('descricao').AsString;
   qryItensunidade.AsString     := qProd.FieldByName('unidade').AsString;
   qryItenslote.AsInteger       := lote;
   qryItensquantidade.AsCurrency   := quantidade;
   qryItensncm.AsString         := qProd.FieldByName('ncm').AsString;
   qryItensorigem.AsString      := qProd.FieldByName('origem').AsString;
   qryItenspeso.AsCurrency         := qProd.FieldByName('peso').AsCurrency;
   qryItenspcomissao.AsCurrency    := qProd.FieldByName('comissao').AsCurrency;
   qryItens.Post;
   Result := LastInsertID(dbConnect.ZConnection1,'nfsaida_itens_id_seq');
   qProd.Close;
   qProd.free;
end;

function TfrmNFSaida.CheckEANItensNota(id: Integer): Boolean;
var lista: TStrings;
begin
  Result:= True;
  lista := ExportTableStrings(dbConnect.ZConnection1,'Select p.id,p.descricao,p.codigo_barras '+
                                 'from nfsaida_itens ni '+
                                 'Left Join produtos p on p.id=ni.produto '+
                                 'Where length(p.codigo_barras) not in (0,8,12,13,14) '+
                                 'and ni.nfsaida=%d',#9,[id]);
  if lista.Count = 0 then exit;
  lista.Insert(0,'Os seguintes itens contém código de barras errado.');
  EditarMemo('Erro de código de barras',TStringList(lista),false);
  Result := False;
end;

procedure TfrmNFSaida.RxDBGrid1TitleClick(Column: TColumn);
begin
  Column := RxDBGrid1.Columns[Column.ID+1];
  if pos(Column.FieldName,order) > 0 then
     Order := 'Order by '+Column.FieldName+' desc'
  else
     Order := 'Order by '+Column.FieldName;
  btAplicar.Click();
end;

procedure TfrmNFSaida.RxDBGrid2DblClick(Sender: TObject);
Var qICMS : TZQuery;
  crt: String;
begin
  //btEditaItem.Click;
  qICMS  := ExecSqlQuery(dbConnect.ZConnection1,'Select * from produto_icms_template Where produto=%d and upper(uf_destino)=''%s''',
  [qryItensproduto.AsInteger,
   UpperCase(qryNotauf.AsString)]);
  crt := ExecSql(dbConnect.ZConnection1,'Select crt from clientes Where id=%d',[qryNotacodcliente.AsInteger]);
  EditTable(qryItens);
  { Verificar se isto pode ser alterado aqui }
  qryItenscst.AsString  := getCSOSN(StrToInt(crt),
                                    qICMS.FieldByName('cst_csosn').AsString);

  CalcularItem(qICMS);
  //qProd.FieldByName('id').AsInteger, qNF.FieldByName('uf').AsString);
end;

procedure TfrmNFSaida.btGerarContasClick(Sender: TObject);
begin
  if GerarContasReceber then
     ShowMessage('Contas a receber geradas com sucesso.');
end;

procedure TfrmNFSaida.RxDBGrid3DblClick(Sender: TObject);
Var sxml,filename : Ansistring;
begin
  filename := GetTempDir(True) + qryNFReferencia.FieldByname('nota_referenciada').AsString  + '-nfe.xml';
  if Not qryNFReferencia.FieldByname('nfentrada').IsNull then
     ExportXMLToFile(dbConnect.ZConnection1,'nfentrada_xml','nfentrada',qryNFReferencia.FieldByname('nfentrada').AsString,'xml_str',filename)
  else
     ExportXMLToFile(dbConnect.ZConnection1,'nfsaida_xml','nfsaida',qryNFReferencia.FieldByname('nfsaida').AsString,'xml_str',filename);
  if Not FileExists(filename) then
     Raise Exception.CreateFmt('Não foi possível gerar/exportar/abrir o arquivo "%s"',[filename]);

  OpenURL( filename );
end;

procedure TfrmNFSaida.SpeedButton1Click(Sender: TObject);
Var res : Variant;
begin
   res := ShowSearchModal(dbConnect.ZConnection1,'tabela_forma_pagamento','nome','nome','nome',True);
   if VarIsBlank(res) then exit;
   EditTable(qryNota);
   qryNotaforma_pgto.AsString:= res;
end;

procedure TfrmNFSaida.SpeedButton2Click(Sender: TObject);
Var res : Variant;
    qTransp : TZQuery;
begin
   res := ShowSearchModal(dbConnect.ZConnection1,'transportadora','id,nome','id','nome',True);
   if VarIsBlank(res) then exit;
   qTransp := ExecSqlQuery(dbConnect.ZConnection1,'Select * from transportadora Where id=%s',[res]);
   EditTable(qryNota);
   qryNotanometransp.AsString  := qTransp.FieldByName('nome').AsString;
   qryNotacnpjtransp.AsString  := qTransp.FieldByName('cnpj').AsString;
   qryNotaendtransp.AsString   := qTransp.FieldByName('endereco').AsString;
   qryNotacidadetransp.AsString:= qTransp.FieldByName('cidade').AsString;
   qryNotaietransp.AsString    := qTransp.FieldByName('ie').AsString;
   qryNotauftransp.AsString    := qTransp.FieldByName('uf').AsString;
   qTransp.Free;
end;

procedure TfrmNFSaida.SpeedButton3Click(Sender: TObject);
begin
  SomarNota;
end;

procedure TfrmNFSaida.SomarNota;
Var totNota, totProd, totDesc, totIPI, totOutro: Currency;
    totBaseIcms, totIcms, totBCST, totIcmsST, totFrete : Currency;
    totPIS, totCOFINS : Currency;
begin
  totNota    := 0.00;
  totProd    := 0.00;
  totDesc    := 0.00;
  totIPI     := 0.00;
  totBaseIcms:= 0.00;
  totIcms    := 0.00;
  totBCST    := 0.00;
  totIcmsST  := 0.00;
  totFrete   := 0.00;
  totOutro   := 0.00;
  totPIS     := 0.00;
  totCOFINS  := 0.00;
  qryItens.First;
  while not qryItens.EOF do begin
     if qryItensindtot.AsInteger = 1 then begin
         totDesc    += (qryItensvalorunitario.AsCurrency * qryItensquantidade.AsCurrency) -
                       (qryItensvalorunitario.AsCurrency * qryItensquantidade.AsCurrency *
                        qryItenspdesconto.AsCurrency/100);
         if (qryItensvalortotal.AsCurrency <> (qryItensvalorunitario.AsCurrency * qryItensquantidade.AsCurrency)) then begin
            EditTable(qryItens);
            qryItensvalortotal.AsCurrency := qryItensvalorunitario.AsCurrency * qryItensquantidade.AsCurrency;
            PostTable(qryItens);
         end;

         totProd    += qryItensvalortotal.AsCurrency;
         totFrete   += qryItensvfrete.AsCurrency;
         totOutro   += qryItensvoutras.AsCurrency;
         totIPI     += RoundABNT(qryItensvbc_ipi.AsCurrency * qryItenspipi.AsCurrency/100,2);
         totBaseIcms+= qryItensbaseicms.AsCurrency;
         totIcms    += qryItensvlricms.AsCurrency;
         totBCST    += qryItensbasesubst.AsCurrency;
         totIcmsST  += qryItensvlrsubst.AsCurrency;
         totPIS     += CalculaPercMais(qryItensvbc_pis.AsCurrency   , qryItensppis.AsCurrency);
         totCOFINS  += CalculaPercMais(qryItensvbc_cofins.AsCurrency, qryItenspcofins.AsCurrency);

     end;
     qryItens.Next;
  end;
  EditTable(qryNota);
  qryNotabaseicms.AsCurrency            := totBaseIcms;
  qryNotavaloricms.AsCurrency           := totIcms;
  qryNotabaseicmssub.AsCurrency         := totBCST;
  qryNotavaloricmssub.AsCurrency        := totIcmsST;
  qryNotavalorfrete.AsCurrency          := totFrete;
  qryNotavaloripi.AsCurrency            := totIPI;
  qryNotavaloroutradesp.AsCurrency      := totOutro;
  qryNotavpis.AsCurrency                := totPIS;
  qryNotavcofins.AsCurrency             := totCOFINS;

  qryNotavalortotalprodutos.AsCurrency  := totProd;
  qryNotavalortotalnota.AsCurrency      := totProd +
                                           qryNotavaloricmssub.AsCurrency +
                                           qryNotavalorfrete.AsCurrency +
                                           qryNotavaloripi.AsCurrency +
                                           qryNotavaloroutradesp.AsCurrency;
  PostTable(qryNota);
end;

procedure TfrmNFSaida.SpeedButton4Click(Sender: TObject);
begin
  if ACBrCEP1.BuscarPorCEP(DBEdit13.Text) = 0 then exit;
  EditTable(qryNota);
  qryNotaendereco.AsString := ACBrCEP1.Enderecos[0].Logradouro;
  qryNotacidade.AsString := ACBrCEP1.Enderecos[0].Municipio;
  qryNotauf.AsString := ACBrCEP1.Enderecos[0].UF;
  qryNotabairro.AsString := ACBrCEP1.Enderecos[0].Bairro;
end;

procedure TfrmNFSaida.SpeedButton5Click(Sender: TObject);
Var res : Variant;
begin
   res := ShowSearchModal(dbConnect.ZConnection1,'empregados','id,nome','id,nome','nome',True,'funcao=''REPRESENTANTE''');
   if VarIsBlank(res) then exit;
   EditTable(qryNota);
   qryNotavendedor.AsString := res[0];
   qryNotavvendedor.AsString:= res[1];
end;

procedure TfrmNFSaida.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  if Panel.Index = 1 then begin
     uUser.DrawUser(StatusBar.Canvas,Rect,uUser.UsuarioAtual.userApelido,uUser.UsuarioAtual.Admin);
  end;

  if Panel.Index = 2 then begin
      uUser.DrawServidor(StatusBar.Canvas,Rect,dbConnect.ZConnection1.HostName);
  end;

end;

procedure TfrmNFSaida.ToolButton2Click(Sender: TObject);
begin
  ClosePageThisForm(Self);
end;

procedure TfrmNFSaida.ToolButton3Click(Sender: TObject);
Var res : Variant;
begin
  res := ShowSearchLista( arOpcoes ,'Selecione o tipo de Nota Fiscal',True);
  if VarIsNull(res) then exit;
  PageControl1.ActivePageIndex:= 1;
  PageControl2.ActivePageIndex:= 0;
  case res of
     0 : Begin
           //Venda de produtos
           CriarNovaNFeVenda;
         end;
     1 : Begin
           //Importar de pedido
           CriarNovaNFeDePedido;
         end;
     2 : Begin
           //Importar de venda do balcao
           ShowMessage(arOpcoes[res]);
           //CriarNovaNFeDeNFCe;
         end;
     3 : Begin
           //Devolução de cliente
           ShowMessage(arOpcoes[res]);
         end;
     4 : Begin
           //Devolução à fornecedor
           CriarNotaDevolucaoFornecedor;
         end;
     5 : Begin
           //Transferência de estoque
           ShowMessage(arOpcoes[res]);
         end;
     6 : Begin
           //NFe Complementar de ICMS
           ShowMessage(arOpcoes[res]);
         end;
     7 : Begin
           //NFe Complementar de Valor
           ShowMessage(arOpcoes[res]);
         end;
     8 : Begin
           //'Carta de correção'
           GerarCartadeCorrecao;
         end;
     9 : Begin
           //'Bonificada'
           CriarNovaNFeBonificadaDePedido;
         end;

  end;
end;

procedure TfrmNFSaida.GerarCartadeCorrecao;
var Chave, CNPJ, Correcao, nNf, id : string;
    filename : String;
    nSeqEvento : Integer;
    qryCCe : TZQuery;
    idLote: LongInt;
begin
//  qryCCe : TZQuery;
  nNf := qryNotanumeroctlform.AsString;
  if not(InputQuery('Carta de Correção', 'Informe o número da NF-e', nNf)) then
     exit;
  qryCCe:= ExecSqlQuery(dbConnect.ZConnection1,'Select id,chave_nfe From nfsaida Where numeroctlform=%s',[nNf]);
  id    := qryCCe.FieldByName('id').ASstring;
  Chave := qryCCe.FieldByName('chave_nfe').ASstring;//ExecSql(dbConnect.ZConnection1,'Select chave_nfe From nfsaida Where numeroctlform=%s',[nNf]);
  Chave := Trim(OnlyNumber(Chave));
  idLote:= DateTimeToDosDateTime(Now);//FormatDateTimeBr(Now(),'yymmddhhnn');
  //if not(InputQuery('WebServices Eventos: Carta de Correção', 'Identificador de controle do Lote de envio do Evento', idLote)) then
  //   exit;
  CNPJ := copy(Chave,7,14);
  //if not(InputQuery('WebServices Eventos: Carta de Correção', 'CNPJ ou o CPF do autor do Evento', CNPJ)) then
     //exit;
  nSeqEvento := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select Coalesce(sequencia,0)+1 From nfsaida_carta_correcao Where nfsaida=(Select id From nfsaida Where numeroctlform=%s)',[nNf]),1);
  //if not(InputQuery('WebServices Eventos: Carta de Correção', 'Sequencial do evento para o mesmo tipo de evento', nSeqEvento)) then
     //exit;
  if nSeqEvento > 1 then
  begin
     qryCCe:= ExecSqlQuery(dbConnect.ZConnection1,'SELECT nfsaida, sequencia, datahora, '+
'UNNEST(xpath(''//a:infEvento/a:detEvento/a:xCorrecao/text()'', xml_str,''{{a,http://www.portalfiscal.inf.br/nfe}}''))::::Text As xml_str '+
                                                  'FROM nfsaida_carta_correcao '+
                                                  'Where nfsaida=%s and sequencia=%d',
                                                  [id, nSeqEvento-1]);
     Correcao := qryCCe.FieldByName('xml_str').AsString;
  end else
     Correcao := 'Correção a ser considerada, texto livre. A correção mais recente substitui as anteriores.';

  if not EditarMemo('Carta de Correção',Correcao) then
     exit;
  //if not(InputQuery('WebServices Eventos: Carta de Correção', 'Correção a ser considerada', Correcao)) then
     //exit;
  InicializaConfigNFe(ACBrNFe1, StrToInt(getEmpresaPadrao( meCodigo )));
  ACBrNFe1.Configuracoes.WebServices.Visualizar:= True;
  ACBrNFe1.Configuracoes.Arquivos.PathEvento    := IncludeTrailingPathDelimiter(obtemPathSistemaNFe(tpsXMLAnoMes, qryNotadataemissao.AsDateTime ) + 'Eventos');

  ACBrNFe1.EventoNFe.Evento.Clear;
  with ACBrNFe1.EventoNFe.Evento.Add do
   begin
     infEvento.chNFe      := Chave;
     infEvento.CNPJ       := CNPJ;
     infEvento.dhEvento   := now;
     infEvento.tpEvento   := teCCe;
     infEvento.nSeqEvento := nSeqEvento;
     infEvento.detEvento.xCorrecao := Correcao;
   end;
  if ACBrNFe1.EnviarEvento( idLote ) then begin
    //ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].
    //1101104116091197242800011255001000000104100000029001-procEventoNFe.xml
    filename := obtemPathSistemaNFe(tpsEventos, qryNotadataemissao.AsDateTime )+'110110'+Chave+Format('%.2d-procEventoNFe.xml',[nSeqEvento]);
    ImportaXMLToDBFromStr(dbConnect.ZConnection1,'nfsaida_carta_correcao',['nfsaida','sequencia'],
                          [id, IntToStr(nSeqEvento)],'xml_str',
                          LeFileToString(filename));

  end;

//  MemoResp.Lines.Text   := ACBrNFe1.WebServices.EnvEvento.RetWS;
  //memoRespWS.Lines.Text := ACBrNFe1.WebServices.EnvEvento.EventoRetorno;
//  ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].XXXX
//  LoadXML(MemoResp, WBResposta);
end;

procedure TfrmNFSaida.DevolverTudoParaEstoque(const historico: string);
begin
  qryItens.First;
  While Not qryItens.Eof do begin
    DevolverEstoque(qryItenslote.AsInteger,qryItensquantidade.AsCurrency);
    GerarHistoricoMovimento(qryNotanumeroctlform.AsInteger,qryItensproduto.AsInteger,qryItenslote.AsInteger,1,
                            OM_NOTA_SAIDA,historico,qryItensquantidade.AsCurrency,0);
    qryItens.Next;
  end;
end;

procedure TfrmNFSaida.EnviaMessagePedidoFaturado(const id: Integer);
Var title : String;
begin
//  title := 'MESSAGE_BACKUP_BD';
  title := 'MESSAGE_PEDIDO_FATURADO';
  sendMenssageToSmatPhoneThread( qryNotavendedor.asInteger, Format('{ped:%d}',[id]),title);
  //if sendMenssageToSmatPhone( qryListaRepid.asInteger, '{ped:0}',title) then
     //ShowMessage('Mensagem enviada.');
end;

procedure TfrmNFSaida.ToolButton5Click(Sender: TObject);
begin
  if MessageDlg('Você que autorizar esta nota fiscal agora ?',mtConfirmation,[mbNo,mbYes],0) <> mrYes then exit;
  mnAutorizarNFe.Click;
end;

procedure TfrmNFSaida.ToolButton8Click(Sender: TObject);
begin
  PostTable(dsNota.DataSet);
end;

procedure TfrmNFSaida.VisualizarXMLClick(Sender: TObject);
Var sxml,filename : Ansistring;
begin
  if Length(qryNotachave_nfe.AsString) = 0 then
     Raise Exception.Create('Erro ao tentar recuperar XML, esta NF-e não tem a chave de acesso.');

  filename := GetTempDir(True) + qryNotachave_nfe.AsString + '-nfe.xml';;
  ExportXMLToFile(dbConnect.ZConnection1,'nfsaida_xml','nfsaida',qryNotaid.AsString,'xml_str',filename);
  if Not FileExists(filename) then
     Raise Exception.CreateFmt('Não foi possível gerar/exportar/abrir o arquivo "%s"',[filename]);

  OpenURL( filename );
end;

procedure TfrmNFSaida.VisualizarXML_NFDClick(Sender: TObject);
Var fileName, localfile : String;
begin
  fileName  := qryNFReferencia.FieldByName('nota_referenciada').AsString + '-nfe.xml';
  localfile := NormalDir(GetTempDir) + fileName;
  if qryNFReferencia.FieldByName('nfsaida').AsInteger > 0 then
     ExportXMLToFile(dbConnect.ZConnection1,'nfsaida_xml','nfsaida',qryNFReferencia.FieldByName('nfsaida').AsString,'xml_str',localfile)
  else
     ExportXMLToFile(dbConnect.ZConnection1,'nfentrada_xml','nfentrada',qryNFReferencia.FieldByName('nfentrada').AsString,'xml_str',localfile);
  OpenURL(localfile);
end;

procedure TfrmNFSaida.FormCreate(Sender: TObject);
begin
  PageControl2.ActivePageIndex:=0;
  PageControl1.ActivePageIndex:=0;
  FormResize(Nil);
  Caption := Caption + ' - @' +RxVersionInfo1.FileVersion;
  DateEdit1.Date := StartOfTheMonth(Date);
  DateEdit2.Date := EndOfTheMonth(Date);
  Order := 'Order by numeroctlform desc';
  RxDBGrid1.ReadOnly := (UsuarioAtual.userApelido <> 'admin');
  btAplicar.Click;
end;

procedure TfrmNFSaida.btAplicarClick(Sender: TObject);
Var Where, sdata, limite : String;
begin
  sdata := 'dataemissao';
  Where := Where + Format('Where %s Between ''%s'' and ''%s''',[sdata,DateEdit1.Text,DateEdit2.Text]);
  limite := '';
  if edLimit.Text = '100' then limite := 'Limit 100'
  else if edLimit.Text = '500' then limite := 'Limit 500'
       else if edLimit.Text = '1000' then limite := 'Limit 1000'
            else if edLimit.Text = 'Sem Limite' then limite := ''
                 else limite := 'Limit '+edLimit.Text;
  qryListaNotas.Close;
  qryListaNotas.Sql.Clear;
  qryListaNotas.Sql.Add('Select * from nfsaida');
  qryListaNotas.Sql.Add(Where);
  qryListaNotas.Sql.Add(Order);
  qryListaNotas.Sql.Add(Limite);
  OpenTable( qryListaNotas );

end;

procedure TfrmNFSaida.ACBrNFe1StatusChange(Sender: TObject);
begin
  case ACBrNFe1.Status of
    stIdle :
    begin
      if ( frmStatus <> nil ) then
        frmStatus.Hide;
    end;
    stNFeStatusServico :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Verificando Status do servico...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeRecepcao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando dados da NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeRetRecepcao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Recebendo dados da NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeConsulta :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Consultando NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeCancelamento :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando cancelamento de NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeInutilizacao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando pedido de Inutilização...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeRecibo :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Consultando Recibo de Lote...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeCadastro :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Consultando Cadastro...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeEmail :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando Email...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeCCe :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando Carta de Correção...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeEvento :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando Evento...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
  end;
  Application.ProcessMessages;
end;

procedure TfrmNFSaida.AdicionarreferenciaobservaoClick(Sender: TObject);
Var qry : TZQuery;
begin
   if qryNFReferencia.FieldByName('nfsaida').AsInteger > 0 then
      qry := ExecSqlQuery(dbConnect.ZConnection1,'Select dataemissao::::date,numeroctlform as numero From nfsaida where id=%d',[qryNFReferencia.FieldByName('nfsaida').AsInteger]);
   if qryNFReferencia.FieldByName('nfentrada').AsInteger > 0 then
      qry := ExecSqlQuery(dbConnect.ZConnection1,'Select dataemissao::::date,numeronf as numero From nfentrada where id=%d',[qryNFReferencia.FieldByName('nfentrada').AsInteger]);

   EditTable(qryNota);
   qryNotadadosadicionais.ASString := qryNotadadosadicionais.ASString + ' ' +
                                      'Ref.Dev.NF '+ qry.FieldByName('numero').AsString +
                                      ' de ' + qry.FieldByName('dataemissao').AsString;
end;

procedure TfrmNFSaida.btAddNFRefClick(Sender: TObject);
Var res : Variant;
begin
  if Not (Str2TipoNFSaida(qryNotatipo_nota.AsString) in [NOTA_DEVOLUCAO_CLI, NOTA_DEVOLUCAO_FOR]) then
     Raise Exception.Create('Não é possível referenciar uma NF neste tipo de nota.');

  if Str2TipoNFSaida(qryNotatipo_nota.AsString) = NOTA_DEVOLUCAO_FOR then begin
     res := ShowSearchModal(dbConnect.ZConnection1,'nfentrada','numeronf,fornecedor','id','fornecedor',Format('cliente_forn=%d',[qryNotacodcliente.AsInteger]),'id desc',true);
      if VarIsBlank(res) then exit;
      ExecSql(dbConnect.ZConnection1,'INSERT INTO nfsaida_referencias(nfsaida_principal, nfsaida, nfentrada) '+
                                 'VALUES (%d, %d, %s)',
                                 [qryNotaid.AsInteger,
                                  0,
                                  res]);
      AddItensNFDevolucaoFornecedor(res);
  end;
  if Str2TipoNFSaida(qryNotatipo_nota.AsString) = NOTA_DEVOLUCAO_CLI then begin
      res := ShowSearchModal(dbConnect.ZConnection1,'nfsaida','numeroctlform,destinatario','id','destinatario',Format('codcliente=%d',[qryNotacodcliente.AsInteger]),'id desc',true);
      if VarIsBlank(res) then exit;
      ExecSql(dbConnect.ZConnection1,'INSERT INTO nfsaida_referencias(nfsaida_principal, nfsaida, nfentrada) '+
                                 'VALUES (%d, %d, %s)',
                                 [qryNotaid.AsInteger,
                                  res,0]);
      AddItensNFDevolucaoCliente(res);
  end;

end;

procedure TfrmNFSaida.btDelItemClick(Sender: TObject);
begin
    ConfirmDelete;
    qryItens.Delete;
    SomarNota;
end;

procedure TfrmNFSaida.btEditaItemClick(Sender: TObject);
begin
  if not EditarItemSaida( qryItensid.AsInteger ) then exit;
  RefreshTable( qryItens );
  SomarNota;
end;

procedure TfrmNFSaida.BitBtn5Click(Sender: TObject);
Var res : Variant;
    Where : String;
begin
   res := ShowSearchModal(dbConnect.ZConnection1,'nfsaida','dataemissao,numeroctlform,destinatario','id','destinatario','0=0');//,'dataentrada desc');
   if VarIsBlank(res) then exit;
   PageControl1.ActivePageIndex:= 1;
   OpenNFe(res);
end;

procedure TfrmNFSaida.btCancelarLancamento1Click(Sender: TObject);
begin
   if Not (Str2StatusNFe(qryNotastatus_nfe.ASString) in [snfInutilizada, snfIniciada ]) then
      Raise Exception.Create('NF-e não pode deletada.');

   if MessageDlg('Voce quer deletar esta nota fiscal agora ?',mtConfirmation,[mbNo,mbYes],0) <> mrYes then exit;
   if qryNotaimpressa.AsBoolean then
     Raise Exception.Create('Esta nota ainda esta marcada como lançada no sistema, cancele a nf primeiro ');

   if qryNotanumero_pedio_online.AsInteger <> 0 then begin
       if MessageDlg('Você quer disponibilizar o pedido desta nota novamente ?',mtConfirmation,[mbNo,mbYes],0) = mrYes then
         ExecSql(dbConnect.ZConnection1,'Update pedido_venda Set status=%d Where id=%d',[STATUS_PEDIDO_PENDENTE, qryNotanumero_pedio_online.AsInteger]);
   end;
   ExecSql(dbConnect.ZConnection1,'Delete From nfsaida_itens Where nfsaida=%d',[qryNotaid.AsInteger]);
   qryNota.Delete;
   RefreshTable( qryListaNotas );
   ShowMessage('Nota eliminada do sistema.');
end;

procedure TfrmNFSaida.btFaltaTempClick(Sender: TObject);
begin
  if MessageDlg('Remover NF-e referenciada','Você quer remover a NF-e selecionada.',mtConfirmation,[mbNo,mbYes],0) = mrYes then
  begin
     ExecSql(dbConnect.ZConnection1,'Delete From nfsaida_referencias Where id=%d',[qryNFReferencia.FieldByName('id').AsInteger]);
     RefreshTable( qryNFReferencia );
  end;

end;

procedure TfrmNFSaida.btImprimirDanfeClick(Sender: TObject);
begin
   ImprimirNFe.Click;
end;

procedure TfrmNFSaida.Button1Click(Sender: TObject);
Var res : variant;
begin
   res := ShowSearchModal(dbConnect.ZConnection1,'cfop_data','cfop,descricao','cfop,descricao','descricao',True);
   if VarIsNull(res) then exit;
   ExecSql(dbConnect.ZConnection1,'Update nfsaida_itens SET cfop=''%s'' Where nfsaida=%d',[res[0],qryNotaid.asInteger]);
   RefreshTable( qryItens );
end;

procedure TfrmNFSaida.DBEdit11DblClick(Sender: TObject);
begin
   DBEdit11.CopyToClipboard;
end;

procedure TfrmNFSaida.dsNotaStateChange(Sender: TObject);
begin
  ToolButton8.Enabled := (dsNota.DataSet.State in dsEditModes) ;
end;

procedure TfrmNFSaida.EnviarNFeporemailClick(Sender: TObject);
Var sxml,filename, email : Ansistring;
    msg : TStringList;
    SMTPConfig : TSMTPConfig;
begin
   if Length(qryNotachave_nfe.AsString) = 0 then
      Raise Exception.Create('Erro ao tentar recuperar XML, esta NF-e não tem a chave de acesso.');

  email := ExecSql(dbConnect.ZConnection1,'Select email From clientes Where id=%d',[qryNotacodcliente.asInteger]);
  if Not InputQuery('Enviar e-mail','Digite o e-mail de destino',email) then exit;
  filename := GetTempDir(True) + qryNotachave_nfe.AsString + '-nfe.xml';;
  ExportXMLToFile(dbConnect.ZConnection1,'nfsaida_xml','nfsaida',qryNotaid.AsString,'xml_str',filename);
  if Not FileExists(filename) then
     Raise Exception.CreateFmt('Não foi possível gerar/exportar/abrir o arquivo "%s"',[filename]);

  InicializaConfigNFe( ACBrNFe1, StrToInt(getEmpresaPadrao( meCodigo )) );
  ACBrNFe1.NotasFiscais.Clear;
  ACBrNFe1.NotasFiscais.LoadFromFile( filename );
  ACBrNFe1.DANFE.TipoDANFE     := tiRetrato;{tiSimplificado alterado para imprimir com ST}
  ACBrNFe1.DANFE.Cancelada  := qryNotacancelada.AsBoolean;
  //ACBrNFe1.DANFE.ExibirResumoCanhoto:= True;

  msg := TStringList.Create;
  msg.Add('Segue em anexo NF-e');
  ACBrNFe1.MAIL := dbConnect.ACBrMail1;
  SMTPConfig := getSmtpConfig();
  ACBrNFe1.MAIL.Host    := SMTPConfig.smtpserver;
  ACBrNFe1.MAIL.Port    := SMTPConfig.smtpporta;
  ACBrNFe1.MAIL.SetSSL  := SMTPConfig.smtpssl;
  ACBrNFe1.MAIL.SetTLS  := SMTPConfig.smtptls;
  ACBrNFe1.MAIL.From    := SMTPConfig.smtpusuario;
  ACBrNFe1.MAIL.FromName:= getEmpresaPadrao(meNome);
  ACBrNFe1.MAIL.Username:= SMTPConfig.smtpusuario;
  ACBrNFe1.MAIL.Password:= SMTPConfig.smtpsenha;
  ACBrNFe1.NotasFiscais[0].EnviarEmail(email,'NF-e',msg);
end;

procedure TfrmNFSaida.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
end;



end.

