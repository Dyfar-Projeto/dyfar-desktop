unit sistema_config;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, ZConnection, ZDataset, uEnviarEmail,
  ACBrNFe, ACBrBoleto;

type
   TConfigRecord = Record
     FileName   : String;
     DirConfig  : String;
     FileNamePath : String;
     DBNAME     : String;
     catalogo   : String;
     UserRemote : String;
     SenhaRemote: String;
     Porta      : Integer;
     DirNFe     : String;
     DirNFCe    : String;
   end;

   TPathSistema = (tpsTmp, tpsCERT, tpsXML, tpsSCHEMA, tpsXMLAnoMes, tpsPDF, tpsInutilizadas, tpsEventos, tpsImagens, tpsDados);
   TModoEmpresa = (meCodigo,meNome,meCodigoNome, meAbreviacao, meCodigoAbrev);

{NF-e}
   TStatusNFe   = (snfIniciada , snfPendente   , snfErro,
                   snfDenegada , snfAutorizada , snfContingencia,
                   snfCancelada, snfInutilizada, snfEPEC);
   StatusNFeSet = Set Of TStatusNFe;

   TTipoNFSaida = (NOTA_VENDA, NOTA_DEVOLUCAO_CLI, NOTA_DEVOLUCAO_FOR, NOTA_BONIFICACAO,
                   NOTA_TRANSFERENCIA, NOTA_COMPLEMENTAR_ICMS,NOTA_COMPLEMENTAR_VALOR,NOTA_AMOSTRA_GRATIS,
                   NOTA_CONSUMIDOR_FINAL);


function StatusNFe2Str( tmp : TStatusNFe):String;
function StatusNFe2Str( tmp : StatusNFeSet):String;
function Str2StatusNFe( tmp : String ):TStatusNFe;

function TipoNFSaida2Str( tmp : TTipoNFSaida):String;
function Str2TipoNFSaida( tmp : String ):TTipoNFSaida;
function Str2TipoNFSaidaLiteral(tmp: String):String;



function DefaultINFileName:String;

function obtemImpressoraNFCe: String;
function obtemTipoImpressao: String;

function getEmpresaPadrao( const modo : TModoEmpresa = meCodigo):String;overload;
function getEmpresaPadrao( const modo : TModoEmpresa; empresa: String):String;overload;
function getEmpresaPadraoNext(empresa:Integer):Integer;
function getApelidoVendedor( id : Integer ):String;
function saveToDiskArquivos:Boolean;

function  getSysParametro( name:String ): String;
procedure putSysParametro(name,value: String);
function  getSmtpConfig: TSMTPConfig;

const MESSAGE_CLIENTE         = 'MESSAGE_CLIENTE';
      MESSAGE_BACKUP_BD       = 'MESSAGE_BACKUP_BD';
      MESSAGE_PEDIDO_FATURADO = 'MESSAGE_PEDIDO_FATURADO';
      MESSAGE_PRODUTO         = 'MESSAGE_PRODUTO';

function  sendMenssageToSmatPhone( const vendedor: Integer; const mensagem : string;
                                  title : String = 'DyFar';
                                  classOpen : String = 'com.walg.sistema.MainActivity';
                                  vibrate : Integer = 1;
                                  sound   : Integer = 1;
                                  smallicon: String = 'ic_launch'):Boolean;
procedure sendMenssageToSmatPhoneThread( const vendedor: Integer; const mensagem : string;
                                  title : String = 'DyFar';
                                  classOpen : String = 'com.walg.sistema.MainActivity';
                                  vibrate : Integer = 1;
                                  sound   : Integer = 1;
                                  smallicon: String = 'ic_launch');




{
procedure SaveFileToServidor(localfile,remotefilename : String);
procedure GetFileFromServidor(localfile,remotefilename : String);
procedure RunShellExecute(const prog,params:string);
}
//Estoque
const  POR_LOTE_ID      = 1;
       POR_LOTE_PRODUTO = 2;
       POR_LOTE_QUANT   = 3;
       POR_LOTE_LOTE    = 4;

{Origem da movimentação do estoque}
const  OM_NOTA_SAIDA       = 'NOTA_SAIDA';
       OM_NOTA_ENTRADA     = 'NOTA_ENTRADA';
       OM_PEDIDO           = 'PEDIDO';
       OM_QUARENTENA       = 'QUARENTENA';
       OM_AVARIADOS        = 'AVARIADOS';
       OM_ESTOQUE_TEMP     = 'TEMPORARIO';
       OM_CONSIGNADO       = 'CONSIGNADO';

{Status => Notas Fiscais}
{snfIniciada, snfPendente, snfErro, snfDenegada, snfAutorizada,snfContingencia, snfCancelada, snfInutilizada, snfEPEC}
       //Notas já autorizadas
                               //4            5               8
       StatusNFeValid    = [snfAutorizada, snfContingencia, snfEPEC];
       //Notas que podem ser enviads para SEFAZ
       StatusNFeEnviavel = [snfIniciada, snfPendente, snfErro, snfContingencia];
       //Notas que não podem ser alterada mais
       StatusNFeBloqueada= [snfDenegada, snfAutorizada, snfCancelada, snfInutilizada];


procedure GerarHistoricoMovimento(const documento,produto,lote, empresa: Integer;
  const origem_mov, historico: String; const entrada, saida: Double);
procedure BaixarEstoque( lote : Integer; quantidade : Double);
procedure DevolverEstoque( lote : Integer; quantidade : Double);
function  obtemProdutoPorLote(const produto: String; const quantidade: Double):TStringList;overload;
function  obtemProdutoPorLote(const produto: Integer; const quantidade: Double):Variant;overload;
function  obtemDataFromCondicao( condicao : String;data : TDateTime; parcela : Integer = 1 ): TDatetime;


//Impostos e tributos
function getCSOSN( const crt_cliente: Integer; const cst : String):String;
function getCFOP4TipoMov( tipo_nota : Integer; uf_destino : String; cst : Integer):String;
function getvTotTrib( NCM : String; vProd : Double ): Double;
function GerarNFCeFromComanda(conn: TZConnection; Comanda: Integer; desconto: Double): Integer;
function obtemPathSistemaNFCe( tipopath: TPathSistema; data : TDateTime = 0): String;
function obtemPathSistemaNFe( tipopath: TPathSistema; data : TDateTime = 0): String;

function getCodigoMun( const uf , cidade : String): Integer;
function CalcularST( const produto,uf : String;const simplesNacional : Boolean; const valor,desconto : Double; out bcst : Double):Double;
function ClientePodeAdquirir( const cliente, produto : String):Boolean;
function CFOPVenda(const cfop : String):Boolean;
function CFOPDevolucao(const cfop: String): Boolean;
function CFOPBonificacao(const cfop: String): Boolean;


{NF-e}
function  InicializaConfigNFe( ACBrNFe : TACBrNFe; id_empresa : Integer):TZQuery;
procedure InicializaConfigNFCe( ACBrNFe : TACBrNFe; id_empresa : Integer);
function  InicializaConfigBoleto( ACBrBoleto : TACBrBoleto; boleto_cfg, empresa : Integer ):TZQuery;


Const
  arOpcoes : array[0..9] of string = ('Venda de produtos',
                                      'Importar de pedido',
                                      'Importar de venda do balcao',
                                      'Devolução de cliente',
                                      'Devolução à fornecedor',
                                      'Transferência de estoque',
                                      'NFe Complementar de ICMS',
                                      'NFe Complementar de Valor',
                                      'Carta de correção',
                                      'Bonificação/amostra gratis');
  MASK_FONE_DDD = '\(00\) 0000\-0009;0;';
  MASK_FONE     = '0000\-0009;0;';
  MASK_CEL_DDD  = '\(00\) 00000\-0009;0;';
  MASK_CEL      = '00000\-0009;0;';

  MASK_CNPJ     = '00\.000\.000\/0000\-09;0;';
  MASK_CPF      = '000\.000\.000\-09;0;';
  MASK_CEP      = '00000\-009;0;';

var ConfigRecord : TConfigRecord;

implementation

uses WagVclUtils, BDSqlUtils, uSearch, uUser, DBBlobImage, fpjson, dateutils,
  ftpsend, synautil, httpsend, synacode, blcksock, pcnConversao, udbConnect,
  usendmsgcgm, pcnConversaoNFe, ACBrDFeSSL, ACBrUtil, ACBrBoletoConversao,
  IniFiles, process, zipper, strutils, variants, FileUtil;//LazFileUtils


