unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    btn1: TButton;
    cbb1: TComboBox;
    edt2: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure sbtbtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
 Function StrToHex(Str:String) : String;
 var i,b:integer;  m :String;
begin
 for i := 1 To Length(Str) do
 begin
 b := (Ord (Str[i]) );
 m := IntToHex(b,2) ;
 Result := Result + m;
  end;
end;
Function String_Reverse(S : String): String;
Var
   i : Integer;
Begin
   Result := '';
   For i := Length(S) DownTo 1 Do
   Begin
     Result := Result + Copy(S,i,1) ;
   End;
End;

 const
  Codes64 = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz+/';

function Encode64(S: string): string;
var
  i: Integer;
  a: Integer;
  x: Integer;
  b: Integer;
begin
  Result := '';
  a := 0;
  b := 0;
  for i := 1 to Length(s) do
  begin
    x := Ord(s[i]);
    b := b * 256 + x;
    a := a + 8;
    while a >= 6 do
    begin
      a := a - 6;
      x := b div (1 shl a);
      b := b mod (1 shl a);
      Result := Result + Codes64[x + 1];
    end;
  end;
  if a > 0 then
  begin
    x := b shl (6 - a);
    Result := Result + Codes64[x + 1];
  end;
end;

function Decode64(S: string): string;
var
  i: Integer;
  a: Integer;
  x: Integer;
  b: Integer;
begin
  Result := '';
  a := 0;
  b := 0;
  for i := 1 to Length(s) do
  begin
    x := Pos(s[i], codes64) - 1;
    if x >= 0 then
    begin
      b := b * 64 + x;
      a := a + 6;
      if a >= 8 then
      begin
        a := a - 8;
        x := b shr a;
        b := b mod (1 shl a);
        x := x mod 256;
        Result := Result + chr(x);
      end;
    end
    else
      Exit;
  end;
end;

function XorStr(Stri, Strk: String): String;
var
    Longkey: string;
    I: Integer;
    Next: char;
begin
    for I := 0 to (Length(Stri) div Length(Strk)) do
    Longkey := Longkey + Strk;
    for I := 1 to length(Stri) do
    begin
        Next := chr((ord(Stri[i]) xor ord(Longkey[i])));
        Result := Result + Next;
    end;
end;

procedure TForm1.btn1Click(Sender: TObject);

begin
  if cbb1.ItemIndex=0 then
 edt2.Text := String_Reverse(edt1.Text);
 if cbb1.ItemIndex=1 then
 edt2.Text := StrToHex(edt1.Text);
 if cbb1.ItemIndex=2 then
 edt2.Text := Encode64 (edt1.Text);
 if cbb1.ItemIndex=3 then
 edt2.Text := XorStr('The String', '1234567890');

end;

procedure TForm1.sbtbtn1Click(Sender: TObject);
begin
  if cbb1.ItemIndex=0 then
 edt1.Text := String_Reverse(edt2.Text);
   if cbb1.ItemIndex=1 then
 edt1.Text := StrToHex(edt2.Text);
 if cbb1.ItemIndex=2 then
 edt1.Text := Decode64 (edt2.Text);
 if cbb1.ItemIndex=3 then
 edt1.Text := XorStr(edt2.Text, '1234567890');
end;
end.
