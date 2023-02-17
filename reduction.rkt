#lang racket

(require redex)
(require "./lang.rkt")
(provide (all-defined-out))


(define typing
  (reduction-relation 
   Typing
   
   (--> (in-hole c true)
        (in-hole c boolean))
   (--> (in-hole c false)
        (in-hole c boolean))
   (--> (in-hole c natural_1)
        (in-hole c natural))
   (--> (in-hole c (succ t))
        (in-hole c natural))
   (--> (in-hole c (pred t))
        (in-hole c natural))
   (--> (in-hole c (iszero t))
        (in-hole c boolean))
   )
  )

;(traces typing (term true))
;(traces typing (term false))
;(traces typing (term 0))
;(traces typing (term (succ 4)))
;(traces typing (term (iszero 4)))
;(traces typing (term (pred 4)))
(traces typing (term (iszero (pred 4))))

#|
- criado utilizando angular.js e apache
- criado em 2003
- foco em interface do usuário e experiência do usuário
com ele você pode executar seu aplicativo em qualquer lugar
possui um conjunto de componentes
possui tecnologia híbrida, permitindo executar o app em qualquer web
apache cordova: framework, mantido pelo apache e permite que vc utilize css, html, js
pra usar em desenvolvimento em android, conseguimos acessar as funcionalidades nativas
super navegador que roda nossa app web
capacitor: mesma coisa que o cordova, criado pela ionic, executa app pras desktop
e oferece suporte pra acessar os recursos nativos de cada plataforma
capacitor consegue criar um app e consegue usar a mesma api pra várias aplicações, ex.: acesso
a camera usa as mesmas ferramentas no android e no ios, o cordova é o contrário.
capacitor cria um projeto do zero na plataforma nativa
o cordova gera um apk a partir no nosso código ionic pra executar a aplicação, dificultando
a dbugação, encontro de erros e dá atraso no desenvolvimento
natiov: rápido e direto com app, mais rápido e mais possibilidade de integração, mas
tem alto custo de dev.
híbrido: n tem o contato direto entre o app e o sistema operacional, tem dois
intermediários entre dispositivo e aplicativo. possui uma ponte pra acessar
funções nativas (capacitor, ou cordova)
híbrido: pode ter sobrecarga, mas existe mtas apis pra acessar funções nativas e
existe computadores mais potentes. pra maioria das aplicações a diferença de
desempenho é mínima

empresas que utilizam ionic:
-nhs: médico entrar em contato com paciente e precisavam de uma solução barata e rápida e por causa
disso escolheram o ionic
-86 400: primeiro banco digital da austrália, pra atualizar o sistema constantemente
fica menos custoso e mais barato usar o ionic
shipt: subsidiária da target (supermercado) que faz o delivery do mercado. tentaram focar
na experiência do usuário (ionic tem o conjunto de componentes pra exp. do usuário)
jnesis: consultoria em ti, automação residencial, grande empecilho nesse projeot era
o tempo de execução da parada, e ai enconrtaram o ionic como solução
|#