//function LerParamsInterno(FResourceName : String): AnsiString;
//var
//  RS: TResourceStream;
//begin
//  Result := '';
//
//  RS := TResourceStream.Create(HInstance, FResourceName, RT_RCDATA);
//  try
//    RS.Position := 0;
//    Result := ReadStrFromStream(RS, RS.Size);
//  finally
//    RS.Free;
//  end;
//end;

function StatusNFe2Str(tmp: TStatusNFe): String;
begin
  Result := IntToStr(Ord(tmp));
end;

function StatusNFe2Str( tmp: StatusNFeSet): String;
Var i : Integer;
    cl : TStatusNFe;
begin
   Result := '';
   for cl := snfIniciada to snfEPEC do begin
       if cl in tmp then begin
          Result += StatusNFe2Str(cl)+',';
       end;
   end;
   Result := Copy(Result,1, Length(Result)-1 );
end;

function Str2StatusNFe(tmp: String): TStatusNFe;
begin
   Result := TStatusNFe(StrToInt(tmp));
end;

function TipoNFSaida2Str(tmp: TTipoNFSaida): String;
begin
  Result := IntToStr(Ord(tmp));
end;

function Str2TipoNFSaida(tmp: String): TTipoNFSaida;
begin
  Result := TTipoNFSaida(StrToInt(tmp));
end;

function Str2TipoNFSaidaLiteral(tmp: String):String;
begin
  Case TTipoNFSaida(StrToInt(tmp)) of
     NOTA_VENDA         : Result := 'Venda de mercadoria';
     NOTA_DEVOLUCAO_CLI : Result := 'Devolução de cliente';
     NOTA_DEVOLUCAO_FOR : Result := 'Devolução a fornecedor';
     NOTA_BONIFICACAO   : Result := 'Bonificação';
     NOTA_TRANSFERENCIA : Result := 'Transferência de estoque';
     NOTA_COMPLEMENTAR_ICMS : Result := 'Complementar de ICMS';
     NOTA_COMPLEMENTAR_VALOR: Result := 'Complementar de Valor';
     NOTA_AMOSTRA_GRATIS : Result := 'Amostra Grátis';
  end;
end;

function VendorName: String;
begin
  Result := 'walg';
end;

function DefaultINFileName: String;
begin
  Result := ConfigRecord.DirConfig + ConfigRecord.FileName;
end;

function obtemImpressoraNFCe: String;
Var ini : TIniFile;
begin
  ini    := TIniFile.Create(DefaultINFileName);
  Result := ini.ReadString('configuracoes','edImpressoraTicket_Text','');
  ini.Free;
end;

function obtemTipoImpressao: String;
Var ini : TIniFile;
begin
  ini    := TIniFile.Create(DefaultINFileName);
  Result := ini.ReadString('configuracoes','cbxTipoImpressao_ItemIndex','1');
  ini.Free;
end;

function getEmpresaPadrao( const modo : TModoEmpresa; empresa: String): String;
begin
  case modo of
     meCodigo     : Result := empresa;
     meNome       : Result := ExecSql(dbConnect.ZConnection1,'Select simple_unaccent(nome) as nome From empresa Where id=%s',[empresa]);
     meCodigoNome : Result := ExecSql(dbConnect.ZConnection1,'Select id||''-''||simple_unaccent(nome) From empresa Where id=%s',[empresa]);
     meAbreviacao : Result := ExecSql(dbConnect.ZConnection1,'Select simple_unaccent(abreviacao) as abreviacao From empresa Where id=%s',[empresa]);
     meCodigoAbrev: Result := ExecSql(dbConnect.ZConnection1,'Select id||''-''||simple_unaccent(abreviacao) From empresa Where id=%s',[empresa]);
  end;
end;

function getEmpresaPadrao( const modo : TModoEmpresa): String;
Var ini : TIniFile;
    s   : String;
begin
  ini := TIniFile.Create(DefaultINFileName);
  s   := ini.ReadString('configuracoes','edEmpresaPadrao_Text','');
  if length(s) = 0 then exit;
  case modo of
     meCodigo     : Result := ExtractWord(1,s,['-']);
     meNome       : Result := ExtractWord(2,s,['-']);
     meCodigoNome : Result := s;
     meAbreviacao : Result := ExecSql(dbConnect.ZConnection1,'Select simple_unaccent(abreviacao) From empresa Where id=%s',[ExtractWord(1,s,['-'])]);
     meCodigoAbrev: Result := ExecSql(dbConnect.ZConnection1,'Select id||''-''||simple_unaccent(abreviacao) From empresa Where id=%s',[ExtractWord(1,s,['-'])]);
  end;
  ini.Free;
end;

function getEmpresaPadraoNext(empresa:Integer):Integer;
begin
   result := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select id From empresa Where id <> %d',[empresa]),-1);
end;

function getApelidoVendedor(id: Integer): String;
begin
  Result := ExecSql(dbConnect.ZConnection1,'Select apelido From empregados Where id=%d',[id]);
end;

procedure baixarSchemas();
Var stFile : TFileStream;
    UnZipper: TUnZipper;
begin
  stFile := TFileStream.Create(obtemPathSistemaNFe(tpsDados) + 'Schema.zip',fmCreate);
  if HttpGetBinary('http://www.walg.com.br/servicos/arquivos_comum/Schema2025.zip',stFile) then
  begin
    RenameFile(obtemPathSistemaNFe(tpsSCHEMA),obtemPathSistemaNFe(tpsDados)+'Schema.old');
    stFile.Free;
    UnZipper := TUnZipper.Create;
    try
      UnZipper.FileName   := obtemPathSistemaNFe(tpsDados) + 'Schema.zip';
      UnZipper.OutputPath := obtemPathSistemaNFe(tpsDados);
      UnZipper.Examine;
      UnZipper.UnZipAllFiles;
      StopWait();
    finally
      DeleteFile(obtemPathSistemaNFe(tpsDados) + 'Schema.zip');
      //StopWait();
      UnZipper.Free;
    end;
  end;
end;

function saveToDiskArquivos:Boolean;
Var qry : TZQuery;
    stFile : TFileStream;
    dt,dtfile : TDateTime;
    sFileName : String;
    UnZipper: TUnZipper;
