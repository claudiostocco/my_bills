unit config;

interface

//uses System.Classes;

type TConfig = class(TObject)
strict private
  class var AInstance: TConfig;
  constructor Create;
private
    FDatabaseUrl: String;
    FDatabasePassword: String;
    FDatabaseUsername: String;
    FPort: Integer;
    class function GetConfig: TConfig;
    procedure SetDatabaseUrl(const Value: String);
    procedure SetDatabasePassword(const Value: String);
    procedure SetDatabaseUsername(const Value: String);
    procedure SetPort(const Value: Integer);
public
  property Port: Integer read FPort write SetPort;
  property DatabaseUrl: String read FDatabaseUrl write SetDatabaseUrl;
  property DatabaseUsername: String read FDatabaseUsername write SetDatabaseUsername;
  property DatabasePassword: String read FDatabasePassword write SetDatabasePassword;
end;


function GetConfig: TConfig;

implementation

function GetConfig: TConfig;
begin
   Result := TConfig.GetConfig;
end;

{ TConfig }

constructor TConfig.Create;
begin
   FPort := 0;
   FDatabaseUrl := '[::1]';
   FDatabaseUsername := '';
   FDatabasePassword := '';
end;

class function TConfig.GetConfig: TConfig;
begin
   if not Assigned(AInstance) then
      AInstance := TConfig.Create;
   Result := AInstance;
end;

procedure TConfig.SetDatabasePassword(const Value: String);
begin
   FDatabasePassword := Value;
end;

procedure TConfig.SetdatabaseUrl(const Value: String);
begin
   FDatabaseUrl := Value;
end;

procedure TConfig.SetDatabaseUsername(const Value: String);
begin
   FDatabaseUsername := Value;
end;

procedure TConfig.SetPort(const Value: Integer);
begin
   FPort := Value;
end;

end.
