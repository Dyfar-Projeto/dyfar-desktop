unit udbConnect;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LazFileUtils, RLDraftFilter, RLPDFFilter, RLPreviewForm,
  RxVersInfo, db, ZConnection, ZSqlMonitor, ZDataset, ZPgEventAlerter, Forms,
  IniPropStorage, Controls, DbCtrls, Graphics, ACBrMail, ACBrBoleto,
  ACBrBoletoFCFortesFr, RLReport;

type

  { TdbConnect }
  TMeuDBNavigator = class( TDbNavigator );


  TdbConnect = class(TDataModule)
    ACBrBoleto1: TACBrBoleto;
    ACBrBoletoFCFortes1: TACBrBoletoFCFortes;
    ACBrMail1: TACBrMail;
    ImageList1: TImageList;
    IniPropStorage1: TIniPropStorage;
    qryModulosaplicacao: TStringField;
    qryModulosdescricao: TStringField;
    qryModulosid: TLongintField;
    qryModulosmodulo: TStringField;
    qryUsuarioModulodescricao: TStringField;
    qryUsuarioModuloid: TLongintField;
    qryUsuarioModulomodulo: TLongintField;
    qryUsuarioModuloreadonly: TBooleanField;
    qryUsuarioModulousuario: TLongintField;
    RLDraftFilter1: TRLDraftFilter;
    RLPDFFilter1: TRLPDFFilter;
    RLPreviewSetup1: TRLPreviewSetup;
    RxVersionInfo1: TRxVersionInfo;
    qryUsuariosadministrador: TBooleanField;
    qryUsuariosapelido: TStringField;
    qryUsuariosid: TLongintField;
    qryUsuariosnome: TStringField;
    qryUsuariossenha: TStringField;
    qryUsuariostipo: TStringField;
    ZConnection1: TZConnection;
    ZSQLMonitor1: TZSQLMonitor;
    procedure DataModuleCreate(Sender: TObject);
    procedure RLPreviewSetup1Send(Sender: TObject);
    procedure ZPgEventAlerter1Notify(Sender: TObject; Event: string;
      ProcessID: Integer; Payload: string);
  private
    { private declarations }
  public
    { public declarations }
    report: TRLReport;
    procedure setImageForDBNavigator( dbnavigator1 : TDbNavigator );
    procedure ConfigReport(rep: TRLReport);
  end;

var
  dbConnect : TDBConnect;

implementation

{$R *.lfm}

Uses uGetPassword, uConnectCFG, uUser, Translations, Dialogs, sistema_config,
  maskutils, uEnviarEmail, BDSqlUtils, WagVclUtils;

{ TdbConnect }

procedure TdbConnect.DataModuleCreate(Sender: TObject);
Var UserServer, PassWordServer, host, dbname, filetrace : String;
    User, PassWord,prompt : String;
    Lang, FallbackLang, catalogo: string;
    l, porta : Integer;

