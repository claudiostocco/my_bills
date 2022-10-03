program mybillsapi;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Server in 'src\Server.pas',
  Constants in 'src\constants\Constants.pas',
  controllers.UVersao in 'src\controllers\controllers.UVersao.pas',
  controllers.User in 'src\controllers\controllers.User.pas',
  services.User in 'src\services\services.User.pas';

var sReponse: String;
    bStartServer: Boolean;

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