begin
  Result := false;
  try
    ForceDirectories(obtemPathSistemaNFe(tpsSCHEMA));
    ForceDirectories(obtemPathSistemaNFe(tpsCERT));
    ForceDirectories(obtemPathSistemaNFe(tpsImagens));
    ForceDirectories(obtemPathSistemaNFe(tpsTmp));
    ForceDirectories(obtemPathSistemaNFe(tpsPDF));
    ForceDirectories(obtemPathSistemaNFe(tpsXML));
    ForceDirectories(obtemPathSistemaNFe(tpsXMLAnoMes,Today()));
    {Checa se os arquivos de Schema existem senão baixa}
    if FileExists( obtemPathSistemaNFe(tpsSCHEMA) + 'nfe_v4.00.xsd' ) then
    begin
      dtfile := FileDateTodateTime( FileAge( obtemPathSistemaNFe(tpsSCHEMA) + 'nfe_v4.00.xsd') );
      dt     := StrToDateTime('04/12/2025 15:49:00');
      if (dtFile < dt) then
      begin
         baixarSchemas();
      end;
    end else
    begin
      baixarSchemas();
    end;
    //if Not FilesExists(obtemPathSistemaNFe(tpsSCHEMA) + '*.xsd') then
    //begin
    //   stFile := TFileStream.Create(obtemPathSistemaNFe(tpsSCHEMA) + 'Schema.zip',fmCreate);
    //   if HttpGetBinary('http://www.walg.com.br/Schema.zip',stFile) then
    //   begin
    //     stFile.Free;
    //     UnZipper := TUnZipper.Create;
    //     try
    //       UnZipper.FileName   := obtemPathSistemaNFe(tpsSCHEMA) + 'Schema.zip';
    //       UnZipper.OutputPath := obtemPathSistemaNFe(tpsDados);
    //       UnZipper.Examine;
    //       UnZipper.UnZipAllFiles;
    //       StopWait();
    //     finally
    //       DeleteFile(obtemPathSistemaNFe(tpsSCHEMA) + 'Schema.zip');
    //       StopWait();
    //       UnZipper.Free;
    //     end;
    //   end;
    //end;
    qry := ExecSqlQuery(dbConnect.ZConnection1,'SELECT id, dh_cadastro, nome, extensao, tipo_dado, oid_documento '+
                                               'FROM gestao_documentos '+
                                               'Order by id');
    while not qry.Eof do begin
        if CompareText(qry.FieldByName('tipo_dado').AsString,'LOGO') = 0 then
        begin
           sFileName := obtemPathSistemaNFe(tpsImagens) + qry.FieldByName('nome').AsString + qry.FieldByName('extensao').AsString;
        end;
        if CompareText(qry.FieldByName('tipo_dado').AsString,'LOGO_NFE') = 0 then
        begin
           sFileName := obtemPathSistemaNFe(tpsImagens) + qry.FieldByName('nome').AsString + qry.FieldByName('extensao').AsString;
        end;
        if CompareText(qry.FieldByName('tipo_dado').AsString,'TRADUCAO') = 0 then
        begin
           sFileName := obtemPathSistemaNFe(tpsImagens) + qry.FieldByName('nome').AsString + qry.FieldByName('extensao').AsString;
        end;
        if CompareText(qry.FieldByName('tipo_dado').AsString,'CERTIFICADO') = 0 then
        begin
           sFileName := obtemPathSistemaNFe(tpsCERT) + qry.FieldByName('nome').AsString + qry.FieldByName('extensao').AsString;
        end;

        if (Length(sFileName) > 0) then begin
             if Not FileExists(sFileName) then
             begin
                ExportFileFromServer(dbConnect.ZConnection1,qry.FieldByName('oid_documento').AsInteger,sFileName);
             end else
             begin
                dt := FileDateTodateTime( FileAge( sFileName ) );
                if qry.FieldByName('dh_cadastro').AsDateTime > dt then
                begin
                   ExportFileFromServer(dbConnect.ZConnection1,qry.FieldByName('oid_documento').AsInteger,sFileName);
                end;
             end;
        end;
        qry.Next;
    end;
    qry.Free;
{
      qry := ExecSqlQuery(dbConnect.ZConnection1,'Select * from empresa',[2]);
      ForceDirectories(obtemPathSistemaNFe(tpsImagens));
      ForceDirectories(obtemPathSistemaNFe(tpsCERT));
      qryFiles := ExecSqlQuery(dbConnect.ZConnection1,'Select tipo_dado,dado,extencao,dh_atualizado FROM empresa_arquivos '+
                                                      'where tipo_dado in (''logo_nfe'',''logo'',''certificado'')',[]);
      while not qryFiles.Eof do begin
          sFileName := '';
          if qryFiles.FieldByName('tipo_dado').AsString = 'logo' then
             sFileName := obtemPathSistemaNFe(tpsImagens) + qryFiles.FieldByName('tipo_dado').AsString + qryFiles.FieldByName('extencao').AsString;
          if qryFiles.FieldByName('tipo_dado').AsString = 'logo_nfe' then
             sFileName := obtemPathSistemaNFe(tpsImagens) + qryFiles.FieldByName('tipo_dado').AsString + qryFiles.FieldByName('extencao').AsString;
          if qryFiles.FieldByName('tipo_dado').AsString = 'certificado' then begin
             sFileName := obtemPathSistemaNFe(tpsCERT) + qry.FieldByName('path_certificado').AsString;// + qryFiles.FieldByName('extencao').AsString;
          end;
          if (Length(sFileName) > 0) then begin
             if Not FileExists(sFileName) then begin
                stFile := TFileStream.Create(sFileName, fmCreate);
                mem := TMemoryStream.Create;
                mem := ExportaStreamFromDB(qryFiles,'dado');
                mem.Position:= 0;
                stFile.CopyFrom(mem, mem.Size);
                stFile.Free;
             end else
                dt := FileDateTodateTime( FileAge( sFileName ) );
                if qryFiles.FieldByName('dh_atualizado').AsDateTime > dt then begin
                   stFile := TFileStream.Create(sFileName, fmCreate);
                   mem := TMemoryStream.Create;
                   mem := ExportaStreamFromDB(qryFiles,'dado');
                   mem.Position:= 0;
                   stFile.CopyFrom(mem, mem.Size);
                   stFile.Free;
                end;
          end;
          qryFiles.Next;
      end;
}
      Result := True;
  except
    Result := false;
  end;
end;

function getSysParametro(name: String): String;
begin
  Result := ExecSql(dbConnect.ZConnection1,'Select valor From sys_parametros Where nome ilike ''%s''',[name]);
end;

procedure putSysParametro(name,value: String);
begin
  ExecSql(dbConnect.ZConnection1,'Update sys_parametros set valor=''%s'' Where nome=''%s''',[value,name]);
end;

function getSmtpConfig: TSMTPConfig;
Var qry : TZQuery;
    s : String;
begin
  Result := TSMTPConfig.Create;
  qry := ExecSqlQuery(dbConnect.ZConnection1,'Select smtphost,smtpporta,smtpusuario,smtpsenha,smtpssl,smtptls From empresa Where id=%s',[getEmpresaPadrao(meCodigo)]);
  Result.smtpserver := qry.FieldByName('smtphost').AsString;
  Result.smtpporta  := qry.FieldByName('smtpporta').AsString;
  Result.smtpusuario:= qry.FieldByName('smtpusuario').AsString;
  Result.smtpsenha  := qry.FieldByName('smtpsenha').AsString;
  Result.smtpemail  := qry.FieldByName('smtpusuario').AsString;
  s := qry.FieldByName('smtpssl').AsString;
  Result.smtpssl    := StrToBoolDef(s,False);
  s := qry.FieldByName('smtptls').AsString;
  Result.smtptls    := StrToBoolDef(s,False);
end;

procedure GerarHistoricoMovimento(const documento, produto,lote, empresa: Integer;
  const origem_mov, historico: String; const entrada, saida: Double);
begin
  try
    SetDecimalSeparator('.');
    ExecSql(dbConnect.ZConnection1,'INSERT INTO produtos_movimento(id_orig, origem_mov,'+
                                   'produto, historico, entrada, saida, usuario, empresa, produtos_estoque) '+
                                   'VALUES (%d, ''%s'', %d,''%s'', %.3f, %.3f, %d , %d, %d)',
                                   [documento, origem_mov, produto, historico, entrada, saida,
                                    UsuarioAtual.id,empresa,lote]);
  finally
    RestoreDecimalSeparator;
  end;
end;

procedure BaixarEstoque(lote: Integer; quantidade: Double);
begin
  try
    SetDecimalSeparator('.');
    ExecSql(dbConnect.ZConnection1,'Update produtos_estoque Set quantidade=quantidade-%.3f Where id=%d',[quantidade,lote]);
    if (LowerCase( getSysParametro('PERMITE_ESTOQUE_NEGATIVO') ) <> 'true') then
       ExecSql(dbConnect.ZConnection1,'Update produtos_estoque Set quantidade=0 Where quantidade < 0');
  finally
    RestoreDecimalSeparator;
  end;
end;

procedure DevolverEstoque(lote: Integer; quantidade: Double);
begin
  try
    SetDecimalSeparator('.');
    ExecSql(dbConnect.ZConnection1,'Update produtos_estoque Set quantidade=quantidade+%.3f Where id=%d',[quantidade,lote]);
    if (LowerCase( getSysParametro('PERMITE_ESTOQUE_NEGATIVO') ) <> 'true') then
       ExecSql(dbConnect.ZConnection1,'Update produtos_estoque Set quantidade=0 Where quantidade < 0');
  finally
    RestoreDecimalSeparator;
  end;
end;

{Retorna os lotes de produtos
 1° = id lote
 2° = produto
 3° = lote
 4° = quantidade
 }

function obtemProdutoPorLote(const produto: String; const quantidade: Double
  ): TStringList;
Var qry : TZQuery;
    linha : String;
    quant, qEstq : Double;
    qRest: Double;
