unit Escola.Aluno;

interface

uses
   System.Generics.Collections,
   Escola.Email,
   Escola.CPF,
   Escola.Telefone;

type
   TAluno = class
   private
      FCPF: TCPF;
      FNome: String;
      FEmail: TEmail;
      FListaTelefone: TObjectList<TTelefone>;
   public
      constructor Create;
      destructor Destroy; override;
      procedure AdicionarTelefone(pDDD, pNumero : String);
      property CPF: TCPF read FCPF write FCPF;
      property Nome: String read FNome write FNome;
      property Email: TEmail read FEmail write FEmail;
//      property ListaTelefone: TObjectList<TTelefone> read FListaTelefone write FListaTelefone;
   end;

implementation

{ TAluno }

constructor TAluno.Create;
begin
   FListaTelefone := TObjectList<TTelefone>.Create;
end;

destructor TAluno.Destroy;
begin
   FListaTelefone.Destroy;
   inherited;
end;

procedure TAluno.AdicionarTelefone(pDDD, pNumero: String);
begin
   FListaTelefone.Add(TTelefone.Create(pDDD, pNumero));
end;

end.
