program escola.linha.comando;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  Escola.Aluno.Dado in 'fonte\dominio\aluno\Escola.Aluno.Dado.pas',
  Escola.Aluno in 'fonte\dominio\aluno\Escola.Aluno.pas',
  Escola.CPF.Excecao in 'fonte\dominio\aluno\Escola.CPF.Excecao.pas',
  Escola.CPF in 'fonte\dominio\aluno\Escola.CPF.pas',
  Escola.Email.Excecao in 'fonte\dominio\aluno\Escola.Email.Excecao.pas',
  Escola.Email in 'fonte\dominio\aluno\Escola.Email.pas',
  Escola.Telefone.Excecao in 'fonte\dominio\aluno\Escola.Telefone.Excecao.pas',
  Escola.Telefone in 'fonte\dominio\aluno\Escola.Telefone.pas',
  Escola.Indicacao in 'fonte\dominio\indicacao\Escola.Indicacao.pas',
  Escola.Aluno.Repositorio in 'fonte\dominio\aluno\Escola.Aluno.Repositorio.pas',
  Escola.Aluno.Repositorio.FireDAC in 'fonte\infra\aluno\Escola.Aluno.Repositorio.FireDAC.pas';

var aAluno : TAluno;
    aAlunoDado : TAlunoDado;
begin
   try
      aAlunoDado.Nome := 'Jhoni Conatti';
      aAlunoDado.CPF  := '066.829.429-90';
      aAlunoDado.Email:= 'jhoni.conzatti@gmail.com';
      aAluno := TAluno.Create(aAlunoDado);
      try
         aAluno.AdicionarTelefone('47', '984577792');
         aAluno.AdicionarTelefone('47', '30355707');
      finally
         aAluno.Destroy;
      end;
   except
      on E: Exception do
         Writeln(E.ClassName, ': ', E.Message);
   end;
   Readln;
end.
