program mybillsapi;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var sReponse: String;
    bStartServer: Boolean;

function StartServer: Boolean;
begin
   Result := True;
end;

begin
  try
     ReportMemoryLeaksOnShutdown := True;

     bStartServer := StartServer;
     {$IFNDEF HORSE_DAEMON}
     while bStartServer do
     begin
        writeln('Type exit + <enter>: To exit');
        ReadLn(sReponse);
        if sReponse.ToLower = 'exit' then Break;
     end;
     {$ENDIF}
  except on E: Exception do
     Writeln(E.ClassName, ': ', E.Message);
  end;
end.
