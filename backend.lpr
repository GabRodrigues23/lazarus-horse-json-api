program backend;
{$MODE DELPHI}{$H+}
uses
  {$IFDEF UNIX}{$IFDEF UseCThreads} cthreads, {$ENDIF}{$ENDIF} Horse,
  Horse.Jhonson,
  fpjson,
  SysUtils;

type
  TOnServerStart = Procedure(const Host: string; Port: word);

var
  SavedJSON: TJSONData = nil;

procedure GetUsers(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
begin
  if Assigned(SavedJSON) then
    Res.ContentType('application/json; charset=UTF-8')
       .Send(SavedJSON.AsJSON)
  else
    Res.ContentType('application/json; charset=UTF-8')
       .Status(404)
       .Send('{"message":"Nenhum JSON Recebido ainda. Use o metodo POST."}');
end;

procedure PostUser(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
  LBody: TJSONData;
begin
  FreeAndNil(SavedJSON);

  LBody := Req.Body<TJSONData>;
  SavedJSON := LBody.Clone;

  Res.ContentType('application/json; charset=UTF-8')
     .Status(201)
     .Send(SavedJSON.AsJSON);
end;

procedure StartServer(const Host: string; Port: Word; Callback: TOnServerStart);
begin
  if Assigned(Callback) then
    Callback(Host, Port);

  THorse.Listen(Port);
end;

procedure MyOnServerStart(const Host: string; Port: word);
begin
  WriteLn(Format('Server is running on %s:%d', [Host, Port]));
end;

begin
  THorse.Use(Jhonson);
  THorse.Get('/users', GetUsers);
  THorse.Post('/users', PostUser);

  StartServer('localhost', 9000, @MyOnServerStart)
end.