begin
  qry   := ExecSqlQuery(dbConnect.ZConnection1,'SELECT id,produto,lote,quantidade,empresa FROM produtos_estoque '+
                                               'Where quantidade > 0 and produto=%s '+
                                               'Order by  data_validade NULLS FIRST,data_fabricacao NULLS FIRST,data_entrada NULLS FIRST',
                                               [produto]);
  quant := quantidade;
  qRest := quantidade;
  Result:= TStringList.Create;
  While not qry.Eof do begin
     qEstq := qry.FieldByName('quantidade').AsFloat;
     if qEstq = qRest then begin
        linha := Format('%d;%d;%f;%s',[qry.FieldByName('id').AsInteger,
                                       qry.FieldByName('produto').AsInteger,
                                       qRest,
                                       IfThen( Length(qry.FieldByName('lote').AsString)=0 ,QuotedStr(''),qry.FieldByName('lote').AsString)]);
        Result.Add(linha);
        Break;
     end;
     if qEstq > qRest then begin
        linha := Format('%d;%d;%f;%s',[qry.FieldByName('id').AsInteger,
                                       qry.FieldByName('produto').AsInteger,
                                       qRest,
                                       IfThen( Length(qry.FieldByName('lote').AsString)=0 ,QuotedStr(''),qry.FieldByName('lote').AsString)]);
        Result.Add(linha);
        Break;
     end;
     if qEstq < qRest then begin
        linha := Format('%d;%d;%f;%s',[qry.FieldByName('id').AsInteger,
                                       qry.FieldByName('produto').AsInteger,
                                       qEstq,
                                       IfThen( Length(qry.FieldByName('lote').AsString)=0 ,QuotedStr(''),qry.FieldByName('lote').AsString)]);
        Result.Add(linha);
        qRest -= qEstq;
     end;
     qry.Next;
  end;
end;

function obtemProdutoPorLote(const produto: Integer; const quantidade: Double):Variant;
Var linha : variant;
    qry : TZQuery;
    quant : Double;
    qRest: Double;
    i : Integer;
begin
   Result:= VarArrayCreate([0,1],varVariant);
   linha := VarArrayCreate([0,4],varVariant);
   qry   := ExecSqlQuery(dbConnect.ZConnection1,'SELECT id,produto,lote,quantidade,empresa FROM produtos_estoque '+
                                                'Where quantidade > 0 and produto=%d '+
                                                'Order by  data_validade NULLS FIRST,data_fabricacao NULLS FIRST,data_entrada NULLS FIRST',
                                                [produto]);
   quant := quantidade;
   qRest := quantidade;
   i := 0;
   While not qry.Eof do begin
      {Estoque >= que necessário}
      if qry.FieldByName('quantidade').AsFloat >= qRest then begin
         linha[0] := qry.FieldByName('id').AsInteger;
         linha[1] := qry.FieldByName('produto').AsInteger;
         linha[2] := qRest;
         linha[3] := qry.FieldByName('lote').AsString;
         Result[i]:= linha;
         Break;
      end;
      {Estoque > que necessário}
      if qry.FieldByName('quantidade').AsFloat < qRest then begin
         linha[0] := qry.FieldByName('id').AsInteger;
         linha[1] := qry.FieldByName('produto').AsInteger;
         linha[2] := qRest;
         linha[3] := qry.FieldByName('lote').AsString;
         Result[i]:= linha;
         qRest -= qry.FieldByName('quantidade').AsFloat;
         inc(i);
      end;
      qry.Next;
      if not qry.EOF then VarArrayRedim(Result,VarArrayDimCount(Result)+1);
   end;
end;

function obtemDataFromCondicao(condicao: String; data: TDateTime;
  parcela: Integer): TDatetime;
Var dias : Integer;
begin
  dias := 0;
  dias := StrtoIntDef( ExtractWord(parcela,condicao,['/']) , dias);
  Result := data + dias;
end;

function getCSOSN(const crt_cliente: Integer; const cst: String): String;
begin
{ Para consumidor final  SEM CRT
    101 - Tributada pelo Simples Nacional com permissão de crédito
    102 - Tributada pelo Simples Nacional sem permissão de crédito;
    103 - Isenção do ICMS no Simples Nacional para faixa de receita bruta;
    201 - Tributada pelo Simples Nacional com permissão de crédito e com cobrança do ICMS por substituição tributária
    202 - Tributada pelo Simples Nacional sem permissão de crédito e com cobrança do ICMS por substituição tributária
    203 - Isenção do ICMS no Simples Nacional para faixa de receita bruta e com cobrança do ICMS por substituição tributária
    300 - Imune;
    400 - Não tributada pelo Simples Nacional;
    500 - ICMS cobrado anteriormente por substituição tributária (substituído) ou por antecipação;
    900 - Outros (a critério da UF);
}
  {Emitente é simples nacional}
  if HaveValueIn(cst,['101','102','103','201','202','203','300','400','500','900']) then begin
     Result := cst;
   (* Esta regra não se aplica então, não depende do cliente *)
     if crt_cliente <= 0 then begin
       { se for Consumidor final só pode ser 102,103,300,400,500,900
         cst nao for um dos especificados então força o 102 }
         if Not HaveValueIn(cst,['102','103','300','400','500','900']) then
            Result := '102';
     end;
     exit;
  end;
  {Emitente é tributação normal}
  Result := cst;
end;

function getCFOP4TipoMov(tipo_nota: Integer; uf_destino : String; cst: Integer): String;
Var campo,s, prefix,sufix : String;
    qry : TZQuery;
begin
  //5108 para consumidor final
  Case Str2TipoNFSaida( IntToStr(tipo_nota) ) of
       NOTA_CONSUMIDOR_FINAL  : BEGIN
                                  prefix:= ifthen(uf_destino='PR','5','6');
                                  sufix := ifthen(uf_destino='PR','102','108');
                                END;
       NOTA_VENDA             : begin
                                  prefix:= ifthen(uf_destino='PR','5','6');
                                  {Simples nacional}
                                  sufix := ifthen(cst = 101,'102','102');
                                  sufix := ifthen(cst = 102,'102',sufix);
                                  sufix := ifthen(cst = 201,'405',sufix);
                                  sufix := ifthen(cst = 202,'405',sufix);
                                  sufix := ifthen(cst = 500,'405',sufix);
                                  {Tributação normal}
                                  sufix := ifthen(cst in [0,20,40,41,50,51,90] ,'102','102');
                                  sufix := ifthen(cst = 60 ,ifthen(prefix='6','404','405'),sufix);
                                  sufix := ifthen(cst in [10,70,30] ,'403',sufix);
                                end;
       NOTA_DEVOLUCAO_CLI     : begin
                                  prefix:= ifthen(uf_destino='PR','1','2');
                                  sufix := '202';
                                 end;
       NOTA_DEVOLUCAO_FOR     : begin
                                  prefix:= ifthen(uf_destino='PR','5','6');
                                  sufix := ifthen(cst = 101,'202','202');
                                  sufix := ifthen(cst = 102,'202',sufix);
                                  sufix := ifthen(cst = 201,'411',sufix);
                                  sufix := ifthen(cst = 202,'411',sufix);
                                  sufix := ifthen(cst = 500,'411',sufix);
                                  {Tributação normal}
                                  sufix := ifthen(cst in [0,20,40,41,50,51,90] ,'202','202');
                                  sufix := ifthen(cst = 60 , '411',sufix);
                                  sufix := ifthen(cst in [10,70,30] ,'411',sufix);
                                end;
       NOTA_BONIFICACAO       : begin
                                  prefix:= ifthen(uf_destino='PR','5','6');
                                  sufix := '910';
                                end;
       NOTA_TRANSFERENCIA     : begin
                                  prefix:= ifthen(uf_destino='PR','5','6');
                                  sufix := '152';
                                end;
{       NOTA_COMPLEMENTAR_ICMS : begin
                                  {Mesmo cfop da nota anterior}
                                  prefix:= ifthen(uf_destino='PR','5','6');
                                  sufix := '102';
                                end;
       NOTA_COMPLEMENTAR_VALOR: begin
                                  {Mesmo cfop da nota anterior}
                                  prefix:= ifthen(uf_destino='PR','5','6');
                                  sufix := '102';
                                end;
}
       NOTA_AMOSTRA_GRATIS    : begin
                                  prefix:= ifthen(uf_destino='PR','5','6');
                                  sufix := '911';
                                end;

   end;
   Result := prefix+'.'+sufix;
end;

function getvTotTrib(NCM: String; vProd: Double): Double;
Var nNCM : Integer;
begin
   //nNcm := StrToint(NCM);
   //ExecSql(dbConnect.ZConnection1,'Select aliqnac from ibptax Where ncm=%d',[nNcm]);
   result := StrToFloatDef(ExecSql(dbConnect.ZConnection1,'Select %f * (ib.aliqnac/100) from ibptax ib '+
                                                        'Where ib.ncm=%s::::int4',[vProd,NCM]),0);

end;

function GerarNFCeFromComanda(conn: TZConnection; Comanda: Integer; desconto: Double): Integer;
Var nfce, numero : Integer;
    qryItens, qryCli : TZQuery;
    unid, lista  : String;
    totalnota,totalproduto,totaldesconto,desc : Double;
