program calc_imc;

uses crt;

var answer: char;
var i: integer;
var imc, lowWeight, normalWeight, overWeight : real;

type person = record
   name : string;
   weight : integer;
   height : real;
end; 

table = array [1..100] of person;
var currentPerson : table;

function getIMC (weight, height: real): real;
begin
  getIMC := weight / (height * height) ;
end;

function getStatus (IMC: real): string;
begin
  lowWeight := 18.5;
  normalWeight := 24.99;
  overWeight := 29.99;

  if (IMC < lowWeight) then
     getStatus := 'abaixo do peso'
  else if (IMC < normalWeight) then
     getStatus := 'peso Normal'
  else if (IMC < overWeight) then
     getStatus := 'sobre peso'
  else 
     getStatus := 'obesidade';
end;


begin
    answer:= 'S';
    i:= 0;
    
    clrscr;
    writeln ('Bem vindo a calculadora de IMC!');
    writeln('Digite Sim / s para cadastrar uma pessoa');
    while (answer = 'S') or (answer = 's') or (answer = 'Sim') do
        begin
            i:= i + 1;
            writeln('Nome: ');
            readln(currentPerson[i].name);
            writeln('Peso: ');
            readln(currentPerson[i].weight);
            writeln('Altura: ');
            readln(currentPerson[i].height);

            writeln ('Deseja cadastrar uma nova pessoa? ');
            readln(answer)
        end;

        for i := 1 to i do
            begin
                writeln('Nome: ', currentPerson[i].name, ':'); 
                writeln('Peso: ', currentPerson[i].weight); 
                writeln('Altura: ', currentPerson[i].height:10:2); 
                imc := getIMC(currentPerson[i].weight, currentPerson[i].height);
                writeln('Imc: ', imc:10:2); 
                writeln('Status: ', getStatus(imc));
            end;

    readln();   
end.