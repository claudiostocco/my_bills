unit User;

interface

uses Horse, System.JSON;

const USERNAME = 'CLAUDIO';
      PASS = '1234';

procedure userRegistry;
procedure userGet(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

procedure userRegistry;
begin
   THorse.Get('/user',userGet);
end;

procedure userGet(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
   with TJSONObject.Create do
   begin
      AddPair('user',USERNAME);
      AddPair('pass',PASS);
      Res.Send(ToJSON);
      Free;
   end;
end;

end.
