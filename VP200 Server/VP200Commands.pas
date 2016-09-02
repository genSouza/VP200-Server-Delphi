unit VP200Commands;

// desenvolvido por genilton souza

        //alguns comandos básicos do VP200, baseado no manual do usuario
        //basicamente é uma lista de bytes que deve ser enviada para o vp200 via socket, 
        // você pode usar a notação que desejar, por exemplo: 
        // "<ESC> 0x25" no lugar de "27 37", estou utilizando a segunda forma por opção pessoal

interface

uses
 System.SysUtils, System.Variants,Generics.Collections;


function clearScreen():String;
function normalFontSize():String;
function largeFontSize():String;
function alignRightBottom():String;
function alignCenterTop():String;
function alignCenterBottom():String;
function alignCenter():String;
function enter():String;
function text(text:String):String;
implementation

function clearScreen():string;   //<ESC> 0x25
begin
Result:= Char(27)+Char(37);
end;


function normalFontSize():string; //<ESC> 0x42 0x30
begin
Result:= Char(27)+Char(66)+Char(48);
end;

function largeFontSize():string; //<ESC> 0x42 0x31 
begin
Result:= Char(27)+Char(66)+Char(49);
end;

function alignRightBottom():string; //<ESC> 0x2e 0x38
begin
Result:= Char(27)+Char(46)+Char(56);
end;

function alignCenterTop():string; // \x1b\x2e\x31
begin
  Result:=Char(27)+Char(46)+Char(49);
end;
 
function alignCenterBottom():string; // \x1b\x2e\x37
begin  
  Result:=Char(27)+Char(46)+Char(55);
end;

function alignCenter():string; // \x1b\x2e\x34
begin
Result:= Char(27)+Char(46)+Char(52);
end;

function enter():string; //0x0d
begin
Result:=Char(13);
end;

function text(text:String):string; 
begin
Result:=text+Char(03);   //0x03 necessario ser enviado no fim indicando o fim da string 
end;


end.
