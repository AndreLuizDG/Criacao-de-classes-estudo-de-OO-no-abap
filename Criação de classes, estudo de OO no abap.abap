*$*$ -------------------------------------------------------------- *$*$
*$*$ Autor      : André Luiz Guilhermini Junior                     *$*$
*$*$ Data       : 20/09/2023                                        *$*$
*$*$ -------------------------------------------------------------- *$*$
*$*$ Objetivo: Criar um report utilizando OO, de uma forma simples  *$*$
*$*$ Melhorias: Usar uma classe para verificar se o CHECKBOX está   *$*$
*$*$ marcado ou não.                                                *$*$
*$*$ -------------------------------------------------------------- *$*$

REPORT z_algj_01.

*$*$ -------------------------------------------------------------- *$*$
*$*$                              CLASS                             *$*$
*$*$ -------------------------------------------------------------- *$*$

* Na parte de definição, criamos classes e seus atributos.
CLASS cla_animais DEFINITION.
* Na seção publica, todos tem acesso idependente se são da mesma classe ou não
  PUBLIC SECTION.

* Atibutos da classe animais
    DATA:
      especie   TYPE string,
      comida    TYPE string,
      ataque    TYPE string,
      brinquedo TYPE string.

* Aqui estamos criandos os metodos das classe animais, aqui é importante
* importar as variaveis que serão usadas pelos metodos
    METHODS:
      fazer_barulho IMPORTING especie   TYPE string,
      correr        IMPORTING especie   TYPE string,
      come_comida   IMPORTING comida  TYPE string
                              especie TYPE string,
      atacar        IMPORTING ataque  TYPE string
                              especie TYPE string,
      brincar       IMPORTING especie TYPE string
                              brinquedo TYPE string.

* Na seção protected, somente as classes que tem acesso
  PROTECTED SECTION.
* Na seção privada, somente ela mesmo consegue ter acesso (nesse caso animais)
  PRIVATE SECTION.

ENDCLASS.

*$*$ -------------------------------------------------------------- *$*$
*$*$                       TELA DE SELEÇÃO                          *$*$
*$*$ -------------------------------------------------------------- *$*$

SELECTION-SCREEN: BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.

PARAMETERS p_especi TYPE string.
PARAMETERS p_comida TYPE string.
PARAMETERS p_ataque TYPE string.
PARAMETERS p_brinqu TYPE string.

SELECTION-SCREEN: END OF BLOCK b1.

SELECTION-SCREEN: BEGIN OF BLOCK b2 WITH FRAME TITLE text-002.

SELECTION-SCREEN: BEGIN OF LINE.
SELECTION-SCREEN COMMENT 1(10) text-b01 FOR FIELD r1.
PARAMETERS: r1 AS CHECKBOX. "Fazer barulho
SELECTION-SCREEN: END OF LINE.

SELECTION-SCREEN: BEGIN OF LINE.
SELECTION-SCREEN COMMENT 1(10) text-b02 FOR FIELD r2.
PARAMETERS: r2 AS CHECKBOX. "Correr
SELECTION-SCREEN: END OF LINE.

SELECTION-SCREEN: BEGIN OF LINE.
SELECTION-SCREEN COMMENT 1(10) text-b03 FOR FIELD r3.
PARAMETERS: r3 AS CHECKBOX. "Comer
SELECTION-SCREEN: END OF LINE.

SELECTION-SCREEN: BEGIN OF LINE.
SELECTION-SCREEN COMMENT 1(10) text-b04 FOR FIELD r4.
PARAMETERS: r4 AS CHECKBOX. "Atacar
SELECTION-SCREEN: END OF LINE.

SELECTION-SCREEN: BEGIN OF LINE.
SELECTION-SCREEN COMMENT 1(10) text-b05 FOR FIELD r5.
PARAMETERS: r5 AS CHECKBOX."Brincar
SELECTION-SCREEN: END OF LINE.

SELECTION-SCREEN: END OF BLOCK b2.


* Na implementação ele vai definir oque os metodos das classes vão fazer.
CLASS cla_animais IMPLEMENTATION.

  METHOD fazer_barulho.
    WRITE: especie, 'fez barulho, AU!! AU!!'.
  ENDMETHOD.

  METHOD correr.
    WRITE: especie, 'etá correndo,'.
  ENDMETHOD.

  METHOD come_comida.
    WRITE: especie, 'está comendo', comida.
  ENDMETHOD.

  METHOD atacar.
    WRITE: especie, 'atacou com', ataque.
  ENDMETHOD.

  METHOD brincar.
    WRITE: especie, 'está brincando com', brinquedo.
  ENDMETHOD.

ENDCLASS.


START-OF-SELECTION.

* Definindo um objeto referenciando a classe.
  DATA: cachorro TYPE REF TO cla_animais,
        gato     TYPE REF TO cla_animais.

* Criando um objeto na classe, no caso está criando cachorro ou gato da
* classe animais.
  cachorro = NEW cla_animais( ).
  gato = NEW cla_animais( ).

* Aqui estou chamando os metodos e passando o valor das veriaveis dentro
* dos parenteses.
IF r1 IS NOT INITIAL.
  cachorro->fazer_barulho( especie = p_especi ).
  NEW-LINE. "Só para pular uma linha na hora de imprimir na tela
ENDIF.

IF r2 IS NOT INITIAL.
  cachorro->correr( especie = p_especi ).
  NEW-LINE.
ENDIF.

IF r3 IS NOT INITIAL.
  cachorro->come_comida( especie = p_especi comida = p_comida ).
  NEW-LINE.
ENDIF.

IF r4 IS NOT INITIAL.
  cachorro->atacar( especie = p_especi ataque = p_ataque ).
  NEW-LINE.
ENDIF.

IF r5 IS NOT INITIAL.
  cachorro->brincar( especie = p_especi brinquedo = p_brinqu ).
  NEW-LINE.
ENDIF.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 740
