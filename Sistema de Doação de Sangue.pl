% Declaração de discontiguous para permitir dispersão dos predicados
:- discontiguous podeDoar/2.
:- discontiguous podeReceber/2.

% Sangue A+
podeDoar(doador(a_positivo), receptor(a_positivo)).
podeDoar(doador(a_positivo), receptor(ab_positivo)).
podeReceber(doador(a_positivo), receptor(a_positivo)).
podeReceber(doador(a_positivo), receptor(o_positivo)).

% Sangue A-
podeDoar(doador(a_negativo), receptor(a_positivo)).
podeDoar(doador(a_negativo), receptor(a_negativo)).
podeDoar(doador(a_negativo), receptor(ab_positivo)).
podeReceber(doador(a_negativo), receptor(a_negativo)).
podeReceber(doador(a_negativo), receptor(o_negativo)).

% Sangue B+
podeDoar(doador(b_positivo), receptor(b_positivo)).
podeDoar(doador(b_positivo), receptor(ab_positivo)).
podeReceber(doador(b_positivo), receptor(b_positivo)).
podeReceber(doador(b_positivo), receptor(o_positivo)).

% Sangue B-
podeDoar(doador(b_negativo), receptor(b_positivo)).
podeDoar(doador(b_negativo), receptor(b_negativo)).
podeDoar(doador(b_negativo), receptor(ab_positivo)).
podeReceber(doador(b_negativo), receptor(b_negativo)).
podeReceber(doador(b_negativo), receptor(o_negativo)).

% Sangue AB+
podeDoar(doador(ab_positivo), receptor(ab_positivo)).
podeReceber(doador(ab_positivo), receptor(a_positivo)).
podeReceber(doador(ab_positivo), receptor(b_positivo)).
podeReceber(doador(ab_positivo), receptor(o_positivo)).

% Sangue AB-
podeDoar(doador(ab_negativo), receptor(ab_positivo)).
podeDoar(doador(ab_negativo), receptor(ab_negativo)).
podeReceber(doador(ab_negativo), receptor(a_negativo)).
podeReceber(doador(ab_negativo), receptor(b_negativo)).
podeReceber(doador(ab_negativo), receptor(o_negativo)).

% Sangue O+
podeDoar(doador(o_positivo), receptor(a_positivo)).
podeDoar(doador(o_positivo), receptor(b_positivo)).
podeDoar(doador(o_positivo), receptor(o_positivo)).
podeDoar(doador(o_positivo), receptor(ab_positivo)).
podeReceber(doador(o_positivo), receptor(o_positivo)).

% Sangue O-
podeDoar(doador(o_negativo), receptor(a_positivo)).
podeDoar(doador(o_negativo), receptor(b_positivo)).
podeDoar(doador(o_negativo), receptor(ab_positivo)).
podeDoar(doador(o_negativo), receptor(o_positivo)).
podeReceber(doador(o_negativo), receptor(o_negativo)).

% Fatos sobre a saúde dos doadores
saudavel(maria). 
saudavel(ana).  
saudavel(carlos). 

% Fatos sobre o tempo apto para doação
cumpriuTempoApto(joao). 
cumpriuTempoApto(maria).
cumpriuTempoApto(ana).
cumpriuTempoApto(carlos).

% Definição de tipos sanguíneos
tipoSanguineo(joao, a_positivo).
tipoSanguineo(maria, b_negativo).
tipoSanguineo(ana, o_negativo).
tipoSanguineo(carlos, ab_positivo).

% Regras: 

% Compatibilidade de doação
podeDoar(doador(X), receptor(Y)) :-
    saudavel(X),
    cumpriuTempoApto(X),
    tipoSanguineo(X, TipoDoador),
    tipoSanguineo(Y, TipoReceptor),
    \+(X = Y),
    podeDoar(doador(TipoDoador), receptor(TipoReceptor)).

% Compatibilidade de recebimento
podeReceber(doador(X), receptor(Y)) :-
    saudavel(Y),
    cumpriuTempoApto(Y),
    tipoSanguineo(X, TipoDoador),
    tipoSanguineo(Y, TipoReceptor),
    \+(X = Y),
    podeReceber(doador(TipoDoador), receptor(TipoReceptor)).

%Consultas

% ?- podeDoar(doador(joao), receptor(carlos)).
% ?- podeDoar(doador(ana), receptor(joao)).
% ?- podeDoar(doador(carlos), receptor(Y)).
% ?- podeDoar(doador(maria), receptor(Y)).
% ?- saudavel(maria).
% ?- saudavel(joao).
% ?- podeDoar(doador(a_positivo), receptor(Y)).