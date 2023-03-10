program escola.linha.comando;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Escola.Aluno in 'Escola.Aluno.pas',
  Escola.Email in 'Escola.Email.pas',
  Escola.Email.Excecao in 'Escola.Email.Excecao.pas',
  Escola.CPF in 'Escola.CPF.pas',
  Escola.CPF.Excecao in 'Escola.CPF.Excecao.pas',
  Escola.Telefone in 'Escola.Telefone.pas',
  Escola.Telefone.Excecao in 'Escola.Telefone.Excecao.pas',
  Escola.Indicacao in 'Escola.Indicacao.pas',
  Escola.Aluno.Dado in 'Escola.Aluno.Dado.pas';

var aAluno : TAluno;
    aAlunoDado : TAlunoDado;
begin
   ReportMemoryLeaksOnShutdown := True;
   try
      aAlunoDado.Nome := 'Jhoni Conatti';
      aAlunoDado.CPF  := '066.829.429-90';
      aAlunoDado.Email:= 'jhoni.conzatti@gmail.com';
      aAluno := TAluno.Create(aAlunoDado);
   except
      on E: Exception do
         Writeln(E.ClassName, ': ', E.Message);
   end;
   Readln;
end.
