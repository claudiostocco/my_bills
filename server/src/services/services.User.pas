unit services.User;

interface

uses System.JSON;

implementation

type
   TServiceUser = class(TObject)
   public
     function listAll(const AParams: TDictionary<String,String>)
   end;

end.