Begin
   NFCe  := -1;
   ExecSql(conn,'Begin Work');
   try
     //snfIniciada, snfPendente, snfErro, snfDenegada, snfAutorizada, snfContingencia, snfCancelada, snfInutilizada
     //''NFCe Impressa'',''NFCe OffLine'',''NFCe Autorizada'',''NFCe Cancelada''
     lista := '3,4,5,6,7';
     lista := ExecSqlResultLista(conn,'Select numero_nf from balcao_venda b '+
                                      'left join nfce n on numero_nf=n.id '+
                                      'where b.id=%d and '+
                                      'n.status_nfe not in (%s)',
                                      [Comanda,lista],False);
     if length(lista) <= 0 then begin
        numero := StrToIntDef(ExecSql(conn,'Select max(numeroctlform)+1 From nfce'),1);
        lista  := 'DEFAULT';
     end else begin
        numero := StrToIntDef(ExecSql(conn,'Select numeroctlform from nfce Where id=%s',[lista]),1);
        ExecSql(conn,'Delete from nfce Where id in (%s)',[lista]);
     end;

     qryCli := ExecSqlQuery(conn,'SELECT id, nome, documento , concat(endereco,'','',numero) as endereco, cidade, bairro, cep, '+
                            'complemento, uf '+
                            'FROM consumidor '+
                            'Where id=(Select consumidor from balcao_venda Where id=%d)',
                            [Comanda]);

     ExecSql(conn,'INSERT INTO nfce(numeroctlform, cliente, destinatario, cnpjcpf, endereco, cidade, bairro, cep,'+
                  'complemento, uf) '+
                  'Values(%d,%d,''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'')',
                  [numero,
                   qryCli.FieldByName('id').AsInteger,
                   qryCli.FieldByName('nome').AsString,
                   qryCli.FieldByName('documento').AsString,
                   qryCli.FieldByName('endereco').AsString,
                   qryCli.FieldByName('cidade').AsString,
                   qryCli.FieldByName('bairro').AsString,
                   qryCli.FieldByName('cep').AsString,
                   qryCli.FieldByName('complemento').AsString,
                   qryCli.FieldByName('uf').AsString]);
     qryCli.Close;
     nfce := LastInsertID(conn,'nfce_id_seq');
     ExecSql(conn,'Update balcao_venda Set numero_nf=%d Where id=%d',[nfce,Comanda]);
     qryItens   := ExecSqlQuery(conn,'SELECT i.id, balcao_venda, produto, p.descricao, p.unidade, i.quantidade,'+
                                     'i.preco, p.ncm,p.origem '+
                                     'FROM balcao_venda_itens i '+
                                     'Left Join produtos p ON p.id=i.produto '+
                                     'Where i.balcao_venda=%d',
                                     [Comanda]);
     qryItens.First;
     totalnota    := 0;
     totalproduto := 0;
     totaldesconto:= 0;
     SetDecimalSeparator('.');
     while not qryItens.Eof do begin
         unid := qryItens.FieldByname('unidade').AsString;
         if length(trim(unid)) = 0 then unid := 'und';
         unid := AddCharR('.', qryItens.FieldByname('unidade').AsString,3);
         desc := qryItens.FieldByname('quantidade').AsFloat * qryItens.FieldByname('preco').AsFloat;
         desc := desc * desconto/100;

         ExecSql(conn,'Insert Into nfce_itens( nfce,produto,descricao,quantidade,preco_unit,unidade,cfop,ncm,'+
                                      'origem,vlr_desconto )'+
                                      'Values(%d,''%s'',''%.40s'',%.3f,%.2f,''%s'',''%s'',''%s'',''%s'',%.2f)',
                                      [nfce,qryItens.FieldByname('produto').AsString,
                                       qryItens.FieldByname('descricao').AsString,
                                       qryItens.FieldByname('quantidade').AsFloat,
                                       qryItens.FieldByname('preco').AsFloat,
                                       unid,
                                       '5102',
                                       qryItens.FieldByname('ncm').AsString,
                                       qryItens.FieldByname('origem').AsString,
                                       desc]);

         totalnota    := totalnota    + (qryItens.FieldByname('quantidade').AsFloat * qryItens.FieldByname('preco').AsFloat) - desc;
         totalproduto := totalproduto + qryItens.FieldByname('quantidade').AsFloat * qryItens.FieldByname('preco').AsFloat;
         totaldesconto:= totaldesconto+ desc;
         qryItens.Next;
     end;
     CloseTable(qryItens);
     ExecSql(conn,'Update nfce Set valortotalnota=%.2f,valortotalprodutos=%.2f Where id=%d',
                                  [totalnota,totalproduto,nfce]);
     Result := nfce;
     ExecSql(conn,'Commit');
     RestoreDecimalSeparator;
   except
     RestoreDecimalSeparator;
     CloseTable(qryItens);
     ExecSql(conn,'Rollback');
     Raise;
   end;
end;

function obtemPathSistemaNFCe(tipopath: TPathSistema; data: TDateTime): String;
begin
  case tipopath of
     tpsTmp      : Result := IncludeTrailingPathDelimiter(ProgramDirectory + 'Dados'+DirectorySeparator+'tmp');
     tpsCERT     : Result := IncludeTrailingPathDelimiter(ProgramDirectory + 'Dados'+DirectorySeparator+'certificado');
     tpsXML      : Result := IncludeTrailingPathDelimiter(ProgramDirectory + 'Dados'+DirectorySeparator+'NFCe'+DirectorySeparator+'xml');
     tpsSCHEMA   : Result := IncludeTrailingPathDelimiter(ProgramDirectory + 'Dados'+DirectorySeparator+'Schema');
     tpsPDF      : Result := IncludeTrailingPathDelimiter(ProgramDirectory + 'Dados'+DirectorySeparator+'PDF');
     tpsXMLAnoMes: begin
                     if data = 0 then
                        Raise Exception.Create('Uma data deve ser fornecida');
                     {$IFDEF LINUX}
                     Result := ProgramDirectory + 'Dados/NFCe/xml/'+FormatDateTime('yyyy"/"mm""mmmm"/"',data);
                     {$ELSE}
                     Result := ProgramDirectory + 'Dados\NFCe\xml\'+FormatDateTime('yyyy"\"mm""mmmm"\"',data);
                     {$ENDIF}
                   end;
     tpsInutilizadas: Result := obtemPathSistemaNFCe(tpsXMLAnoMes, data )+ 'inutilizadas'+ PathDelim;
     tpsEventos     : Result := obtemPathSistemaNFCe(tpsXMLAnoMes, data )+ 'eventos'+ PathDelim;
     tpsImagens     : Result := ProgramDirectory + 'Dados'+ PathDelim+'imagens'+ PathDelim;
     tpsDados       : Result := ProgramDirectory + 'Dados'+ PathDelim;
  end;
end;

function obtemPathSistemaNFe(tipopath: TPathSistema; data: TDateTime): String;
begin
  case tipopath of
     tpsTmp      : Result := IncludeTrailingPathDelimiter(ProgramDirectory + 'Dados'+PathDelim+'tmp');
     tpsCERT     : Result := IncludeTrailingPathDelimiter(ProgramDirectory + 'Dados'+PathDelim+'certificado');
     tpsXML      : Result := IncludeTrailingPathDelimiter(ProgramDirectory + 'Dados'+PathDelim+'NFe'+DirectorySeparator+'xml');
     tpsSCHEMA   : Result := IncludeTrailingPathDelimiter(ProgramDirectory + 'Dados'+PathDelim+'Schema');
     tpsPDF      : Result := IncludeTrailingPathDelimiter(ProgramDirectory + 'Dados'+PathDelim+'PDF');
     tpsXMLAnoMes: begin
                     if data = 0 then
                        Raise Exception.Create('Uma data deve ser fornecida');
                     {$IFDEF LINUX}
                     Result := ProgramDirectory + 'Dados/NFe/xml/'+FormatDateTime('yyyy"/"mm""mmmm"/"',data);
                     {$ELSE}
                     //if MonthOf(data) = 3 then
                     //   Result := ProgramDirectory + 'Dados\NFe\xml\'+FormatDateTime('yyyy"\"mm"marco\"',data)
                     //else
                        Result := ProgramDirectory + 'Dados\NFe\xml\'+FormatDateTime('yyyy"\"mm""mmmm"\"',data);
                     {$ENDIF}
                   end;
     tpsInutilizadas: Result := obtemPathSistemaNFe(tpsXMLAnoMes, data )+ 'inutilizadas'+ PathDelim;
     tpsEventos     : Result := obtemPathSistemaNFe(tpsXMLAnoMes, data )+ 'eventos'+ PathDelim;
     tpsImagens     : Result := ProgramDirectory + 'Dados'+ PathDelim+'imagens'+ PathDelim;
     tpsDados       : Result := ProgramDirectory + 'Dados'+ PathDelim;
  end;
