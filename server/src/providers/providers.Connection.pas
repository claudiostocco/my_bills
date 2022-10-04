unit providers.Connection;

interface

uses System.Classes, AcessoBD, Config;

type
  TProviderConnection = class(TDB)
  public
    constructor Create(AOwnner: TComponent);
  end;

implementation

{ TProviderConnection }

constructor TProviderConnection.Create(AOwnner: TComponent);
begin
   inherited Create(GetConfig.DatabaseUrl,GetConfig.DatabaseUsername,GetConfig.DatabasePassword,AOwnner);
end;

end.