begin
  {para traduzir menssagens e botoes p/ portugues}
  Lang := 'pt_BR';
  FallBackLang := '';

  //showMessage( ConfigRecord.DirConfig + ConfigRecord.FileName );
  {Define valores que sao boolean}
  SetLength(TrueBoolStrs,3);
  TrueBoolStrs[0] := 'True';
  TrueBoolStrs[1] := 'T';
  TrueBoolStrs[2] := '1';
  SetLength(FalseBoolStrs,3);
  FalseBoolStrs[0] := 'False';
  FalseBoolStrs[1] := 'F';
  FalseBoolStrs[2] := '0';

  ////////ShowMessage(ConfigRecord.DirConfig);
  ////////ShowMessage(ConfigRecord.FileNamePath);

  filetrace := ConfigRecord.DirConfig + ChangeFileExt(ConfigRecord.FileName,'.txt');
  //filetrace := 'C:\Users\Usuário\AppData\Local\dyfar\dyfar.txt';

  if FileExists(filetrace) and (FileSizeUtf8(filetrace) > 200000) then
     DeleteFile(filetrace);
  ZSQLMonitor1.FileName := filetrace;

  {1º execução}
  if not FileExists(ConfigRecord.DirConfig + ConfigRecord.FileName) then begin


  end;


    ////////ZSQLMonitor1.Active        := true;
  //ConfigRecord.FileNamePath := 'C:\Users\Usuário\AppData\Local\dyfar\dyfar.cfg';
  host           := ReadStringINI(ConfigRecord.FileNamePath,'conexao','host','localhost' );//  IniPropStorage1.StoredValue['host'];
  UserServer     := ReadStringINI(ConfigRecord.FileNamePath,'conexao','user',UserServer );//IniPropStorage1.ReadString('user'    ,UserServer);
  PassWordServer := ReadStringINI(ConfigRecord.FileNamePath,'conexao','password',PassWordServer );//IniPropStorage1.ReadString('password',PassWordServer);
  dbname         := ReadStringINI(ConfigRecord.FileNamePath,'conexao','dbname',ConfigRecord.DBNAME );//IniPropStorage1.ReadString('dbname'  ,ConfigRecord.DBNAME);
  catalogo       := ReadStringINI(ConfigRecord.FileNamePath,'conexao','catalogo','public' );//IniPropStorage1.ReadString('catalogo','public');
  porta          := ReadIntegerINI(ConfigRecord.FileNamePath,'conexao','porta', 0) ;//IniPropStorage1.ReadInteger('porta'  ,ConfigRecord.Porta);
  ZConnection1.Properties.Add('AutoEncodeStrings=ON');
  ZConnection1.Properties.Add('codepage=UTF8');
  ZConnection1.Properties.Add('controls_cp=CP_UTF8');
  ZConnection1.Properties.Add('timeout=30');
  ZConnection1.Properties.Add('keepalives=1');
  ZConnection1.Properties.Add('keepalives_idle=30');
  ZConnection1.Properties.Add('keepalives_interval=10');
  ZConnection1.Properties.Add('keepalives_count=3');
  ZConnection1.Properties.Add('currentSchema=%s',[catalogo]);

  ZConnection1.LibraryLocation := '';
  if not ConnectTo(ZConnection1,dbname,host, UserServer, PassWordServer, catalogo, porta) then
     Application.Terminate;
  //ZConnection1.DbcConnection.SetCatalog(catalogo);
  //ZConnection1.Catalog := catalogo;
  ExecSql(ZConnection1,'SET search_path = ''%s''',[catalogo]);
  for l := 1 to 3 do begin
    prompt := Format('Digite seu nome e senha (%d/3)',[l]);
    if not GetPassword(User, PassWord,prompt) then
       Application.Terminate;
    UsuarioAtual := obtemInfo4User(ZConnection1,User, False);
    if not CheckUser(ZConnection1,User, PassWord) then begin
       if (l >= 3) then
          Application.Terminate
       else
          Continue;
    end;
    Break;
  end;

  if User <> 'admin' then
     registraAcesso(ZConnection1, UsuarioAtual.id , ExtractFileName(Application.ExeName), ExtractShortPathName(Application.ExeName));

  {Registra variavel de sessao PostgreSQL}
  ExecSql(ZConnection1,'SET wagconfig.usuario TO ''%s''',[uUser.UsuarioAtual.userApelido]);

  SaveStringIni(ConfigRecord.FileNamePath,'conexao','host',host);//IniPropStorage1.StoredValue['host']    := host;
  SaveStringIni(ConfigRecord.FileNamePath,'conexao','user',UserServer);//IniPropStorage1.StoredValue['user']    := UserServer;
  SaveStringIni(ConfigRecord.FileNamePath,'conexao','password',PassWordServer);//IniPropStorage1.StoredValue['password']:= PassWordServer;
  SaveStringIni(ConfigRecord.FileNamePath,'conexao','dbname',dbname);//IniPropStorage1.StoredValue['dbname']  := dbname;
  SaveStringIni(ConfigRecord.FileNamePath,'conexao','catalogo',catalogo);//IniPropStorage1.StoredValue['catalogo']:= catalogo;
  SaveStringIni(ConfigRecord.FileNamePath,'conexao','porta',IntToStr(porta));//IniPropStorage1.StoredValue['porta']   := IntToStr(porta);

  //IniPropStorage1.Save;
  TranslateUnitResourceStrings('LclStrConsts',obtemPathSistemaNFe(tpsImagens) + 'lclstrconsts.pt_BR.po', Lang, FallbackLang);
  {para traduzir menssagens e botoes}
  //IniPropStorage1.Free;
  SetDefaultLocate(ZConnection1,'/',',','.');
  SetAppToServer( ZConnection1, ExtractFileNameOnly(Application.ExeName) + '('+uUser.UsuarioAtual.userApelido+')' );
  saveToDiskArquivos;