end;

function getCodigoMun(const uf, cidade: String): Integer;
begin
   Result := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select ibge From municipio Where lower(trim(nome)) ilike ''%s'' and id_uf_ibge=%d',
                                  [trim(cidade),UFtoCUF(uf)]),0);
   if result = 0 then
      Raise Exception.CreateFmt('Erro: Não localizada a cidade %s no cadastro do IBGE.',[cidade]);
end;

function InicializaConfigNFe(ACBrNFe: TACBrNFe; id_empresa: Integer): TZQuery;
var qry, qCert : TZQuery;
    ok  : Boolean;
    tipoEmissao : String;
begin
  //ACBrNFe.Configuracoes.Arquivos.IniServicos := LeFileToString(obtemPathSistemaNFe(tpsImagens ) + 'ACBrNFeServicos.ini');
  qry  := ExecSqlQuery(dbConnect.ZConnection1,'Select e.* '+
                                              'FROM empresa e '+
                                              'where e.id=%d ',[id_empresa]);
  ACBrNFe.Configuracoes.WebServices.Visualizar    := False;
  ACBrNFe.Configuracoes.WebServices.Salvar        := False;

  ACBrNFe.Configuracoes.Arquivos.Salvar           := True;
  ACBrNFe.Configuracoes.Arquivos.SalvarEvento     := True;
  ACBrNFe.Configuracoes.Arquivos.SepararPorModelo := False;

  ACBrNFe.Configuracoes.Arquivos.PathSalvar := obtemPathSistemaNFe(tpsTmp );
  ACBrNFe.Configuracoes.Arquivos.PathNFe    := obtemPathSistemaNFe(tpsXMLAnoMes, Date() );
  ACBrNFe.Configuracoes.Arquivos.PathEvento := IncludeTrailingPathDelimiter(obtemPathSistemaNFe(tpsXMLAnoMes, Date() ) + 'Eventos');
  ACBrNFe.Configuracoes.Arquivos.PathInu    := IncludeTrailingPathDelimiter(obtemPathSistemaNFe(tpsXMLAnoMes, Date() ) + 'Inutilizadas');
  ACBrNFe.Configuracoes.Arquivos.PathSchemas:= obtemPathSistemaNFe(tpsSCHEMA);

  ForceDirectories(ACBrNFe.Configuracoes.Arquivos.PathSalvar);
  ForceDirectories(ACBrNFe.Configuracoes.Arquivos.PathNFe);
  ForceDirectories(ACBrNFe.Configuracoes.Arquivos.PathEvento);
  ForceDirectories(ACBrNFe.Configuracoes.Arquivos.PathInu);
  ForceDirectories(ACBrNFe.Configuracoes.Arquivos.PathSchemas);
  ForceDirectories(obtemPathSistemaNFe(tpsPDF ));
  ForceDirectories(obtemPathSistemaNFCe(tpsCERT));

  ACBrNFe.Configuracoes.Geral.VersaoDF             := ve400;//ve400;//ve310;
  ACBrNFe.Configuracoes.Geral.ModeloDF             := moNFe;
  //ACBrNFe.Configuracoes.Geral.IncluirQRCodeXMLNFCe := False;
  ACBrNFe.Configuracoes.Geral.ValidarDigest        := False;

  ////////ACBrNFe.Configuracoes.Geral.SSLCryptLib          := cryOpenSSL;//libOpenSSL libCapicom;
  ////////ACBrNFe.Configuracoes.Geral.SSLHttpLib           := httpOpenSSL;//libOpenSSL libCapicom;
  ////////ACBrNFe.Configuracoes.Geral.SSLLib               := libOpenSSL;//libOpenSSL libCapicom;
  ////////ACBrNFe.Configuracoes.Geral.SSLXmlSignLib        := xsLibXml2;//libOpenSSL libCapicom;

  ACBrNFe.Configuracoes.Geral.SSLCryptLib          := cryWinCrypt;
  ACBrNFe.Configuracoes.Geral.SSLHttpLib           := httpWinHttp;
  ACBrNFe.Configuracoes.Geral.SSLLib               := libWinCrypt;
  ACBrNFe.Configuracoes.Geral.SSLXmlSignLib        := xsLibXml2;
  ACBrNFe.SSL.SSLType := LT_TLSv1_2;//TSSLType( 5 ); //LT_TLSv1_2
  //ACBrNFe.Configuracoes.Arquivos.IniServicos     := LeFileToString('C:\lazarus\Componentes_Laz\ACBrTrunk2\trunk2\Fontes\ACBrDFe\ACBrNFe\ACBrNFeServicos.ini');
  //ACBrNFe.Configuracoes.Certificados.DadosPFX    := ReadStrFromStream(stMem, stMem.Size);
  if Not EstaVazio(qry.FieldByName('path_certificado').AsString) then
  begin
    ACBrNFe.Configuracoes.Certificados.ArquivoPFX     := obtemPathSistemaNFe(tpsCERT) + qry.FieldByName('path_certificado').AsString;
    ACBrNFe.Configuracoes.Certificados.Senha          := qry.FieldByName('senha_cert_digital').AsString;
  end else
  begin
    ACBrNFe.Configuracoes.Certificados.NumeroSerie    := qry.FieldByName('num_serie_certificado').AsString;
    ACBrNFe.Configuracoes.Certificados.Senha          := qry.FieldByName('senha_cert_digital').AsString;
  end;
  ACBrNFe.Configuracoes.Certificados.VerificarValidade:= False;

  ACBrNFe.Configuracoes.WebServices.Ambiente        := taProducao;//(taProducao,taHomologacao )
  ACBrNFe.Configuracoes.Geral.FormaEmissao          := StrToTpEmis(ok,ExecSql(dbConnect.ZConnection1,'Select regime From nfe_contingencia Order by id desc Limit 1'));
  ACBrNFe.Configuracoes.WebServices.UF              := qry.FieldByName('uf').AsString;
  if Assigned(ACBrNFe.DANFE) then
  begin
    ACBrNFe.DANFE.Logo := obtemPathSistemaNFe(tpsImagens) + ExecSql(dbConnect.ZConnection1,'Select nome||extensao From gestao_documentos Where tipo_dado=''LOGO_NFE'' Order by id Limit 1');
    ACBrNFe.DANFE.ExpandeLogoMarca:= True;
  end;

  (* Responsável Técnico *)
  if ACBrNFe.Configuracoes.WebServices.Ambiente = taProducao then
  begin
     //OE19VU0QZOIOP72WQ4JNO32GMIC4DU7SDEH6 02 Produção
     ACBrNFe.Configuracoes.RespTec.IdCSRT:= 2;
     ACBrNFe.Configuracoes.RespTec.CSRT  := 'OE19VU0QZOIOP72WQ4JNO32GMIC4DU7SDEH6';
  end else
  begin
     //YTTA3481PIMON4CJ5Z2BBEVD7K3G31FDW6BX 01 Homologação
     ACBrNFe.Configuracoes.RespTec.IdCSRT:= 1;
     ACBrNFe.Configuracoes.RespTec.CSRT  := 'YTTA3481PIMON4CJ5Z2BBEVD7K3G31FDW6BX';
  end;

  Result := qry;
end;

