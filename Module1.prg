/*
 * Proyecto: testcgi
 * Fichero: Module1.prg
 * Descripción:
 * Autor:
 * Fecha: 02/12/2020
 */

Function Main()

   Local nLen := Val( GetEnv("CONTENT_LENGTH") )
   Local cTemp := Space( nLen )
   Local aValor1
   Local aValor2
   Local aValor3
   Local aVars
   Local nRead
   Local cNombre
   Local cApellido
   Local cInput

   SET DATE TO BRITISH
   SET CENT ON
   SET EPOCH TO 1950
   SET( _SET_DELETED, .T. )
   SET DBFLOCKSCHEME TO 1


   // Lectura del dato enviado por javascript-Ajax
   IF ( nRead := FRead( Hb_GetStdIn(), @cTemp, nLen ) ) >= nLen

      aVars := hb_ATokens( cTemp, "&", .T., .T. )

      aValor1 := hb_ATokens( aVars[1], "=", .T., .T. )
      aValor2 := hb_ATokens( aVars[2], "=", .T., .T. )
      aValor3 := hb_ATokens( aVars[3], "=", .T., .T. )

      cNombre   := aValor1[2]
      cApellido := aValor2[2]
      cInput    := aValor3[2]

      HB_MemoWrit( "C:\Temp6\aur.txt", cTemp )

   Else
      // no hace nada
   EndIf

   OutStd( "Content-type: text/html" + hb_OSNewLine() + hb_OSNewLine() )
   OutStd( cNombre + " " + cApellido + " " + cInput )

Return Nil
