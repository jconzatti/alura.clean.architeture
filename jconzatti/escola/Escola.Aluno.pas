unit Escola.Aluno;

interface

uses
   System.Generics.Collections,
   Escola.Email,
   Escola.CPF,
   Escola.Telefone,
   Escola.Aluno.Dado;

type
   TAluno = class
   private
      FCPF: TCPF;
      FNome: String;
      FEmail: TEmail;
      FListaTelefone: TObjectList<TTelefone>;
   public
      constructor Create(pDado : TAlunoDado); reintroduce;
      destructor Destroy; override;
      procedure AdicionarTelefone(pDDD, pNumero : String);
      property CPF: TCPF read FCPF;
      property Nome: String read FNome;
      property Email: TEmail read FEmail;
//      property ListaTelefone: TObjectList<TTelefone> read FListaTelefone write FListaTelefone;
   end;

implementation

{ TAluno }

constructor TAluno.Create(pDado : TAlunoDado);
begin
   FCPF := TCPF.Create(pDado.CPF);
   FEmail := TEmail.Create(pDado.Email);
   FListaTelefone := TObjectList<TTelefone>.Create;
   FNome := pDado.Nome;
end;

destructor TAluno.Destroy;
begin
   FListaTelefone.Destroy;
   FEmail.Destroy;
   FCPF.Destroy;
   inherited;
end;

procedure TAluno.AdicionarTelefone(pDDD, pNumero: String);
begin
   FListaTelefone.Add(TTelefone.Create(pDDD, pNumero));
end;

end.