procedure InicializaConfigNFCe(ACBrNFe: TACBrNFe; id_empresa: Integer);
  (*procedure saveFiles(sFileCert : String);
  var qCert : TZQuery;
      stFile : TFileStream;
      mem: TMemoryStream;
  begin
    //sFileCert := obtemPathSistemaNFCe(tpsCERT) + sFileCert;
    if Not FileExists(sFileCert) then begin
       qCert := ExecSqlQuery(dbConnect.ZConnection1,'Select dado from empresa_arquivos where tipo_dado=''certificado'' Limit 1',[]);
       if  qCert.eof and qCert.Bof then exit;
       stFile:= TFileStream.Create(sFileCert, fmCreate);
        mem := TMemoryStream.Create;
        mem := ExportaStreamFromDB(qCert,'dado');
        mem.Position:= 0;
        stFile.CopyFrom(mem, mem.Size);
       stFile.Free;
    end;

    sFileCert := ProgramDirectory + 'logo_nfe.png';
    if Not FileExists(sFileCert) then begin
       qCert := ExecSqlQuery(dbConnect.ZConnection1,'Select dado from empresa_arquivos where tipo_dado=''logo_nfe'' Limit 1',[]);
       if  qCert.eof and qCert.Bof then exit;
       stFile:= TFileStream.Create(sFileCert, fmCreate);
       mem := TMemoryStream.Create;
       mem := ExportaStreamFromDB(qCert,'dado');
       mem.Position:= 0;
       stFile.CopyFrom(mem, mem.Size);
       stFile.Free;
    end;

  end;
    *)
var qry : TZQuery;
begin
  qry  := ExecSqlQuery(dbConnect.ZConnection1,'Select e.* '+
                                              'FROM empresa e '+
                                              'where e.id=%d ',[id_empresa]);
  ACBrNFe.Configuracoes.WebServices.Visualizar:= False;
  ACBrNFe.Configuracoes.WebServices.Salvar    := True;

  ACBrNFe.Configuracoes.Arquivos.Salvar       := True;
  ACBrNFe.Configuracoes.Arquivos.SalvarEvento := True;
  ACBrNFe.Configuracoes.Arquivos.SepararPorModelo := False;
  //ACBrNFe.DANFE.PathPDF                     := obtemPathSistemaNFCe(tpsPDF );

  ACBrNFe.Configuracoes.Arquivos.PathSalvar := obtemPathSistemaNFCe(tpsTmp );
  ACBrNFe.Configuracoes.Arquivos.PathNFe    := obtemPathSistemaNFCe(tpsXMLAnoMes, Date() );
  ACBrNFe.Configuracoes.Arquivos.PathEvento := IncludeTrailingPathDelimiter(obtemPathSistemaNFCe(tpsXMLAnoMes, Date() ) + 'Eventos');
  ACBrNFe.Configuracoes.Arquivos.PathInu    := IncludeTrailingPathDelimiter(obtemPathSistemaNFCe(tpsXMLAnoMes, Date() ) + 'Inutilizadas');
  ACBrNFe.Configuracoes.Arquivos.PathSchemas:= obtemPathSistemaNFCe(tpsSCHEMA);

  ForceDirectories(ACBrNFe.Configuracoes.Arquivos.PathSalvar);
  ForceDirectories(ACBrNFe.Configuracoes.Arquivos.PathNFe);
  ForceDirectories(ACBrNFe.Configuracoes.Arquivos.PathEvento);
  ForceDirectories(ACBrNFe.Configuracoes.Arquivos.PathInu);
  ForceDirectories(ACBrNFe.Configuracoes.Arquivos.PathSchemas);
  ForceDirectories(obtemPathSistemaNFCe(tpsPDF ));
  ForceDirectories(obtemPathSistemaNFCe(tpsCERT));

  ACBrNFe.Configuracoes.Geral.VersaoDF            := ve400;
  ACBrNFe.Configuracoes.Geral.ModeloDF            := moNFCe;
  //ACBrNFe.Configuracoes.Geral.IncluirQRCodeXMLNFCe:= True;
  ACBrNFe.Configuracoes.Geral.ValidarDigest       := False;
  ACBrNFe.Configuracoes.Geral.SSLCryptLib          := cryOpenSSL;//libOpenSSL libCapicom;
  ACBrNFe.Configuracoes.Geral.SSLHttpLib           := httpOpenSSL;//libOpenSSL libCapicom;
  ACBrNFe.Configuracoes.Geral.SSLLib               := libOpenSSL;//libOpenSSL libCapicom;
  ACBrNFe.Configuracoes.Geral.SSLXmlSignLib        := xsLibXml2;//libOpenSSL libCapicom;

  ACBrNFe.Configuracoes.Certificados.ArquivoPFX   := obtemPathSistemaNFCe(tpsCERT) + qry.FieldByName('path_certificado').AsString;
  ACBrNFe.Configuracoes.Certificados.Senha        := qry.FieldByName('senha_cert_digital').AsString;
  ACBrNFe.Configuracoes.Certificados.VerificarValidade:= False;
  ACBrNFe.Configuracoes.Geral.CSC                 := qry.FieldByName('csc').AsString;
  ACBrNFe.Configuracoes.Geral.IdCSC               := qry.FieldByName('id_csc').AsString;

  {Salva certificado e logo se não existir}
  //saveFiles(qry.FieldByName('path_certificado').AsString);

  ACBrNFe.Configuracoes.WebServices.Ambiente      := taProducao;//(taProducao, taHomologacao)
  ACBrNFe.Configuracoes.WebServices.UF            := qry.FieldByName('uf').AsString;
  qry.Close;
end;

function InicializaConfigBoleto(ACBrBoleto: TACBrBoleto; boleto_cfg,
  empresa: Integer):TZQuery;
Var qryBolCfg, qryEmp : TZQuery;
begin
  qryEmp   := ExecSqlQuery(dbConnect.ZConnection1,'Select * from empresa Where id=%d',[empresa]);
  qryBolCfg:= ExecSqlQuery(dbConnect.ZConnection1,'Select * from boleto_config Where id=%d',[boleto_cfg]);

  ACBrBoleto.Banco.TipoCobranca := TACBrTipoCobranca(qryBolCfg.FieldByName('banco').AsInteger);
  {CEDENTE }
  ACBrBoleto.Cedente.Agencia      := qryBolCfg.FieldByName('agencia').AsString;
  ACBrBoleto.Cedente.AgenciaDigito:= qryBolCfg.FieldByName('agencia_digito').AsString;
  ACBrBoleto.Cedente.CaracTitulo  := TACBrCaracTitulo( qryBolCfg.FieldByName('caracteristica_titulo').AsInteger );
  ACBrBoleto.Cedente.CodigoCedente:= qryBolCfg.FieldByName('codigo_cedente').AsString;
  ACBrBoleto.Cedente.CodigoTransmissao := qryBolCfg.FieldByName('codigo_transmissao').AsString;
  ACBrBoleto.Cedente.Conta        := qryBolCfg.FieldByName('numero_conta').AsString;
  ACBrBoleto.Cedente.ContaDigito  := qryBolCfg.FieldByName('numero_conta_digito').AsString;
  ACBrBoleto.Cedente.Convenio     := qryBolCfg.FieldByName('convenio').AsString;
  ACBrBoleto.Cedente.Modalidade   := qryBolCfg.FieldByName('modalidade').AsString;
  ACBrBoleto.Cedente.NumeroRes    := qryBolCfg.FieldByName('numero_res').AsString;
  ACBrBoleto.Cedente.ResponEmissao:= TACBrResponEmissao( qryBolCfg.FieldByName('emitido_por').AsInteger );
  ACBrBoleto.Cedente.TipoCarteira := TACBrTipoCarteira( qryBolCfg.FieldByName('tipo_carteira').AsInteger );
  ACBrBoleto.Cedente.TipoDocumento:= TACBrTipoDocumento( qryBolCfg.FieldByName('tipo_documento').AsInteger );
  ACBrBoleto.Cedente.TipoInscricao:= TACBrPessoa( qryBolCfg.FieldByName('tipo_inscricao').AsInteger );

  ACBrBoleto.Cedente.Nome         := qryEmp.FieldByName('nome').AsString;
  ACBrBoleto.Cedente.CNPJCPF      := qryEmp.FieldByName('cnpj').AsString;
  ACBrBoleto.Cedente.Bairro       := qryEmp.FieldByName('bairro').AsString;
  ACBrBoleto.Cedente.Cidade       := qryEmp.FieldByName('cidade').AsString;
  ACBrBoleto.Cedente.CEP          := qryEmp.FieldByName('cep').AsString;
  ACBrBoleto.Cedente.Logradouro   := qryEmp.FieldByName('logradouro').AsString;
  ACBrBoleto.Cedente.Telefone     := qryEmp.FieldByName('fone').AsString;
  ACBrBoleto.Cedente.UF           := qryEmp.FieldByName('uf').AsString;
//   ACBrBoleto.Cedente.Complemento  := qryEmp.FieldByName('complemento').AsString;
  qryEmp.Close;
  //qryBolCfg.Close;
  Result := qryBolCfg;
end;

