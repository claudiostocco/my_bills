unit Server;

interface

uses System.SysUtils, System.Classes, System.JSON,
     (* Horse Units *)
     Horse, Horse.CORS, Horse.Jhonson,
     (* Project Units *)
     Constants, UVersao, User;

function StartServer: Boolean;

implementation

function verifyParameters(var sPort: String): Boolean;
var i: Integer;
begin
   for i := 1 to ParamCount do
      if (ParamStr(i).ToLower = '-p') and (ParamStr(i+1).Trim <> '') then
         sPort := ParamStr(i+1)
      else if (ParamStr(i).ToLower = '-u') and (ParamStr(i+1).Trim <> '') then
         dbUrl := ParamStr(i+1)
      else if ParamStr(i).ToLower = '-service' then
      else if (ParamStr(i).ToLower = '-h') or (ParamStr(i).ToLower = '-?') then
      begin
         writeln('Usage: ');
         writeln('   -p <port>   Customize port');
         writeln('   -c <url>    Firebird database location');
         writeln('   -service    Run as deamon');
         writeln('   -?|-h Show this help');
         Result := False;
         Exit;
      end;
   Result := True;
end;

procedure verifySettingsFile;
var jSettings: TJSONValue;
    sl: TStringList;
begin
   try
      sl := TStringList.Create;
      try
         sl.LoadFromFile('./mybills.json');
      except on e: Exception do
//         TLog.LogTXT('mybills.log',e.Message);
      end;
      jSettings := TJSONObject.ParseJSONValue(sl.Text);                         //<TJSONObject>
      if (jSettings <> nil) and (jSettings is TJSONObject) and (jSettings.GetValue<TJSONValue>('banco de dados') is TJSONObject) then
      begin
         jSettings.GetValue<TJSONValue>('banco de dados').TryGetValue('endereco',dbUrl);
      end;
   finally
      try FreeAndNil(sl); except end;
      try FreeAndNil(jSettings); except end;
   end;
end;

procedure verifySettingsDB(var sPort: String);
begin
   if sPort = '' then
   begin
      sPort := '52001';
//      with TConnFactory.NewConnection do
//      begin
//         try
//            sPort := SelectSimples('SELECT FIRST 1 VALOR FROM CFG WHERE TIPO = ''SISTEMA'' AND NOME = ''PORTA''');
//         finally
//            Free;
//         end;
//      end;
   end;
end;

procedure RoutesRegistry;
begin
   THorse.Get('/versao',Versao);

   THorse.Get('/',procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
                  begin
                     Res.Send('<H1><b>MyBillsAPI</b>: API de recursos para para gerenciamento de contas pessoais.</H1>');
                  end);

   userRegistry;
end;

function StartServer: Boolean;
var sPort, sLocalLog: String;
    iPort: Integer;
begin
   WriteLn('Server starting...');
   sLocalLog := './logs';
   if not DirectoryExists(sLocalLog) then MkDir(sLocalLog);
   WriteLn('Creating Log instance...');


   WriteLn('Settings checking...');
   verifySettingsFile;
   sPort := '';
   WriteLn('Parameters checking...');
   Result := verifyParameters(sPort);
   Result := Result and (dbUrl <> '');
   if not Result then Exit;
   WriteLn('DB settings checking...');
   verifySettingsDB(sPort);
   iPort := StrToIntDef(sPort,52001);
   WriteLn('Creating Horse instance with Horse version '+THorse.Version+'...');
   THorse.Port := iPort;

//   THorse.Use(UseLogger(sLocalLog));
   THorse.Use(jhonson);
   THorse.Use(CORS);

   WriteLn('Registering routes...');
   RoutesRegistry;

   IsConsole := False;
   THorse.Listen;
   {$IFDEF CONSOLE}
      IsConsole := True;
   {$ENDIF}
   WriteLn('Listening on port '+iPort.ToString+'...');
end;

end.
