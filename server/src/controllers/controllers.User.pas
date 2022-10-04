unit controllers.User;

interface

uses Horse, System.JSON, Horse.Commons;

const USERNAME = 'CLAUDIO';
      PASS = '1234';

procedure userRegistry;
procedure userGet(Req: THorseRequest; Res: THorseResponse);
procedure userPost(Req: THorseRequest; Res: THorseResponse);
procedure userPut(Req: THorseRequest; Res: THorseResponse);
procedure userDelete(Req: THorseRequest; Res: THorseResponse);

implementation

uses services.User;

procedure userRegistry;
begin
   THorse.Get('/user',userGet);
   THorse.Get('/user/:id',userGet);
   THorse.Post('/user',userGet);
   THorse.Put('/user/:id',userGet);
   THorse.Delete('/user/:id',userGet);
end;

procedure userGet(Req: THorseRequest; Res: THorseResponse);
var LService: TServiceUser;
begin
   with TServiceUser.Create(nil) do
   begin
      try
//         THTTPStatus.OK
         Res.Send<TJSONValue>(listAll(Req.Params.Dictionary)).Status(Status);
      finally
         Free;
      end;
   end;
end;

procedure userPost(Req: THorseRequest; Res: THorseResponse);
begin
   with TJSONObject.Create do
   begin
      AddPair('user',USERNAME);
      AddPair('pass',PASS);
      Res.Send(ToJSON);
      Free;
   end;
end;

procedure userPut(Req: THorseRequest; Res: THorseResponse);
begin
   with TJSONObject.Create do
   begin
      AddPair('user',USERNAME);
      AddPair('pass',PASS);
      Res.Send(ToJSON);
      Free;
   end;
end;

procedure userDelete(Req: THorseRequest; Res: THorseResponse);
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