procedure InitializationUnit;
Var SysANSIencoding : String;
begin
  //C:\Users\André
  ConfigRecord.DBNAME       := 'dyfar';
  ConfigRecord.Porta        := 0;
  ConfigRecord.DirConfig    := ApplicationDataDir('dyfar');//'C:\Users\André\AppData\Local\dyfar\';//
  ConfigRecord.DirConfig    := ACBrAnsiToUTF8(ConfigRecord.DirConfig);
  SysANSIencoding := GetSysANSIencoding;
  ForceDirectories(ConfigRecord.DirConfig);
  ConfigRecord.FileName     := 'dyfar.cfg';
  if Not DirectoryExists(ConfigRecord.DirConfig) then
  begin
    ConfigRecord.FileNamePath := 'C:\Users\Usuário\AppData\Local\dyfar\dyfar.txt';
    ConfigRecord.DirConfig    := 'C:\Users\Usuário\AppData\Local\dyfar\dyfar.cfg';
     //ConfigRecord.DirConfig := 'C:\Users\André\AppData\Local\dyfar\';
     //C:\Users\André\AppData\Local\dyfar
  end;
  ConfigRecord.FileNamePath := ConfigRecord.DirConfig + ConfigRecord.FileName;
end;

function CalcularST( const produto,uf : String;const simplesNacional : Boolean; const valor,desconto : Double; out bcst : Double):Double;
var qryICMS  : TZQuery;
    vicms, vicms_st, preco_desconto, vBCST : Double;
    Sql : String;
begin
  Result := 0.00;
  bcst   := 0.00;
  Sql    := 'SELECT id, produto, uf_destino, bc_include_ipi, bc_st_include_ipi, cst_csosn,'+
            'mod_bc, mod_bc_st, p_cred_sn, p_cred_sn_valid_until, p_icms,'+
            'p_icms_st, p_mva_st, p_red_bc, p_red_bc_st, fcp, p_red_mvs_sn,'+
            'preco_max_consumidor,'+
            '(((1+ p_mva_st/100) * (1 - p_icms/100) / (1- p_icms_st/100) -1 )*100)::::numeric(10,2) as pmvast_aj,'+
            '(((1+ (p_mva_st - (p_mva_st * p_red_mvs_sn/100))/100) * (1 - p_icms/100)/(1-p_icms_st/100) -1 )*100)::::numeric(10,2) as pmvast_ajsn '+
            'FROM produto_icms_template '+
            'Where produto=%s and Upper(uf_destino)=''%s'' ';

//  qryICMS:= ExecSqlQuery(dbConnect.ZConnection1,'Select *,(Select aliquota_sn From empresa Where id=1) as aliquota_sn from produto_icms_template Where produto=%s and Upper(uf_destino)=''%s''',[produto,UpperCase(uf)]);
  qryICMS:= ExecSqlQuery(dbConnect.ZConnection1,Sql,[produto,UpperCase(uf)]);
  if qryICMS.FieldByName('cst_csosn').AsInteger in [10,70,90,30,201,202] then begin
     preco_desconto := valor - CalculaPerc(desconto,valor);
     {Utilizar ? a aliquota do simples nacional ver com contador
     vicms          := CalculaPerc(qryICMS.FieldByName('aliquota_sn').AsCurrency,preco_desconto);
     }
     vicms          := CalculaPerc(qryICMS.FieldByName('p_icms').AsCurrency,preco_desconto);
     if qryICMS.FieldByName('preco_max_consumidor').AsFloat > 0 then begin
        vBCST := qryICMS.FieldByName('preco_max_consumidor').AsCurrency;
        vBCST := vBCST - CalculaPerc(qryICMS.FieldByName('p_red_bc_st').AsCurrency,vBCST);
     end else begin
        if simplesNacional then
           vBCST := preco_desconto + CalculaPerc(qryICMS.FieldByName('pmvast_ajsn').AsCurrency,preco_desconto)
        else
          vBCST := preco_desconto + CalculaPerc(qryICMS.FieldByName('pmvast_aj').AsCurrency,preco_desconto);
        vBCST := vBCST - CalculaPerc(qryICMS.FieldByName('p_red_bc_st').AsCurrency,vBCST);
     end;
     bcst    := vBCST;
     vicms_st:= vBCST * qryICMS.FieldByName('p_icms_st').AsCurrency/100;
     Result  := (vicms_st - vicms);
  end;
end;

function ClientePodeAdquirir(const cliente, produto: String): Boolean;
begin
  Result := False;
  Result := StrToIntDef(ExecSql(dbConnect.ZConnection1,'select count(*) from cliente_tipo_produto where cliente=%s '+
                               'and tipo_produto in ( '+
                               'select tipo_produto from produtos where id=%s)',[cliente,produto]),0) = 0;
end;

function CFOPVenda(const cfop: String): Boolean;
Var s : String;
begin
   s := DelChars(cfop,'.');
   Result := (s[2] = '1') or (s[2] = '4') or (MidStr(s,2,2) = '65');
end;

function CFOPDevolucao(const cfop: String): Boolean;
Var s : String;
begin
   s := DelChars(cfop,'.');
   Result := (s[2] = '2');
end;

function CFOPBonificacao(const cfop: String): Boolean;
Var s : String;
begin
   s := DelChars(cfop,'.');
   s :=  MidStr(s,2,2);
   Result := (s='91');
end;

procedure sendMenssageToSmatPhoneThread( const vendedor: Integer; const mensagem : string;
                                  title : String;classOpen : String;vibrate : Integer;
                                  sound   : Integer;smallicon: String);
Var SendMSGCGM : TSendMSGCGM;
begin
  SendMSGCGM := TSendMSGCGM.Create;
  SendMSGCGM.Representante:= vendedor;
  SendMSGCGM.Mensagem     := mensagem;
  SendMSGCGM.Title        := title;
  SendMSGCGM.URL          := getSysParametro('URL_MESSAGE_SMARTPHONE');
  if length(SendMSGCGM.URL) = 0 then exit;
  SendMSGCGM.Start;
end;

function sendMenssageToSmatPhone( const vendedor: Integer; const mensagem : string;
                                  title : String;
                                  classOpen : String;
                                  vibrate : Integer;
                                  sound   : Integer;
                                  smallicon: String):Boolean;
Var Response: TStringList;
    msg , url, resp    : String;
    auth    : TZQuery;
    jData   : TJSONData;
    jObject : TJSONObject;
begin
  Result   := False;
  auth     := ExecSqlQuery(dbConnect.ZConnection1,'Select id,apelido,senha From sys_usuarios Where id=(Select sys_usuario From empregados Where id=%d)',[vendedor]);
  Response := TStringList.Create;
  msg      := Format('versao=4.0.0&user=%s&senha=%s',
                    [auth.FieldByName('apelido').AsString,
                     auth.FieldByName('senha').AsString]);

  msg    += '&msg='      + EncodeURLElement(mensagem);
  msg    += '&title='    + EncodeURLElement(title);
  msg    += '&classopen='+ EncodeURLElement(classOpen);
  msg    += '&vibrate='  + IntToStr(vibrate);
  msg    += '&sound='    + IntToStr(sound);
  msg    += '&smallicon='+smallicon;
  url    := getSysParametro('URL_MESSAGE_SMARTPHONE');
  if length(url) = 0 then exit;
  URL    := url + '?acao=gcm&subacao=send&'+ msg +'';
  HttpGetText( URL ,Response);
  RESP   := Response.Text;
  //jData  := GetJSON(Response.Text);
  //jObject:= TJSONObject(jData);
  //jObject:= jObject.Get('result');
  //Result := (jObject.Get('success') = '1' );

  Result := True;
//{"sucesso":"1","falha":"0",
//"result":"{\"multicast_id\":8487806177395248969,\"success\":1,
//\"failure\":0,\"canonical_ids\":0,
//\"results\":[{\"message_id\":\"0:1478268351719645%14e03a46f9fd7ecd\"}]}"}
end;


initialization
  InitializationUnit;

end.

{
String title     = data.getString("title");
String message   = data.getString("message");
String classOpen = data.getString("classOpen");

String vibrate   = data.getString("vibrate");
String sound     = data.getString("sound");
String smallIcon = data.getString("smallIcon");

Resposta

'{"sucesso":"1","falha":"0",
"result":"{\"multicast_id\":8433588366947054779,
           \"success\":1,
           \"failure\":0,
           \"canonical_ids\":0,
           \"results\":[{\"message_id\":\"0:1477839070150430%14e03a46f9fd7ecd\"}]}"}'#13#10

}

