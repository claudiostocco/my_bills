unit providers.User;

interface

uses System.Classes, System.SysUtils, System.JSON, System.Generics.Collections, providers.Connection;

type
  TUserProvider = class(TProviderConnection)
  private
    FStatus: Integer;
    procedure SetStatus(const Value: Integer);
  public
    constructor Create(AOwnner: TComponent);
    function listAll(const AParams: TDictionary<String,String>): TJSONValue;
    property Status: Integer read FStatus write SetStatus;
  end;

implementation

{ TUserProvider }

constructor TUserProvider.Create(AOwnner: TComponent);
begin
   inherited Create(AOwnner);
end;

function TUserProvider.listAll(const AParams: TDictionary<String, String>): TJSONValue;
var param: TPair<String,String>;
begin
   try
      for param in AParams do
      begin
         WriteLn(param.Key+': '+param.Value);
      end;
      Result := SelectJSON('SELECT * FROM ENTIDADE');
      SetStatus(200);
   except on e: Exception do
   begin
      SetStatus(500);
      Result := TJSONObject.Create(TJSONPair.Create('error',e.Message));
   end; end;
end;

procedure TUserProvider.SetStatus(const Value: Integer);
begin
   FStatus := Value;
end;

end.