end;

procedure TdbConnect.RLPreviewSetup1Send(Sender: TObject);
Var filename,msg,s : string;
    qry : TZQuery;
begin
  qry := ExecSqlQuery(ZConnection1,'Select * from empresa Where id=%s',[getEmpresaPadrao]);
  if Length(Report.Title) <= 0 then
     filename := 'Relatorio_'
  else
     filename := Report.Title;

  filename := StringReplace(Report.Title,' ','_',[rfReplaceAll]);
  filename := GetTempDir + filename+'.pdf';
  Report.SaveToFile( filename );
  msg := #10#13;
  msg += '-------------------------'#10#13;
  msg += qry.FieldByName('nome').AsString+#10#13;
  s := FormatMaskText(MASK_FONE_DDD, qry.FieldByName('fone').AsString );
  msg += 'Fone '+s+#10#13;
  EnviarEmail( getSmtpConfig ,'','(assunto)',msg,filename );
end;

procedure TdbConnect.ZPgEventAlerter1Notify(Sender: TObject; Event: string;
  ProcessID: Integer; Payload: string);
begin
  ShowMessage(Event + Payload);
end;

procedure TdbConnect.setImageForDBNavigator( dbnavigator1 : TDbNavigator );
Var c : TBitmap;
begin
  c:=Tbitmap.Create;
  ImageList1.GetBitmap(0,c);
  TMeuDBNavigator(dbnavigator1).buttons[nbinsert].Glyph :=c;
  ImageList1.GetBitmap(1,c);
  TMeuDBNavigator(dbnavigator1).buttons[nbEdit].Glyph   :=c;
  ImageList1.GetBitmap(2,c);
  TMeuDBNavigator(dbnavigator1).buttons[nbPost].Glyph   :=c;
  ImageList1.GetBitmap(3,c);
  TMeuDBNavigator(dbnavigator1).buttons[nbCancel].Glyph :=c;
  ImageList1.GetBitmap(4,c);
  TMeuDBNavigator(dbnavigator1).buttons[nbRefresh].Glyph:=c;
  ImageList1.GetBitmap(5,c);
  TMeuDBNavigator(dbnavigator1).buttons[nbDelete].Glyph:=c;

  dbnavigator1.Hints.Clear;
  dbnavigator1.Hints.Add('Primeiro registro');
  dbnavigator1.Hints.Add('Registro anterior');
  dbnavigator1.Hints.Add('Próximo registro');
  dbnavigator1.Hints.Add('Último registro');
  dbnavigator1.Hints.Add('Inserir registro');
  dbnavigator1.Hints.Add('Excluir registro');
  dbnavigator1.Hints.Add('Editar redistro');
  dbnavigator1.Hints.Add('Gravar alterações');
  dbnavigator1.Hints.Add('Cancelar alterações');
  dbnavigator1.Hints.Add('Reler banco de dados');
end;

procedure TdbConnect.ConfigReport(rep: TRLReport);
Var SMTPConfig : TSMTPConfig;
begin
  report := rep;
  SMTPConfig := getSmtpConfig;
  ACBrMail1.Clear;
  ACBrMail1.Host    := SMTPConfig.smtpserver;
  ACBrMail1.Port    := SMTPConfig.smtpporta;
  ACBrMail1.FromName:= SMTPConfig.smtpusuario;
  ACBrMail1.From    := SMTPConfig.smtpemail;
  ACBrMail1.SetSSL  := SMTPConfig.smtpssl;
  ACBrMail1.SetTLS  := SMTPConfig.smtptls;
end;

end.

