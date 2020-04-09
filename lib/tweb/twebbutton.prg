#include 'hbclass.ch'
#include 'common.ch'

CLASS TWebButton FROM TWebControl

	DATA cType		 				INIT 'text'
	DATA cPlaceHolder 				INIT ''
	DATA lOutline 					INIT .T.

	METHOD New() 					CONSTRUCTOR
	METHOD Activate()


ENDCLASS 

METHOD New( oParent, cId, cLabel, cAction , nGrid, cIcon, cClass, lDisabled  ) CLASS TWebButton

	DEFAULT cId TO ''
	DEFAULT cLabel TO 'Submit'
	DEFAULT cAction TO ''
	DEFAULT nGrid TO 12
	DEFAULT cIcon TO ''		// '<i class="fas fa-check"></i>'
	DEFAULT cClass TO 'btn-primary'				
	DEFAULT lDisabled TO .F.				
	
	if empty( cClass ) 
		cClass := if( ::lOutline, 'btn-outline-primary' , 'btn-primary')	
	endif
	

	::oParent 		:= oParent
	::cId			:= cId
	::nGrid			:= nGrid
	::cLabel 		:= cLabel
	::cAction		:= cAction	
	::cClass		:= cClass
	::cIcon			:= cIcon
	::lDisabled	:= lDisabled

	IF Valtype( oParent ) == 'O'	
		oParent:AddControl( SELF )		
	ENDIF

RETU SELF

METHOD Activate() CLASS TWebButton

	LOCAL cHtml := ''
	LOCAL cSize := ''
	
	DO CASE
		CASE upper(::oParent:cSizing) == 'SM' ; cSize := 'btn-sm'
		CASE upper(::oParent:cSizing) == 'LG' ; cSize := 'btn-lg'
	ENDCASE
	
	

	cHtml += '<div class="col-' + ltrim(str(::nGrid)) + IF( ::oParent:lDessign, ' tweb_dessign', '')  + '" ' + IF( ::oParent:lDessign, 'style="border:1px solid blue;"', '' ) + '>'
	cHtml += '<button type="button" class="btn ' + ::cClass + ' ' + cSize + ' " onclick="' + ::cAction + '" id="' + ::cId + '" ' + IF( ::lDisabled, 'disabled', '' ) + ' >' 
	cHtml += ::cIcon + ::cLabel
	cHtml += '</button>'
	cHtml += '</div>'	

RETU cHtml