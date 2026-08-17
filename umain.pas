unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, windows, SysUtils, FileUtil, Forms, Controls, Dialogs, ComCtrls,
  Menus, ExtCtrls, ActnList,PopupNotifier,ZDataset,RxVersInfo,TDIPageControl,
  LMessages;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    acsair: TAction;
    acClientes: TAction;
    acFornecedores: TAction;
    acProdutos: TAction;
    acContasReceber: TAction;
    acContasPagar: TAction;
    acDireitosAcesso: TAction;
    acConfig: TAction;
    acEntradaProd: TAction;
    acSaidaProd: TAction;
    acPlanocontas: TAction;
    acCFOP: TAction;
    acClasseTrib: TAction;
    acCadEmpregados: TAction;
    acCaixa: TAction;
    acSitCliente: TAction;
    acDepProdutos: TAction;
    acNFSaida: TAction;
    acOrdemProducao: TAction;
    acPedidoFornecedor: TAction;
    acCadTransp: TAction;
    acFormaPgto: TAction;
    acAvariados: TAction;
    acGerenciarFlex: TAction;
    acVendaBalcao: TAction;
    acTipoMovimento: TAction;
    ActionList1: TActionList;
    ApplicationProperties1: TApplicationProperties;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    exportXMLEntrada: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    GerenciamentodoFlex: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    Agenda: TMenuItem;
    MenuItem44: TMenuItem;
    Tabeladeprazodepagamento: TMenuItem;
    Relatoriodecomissoes: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem41: TMenuItem;
    tabelaipi: TMenuItem;
    mnRelVendas: TMenuItem;
    mnAtualizacao: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    OpenDialog1: TOpenDialog;
    PopupNotifier1: TPopupNotifier;
    RxVersionInfo1: TRxVersionInfo;
    StatusBar1: TStatusBar;
    TDIPageControl1: TTDIPageControl;
    TimerCheckEstoque: TTimer;
    TimerCheckUpdate: TTimer;
    TimerCheckEDI: TTimer;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    TrayIcon1: TTrayIcon;
    procedure acAvariadosExecute(Sender: TObject);
    procedure acCadEmpregadosExecute(Sender: TObject);
    procedure acCadTranspExecute(Sender: TObject);
    procedure acCaixaExecute(Sender: TObject);
    procedure acCFOPExecute(Sender: TObject);
    procedure acClientesExecute(Sender: TObject);
    procedure acConfigExecute(Sender: TObject);
    procedure acContasPagarExecute(Sender: TObject);
    procedure acContasReceberExecute(Sender: TObject);
    procedure acDepProdutosExecute(Sender: TObject);
    procedure acDireitosAcessoExecute(Sender: TObject);
    procedure acEntradaProdExecute(Sender: TObject);
    procedure acFormaPgtoExecute(Sender: TObject);
    procedure acFornecedoresExecute(Sender: TObject);
    procedure acGerenciarFlexExecute(Sender: TObject);
    procedure acPedidoFornecedorExecute(Sender: TObject);
    procedure acProdutosExecute(Sender: TObject);
    procedure acSaidaProdExecute(Sender: TObject);
    procedure acsairExecute(Sender: TObject);
    procedure acNFSaidaExecute(Sender: TObject);
    procedure acTipoMovimentoExecute(Sender: TObject);
    procedure acSitClienteExecute(Sender: TObject);
    procedure AgendaClick(Sender: TObject);
    procedure ApplicationProperties1Exception(Sender: TObject; E: Exception);
    procedure ApplicationProperties1Hint(Sender: TObject);
    procedure exportXMLEntradaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShortCut(var Msg: TLMKey; var Handled: Boolean);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure MenuItem32Click(Sender: TObject);
    procedure MenuItem33Click(Sender: TObject);
    procedure MenuItem36Click(Sender: TObject);
    procedure MenuItem41Click(Sender: TObject);
    procedure MenuItem42Click(Sender: TObject);
    procedure MenuItem43Click(Sender: TObject);
    procedure MenuItem44Click(Sender: TObject);
    procedure mnAtualizacaoClick(Sender: TObject);
    procedure mnRelVendasClick(Sender: TObject);
    procedure RelatoriodecomissoesClick(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure TabeladeprazodepagamentoClick(Sender: TObject);
    procedure tabelaipiClick(Sender: TObject);
    procedure TimerCheckEstoqueTimer(Sender: TObject);
    procedure TimerCheckUpdateTimer(Sender: TObject);
    procedure TimerCheckEDITimer(Sender: TObject);
  private
    { private declarations }
    versao_avisada : String;
    ultimo_pedido_avisado : Integer;
    ultimo_doc_cliente    : Integer;
    VoltarUmaVersao : Boolean;
    procedure checkUpdate;
    procedure checkAgenda;
  public
    { public declarations }
    procedure PopupNotifier1Close(Sender: TObject; var CloseAction: TCloseAction);
  end;

var
  frmMain: TfrmMain;


implementation

{$R *.lfm}

Uses udbConnect, uCadCliente, uCadFornecedor, uUser, WagVclUtils, BDSqlUtils,
  uSearch, uCadProdutos, uBaseForm, uCtareceber, uCtapagar, uPedidoCliente,
  uNFEntrada, uNotificacao, uCadSimples, sistema_config, uCadEmpregados, uCaixa,
  AppUtils, LazFileUtils, XMLRead, DOM, zipper, uNFSaida, uPedidoFornecedor,
  ucadtran, uCadAvariados, uRelComissoes, uGerenciamentoFlex, uExportXMLSaida,
  uExportXMLEntrada, uCheckNotify, httpsend;
//,

{ TfrmMain }

{Cadastros}
procedure TfrmMain.acClientesExecute( Sender: TObject );
begin
   uUser.FindShowForm(dbConnect.ZConnection1,TDIPageControl1,'Cadastros',TfrmCadCliente,'Cadastro de clientes',4);
end;


procedure TfrmMain.acCadEmpregadosExecute(Sender: TObject);
begin
  uUser.FindShowForm(dbConnect.ZConnection1,TDIPageControl1,'Cadastros',TfrmCadEmpregados,'Cadastro de empregados',16);
end;

procedure TfrmMain.acAvariadosExecute(Sender: TObject);
begin
  uUser.FindShowForm(dbConnect.ZConnection1,TDIPageControl1,'Cadastros',TfrmCadAvariados,'Avariados/Quarentena/Temp.',22);
end;

procedure TfrmMain.acCadTranspExecute(Sender: TObject);
begin
    uUser.FindShowForm(dbConnect.ZConnection1,TDIPageControl1,'Cadastros',TfCadTran,'Movimento de caixa',18);
end;

procedure TfrmMain.acFornecedoresExecute(Sender: TObject);
begin
  uUser.FindShowForm(dbConnect.ZConnection1,TDIPageControl1,'Cadastros',TfrmCadFornecedor,'Cadastro de fornecedores',5);
end;

procedure TfrmMain.acProdutosExecute(Sender: TObject);
begin
  uUser.FindShowForm(dbConnect.ZConnection1,TDIPageControl1,'Cadastros',TfrmCadProdutos,'Cadastro de produtos',6);
end;

procedure TfrmMain.MenuItem22Click(Sender: TObject);
begin
  uUser.ShowDialog(dbConnect.ZConnection1,'Cadastros','TfrmCadEmpresa');
end;


{Tabelas}

procedure TfrmMain.acTipoMovimentoExecute(Sender: TObject);
begin
  uUser.ShowDialog(dbConnect.ZConnection1,'Tabelas','TfrmTipoMovimento');
end;

procedure TfrmMain.acCFOPExecute(Sender: TObject);
begin
  if CheckAcessModulo(dbConnect.ZConnection1,'Tabelas', 'cfop_data') <> ACESSO_PERMITIDO then exit;
  ShowCadastro('Tabela de CFOP','cfop_data',['Código','Descrição'],['cfop','descricao'],[False,False],'cfop');
end;

procedure TfrmMain.acSitClienteExecute(Sender: TObject);
begin
  uUser.ShowDialog(dbConnect.ZConnection1,'Tabelas','TfrmcadSituacao');
end;

procedure TfrmMain.AgendaClick(Sender: TObject);
begin
//  ExecSql(dbConnect.ZConnection1,'Update agenda SET visualizado=True Where (data_aviso = CURRENT_DATE) AND (not visualizado)');
    ShowSearchModal(dbConnect.ZConnection1,'agenda','visualizado,data_aviso,mensagem','id','mensagem',True,'0=0');
end;

procedure TfrmMain.ApplicationProperties1Exception(Sender: TObject; E: Exception );
begin
  if E.ClassName <> 'EZSQLException' then exit;
  if not dbConnect.ZConnection1.PingServer then
  begin
     //while Not dbConnect.ZConnection1.Connected do
     //begin
        //dbConnect.ZConnection1.Disconnect;
        try
        dbConnect.ZConnection1.Reconnect;
        except
          Sleep(5000);
          //continue;
        end;
     //end;
  end;
end;

procedure TfrmMain.acDepProdutosExecute(Sender: TObject);
begin
  uUser.ShowDialog(dbConnect.ZConnection1,'Tabelas','Tfrmcadgrupoprod');
end;

procedure TfrmMain.MenuItem14Click(Sender: TObject);
begin
  if CheckAcessModulo(dbConnect.ZConnection1,'Tabelas', 'produto_tipo_produto') <> ACESSO_PERMITIDO then exit;
  ShowCadastro('Tipo tributário de produto','produto_tipo_produto',['Código','Descrição'],['id','nome'],[True,False],'id');
end;

procedure TfrmMain.MenuItem41Click(Sender: TObject);
begin
  if CheckAcessModulo(dbConnect.ZConnection1,'Tabelas', 'tipo_produto_interno') <> ACESSO_PERMITIDO then exit;
  ShowCadastro('Tipo interno de produto','tipo_produto_interno',['Código','Descrição'],['id','nome'],[True,False],'id');

end;

procedure TfrmMain.acFormaPgtoExecute(Sender: TObject);
begin
  if CheckAcessModulo(dbConnect.ZConnection1,'Tabelas', 'tabela_forma_pagamento') <> ACESSO_PERMITIDO then exit;
  ShowCadastro('Tabela de formas de pagamentos','tabela_forma_pagamento',['Descrição','Gera Conta?','Obs. Nota fiscal'],['nome','gera_conta','obs_nota_fiscal'],[False,False,False],'nome');
end;

procedure TfrmMain.tabelaipiClick(Sender: TObject);
begin
    uUser.ShowDialog(dbConnect.ZConnection1,'Tabelas','TfrmCadIPI');
end;

procedure TfrmMain.MenuItem15Click(Sender: TObject);
begin
  uUser.ShowDialog(dbConnect.ZConnection1,'Tabelas','TfrmPlanoContas');
end;

{Financeiro}

procedure TfrmMain.acCaixaExecute(Sender: TObject);
begin
  uUser.FindShowForm(dbConnect.ZConnection1,TDIPageControl1,'Financeiro',TfrmCaixa,'Movimento de caixa',11);
end;

procedure TfrmMain.acContasPagarExecute(Sender: TObject);
begin
  uUser.FindShowForm(dbConnect.ZConnection1,TDIPageControl1,'Financeiro',TfrmCtapagar,'Contas a Pagar',10);
end;

procedure TfrmMain.acContasReceberExecute(Sender: TObject);
begin
  uUser.FindShowForm(dbConnect.ZConnection1,TDIPageControl1,'Financeiro',TfrmCtareceber,'Contas a Receber',17);
end;

{Movimento}

procedure TfrmMain.acNFSaidaExecute(Sender: TObject);
begin
  uUser.FindShowForm(dbConnect.ZConnection1,TDIPageControl1,'Movimento',TfrmNFSaida,'Notas fiscais de saída',3);
end;

procedure TfrmMain.acPedidoFornecedorExecute(Sender: TObject);
begin
  uUser.FindShowForm(dbConnect.ZConnection1,TDIPageControl1,'Movimento',TfrmPedidoFornecedor,'Pedido ao fornecedor',10);
end;

procedure TfrmMain.acEntradaProdExecute(Sender: TObject);
begin
  uUser.FindShowForm(dbConnect.ZConnection1,TDIPageControl1,'Movimento',TfrmNFEntrada,'Notas Fiscais de entrada',2);
end;

procedure TfrmMain.acSaidaProdExecute(Sender: TObject);
begin
  uUser.FindShowForm(dbConnect.ZConnection1,TDIPageControl1,'Movimento',TfrmPedidoCliente,'Pedido do cliente',21);
end;

procedure TfrmMain.acGerenciarFlexExecute(Sender: TObject);
begin
  uUser.ShowDialog(dbConnect.ZConnection1,'Movimento','TfrmGerenciamentoFlex');
end;

{Relatorios}
procedure TfrmMain.exportXMLEntradaClick(Sender: TObject);
begin
  uUser.ShowDialog(dbConnect.ZConnection1,'Relatorios','TfrmExportXMLEntrada');
end;

procedure TfrmMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    CloseAction := caFree;
    SaveStringIni(DefaultINFileName,'versao','disponivel',versao_avisada);
    SaveStringIni(DefaultINFileName,'edi','ultimo_pedido_avisado',IntTostr(ultimo_pedido_avisado));
    SaveStringIni(DefaultINFileName,'edi','ultimo_doc_cliente',InttoStr(ultimo_doc_cliente));
end;

procedure TfrmMain.PopupNotifier1Close(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
  ExecSql(dbConnect.ZConnection1,'Update agenda SET visualizado=True Where (data_aviso = CURRENT_DATE) AND (not visualizado)');
  PopupNotifier1.OnClose := Nil;
end;

procedure TfrmMain.MenuItem32Click(Sender: TObject);
begin
  uUser.ShowDialog(dbConnect.ZConnection1,'Relatorios','TfrmRelConfEstoque');
end;

procedure TfrmMain.MenuItem33Click(Sender: TObject);
begin
  uUser.ShowDialog(dbConnect.ZConnection1,'Relatorios','TfrmRelListEnvio');
end;

procedure TfrmMain.MenuItem36Click(Sender: TObject);
begin
  uUser.ShowDialog(dbConnect.ZConnection1,'Relatorios','TfrmExportXMLSaida');
end;

procedure TfrmMain.mnRelVendasClick(Sender: TObject);
begin
  uUser.ShowDialog(dbConnect.ZConnection1,'Relatorios','TfrmRelVendas');
end;

procedure TfrmMain.RelatoriodecomissoesClick(Sender: TObject);
begin
  uUser.ShowDialog(dbConnect.ZConnection1,'Relatorios','TfrmRelComissoes');
end;

procedure TfrmMain.MenuItem42Click(Sender: TObject);
begin
  uUser.ShowDialog(dbConnect.ZConnection1,'Relatorios','TfrmRelClientes');
end;

procedure TfrmMain.MenuItem43Click(Sender: TObject);
begin
   ShowCadastro('Tabela de unidades de medida','unidade_medida',['Unidade','Descrição'],['unidade','descricao'],[False,False],'unidade');
end;

procedure TfrmMain.MenuItem44Click(Sender: TObject);
begin
  VoltarUmaVersao := True;
  ShowMessage('Atualização concluida, reinicie o aplicativo.');
end;

{Sistema}

procedure TfrmMain.acsairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.ApplicationProperties1Hint(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := Application.Hint;
end;

{Sistema}
procedure TfrmMain.acConfigExecute(Sender: TObject);
begin
  uUser.ShowDialog(dbConnect.ZConnection1,'Main','TfrmConfig');
end;

procedure TfrmMain.acDireitosAcessoExecute(Sender: TObject);
begin
  uUser.ShowUsersSys(dbConnect.ZConnection1);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  CanClose := MessageDlg('Encerrar aplicativo','Voce quer encerrar o aplicativo agora ?',mtconfirmation,[mbno,mbYes],0) = mrYes;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  {$IfDef CPUX86_64}
    Caption := ApplicationName + ' - versão 64bits@'+RxVersionInfo1.FileVersion;
  {$Else}
    Caption := ApplicationName + ' - versão 32bits@'+RxVersionInfo1.FileVersion;
  {$EndIf}
  TDIPageControl1.BaseForm := TfrmBaseForm;
  ultimo_pedido_avisado    := StrToInt(ReadStringINI(DefaultINFileName,'edi','ultimo_pedido_avisado','0'));
  ultimo_doc_cliente       := StrToInt(ReadStringINI(DefaultINFileName,'edi','ultimo_doc_cliente','0'));
  TimerCheckEDI.Enabled    := True;
  TimerCheckUpdate.Enabled := True;  //900000
  TimerCheckUpdateTimer(Self);

  VoltarUmaVersao := False;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
Var tmpdir, tempFile : String;
    lista : TStringList;
    i : Integer;
begin
  TimerCheckEDI.Enabled:= False;
  inherited;
  if VoltarUmaVersao then
  begin
     if Not FileExists('OLD-'+ExtractFileName( Application.ExeName)) then exit;
     RenameFile(ExtractFileName( Application.ExeName), 'NEW-'+ExtractFileName( Application.ExeName));
     RenameFile('OLD-'+ExtractFileName( Application.ExeName),ExtractFileName( Application.ExeName) );
     SaveStringToFile('Voltou um VERSÃO','atualizacao.log',True);
  end;
  try
    tmpdir   := NormalDir(NormalDir( GetTempDir ) + ExtractFileNameOnly( Application.ExeName ));
    tempFile := tmpdir + ExtractFileName( Application.ExeName );
    if Not FileExists(tempFile) then exit;
    DeleteFile('OLD-' + ExtractFileName( Application.ExeName) );
    RenameFile(ExtractFileName( Application.ExeName), 'OLD-'+ExtractFileName( Application.ExeName));
    lista := FindAllFiles(tmpdir,GetAllFilesMask,False);
    for i := 0 to lista.count -1 do begin
        try
        CopyFile(lista[i], ProgramDirectory + ExtractFileName(lista[i]) );
        except
        end;
    end;
    DeleteDirectory(tmpdir,False);
  finally
    //Atualizou ?
    if Not FileExists( ProgramDirectory + ExtractFileName( Application.ExeName) ) then begin
       RenameFile('OLD-'+ExtractFileName( Application.ExeName),ExtractFileName( Application.ExeName) );
    end;
  end;

end;

procedure TfrmMain.FormShortCut(var Msg: TLMKey; var Handled: Boolean);
begin
  if Assigned(TDIPageControl1.ActivePage.Form.OnShortcut) then begin
     TDIPageControl1.ActivePage.Form.OnShortcut(Msg,Handled);
  end;
end;

procedure TfrmMain.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin

  if Panel.Index = 1 then begin
     //Aviso de locação
  end;
  if Panel.Index = 2 then begin
     uUser.DrawServidor(StatusBar.Canvas,Rect,dbConnect.ZConnection1.HostName +'=>'+ getEmpresaPadrao(meAbreviacao));
  end;
  if Panel.Index = 3 then begin
     uUser.DrawUser(StatusBar.Canvas,Rect,UsuarioAtual.userApelido+'-'+dbConnect.ZConnection1.Database ,true);
  end;

end;

procedure TfrmMain.TabeladeprazodepagamentoClick(Sender: TObject);
begin
  if CheckAcessModulo(dbConnect.ZConnection1,'Tabelas', 'tabela_prazo_pagamento') <> ACESSO_PERMITIDO then exit;
  ShowCadastro('Tabela de prazo pagamento','tabela_prazo_pagamento',['Código','Forma de pgto'],['id','prazo'],[True,False],'prazo');
end;

procedure TfrmMain.TimerCheckUpdateTimer(Sender: TObject);
begin
  TimerCheckUpdate.Enabled:= False;
  checkUpdate;
  checkAgenda;
  TimerCheckUpdate.Enabled:= True;
end;

procedure TfrmMain.TimerCheckEDITimer(Sender: TObject);
Var id : String;
begin
  TimerCheckEDI.Enabled:= False;
  try
    Application.ProcessMessages;
    id := ExecSql(dbConnect.ZConnection1,'Select max(id) from pedido_venda '+
                                         'Where origem_pedido=1 and status=0 and id > %d',
                                         [ultimo_pedido_avisado]);
    if StrToIntDef(id,0) > 0 then begin
       ultimo_pedido_avisado := StrToInt(id);
       PopupNotifier1.Title:= 'Aviso DyFar ';
       if PopupNotifier1.Visible then begin
          PopupNotifier1.Text := 'Você recebeu novo pedido Nº '+ id + #10 + PopupNotifier1.Text;
       end else
          PopupNotifier1.Text := 'Você recebeu novo pedido Nº '+id;

       PopupNotifier1.ShowAtPos(TrayIcon1.GetPosition.x,TrayIcon1.GetPosition.y );
       PopupNotifier1.Show;
    end;
    Application.ProcessMessages;
    id := ExecSql(dbConnect.ZConnection1,'Select max(id) from cliente_documento '+
                                         'Where id > %d and visualizado = False',
                                         [ultimo_doc_cliente]);
    if StrToIntDef(id,0) > 0 then begin
       ultimo_doc_cliente := StrToInt( id );
       PopupNotifier1.Title:= 'Aviso DyFar ';
       if PopupNotifier1.Visible then begin
          PopupNotifier1.Text := 'Clientes enviaram documentos '+ id + #10 + PopupNotifier1.Text;
       end else
          PopupNotifier1.Text := 'Clientes enviaram documentos '+id;

       PopupNotifier1.ShowAtPos(TrayIcon1.GetPosition.x,TrayIcon1.GetPosition.y );
       PopupNotifier1.Show;
    end;

  finally
    TimerCheckEDI.Enabled:= True;
  end;
end;

procedure TfrmMain.TimerCheckEstoqueTimer(Sender: TObject);
begin
  TimerCheckEstoque.Enabled:= False;
  Application.ProcessMessages;
  {id := ExecSql(dbConnect.ZConnection1,'Select max(id) from pedido_venda '+
                                         'Where origem_pedido=1 and status=0 and id > %d',
                                         [ultimo_pedido_avisado]);
  PopupNotifier1.ShowAtPos(TrayIcon1.GetPosition.x,TrayIcon1.GetPosition.y );
  PopupNotifier1.Show;
  }
  TimerCheckEstoque.Enabled:= True;
end;


procedure TfrmMain.mnAtualizacaoClick(Sender: TObject);
var PassNode: TDOMNode;
    Doc:      TXMLDocument;
    ver_Local, ver_Remota, msg : String;
    lista : TStringList;
    UnZipper : TUnZipper;
    frmNotificacao : TfrmNotificacao;
    tmpDir,ProjectName, url : String;
    i : Integer;
    arq : TStringList;
    mem : TFileStream;
begin
  try
    ProjectName := ExtractFileNameOnly( Application.ExeName );
    url := getSysParametro('URL_ATUALIZACAO_SOFTWARE_DESKTOP');
    arq := TStringList.Create;
    if not HttpGetText(url +'/versao.xml',arq) then
    //+ 'http://www.walg.com.br/'+ProjectName+'/versao.xml',arq) then
       Raise Exception.Create('Não foi possível recuperar informações de atualização.');
    arq.SaveToFile('versao.xml');
    try
      ReadXMLFile(Doc, 'versao.xml');
    except
      Exit;
    end;
    PassNode  := Doc.DocumentElement.FindNode('versao');
    ver_Local := dbConnect.RxVersionInfo1.FileVersion;
    ver_Remota:= PassNode.TextContent;
    Doc.Free;
    msg := 'Recomendamos a atualização do sistema.';
    if comparaVersao(ver_Remota,ver_Local) <= 0 then
       msg := 'Não recomendamos a atualização do sistema.';
    if MessageDlg('Atualização','A versão atual do sistema é ' + ver_Local + #10+
                 'A versão disponível é       ' + ver_Remota+ #10+
                  msg+ #10+
                 'Você quer atualizar agora ? ',mtConfirmation,[mbNo,mbYes],0) <> mrYes then exit;
   StartWait();
   frmNotificacao := ShowNotificacao('Atualizar sistema','Baixando nova versão, aguarde ...');
   tmpDir := NormalDir(GetTempDir);
   mem := TFileStream.Create(tmpDir + ProjectName+'.zip',fmCreate);
   if not HttpGetBinary(url + ProjectName+'.zip',mem) then
   //'http://www.walg.com.br/'+ProjectName+'/'+ProjectName+'.zip',mem) then
      Raise Exception.Create('Não foi possível recuperar arquivo de atualização.');
   mem.Free;
   frmNotificacao.UpdateMsg('Descompactando...');
   ForceDirectories(NormalDir(tmpDir) + ProjectName);
   UnZipper := TUnZipper.Create;
   try
     UnZipper.FileName   := tmpDir + ProjectName +'.zip';
     UnZipper.OutputPath := NormalDir(tmpDir + ProjectName );
     UnZipper.Examine;
     UnZipper.UnZipAllFiles;
     //frmNotificacao.Free;
     StopWait();
     ShowMessage('Atualização concluida, reinicie o aplicativo.');
   finally
     frmNotificacao.Free;
     StopWait();
     UnZipper.Free;
   end;
  finally
  end;
end;

procedure TfrmMain.checkUpdate;
var PassNode: TDOMNode;
    Doc     : TXMLDocument;
    ver_Local, ver_Remota, ProjectName,msg, fileRemoto, url : String;
    arq : TStringList;
begin
  Application.ProcessMessages;
  ProjectName := ExtractFileNameOnly( Application.ExeName );
  url := getSysParametro('URL_ATUALIZACAO_SOFTWARE_DESKTOP');
  arq := TStringList.Create;
  //ProjectName+
  if not HttpGetText(url + '/versao.xml',arq) then exit;
  //'http://www.walg.com.br/'+ProjectName+'/versao.xml',arq) then
     //Raise Exception.Create('Não foi possível recuperar informações de atualização.');
  arq.SaveToFile('versao.xml');
  try
    ReadXMLFile(Doc, 'versao.xml');
  except
    Exit;
  end;
  PassNode  := Doc.DocumentElement.FindNode('versao');
  ver_Local := dbConnect.RxVersionInfo1.FileVersion;
  ver_Remota:= PassNode.TextContent;
  Doc.Free;
  msg := 'Recomendamos a atualização do sistema.';
  versao_avisada := ReadStringINI(DefaultINFileName,'versao','disponivel','');
  if comparaVersao(ver_Remota,versao_avisada) <= 0 then Exit;
  if comparaVersao(ver_Remota, ver_Local) > 0 then begin
     versao_avisada := ver_Remota;
     PopupNotifier1.Title:= 'Aviso de atualização '+ProjectName;
     PopupNotifier1.Text := 'A versão '+ver_Remota+' esta disponível para baixar';
     PopupNotifier1.ShowAtPos(TrayIcon1.GetPosition.x,TrayIcon1.GetPosition.y );
     PopupNotifier1.Show;
  end;

end;

procedure TfrmMain.checkAgenda;
var
  count: LongInt;
  qry: TZQuery;
  msg: String;
begin
  {
  count := StrToIntDef( ExecSql(dbConnect.ZConnection1,'Select count(*) From agenda Where (data_aviso = CURRENT_DATE) AND (not visualizado)'), 0);
  if count > 0 then
  begin
     qry := ExecSqlQuery(dbConnect.ZConnection1,'Select * From agenda Where (data_aviso = CURRENT_DATE) AND (not visualizado)');
     msg := '';
     while not qry.Eof do
     begin
         msg += qry.FieldByName('mensagem').AsString + #10;
         qry.Next;
     end;
     PopupNotifier1.Color:= clAzul;
     PopupNotifier1.Title:= 'Agenda ';
     PopupNotifier1.Text := 'Lembrete : ' + msg;
     PopupNotifier1.ShowAtPos(TrayIcon1.GetPosition.x,TrayIcon1.GetPosition.y );
     PopupNotifier1.Show;
     PopupNotifier1.OnClose := @PopupNotifier1Close;
  end;
  }
end;


end.


