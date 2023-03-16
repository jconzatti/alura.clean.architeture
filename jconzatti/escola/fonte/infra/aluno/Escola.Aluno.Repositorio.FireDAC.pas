unit Escola.Aluno.Repositorio.FireDAC;

interface

uses
   System.Generics.Collections,
   Escola.Aluno,
   Escola.CPF,
   Escola.Telefone,
   Data.DB,
   Escola.Aluno.Repositorio,
   FireDAC.Stan.Intf,
   FireDAC.Stan.Option,
   FireDAC.Stan.Error,
   FireDAC.UI.Intf,
   FireDAC.Phys.Intf,
   FireDAC.Stan.Def,
   FireDAC.Stan.Pool,
   FireDAC.Stan.Async,
   FireDAC.Phys,
   FireDAC.ConsoleUI.Wait,
   FireDAC.Comp.Client;

type
   TAlunoRepositorioFireDAC = class(TAlunoRepositorio)
   private
      FConexao : TFDConnection;
   public
      constructor Create(pConexao : TFDConnection); reintroduce;
      procedure Matricular(pAluno : TAluno); override;
      function BuscarPorCPF(pCPF : TCPF): TAluno; override;
      function ListarTodoAlunoMatriculado: TObjectList<TAluno>; override;
   end;

implementation

{ TAlunoRepositorioFireDAC }

constructor TAlunoRepositorioFireDAC.Create(pConexao: TFDConnection);
begin
   FConexao := pConexao;
end;

procedure TAlunoRepositorioFireDAC.Matricular(pAluno: TAluno);
var lSQLInsert : String;
    lTelefone: TTelefone;
begin
   inherited;
   lSQLInsert := 'INSERT INTO ALUNO(CPF, NOME, EMAIL) VALUES (:CPF, :NOME, :EMAIL)';
   FConexao.ExecSQL(lSQLInsert, [pAluno.CPF.Valor,
                                 pAluno.Nome,
                                 pAluno.Email.Valor]);
   for lTelefone in pAluno.ListaTelefone do
   begin
      lSQLInsert := 'INSERT INTO TELEFONE(DDD, NNUMERO) VALUES (:DDD, :NNUMERO)';
      FConexao.ExecSQL(lSQLInsert, [lTelefone.DDD, lTelefone.Numero]);
   end;
end;

function TAlunoRepositorioFireDAC.BuscarPorCPF(pCPF: TCPF): TAluno;
var lFDQuery : TFDQuery;
    lAlunoDado: TAlunoDado;
begin
   lFDQuery := TFDQuery.Create(nil);
   try
      lFDQuery.Connection := FConexao;
      lFDQuery.Open('SELECT NOME, EMAIL FROM ALUNO '+
                    'WHERE CPF = :CPF',
                    [pCPF.Valor]);
      if not lFDQuery.Eof then
      begin

      end;
   finally
      lFDQuery.Destroy;
   end;
end;

function TAlunoRepositorioFireDAC.ListarTodoAlunoMatriculado: TObjectList<TAluno>;
begin

end;

end.
