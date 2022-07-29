unit UVersao;

interface

uses Horse, System.JSON;

const VER = '0.0.1';
      BUILD = 1;

procedure Versao(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

procedure Versao(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
   with TJSONObject.Create do
   begin
      AddPair('versao',VER);
      AddPair('build',TJSONNumber.Create(BUILD));
      Res.Send(ToJSON);
      Free;
   end;
end;

end.
