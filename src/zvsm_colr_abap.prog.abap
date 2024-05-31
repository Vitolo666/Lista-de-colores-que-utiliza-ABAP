*&---------------------------------------------------------------------*
*& Report ZVSM_COLR_ABAP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zvsm_colr_abap.


*&---------------------------------------------------------------------*
*& DECLARACION DE VARIABLES
*&---------------------------------------------------------------------*

DATA: i       TYPE i,
      col(15) TYPE c.

*&---------------------------------------------------------------------*
*& START-OF-SELECTION
*&---------------------------------------------------------------------*

START-OF-SELECTION.
  PERFORM imprimir.
*&---------------------------------------------------------------------*
*& Form IMPRIMIR
*&---------------------------------------------------------------------*

FORM imprimir .

  WRITE: /9 'COLOR ACTIVO', 27 'COLOR INACTIVO', 48 'INVERSE'.

  SKIP 2. " Inserta lineas en blanco.

  WHILE i < 8. " Nos brinda el formato de filas.

    CASE i. " Llena el contenido en el while.
      WHEN 0. col = 'FONDO '.      "BACKGROUP es el color de fondo.
      WHEN 1. col = 'ENCABEZADO '. "AZUL CIELO, para resaltar encabezados.
      WHEN 2. col = 'NORMAL '.     "CELESTE, Es el color normal que se utiliza en SAP.
      WHEN 3. col = 'TOTAL '.      "AMARILLO, para resaltar cantidades totales.
      WHEN 4. col = 'LLAVE '.      "AZUL, para resaltar KEY (llaves).
      WHEN 5. col = 'POSITIVO '.   "VERDE, para resaltar confirmaciones.
      WHEN 6. col = 'NEGATIVO '.   "ROJO, para resaltar errores
      WHEN 7. col = 'GRUPO '.      "NARANJA, para resaltar GROUP (grupos)
    ENDCASE.

    FORMAT INTENSIFIED COLOR = i. " Intensidad del color en el formato.

    WRITE: /(4) i, AT 7 sy-vline,
    col INTENSIFIED ON, sy-vline,
    col INTENSIFIED OFF, sy-vline,
    col INVERSE.

    i = i + 1.
  ENDWHILE.
* SY-VLINE es el carácter vertical.
* INVERSE determina si se establece el color de fondo.
* INTENSIFIED ON = Color de fondo Activo.
* INTENSIFIED OFF = Color de fondo inactivo.
ENDFORM.
