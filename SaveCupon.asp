<!--#include file="../../../../h2/asp/Common.asp"-->	
<!--#include file="../../../../h2/asp/functions.asp"-->
 
<%
dim arrAtt,creaC,xIdEntityCpn
dim Iddom,IdTab
dim IdVehiculo
dim IdPersonaPropietaria,IdUsuarioPropietaria,IdCtaEmpresa,IdUsuarioCtaEmpresa
Dim rutconcesionario
Dim login
Dim marcaGrupo,Modelo,ModeloResumen
Dim NumDocGen
dim txtRut,txtDV,Nombre,Apellidos,ApellidoMaterno,Direccionresidencia
dim txtNro,Dpto,RegionPropietario,ComunaPropietario,txtcodtel
dim Telefono,txtcodtelcom,TelefonoCentral,txtCodigoCelular,Celular
dim EMail,EstadoCivil,SexoPropietario,cboDiaNac,cboMesNac,cboAnhoNac
dim IdCupon
dim IdDomainh2,TypeEntity
dim FechaNac,FechaNacUsuario,FechaNacUsuarioEmp
dim cboDiaFac,cboMesFac,cboAnhoFac
dim cboDiaEnt,cboMesEnt,cboAnhoEnt
dim Local,NombreLocal,txtNombreVendedor,IdConcesionario,NombreConcesionario
dim FechaFac,FechaEnt
dim txtnumfact
Dim a2a2a2
Dim RangoHijos,PracticaDeportes,TiempoLibre 
Dim Motor,Color 

Dim txtRutUsuario,txtDVUsuario,NombreUsuario,ApellidosUsuario,ApellidoMaternoUsuario,DireccionresidenciaUsuario
Dim txtNroUsuario,DptoUsuario,RegionPropietarioUsuario,ComunaPropietarioUsuario,txtcodtelUsuario,TelefonoUsuario
Dim txtcodtelcomUsuario,TelefonoCentralUsuario,txtCodigoCelularUsuario,CelularUsuario,EMailUsuario,EstadoCivilUsuario
Dim SexoPropietarioUsuario,cboDiaNacUsuario,cboMesNacUsuario,cboAnhoNacUsuario

Dim txtRutUsuarioEmp,txtDVUsuarioEmp,NombreUsuarioEmp,ApellidosUsuarioEmp,ApellidoMaternoUsuarioEmp,DireccionresidenciaUsuarioEmp
Dim txtNroUsuarioEmp,DptoUsuarioEmp,RegionPropietarioUsuarioEmp,ComunaPropietarioUsuarioEmp,txtcodtelUsuarioEmp,TelefonoUsuarioEmp
Dim txtcodtelcomUsuarioEmp,TelefonoCentralUsuarioEmp,txtCodigoCelularUsuarioEmp,CelularUsuarioEmp,EMailUsuarioEmp,EstadoCivilUsuarioEmp
Dim SexoPropietarioUsuarioEmp,cboDiaNacUsuarioEmp,cboMesNacUsuarioEmp,cboAnhoNacUsuarioEmp

Dim RUTEmpresa,DVEmpresa,RazonSocialEmpresa,CalleEmpresa,NumeroEmpresa,OficinaEmpresa,Comuna2Empresa
Dim RegionEmpresa,TelefonoEmpresa,Telefono2Empresa,ContactoClienteEmpresa
Dim FonoContactoEmpresa,EmailContactoEmpresa,CelularContactoEmpresa               
Dim codTelefonoEmpresa,codTelefono2Empresa
Dim FormaPagoUsuario,SeguroUsuario
Dim FormaPagoUsuarioEmpresa,SeguroUsuarioEmpresa

'======= Leasing =======
Dim EntidadLeasing, contactoLeasing, codTelefonoLeasing, TelefonoLeasing
arrAtt = ""
creaC = "N"
Iddom = "5920740"

Dim AppDesc
codapp = request.cookies("codapp")&""
if trim(codapp)="1" then
	AppDesc="AR"
elseif trim(codapp)="2" then
	AppDesc="IT"
elseif trim(codapp)="3" then
	AppDesc="SS"
elseif trim(codapp)="4" then
	AppDesc="CH"
elseif trim(codapp)="5" then
	AppDesc="MM"
elseif trim(codapp)="10" then
	AppDesc="PE"
end if

IdTab							= request("IdTab")
rutconcesionario	= request("rutconcesionario")
marcaGrupo        = request("marcaGrupo")
Modelo          	= request("Modelo2")
ModeloResumen     = request("ModeloResumen")
IdCupon        		= request("IdCupon")
a2a2a2						= request("a2a2a2")
Motor							= request("txtNroMotor")
Color							= request("Color")
login							= request("login")

'======= Propietario Persona =======
txtRut						= request("txtRut")
txtDV							= request("txtDV")
Nombre						= request("Nombre")
Apellidos					= request("APPATERNO")
ApellidoMaterno		= request("APMATERNO")
Direccionresidencia	= request("DIRECCION")
txtNro						= request("txtNro")
Dpto							= request("CasaPisoDpto")
RegionPropietario	= request("RegionPropietario")
ComunaPropietario	= request("ComunaPropietario")
txtcodtel					= request("txtcodtel")
Telefono					= request("Telefono")

txtcodtelcom			= request("txtcodtelcom")
TelefonoCentral		= request("TelefonoCentral")
txtCodigoCelular	= request("txtCodigoCelular")
Celular						= request("Celular")
EMail							= request("EMail")
EstadoCivil				= request("EstadoCivil")
SexoPropietario		= request("SexoPropietario")
cboDiaNac					= request("cboDiaNac")
cboMesNac					= request("cboMesNac")
cboAnhoNac				= request("cboAnhoNac")
RangoHijos				= request("RangoHijos")
PracticaDeportes	= request("PracticaDeportes")
TiempoLibre				= request("TiempoLibre")

'======= Usuario Persona =======
txtRutUsuario			= request("txtRutUsuario")
txtDVUsuario			= request("txtDVUsuario")
NombreUsuario			= request("NombreUsuario")
ApellidosUsuario	= request("APPATERNOUsuario")
ApellidoMaternoUsuario			= request("APMATERNOUsuario")
DireccionresidenciaUsuario = request("DIRECCIONUsuario")
txtNroUsuario					= request("txtNroUsuario")
DptoUsuario					 	= request("CasaPisoDptoUsuario")
RegionPropietarioUsuario		= request("RegionPropietarioUsuario")
ComunaPropietarioUsuario		= request("ComunaPropietarioUsuario")
txtcodtelUsuario				= request("txtcodtelUsuario")
TelefonoUsuario					= request("TelefonoUsuario")
txtcodtelcomUsuario			= request("txtcodtelcomUsuario")
TelefonoCentralUsuario	= request("TelefonoCentralUsuario")
txtCodigoCelularUsuario	= request("txtCodigoCelularUsuario")
CelularUsuario					= request("CelularUsuario")
EMailUsuario						= request("EMailUsuario")
EstadoCivilUsuario			= request("EstadoCivilUsuario")
SexoPropietarioUsuario	= request("SexoPropietarioUsuario")
cboDiaNacUsuario				= request("cboDiaNacUsuario")
cboMesNacUsuario				= request("cboMesNacUsuario")
cboAnhoNacUsuario				= request("cboAnhoNacUsuario")

'======= Usuario Empresa =======
txtRutUsuarioEmp				= request("txtRutUsuarioEmp")
txtDVUsuarioEmp					= request("txtDVUsuarioEmp")
NombreUsuarioEmp				= request("NombreUsuarioEmp")
ApellidosUsuarioEmp				= request("APPATERNOUsuarioEmp")
ApellidoMaternoUsuarioEmp		= request("APMATERNOUsuarioEmp")
DireccionresidenciaUsuarioEmp	= request("DIRECCIONUsuarioEmp")
txtNroUsuarioEmp				= request("txtNroUsuarioEmp")
DptoUsuarioEmp					= request("CasaPisoDptoUsuarioEmp")
RegionPropietarioUsuarioEmp		= request("RegionPropietarioUsuarioEmp")
ComunaPropietarioUsuarioEmp		= request("ComunaPropietarioUsuarioEmp")
txtcodtelUsuarioEmp				= request("txtcodtelUsuarioEmp")
TelefonoUsuarioEmp				= request("TelefonoUsuarioEmp")
txtcodtelcomUsuarioEmp		= request("txtcodtelcomUsuarioEmp")
TelefonoCentralUsuarioEmp	= request("TelefonoCentralUsuarioEmp")
txtCodigoCelularUsuarioEmp= request("txtCodigoCelularUsuarioEmp")
CelularUsuarioEmp					= request("CelularUsuarioEmp")
EMailUsuarioEmp						= request("EMailUsuarioEmp")
EstadoCivilUsuarioEmp			= request("EstadoCivilUsuarioEmp")
SexoPropietarioUsuarioEmp	= request("SexoPropietarioUsuarioEmp")
cboDiaNacUsuarioEmp				= request("cboDiaNacUsuarioEmp")
cboMesNacUsuarioEmp				= request("cboMesNacUsuarioEmp")
cboAnhoNacUsuarioEmp			= request("cboAnhoNacUsuarioEmp")

RUTEmpresa					 			= request("RUTEmpresa")
DVEmpresa									= request("DVEmpresa")
RazonSocialEmpresa				= request("NombreEmpresa")
CalleEmpresa							= request("DireccionEmpresa")
NumeroEmpresa							= request("txtnroEmpresa")
OficinaEmpresa						= request("CasaPisoDptoEmpresa")
Comuna2Empresa						= request("Comuna2Empresa")
RegionEmpresa							= request("RegionEmpresa")
codTelefonoEmpresa				= request("codTelefonoEmpresa")
TelefonoEmpresa						= request("TelefonoEmpresa")
codTelefono2Empresa				= request("codTelefono2Empresa")
Telefono2Empresa					= request("TelefonoCentralEmpresa")
ContactoClienteEmpresa		= request("APPATERNOEmpresa")
FonoContactoEmpresa				= request("FonoContactoEmpresa")
EmailContactoEmpresa			= request("EMailEmpresa")
CelularContactoEmpresa		= request("CelularEmpresa")
FormaPagoUsuario					= request("FormaPagoUsuario")
SeguroUsuario							= request("SeguroUsuario")
FormaPagoUsuarioEmpresa		= request("FormaPagoUsuarioEmpresa")
SeguroUsuarioEmpresa			= request("SeguroUsuarioEmpresa")
cboDiaFac									= request("cboDiaFac")
cboMesFac									= request("cboMesFac")
cboAnhoFac								= request("cboAnhoFac")
cboDiaEnt									= request("cboDiaEnt")
cboMesEnt									= request("cboMesEnt")
cboAnhoEnt								= request("cboAnhoEnt")

Local											= request("Local")
txtNombreVendedor					= request("txtNombreVendedor")
txtnumfact								=	request("txtnumfact")

'======= Leasing =======
EntidadLeasing          	= request("EntidadLeasing")
contactoLeasing         	= request("contactoLeasing")
codTelefonoLeasing      	= request("codTelefonoLeasing")    
TelefonoLeasing         	= request("TelefonoLeasing")
NombreConcesionario				= request("NombreConcesionario")
NombreLocal				    		= request("txt_LocalConc")

if trim(request("LocalConc"))<>"" then
	Local = h2res.attribute_answer_get(trim(request("LocalConc")),108514,Iddom)
	if trim(Local)<>"" then
			IdConcesionario = h2res.attribute_answer_get(Local,108514,Iddom)
	end if
end if

if trim(IdConcesionario)="" then
	On Error resume Next
	IdConcesionario = GetIdConcesionario(rutconcesionario)
end if

if trim(cboDiaNac)<>"" and trim(cboMesNac)<>"" and trim(cboAnhoNac)<>"" then
	FechaNac = trim(cboAnhoNac) & "-" & trim(cboMesNac) & "-" & trim(cboDiaNac) & " 00:00:00"
end if
if trim(cboDiaNacUsuario)<>"" and trim(cboMesNacUsuario)<>"" and trim(cboAnhoNacUsuario)<>"" then
	FechaNacUsuario = trim(cboAnhoNacUsuario) & "-" & trim(cboMesNacUsuario) & "-" & trim(cboDiaNacUsuario) & " 00:00:00"
end if
if trim(cboDiaNacUsuarioEmp)<>"" and trim(cboMesNacUsuarioEmp)<>"" and trim(cboAnhoNacUsuarioEmp)<>"" then
	FechaNacUsuarioEmp = trim(cboAnhoNacUsuarioEmp) & "-" & trim(cboMesNacUsuarioEmp) & "-" & trim(cboDiaNacUsuarioEmp) & " 00:00:00"
end if
if trim(cboDiaFac)<>"" and trim(cboMesFac)<>"" and trim(cboAnhoFac)<>"" then
	FechaFac = trim(cboAnhoFac) & "-" & trim(cboMesFac) & "-" & trim(cboDiaFac) & " 00:00:00"
end if
if trim(cboDiaEnt)<>"" and trim(cboMesEnt)<>"" and trim(cboAnhoEnt)<>"" then
	FechaEnt = trim(cboAnhoEnt) & "-" & trim(cboMesEnt) & "-" & trim(cboDiaEnt) & " 00:00:00"
end if

Patente							= request("Patente")
IdVehiculo						= request("IdVehiculo")
IdPersonaPropietaria        	= request("IdPersonaPropietaria")
IdUsuarioPropietaria        	= request("IdUsuarioPropietaria")
IdCtaEmpresa					= request("IdCtaEmpresa")
IdUsuarioCtaEmpresa	        	= request("IdUsuarioCtaEmpresa")


dim NumCupones
NumCupones = "0"
if trim(IdCupon)="" then
	if trim(IdVehiculo)<>"" then
		NumCupones = CounEvento(IdVehiculo)
		if trim(NumCupones)<>"0" then
			response.write("VENTA YA SE ENCUENTRA REGISTRADA ANTERIORMENTE.")
			h2_dbclose() 
			response.end
		end if
	end if	
end if		

if trim(IdTab)="1" then 'Para Propietario Persona
		'////////Propietario Persona///////////////////////////
		if trim(IdPersonaPropietaria)="" then 			
			call CreateContactoPersona()			
		else
			call UpdateContactoPersona(IdPersonaPropietaria)
		end if				
		'////////Propietario Persona///////////////////////////	
		'////////Usuario Persona///////////////////////////
		if trim(txtRut)<>trim(txtRutUsuario) then
		  if trim(IdUsuarioPropietaria)="" then				
				call CreateUsuarioPersona()
			else				
				call UpdateUsuarioPersona(IdUsuarioPropietaria)
			end if
		else
				IdUsuarioPropietaria = IdPersonaPropietaria
		end if
		'////////Usuario Persona///////////////////////////		
end if

if trim(IdTab)="2" then 
	if trim(IdCtaEmpresa)="" then 		
		call CreateCuenta()
	else		
		call UpdateCuenta(IdCtaEmpresa)
	end if	
	if trim(IdUsuarioCtaEmpresa)="" then 'Se crea el user de la cuenta		
		call CreateUsuarioEmpresa()
	else			
		call UpdateUsuarioEmpresa(IdUsuarioCtaEmpresa)
	end if
end if		

if trim(IdTab)="3" then 'Para Leasing Banco
	if trim(IdCtaEmpresa)="" then 'Se crea la cuenta
			call CreateCuenta()
	else	'Se actualiza la cuenta
			call UpdateCuenta(IdCtaEmpresa)
	end if	
	if trim(IdUsuarioCtaEmpresa)="" then 'Se crea el user de la cuenta
			call CreateUsuarioEmpresa()
	else	'Se actualiza la cuenta
			call UpdateUsuarioEmpresa(IdUsuarioCtaEmpresa)
	end if
end if		


'/////////Actualiza Vehículo
call UpdateVehiculo(IdVehiculo)
'/////////Actualiza Vehículo


'/////////Se crea el Cupón/////////
if trim(IdCupon)="" then
	CreateCupon()
end if
'/////////Se crea el Cupón/////////

if trim(IdTab)="1" then
	UpdateUsuarioPersonaCupon(IdCupon)
else
	UpdateUsuarioEmpresaCupon(IdCupon)	
end if


'////////////// SACAR LA CAGA QUE TIEN MUGUEL
'////////////// SACAR LA CAGA QUE TIEN MUGUEL
'////////////// SACAR LA CAGA QUE TIEN MUGUEL
'////////////// SACAR LA CAGA QUE TIEN MUGUEL
'////////////// SACAR LA CAGA QUE TIEN MUGUEL
'////////////// SACAR LA CAGA QUE TIEN MUGUEL

' VEHICULO **********************************
' VEHICULO **********************************

'////////////// SACAR LA CAGA QUE TIEN MUGUEL
'////////////// SACAR LA CAGA QUE TIEN MUGUEL
'////////////// SACAR LA CAGA QUE TIEN MUGUEL
'////////////// SACAR LA CAGA QUE TIEN MUGUEL
'////////////// SACAR LA CAGA QUE TIEN MUGUEL
'////////////// SACAR LA CAGA QUE TIEN MUGUEL

'''''''''''''''''''''comentadas reglas humano2
dim strListAttribs
dim retarr
IdDomainh2 = "5920740"
TypeEntity = 1817934
'if trim(IdCupon)="1" then
		'Calcula Atributos Autómaticos
'		retarr = h2res.attribute_automatico(IdCupon, IdDomainh2, TypeEntity, "creacion", ,True)
'		if isarray(retarr) then 
'			if retarr(0,0) <> "-1" and retarr(0,0) <> "" then 
'				strListAttribs  = strListAttribs  & retarr(0,0) & "," 
'			end if
'		end if

		'Aplica reglas del modulo
'	 	retarr = h2res.attribute_rules(IdDomainh2, TypeEntity, IdCupon, "creacion")
'		if isarray(retarr) then 
'			if retarr(0,0) <> "-1" and retarr(0,0) <> "" then 
'				strListAttribs  = strListAttribs & retarr(0,0) & "," 
'			end if
'		end if
		
		'Aplica reglas tipo 2
'		retarr = h2res.attribute_Newrules(IdDomainh2, TypeEntity, IdCupon, , ,54458)
'	    If IsArray(retarr) Then
'	        If retarr(0, 0) <> "-1" And retarr(0, 0) <> "^" Then
'	            arr1 = Split(retarr(0, 0), "^")
'	            strListAttribs = strListAttribs & arr1(0) & ","
'	        End If
'	    End If
'end if
'''''''''''''''''''''comentadas reglas humano2

'Estado Cupon Activo
if trim(IdCupon)<>"" then Call h2res.attribute_answer(1,108626,IdCupon,Iddom,"117609")


sub CreateContactoPersona()
	dim IdContacto
	IdContacto = salesh2.user_create(Iddom, Iddom, "1817935", "6179738")
  	If IdContacto = "-1" then
	   	Response.Write ("Error al crear Contacto.")
  	Else
  		IdPersonaPropietaria = IdContacto
		call h2res.attribute_answer(1, 1026, IdContacto, Iddom,h2res.get_fechaSQL("", "", 20, 1))
		call h2res.attribute_answer(1, 1027, IdContacto, Iddom,h2res.get_fechaSQL("", "", 20, 1))
		call h2res.attribute_answer(1, 1028, IdContacto, Iddom,"6179738")
		'Tipo Contacto
		Call h2res.attribute_answer(1,108604,IdContacto,Iddom,117571)
		'Rut
		if trim(txtRut)<>"" then Call h2res.attribute_answer(1,108551,IdContacto,Iddom,txtRut)
		'Nombre
		if trim(Nombre)<>"" then Call h2res.attribute_answer(1,108566,IdContacto,Iddom,Nombre)
		'Apellidos
		if trim(Apellidos)<>"" then Call h2res.attribute_answer(1,108567,IdContacto,Iddom,Apellidos)
		'ApellidoMaterno
		if trim(ApellidoMaterno)<>"" then Call h2res.attribute_answer(1,108568,IdContacto,Iddom,ApellidoMaterno)
		'EstadoCivil
		if trim(EstadoCivil)<>"" then Call h2res.attribute_answer(1,108579,IdContacto,Iddom,EstadoCivil)				
		'FechaNac
		if trim(FechaNac)<>"" then Call h2res.attribute_answer(1,108583,IdContacto,Iddom,FechaNac)	
		'txtcodtelcom-TelefonoCentral
		if trim(txtcodtelcom)<>"" then
			if trim(TelefonoCentral)<>"" then Call h2res.attribute_answer(1,108572,IdContacto,Iddom,txtcodtelcom & "-" & TelefonoCentral)				
		else
			if trim(TelefonoCentral)<>"" then Call h2res.attribute_answer(1,108572,IdContacto,Iddom,TelefonoCentral)				
		end if			
		'txtCodigoCelular-Celular
		if trim(txtCodigoCelular)<>"" then
			if trim(Celular)<>"" then Call h2res.attribute_answer(1,108573,IdContacto,Iddom,txtCodigoCelular & "-" & Celular)								
		else
			if trim(Celular)<>"" then Call h2res.attribute_answer(1,108573,IdContacto,Iddom,Celular)					
		end if		
		'txtcodtel-Telefono
		if trim(txtcodtel)<>"" then
			if trim(Telefono)<>"" then Call h2res.attribute_answer(1,108571,IdContacto,Iddom,txtcodtel & "-" & Telefono)				
		else
			if trim(Telefono)<>"" then Call h2res.attribute_answer(1,108571,IdContacto,Iddom,Telefono)				
		end if
		'Direccionresidencia
		if trim(Direccionresidencia)<>"" then Call h2res.attribute_answer(1,108569,IdContacto,Iddom,Direccionresidencia)
		'Numero Residencia
		if trim(txtNro)<>"" then Call h2res.attribute_answer(1,108570,IdContacto,Iddom,txtNro)
		'Dpto
		if trim(Dpto)<>"" then Call h2res.attribute_answer(1,108585,IdContacto,Iddom,Dpto)
		'Comuna2 - ComunaPropietario
		if trim(ComunaPropietario)<>"" then Call h2res.attribute_answer(1,108575,IdContacto,Iddom,ComunaPropietario)
		'RegionPropietario
		if trim(RegionPropietario)<>"" then Call h2res.attribute_answer(1,108577,IdContacto,Iddom,RegionPropietario)				
		'SexoPropietario
		if trim(SexoPropietario)<>"" then Call h2res.attribute_answer(1,108581,IdContacto,Iddom,SexoPropietario)					
		'EMail
		if trim(EMail)<>"" then Call h2res.attribute_answer(1,108574,IdContacto,Iddom,EMail)		
	end if
end sub

sub UpdateContactoPersona(IdContacto)
		'id contacto
		call h2res.attribute_answer(1, 1026, IdContacto, Iddom,h2res.get_fechaSQL("", "", 20, 1))
		'Nombre
		if trim(Nombre)<>"" then Call h2res.attribute_answer(1,108566,IdContacto,Iddom,Nombre)
		'Apellidos
		if trim(Apellidos)<>"" then Call h2res.attribute_answer(1,108567,IdContacto,Iddom,Apellidos)
		'ApellidoMaterno
		if trim(ApellidoMaterno)<>"" then Call h2res.attribute_answer(1,108568,IdContacto,Iddom,ApellidoMaterno)
		'EstadoCivil
		if trim(EstadoCivil)<>"" then Call h2res.attribute_answer(1,108579,IdContacto,Iddom,EstadoCivil)				
		'FechaNac
		if trim(FechaNac)<>"" then Call h2res.attribute_answer(1,108583,IdContacto,Iddom,FechaNac)	
		'txtcodtelcom-TelefonoCentral
		if trim(txtcodtelcom)<>"" then
			if trim(TelefonoCentral)<>"" then Call h2res.attribute_answer(1,108572,IdContacto,Iddom,txtcodtelcom & "-" & TelefonoCentral)				
		else
			if trim(TelefonoCentral)<>"" then Call h2res.attribute_answer(1,108572,IdContacto,Iddom,TelefonoCentral)				
		end if			
		'txtCodigoCelular-Celular
		if trim(txtCodigoCelular)<>"" then
			if trim(Celular)<>"" then Call h2res.attribute_answer(1,108573,IdContacto,Iddom,txtCodigoCelular & "-" & Celular)								
		else
			if trim(Celular)<>"" then Call h2res.attribute_answer(1,108573,IdContacto,Iddom,Celular)					
		end if		
		'txtcodtel-Telefono
		if trim(txtcodtel)<>"" then
			if trim(Telefono)<>"" then Call h2res.attribute_answer(1,108571,IdContacto,Iddom,txtcodtel & "-" & Telefono)				
		else
			if trim(Telefono)<>"" then Call h2res.attribute_answer(1,108571,IdContacto,Iddom,Telefono)				
		end if
		'Direccionresidencia
		if trim(Direccionresidencia)<>"" then Call h2res.attribute_answer(1,108569,IdContacto,Iddom,Direccionresidencia)
		'Numero Residencia
		if trim(txtNro)<>"" then Call h2res.attribute_answer(1,108570,IdContacto,Iddom,txtNro)
		'Dpto
		if trim(Dpto)<>"" then Call h2res.attribute_answer(1,108585,IdContacto,Iddom,Dpto)
		'Comuna2 - ComunaPropietario
		if trim(ComunaPropietario)<>"" then Call h2res.attribute_answer(1,108575,IdContacto,Iddom,ComunaPropietario)
		'RegionPropietario
		if trim(RegionPropietario)<>"" then Call h2res.attribute_answer(1,108577,IdContacto,Iddom,RegionPropietario)				
		'SexoPropietario
		if trim(SexoPropietario)<>"" then Call h2res.attribute_answer(1,108581,IdContacto,Iddom,SexoPropietario)					
		'EMail
		if trim(EMail)<>"" then Call h2res.attribute_answer(1,108574,IdContacto,Iddom,EMail)		
end sub

sub UpdateVehiculo(IdVehiculo)
			call h2res.attribute_answer(1, 1026, IdVehiculo, Iddom,h2res.get_fechaSQL("", "", 20, 1))

			'85054 Patente
			if trim(Patente)<>"" then Call h2res.attribute_answer(1,108562,IdVehiculo,Iddom,Patente)	
				
			'92035 Cupones
			Call h2res.attribute_answer(1,108548,IdVehiculo,Iddom,1)	
end sub



function GetNumDocumento(IdCupon)
dim StrSql,StrSql2
dim Rs_ent
dim valor
valor = ""
	StrSql = "insert AutoIncrementCupon (idCUpon) values (" & IdCupon & ")"
	StrSql2 = " AutoIncrementCupon where idcupon=" & IdCupon
	set Rs_ent = salesh2.execute_query(StrSql,StrSql2)

	if not(Rs_ent is nothing) then
	 If Rs_ent.state = 1 Then
	  If Not Rs_ent.EOF Then
	  	 valor = Rs_ent("ident")
	    Rs_ent.Close
	  end if
	 end if
	end if
	set Rs_ent = Nothing	
	GetNumDocumento = valor
end function 

function GetDistritotxt(ComunaPropietario)
dim strSelectedFields
dim strTempTable
dim strFilter
dim str_orderby
dim Rs_ent
dim valor
valor = ""

	strSelectedFields = " m1.distrito "
	strTempTable = " entity e inner join module_5920740_9469 m1 on e.id_entity=m1.id_entity "
	strFilter = " type_entity>0 and m1.id_entity = '" & ComunaPropietario & "'"
	str_orderby = ""
	set Rs_ent = salesh2.execute_Commandquery("select", strSelectedFields, strTempTable, strFilter, , str_orderby)
	if not(Rs_ent is nothing) then
	 If Rs_ent.state = 1 Then
	  If Not Rs_ent.EOF Then
	  	 valor = Rs_ent("distrito")
	  end if
	 end if
	end if
	Rs_ent.Close
	set Rs_ent = Nothing	
	GetDistritotxt = valor
end function 

function GetMresumen(ModeloResumen)
dim strSelectedFields
dim strTempTable
dim strFilter
dim str_orderby
dim Rs_ent
dim valor
valor = ""
	strSelectedFields = " id_option_attribute "
	strTempTable = " option_attribute "
	strFilter = " id_attribute = 108565 and value_option_attribute_cl = '" & ModeloResumen & "'"
	str_orderby = ""
	set Rs_ent = salesh2.execute_Commandquery("select", strSelectedFields, strTempTable, strFilter, , str_orderby)
	if not(Rs_ent is nothing) then
	 If Rs_ent.state = 1 Then
	  If Not Rs_ent.EOF Then
	  	 valor = Rs_ent("id_option_attribute")
	  end if
	 end if
	end if
	Rs_ent.Close
	set Rs_ent = Nothing	
	GetMresumen = valor
end function 

sub SAP_Integra_Evento(IdCupon)
dim ID_Integra_Evento
	  ID_Integra_Evento = salesh2.user_create(Iddom, Iddom, "1817980", "6179738")
  	If ID_Integra_Evento = "-1" then
	   	 Response.Write ("Error al crear SAP_Integra_Evento.")
  	Else
			 call h2res.attribute_answer(1, 1026, ID_Integra_Evento, Iddom,h2res.get_fechaSQL("", "", 20, 1))
			 call h2res.attribute_answer(1, 1027, ID_Integra_Evento, Iddom,h2res.get_fechaSQL("", "", 20, 1))
			 call h2res.attribute_answer(1, 1028, ID_Integra_Evento, Iddom,"6179738")	

			 '109400	s_textline	IDPROCESO
			 Call h2res.attribute_answer(1,109400,ID_Integra_Evento,Iddom,ID_Integra_Evento)
			 '109402	m_lookup		LKEvento
			 Call h2res.attribute_answer(1,109402,ID_Integra_Evento,Iddom,IdCupon)
			 '109404	s_date			FechaIngreso
			 Call h2res.attribute_answer(1,109404,ID_Integra_Evento,Iddom,h2res.get_fechaSQL("", "", 20, 1))
			 '109405	s_textline	EstadoContacto
			 Call h2res.attribute_answer(1,109405,ID_Integra_Evento,Iddom,"pendiente")
			 '109406	s_textline	EstadoEvento
			 Call h2res.attribute_answer(1,109406,ID_Integra_Evento,Iddom,"pendiente")
			 dim IDCte
			 IDCte = h2res.attribute_answer_get(IdCupon,108594,Iddom)
			 '109401	m_lookup		LKCliente
			 Call h2res.attribute_answer(1,109401,ID_Integra_Evento,Iddom,IDCte)
			 '109410	s_textline	Tiporegistro
			 Call h2res.attribute_answer(1,109410,ID_Integra_Evento,Iddom,"garantia")
    End If
end sub

sub CreateCupon()
	  IdCupon = salesh2.user_create(Iddom, Iddom, "1817934", "6179738")
  	If IdCupon = "-1" then
	   	Response.Write ("Error al crear Cupon.")
  	Else
  		dim NumDoc
  		NumDoc = ""
  		NumDoc = GetNumDocumento(IdCupon)
  		dim Mresumen
  		Mresumen = ""
  		Mresumen = GetMresumen(ModeloResumen)  		
  		NumDocGen = NumDoc  	
			call h2res.attribute_answer(1, 1026, IdCupon, Iddom,h2res.get_fechaSQL("", "", 20, 1))
			call h2res.attribute_answer(1, 1027, IdCupon, Iddom,h2res.get_fechaSQL("", "", 20, 1))
			call h2res.attribute_answer(1, 1028, IdCupon, Iddom,"6179738")	
			
			'IdVehiculo
			if trim(IdVehiculo)<>"" then Call h2res.attribute_answer(1,108547,IdCupon,Iddom,IdVehiculo)			
			'Factura  
			if trim(txtnumfact)<>"" then Call h2res.attribute_answer(1,108601,IdCupon,Iddom,txtnumfact)			
			'Fecha Factura  
			if trim(FechaFac)<>"" then Call h2res.attribute_answer(1,108599,IdCupon,Iddom,FechaFac)	
			'Fecha Entrega Vehiculo  
			if trim(FechaEnt)<>"" then Call h2res.attribute_answer(1,108598,IdCupon,Iddom,FechaEnt)
			'Local  
			if trim(request("LocalConc"))<>"" then Call h2res.attribute_answer(1,108593,IdCupon,Iddom,request("LocalConc"))						
			'Numero de Documento
			call h2res.attribute_answer(1, 108600, IdCupon, Iddom,NumDoc)			
			'id eventoCOD-SK
			if trim(IdCupon)<>"" then Call h2res.attribute_answer(1,108501,IdCupon,Iddom,IdCupon)	
			'Motor
			if trim(Motor)<>"" then Call h2res.attribute_answer(1,108625,IdCupon,Iddom,Motor)				
			
			'login 108639  Creado Por  
			if trim(login)<>"" then Call h2res.attribute_answer(1,108639,IdCupon,Iddom,login)				
			
			
			
			'color
			if trim(Color)<>"" then Call h2res.attribute_answer(1,108560,IdCupon,Iddom,Color)
			'Tipo de Evento
			Call h2res.attribute_answer(1,108596,IdCupon,Iddom,"117531")
			'Tipo de Documento
			Call h2res.attribute_answer(1,108796,IdCupon,Iddom,"117652")
			'Marca Grupo
			if trim(marcaGrupo)<>"" then Call h2res.attribute_answer(1,108539,IdCupon,Iddom,marcaGrupo)				
			'Marca Single
			if trim(marcaGrupo)<>"" then 
				Select Case (marcaGrupo)
					'KIA
					Case 117477:
						Call h2res.attribute_answer(1,108534,IdCupon,Iddom,117469)
					'FIAT
					Case 117474:
						Call h2res.attribute_answer(1,108534,IdCupon,Iddom,117463)
					'CHERY
					Case 117475:
						Call h2res.attribute_answer(1,108534,IdCupon,Iddom,117462)
					'MG
					Case 117476:
						Call h2res.attribute_answer(1,108534,IdCupon,Iddom,117465)
					'MM
					Case 117878:
					  Call h2res.attribute_answer(1,108534,IdCupon,Iddom,117467)
					Case else:
							Call h2res.attribute_answer(1,108534,IdCupon,Iddom,"")
				End Select
			end if
			'Modelo
			if trim(Modelo)<>"" then Call h2res.attribute_answer(1,108561,IdCupon,Iddom,Modelo)				
			'Modelo Resumen
			if trim(Mresumen)<>"" then Call h2res.attribute_answer(1,108565,IdCupon,Iddom,Mresumen)
			'Fecha
			Call h2res.attribute_answer(1,108552,IdCupon,Iddom,h2res.get_fechaSQL("", "", 20, 1))			
			'Patente
			if trim(Patente)<>"" then Call h2res.attribute_answer(1,108563,IdCupon,Iddom,Patente)	
			'Nombre Local			
			if trim(NombreLocal)<>"" then Call h2res.attribute_answer(1,108553,IdCupon,Iddom,NombreLocal)
			'RUT Concesionario
			if trim(IdConcesionario)<>"" then Call h2res.attribute_answer(1,108537,IdCupon,Iddom,IdConcesionario)				
			'Nombre Concesionario
			if trim(NombreConcesionario)<>"" then Call h2res.attribute_answer(1,108597,IdCupon,Iddom,NombreConcesionario)
			'Nombre Contacto Concesionario Carga  
			if trim(txtNombreVendedor)<>"" then Call h2res.attribute_answer(1,108536,IdCupon,Iddom,ucase(txtNombreVendedor))
				
			'109492 lk ejecutivo 
			
			'======================== DATOS PROPIETARIO ========================
			If trim(IdTab)="1" Then	
				'Tipo Contacto
				Call h2res.attribute_answer(1,108602,IdCupon,Iddom,117569)
				'Id Propietario
				if trim(IdPersonaPropietaria)<>"" then Call h2res.attribute_answer(1,108594,IdCupon,Iddom,IdPersonaPropietaria)	
				'Rut
				if trim(txtRut)<>"" then Call h2res.attribute_answer(1,108607,IdCupon,Iddom,txtRut)
				'Nombre
				if trim(Nombre)<>"" then Call h2res.attribute_answer(1,108603,IdCupon,Iddom,Nombre&" "&Apellidos&" "&ApellidoMaterno)
				'txtcodtelcom-TelefonoCentral
				if trim(txtcodtelcom)<>"" then
					if trim(TelefonoCentral)<>"" then Call h2res.attribute_answer(1,108608,IdCupon,Iddom,txtcodtelcom & "-" & TelefonoCentral)				
				else
					if trim(TelefonoCentral)<>"" then Call h2res.attribute_answer(1,108608,IdCupon,Iddom,TelefonoCentral)				
				end if			
				'txtCodigoCelular-Celular
				if trim(txtCodigoCelular)<>"" then
					if trim(Celular)<>"" then Call h2res.attribute_answer(1,108609,IdCupon,Iddom,txtCodigoCelular & "-" & Celular)								
				else
					if trim(Celular)<>"" then Call h2res.attribute_answer(1,108609,IdCupon,Iddom,Celular)					
				end if		
				'txtcodtel-Telefono
				if trim(txtcodtel)<>"" then
					if trim(Telefono)<>"" then Call h2res.attribute_answer(1,108606,IdCupon,Iddom,txtcodtel & "-" & Telefono)				
				else
					if trim(Telefono)<>"" then Call h2res.attribute_answer(1,108606,IdCupon,Iddom,Telefono)				
				end if
				'EMail
				if trim(EMail)<>"" then Call h2res.attribute_answer(1,108610,IdCupon,Iddom,EMail)
				'Direccionresidencia
				if trim(Direccionresidencia)<>"" then Call h2res.attribute_answer(1,108611,IdCupon,Iddom,Direccionresidencia)
				'Numero Residencia
				if trim(txtNro)<>"" then Call h2res.attribute_answer(1,108623,IdCupon,Iddom,txtNro)
				'Dpto
				if trim(Dpto)<>"" then Call h2res.attribute_answer(1,108612,IdCupon,Iddom,Dpto)
				'EstadoCivil
				'if trim(EstadoCivil)<>"" then Call h2res.attribute_answer(1,108580,IdCupon,Iddom,EstadoCivil)		
				
				'EstadoCivil
				if trim(EstadoCivil) <> ""  Then
					if trim(EstadoCivil) = "117491" Then
						Call h2res.attribute_answer(1,108580,IdCupon,Iddom,"Soltero")	
					End If
					if trim(EstadoCivil) = "117492" Then
						Call h2res.attribute_answer(1,108580,IdCupon,Iddom,"Casado")	
					End If
					if trim(EstadoCivil) = "117613" Then
						Call h2res.attribute_answer(1,108580,IdCupon,Iddom,"Separado")	
					End If
					if trim(EstadoCivil) = "117614" Then
						Call h2res.attribute_answer(1,108580,IdCupon,Iddom,"Viudo")	
					End If
				End If		
				
				'FechaNac
				if trim(FechaNac)<>"" then Call h2res.attribute_answer(1,108584,IdCupon,Iddom,FechaNac)	
				'SexoPropietario
				'if trim(SexoPropietario)<>"" then Call h2res.attribute_answer(1,108582,IdCupon,Iddom,SexoPropietario)		
				'SexoPropietario
				if trim(SexoPropietario) <> ""  Then
					if trim(SexoPropietario) = "117494" Then
						Call h2res.attribute_answer(1,108582,IdCupon,Iddom,"M")	
					End If
					if trim(SexoPropietario) = "117493" Then
						Call h2res.attribute_answer(1,108582,IdCupon,Iddom,"F")	
					End If
				End If
							
				'Comuna2 - ComunaPropietario
				if trim(request("txt_ComunaPropietario"))<>"" then Call h2res.attribute_answer(1,108576,IdCupon,Iddom,GetDistritotxt(ComunaPropietario))
				'RegionPropietario
				if trim(RegionPropietario)<>"" then Call h2res.attribute_answer(1,108578,IdCupon,Iddom,RegionPropietario)				
				
			End If
			If trim(IdTab)="2" Then
				Call h2res.attribute_answer(1,108602,IdCupon,Iddom,117570)
				'Id Propietario
				if trim(IdCtaEmpresa)<>"" then Call h2res.attribute_answer(1,108594,IdCupon,Iddom,IdCtaEmpresa)	
				'rut e
				if trim(RUTEmpresa)<>"" then Call h2res.attribute_answer(1,108607,IdCupon,Iddom,RUTEmpresa)			
				'Sexo e
				Call h2res.attribute_answer(1,108582,IdCupon,Iddom,"E")
				'Propietario e
				if trim(RazonSocialEmpresa)<>"" then Call h2res.attribute_answer(1,108603,IdCupon,Iddom,RazonSocialEmpresa)	
				'Tel1 e
				if trim(TelefonoEmpresa)<>"" then Call h2res.attribute_answer(1,108606,IdCupon,Iddom,TelefonoEmpresa)				
				'Email e
				if trim(EmailContactoEmpresa)<>"" then Call h2res.attribute_answer(1,108610,IdCupon,Iddom,EmailContactoEmpresa)					
				'direccion e
				if trim(CalleEmpresa)<>"" then Call h2res.attribute_answer(1,108611,IdCupon,Iddom,CalleEmpresa)					
				'numero e
				if trim(NumeroEmpresa)<>"" then Call h2res.attribute_answer(1,108623,IdCupon,Iddom,NumeroEmpresa)			
				'Dpto e
				if trim(OficinaEmpresa)<>"" then Call h2res.attribute_answer(1,108612,IdCupon,Iddom,OficinaEmpresa)
				'Comuna e
				if trim(request("txt_Comuna2Empresa"))<>"" then Call h2res.attribute_answer(1,108576,IdCupon,Iddom,GetDistritotxt(ComunaPropietario))
				'region e
				if trim(RegionEmpresa)<>"" then Call h2res.attribute_answer(1,108578,IdCupon,Iddom,RegionEmpresa)
				'Telefono Empresa
				if trim(codTelefonoEmpresa)<>"" then
					if trim(TelefonoEmpresa)<>"" then Call h2res.attribute_answer(1,108606,IdCupon,Iddom,codTelefonoEmpresa & "-" & TelefonoEmpresa)	
				else
					if trim(TelefonoEmpresa)<>"" then Call h2res.attribute_answer(1,108606,IdCupon,Iddom,TelefonoEmpresa)	
				end if
				'Telefono Empresa 2
				if trim(codTelefono2Empresa)<>"" then
					if trim(Telefono2Empresa)<>"" then Call h2res.attribute_answer(1,108608,IdCupon,Iddom,codTelefono2Empresa & "-" & Telefono2Empresa)	
				else
					if trim(Telefono2Empresa)<>"" then Call h2res.attribute_answer(1,108608,IdCupon,Iddom,Telefono2Empresa)	
				end if
				'Celular
				if trim(CelularContactoEmpresa)<>"" then Call h2res.attribute_answer(1,108609,IdCupon,Iddom,CelularContactoEmpresa)
			End If	
			If trim(IdTab)="3" Then	
				Call h2res.attribute_answer(1,108602,IdCupon,Iddom,117612)
			End If
			'======================== FIN DATOS PROPIETARIO ========================
			'=======================================================================
			
			
			'===============================================================
			'======================== DATOS USUARIO ========================
			If trim(IdTab)="1" Then
				'IdUsuario
				if trim(IdUsuarioPropietaria)<>"" then Call h2res.attribute_answer(1,108638,IdCupon,Iddom,IdUsuarioPropietaria)				
				'Tipo Usuario Persona 117615 
				Call h2res.attribute_answer(1,108656,IdCupon,Iddom,117615)
				'Nombre Usuario
				if trim(NombreUsuario)<>"" then Call h2res.attribute_answer(1,108640,IdCupon,Iddom,NombreUsuario)
				'Apellido Paterno
				if trim(ApellidosUsuario)<>"" then Call h2res.attribute_answer(1,108641,IdCupon,Iddom,ApellidosUsuario)
				'Apellido Materno
				if trim(ApellidoMaternoUsuario)<>"" then Call h2res.attribute_answer(1,108642,IdCupon,Iddom,ApellidoMaternoUsuario)
				'Estado Civil
				if trim(EstadoCivilUsuario) <> ""  Then
					if trim(EstadoCivilUsuario) = "117491" Then
						Call h2res.attribute_answer(1,108643,IdCupon,Iddom,"Soltero")	
					End If
					if trim(EstadoCivilUsuario) = "117492" Then
						Call h2res.attribute_answer(1,108643,IdCupon,Iddom,"Casado")	
					End If
				End If
				'F.Nacimiento Usuario 
				if trim(FechaNacUsuario)<>"" then Call h2res.attribute_answer(1,108644,IdCupon,Iddom,FechaNacUsuario)
				'Direccion
				if trim(DireccionresidenciaUsuario)<>"" then Call h2res.attribute_answer(1,108645,IdCupon,Iddom,DireccionresidenciaUsuario)
				'Nro
				if trim(txtNroUsuario)<>"" then Call h2res.attribute_answer(1,108646,IdCupon,Iddom,txtNroUsuario)
				'Depto
				if trim(DptoUsuario)<>"" then Call h2res.attribute_answer(1,108647,IdCupon,Iddom,DptoUsuario)
				'Region
				if trim(RegionPropietarioUsuario)<>"" then Call h2res.attribute_answer(1,108650,IdCupon,Iddom,RegionPropietarioUsuario)
				'Comuna lookup
				if trim(ComunaPropietarioUsuario)<>"" then Call h2res.attribute_answer(1,108648,IdCupon,Iddom,ComunaPropietarioUsuario)
				'Comuna nombre
				if trim(request("txt_ComunaPropietarioUsuario"))<>"" then Call h2res.attribute_answer(1,108649,IdCupon,Iddom,request("txt_ComunaPropietarioUsuario"))
				'Sexo
				if trim(SexoPropietarioUsuario) <> ""  Then
					if trim(SexoPropietarioUsuario) = "117494" Then
						Call h2res.attribute_answer(1,108651,IdCupon,Iddom,"M")	
					End If
					if trim(SexoPropietarioUsuario) = "117493" Then
						Call h2res.attribute_answer(1,108651,IdCupon,Iddom,"F")	
					End If
				End If
				'txtcodtelcom-TelefonoCentralUsuario
				if trim(txtcodtelcomUsuario)<>"" then
					if trim(TelefonoCentralUsuario)<>"" then Call h2res.attribute_answer(1,108652,IdCupon,Iddom,txtcodtelcomUsuario & "-" & TelefonoCentralUsuario)					
				else
					if trim(TelefonoCentralUsuario)<>"" then Call h2res.attribute_answer(1,108652,IdCupon,Iddom,TelefonoCentralUsuario)				
				end if		
				'txtCodigoCelular-CelularUsuario
				if trim(txtCodigoCelular)<>"" then
					if trim(CelularUsuario)<>"" then Call h2res.attribute_answer(1,108654,IdCupon,Iddom,txtCodigoCelularUsuario & "-" & CelularUsuario)					
				else
					if trim(CelularUsuario)<>"" then Call h2res.attribute_answer(1,108654,IdCupon,Iddom,CelularUsuario)					
				end if		
				'txtcodtel-TelefonoUsuario
				if trim(txtcodtelUsuario)<>"" then
					if trim(TelefonoUsuario)<>"" then Call h2res.attribute_answer(1,108653,IdCupon,Iddom,txtcodtelUsuario & "-" & TelefonoUsuario)				
				else
					if trim(TelefonoUsuario)<>"" then Call h2res.attribute_answer(1,108653,IdCupon,Iddom,TelefonoUsuario)					
				end if
				'Email
				if trim(EMailUsuario)<>"" then Call h2res.attribute_answer(1,108655,IdCupon,Iddom,EMailUsuario)
			End If
			If trim(IdTab)="2" Then
				'IdUsuarioEmpresa
				if trim(IdUsuarioCtaEmpresa)<>"" then Call h2res.attribute_answer(1,108638,IdCupon,Iddom,IdUsuarioCtaEmpresa)				
				'Tipo Usuario Empresa 117616 
				Call h2res.attribute_answer(1,108656,IdCupon,Iddom,117616)
				'Nombre Usuario
				if trim(NombreUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108640,IdCupon,Iddom,NombreUsuarioEmp)
				'Apellido Paterno
				if trim(ApellidosUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108641,IdCupon,Iddom,ApellidosUsuarioEmp)
				'Apellido Materno
				if trim(ApellidoMaternoUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108642,IdCupon,Iddom,ApellidoMaternoUsuarioEmp)
				'Estado Civil
				if trim(EstadoCivilUsuarioEmp) <> ""  Then
					if trim(EstadoCivilUsuarioEmp) = "117491" Then
						Call h2res.attribute_answer(1,108643,IdCupon,Iddom,"Soltero")	
					End If
					if trim(EstadoCivilUsuarioEmp) = "117492" Then
						Call h2res.attribute_answer(1,108643,IdCupon,Iddom,"Casado")	
					End If
				End If
				'F.Nacimiento Usuario Empresa
				if trim(FechaNacUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108644,IdCupon,Iddom,FechaNacUsuarioEmp)
				'Direccion
				if trim(DireccionresidenciaUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108645,IdCupon,Iddom,DireccionresidenciaUsuarioEmp)
				'Nro
				if trim(txtNroUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108646,IdCupon,Iddom,txtNroUsuarioEmp)
				'Depto
				if trim(DptoUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108647,IdCupon,Iddom,DptoUsuarioEmp)
				'Region
				if trim(RegionPropietarioUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108650,IdCupon,Iddom,RegionPropietarioUsuarioEmp)
				'Comuna lookup
				if trim(ComunaPropietarioUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108648,IdCupon,Iddom,ComunaPropietarioUsuarioEmp)
				'Comuna nombre
				if trim(request("txt_ComunaPropietarioUsuarioEmp"))<>"" then Call h2res.attribute_answer(1,108649,IdCupon,Iddom,request("txt_ComunaPropietarioUsuarioEmp"))
				'Sexo
				if trim(SexoPropietarioUsuarioEmp) <> ""  Then
					if trim(SexoPropietarioUsuarioEmp) = "117494" Then
						Call h2res.attribute_answer(1,108651,IdCupon,Iddom,"M")	
					End If
					if trim(SexoPropietarioUsuarioEmp) = "117493" Then
						Call h2res.attribute_answer(1,108651,IdCupon,Iddom,"F")	
					End If
				End If
				'Telefono Particuar
				if trim(txtcodtelUsuarioEmp)<>"" then
					if trim(TelefonoUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108652,IdCupon,Iddom,txtcodtelUsuarioEmp & "-" & TelefonoUsuarioEmp)	
				else
					if trim(TelefonoUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108652,IdCupon,Iddom,TelefonoUsuarioEmp)	
				end if
				'Telefono Comercial Usuario
				if trim(txtcodtelcomUsuarioEmp)<>"" then
					if trim(TelefonoCentralUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108653,IdCupon,Iddom,txtcodtelcomUsuarioEmp & "-" & TelefonoCentralUsuarioEmp)	
				else
					if trim(TelefonoCentralUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108653,IdCupon,Iddom,TelefonoCentralUsuarioEmp)	
				end if
				'Celular
				if trim(txtCodigoCelularEmp)<>"" then
					if trim(CelularUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108654,IdCupon,Iddom,txtCodigoCelularUsuarioEmp & "-" & CelularUsuarioEmp)	
				else
					if trim(CelularUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108654,IdCupon,Iddom,CelularUsuarioEmp)	
				end if	
				'Email
				if trim(EMailUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108655,IdCupon,Iddom,EMailUsuarioEmp)
			End If	
			If trim(IdTab)="3" Then			
			End If
			'======================== FIN DATOS USUARIO ========================
			'===================================================================
			

            '109455  LogSave
            Dim strLOG
            strLOG = strLOG & "IdCupon=" & IdCupon
            strLOG = strLOG & ",fechafactura=" & FechaFac
            strLOG = strLOG & ",FechaEntregaVehiculo=" & FechaEnt
            strLOG = strLOG & ",formulario=ActivarGarantia(DOL)"
            if trim(strLOG)<>"" then Call h2res.attribute_answer(1,109455,IdCupon,Iddom,strLOG)

			On Error resume Next
			Dim LoginSK	
			'cacevedo  AHORA LA VARIABLE SE TRASPASA COMO PARAMETROS 03/08/2007
			LoginSK = request("login")&""
			response.write ("<!--LoginSK : " & LoginSK & "-->")
			'if trim(LoginSK)<>"" then
			'	Call h2res.attribute_answer(1,96794,IdCupon,1516181,LoginSK)
			'end if	
		end if			
		
		If IdCupon <> "-1" and IdCupon <> "" then
			call SAP_Integra_Evento(IdCupon)
		end if
		
end sub

sub CreateUsuarioPersona()
	dim IdUsuarioPersona
		IdUsuarioPersona = salesh2.user_create(Iddom, Iddom, "1817935", "6179738")
  	If IdUsuarioPersona = "-1" then
	   	Response.Write ("Error al crear Contacto.")
  	Else
		IdUsuarioPropietaria = IdUsuarioPersona
		call h2res.attribute_answer(1, 1026, IdUsuarioPersona, Iddom,h2res.get_fechaSQL("", "", 20, 1))
		call h2res.attribute_answer(1, 1027, IdUsuarioPersona, Iddom,h2res.get_fechaSQL("", "", 20, 1))
		call h2res.attribute_answer(1, 1028, IdUsuarioPersona, Iddom,"6179738")		
		
		'Tipo Contacto
		Call h2res.attribute_answer(1,108604,IdUsuarioPersona,Iddom,117571)
		'Rut
		if trim(txtRutUsuario)<>"" then Call h2res.attribute_answer(1,108551,IdUsuarioPersona,Iddom,txtRutUsuario)
		'Nombre
		if trim(NombreUsuario)<>"" then Call h2res.attribute_answer(1,108566,IdUsuarioPersona,Iddom,NombreUsuario)
		'Apellidos
		if trim(ApellidosUsuario)<>"" then Call h2res.attribute_answer(1,108567,IdUsuarioPersona,Iddom,ApellidosUsuario)
		'ApellidoMaterno
		if trim(ApellidoMaternoUsuario)<>"" then Call h2res.attribute_answer(1,108568,IdUsuarioPersona,Iddom,ApellidoMaternoUsuario)
		'EstadoCivil
		if trim(EstadoCivilUsuario)<>"" then Call h2res.attribute_answer(1,108579,IdUsuarioPersona,Iddom,EstadoCivilUsuario)	
		'FechaNac
		if trim(FechaNacUsuario)<>"" then Call h2res.attribute_answer(1,108583,IdUsuarioPersona,Iddom,FechaNacUsuario)
		'txtcodtelcom-TelefonoCentralUsuario
		if trim(txtcodtelcomUsuario)<>"" then
			if trim(TelefonoCentralUsuario)<>"" then Call h2res.attribute_answer(1,108572,IdUsuarioPersona,Iddom,txtcodtelcomUsuario & "-" & TelefonoCentralUsuario)					
		else
			if trim(TelefonoCentralUsuario)<>"" then Call h2res.attribute_answer(1,108572,IdUsuarioPersona,Iddom,TelefonoCentralUsuario)				
		end if		
		'txtCodigoCelular-CelularUsuario
		if trim(txtCodigoCelular)<>"" then
			if trim(CelularUsuario)<>"" then Call h2res.attribute_answer(1,108573,IdUsuarioPersona,Iddom,txtCodigoCelularUsuario & "-" & CelularUsuario)					
		else
			if trim(CelularUsuario)<>"" then Call h2res.attribute_answer(1,108573,IdUsuarioPersona,Iddom,CelularUsuario)					
		end if		
		'txtcodtel-TelefonoUsuario
		if trim(txtcodtelUsuario)<>"" then
			if trim(TelefonoUsuario)<>"" then Call h2res.attribute_answer(1,108571,IdUsuarioPersona,Iddom,txtcodtelUsuario & "-" & TelefonoUsuario)				
		else
			if trim(TelefonoUsuario)<>"" then Call h2res.attribute_answer(1,108571,IdUsuarioPersona,Iddom,TelefonoUsuario)					
		end if
		'Direccionresidencia
		if trim(DireccionresidenciaUsuario)<>"" then Call h2res.attribute_answer(1,108569,IdUsuarioPersona,Iddom,DireccionresidenciaUsuario)
		'Numero Residencia
		if trim(txtNroUsuario)<>"" then Call h2res.attribute_answer(1,108570,IdUsuarioPersona,Iddom,txtNroUsuario)
		'Dpto
		if trim(DptoUsuario)<>"" then Call h2res.attribute_answer(1,108585,IdUsuarioPersona,Iddom,DptoUsuario)
		'Comuna2 - ComunaPropietario
		if trim(ComunaPropietarioUsuario)<>"" then Call h2res.attribute_answer(1,108575,IdUsuarioPersona,Iddom,ComunaPropietarioUsuario)
		'RegionPropietario
		if trim(RegionPropietarioUsuario)<>"" then Call h2res.attribute_answer(1,108577,IdUsuarioPersona,Iddom,RegionPropietarioUsuario)				
		'SexoPropietario
		if trim(SexoPropietarioUsuario)<>"" then Call h2res.attribute_answer(1,108581,IdUsuarioPersona,Iddom,SexoPropietarioUsuario)					
		'EMail
		if trim(EMailUsuario)<>"" then Call h2res.attribute_answer(1,108574,IdUsuarioPersona,Iddom,EMailUsuario)
	end if
end sub


sub UpdateUsuarioPersona(IdUsuarioPersona)
		call h2res.attribute_answer(1, 1026, IdUsuarioPersona, Iddom,h2res.get_fechaSQL("", "", 20, 1))
	
		'Rut
		if trim(txtRutUsuario)<>"" then Call h2res.attribute_answer(1,108551,IdUsuarioPersona,Iddom,txtRutUsuario)
		'Nombre
		if trim(NombreUsuario)<>"" then Call h2res.attribute_answer(1,108566,IdUsuarioPersona,Iddom,NombreUsuario)
		'Apellidos
		if trim(ApellidosUsuario)<>"" then Call h2res.attribute_answer(1,108567,IdUsuarioPersona,Iddom,ApellidosUsuario)
		'ApellidoMaterno
		if trim(ApellidoMaternoUsuario)<>"" then Call h2res.attribute_answer(1,108568,IdUsuarioPersona,Iddom,ApellidoMaternoUsuario)
		'EstadoCivil
		if trim(EstadoCivilUsuario)<>"" then Call h2res.attribute_answer(1,108579,IdUsuarioPersona,Iddom,EstadoCivilUsuario)	
		'FechaNac
		if trim(FechaNacUsuario)<>"" then Call h2res.attribute_answer(1,108583,IdUsuarioPersona,Iddom,FechaNacUsuario)
		'txtcodtelcom-TelefonoCentralUsuario
		if trim(txtcodtelcomUsuario)<>"" then
			if trim(TelefonoCentralUsuario)<>"" then Call h2res.attribute_answer(1,108572,IdUsuarioPersona,Iddom,txtcodtelcomUsuario & "-" & TelefonoCentralUsuario)					
		else
			if trim(TelefonoCentralUsuario)<>"" then Call h2res.attribute_answer(1,108572,IdUsuarioPersona,Iddom,TelefonoCentralUsuario)				
		end if		
		'txtCodigoCelular-CelularUsuario
		if trim(txtCodigoCelular)<>"" then
			if trim(CelularUsuario)<>"" then Call h2res.attribute_answer(1,108573,IdUsuarioPersona,Iddom,txtCodigoCelularUsuario & "-" & CelularUsuario)					
		else
			if trim(CelularUsuario)<>"" then Call h2res.attribute_answer(1,108573,IdUsuarioPersona,Iddom,CelularUsuario)					
		end if		
		'txtcodtel-TelefonoUsuario
		if trim(txtcodtelUsuario)<>"" then
			if trim(TelefonoUsuario)<>"" then Call h2res.attribute_answer(1,108571,IdUsuarioPersona,Iddom,txtcodtelUsuario & "-" & TelefonoUsuario)				
		else
			if trim(TelefonoUsuario)<>"" then Call h2res.attribute_answer(1,108571,IdUsuarioPersona,Iddom,TelefonoUsuario)					
		end if
		'Direccionresidencia
		if trim(DireccionresidenciaUsuario)<>"" then Call h2res.attribute_answer(1,108569,IdUsuarioPersona,Iddom,DireccionresidenciaUsuario)
		'Numero Residencia
		if trim(txtNroUsuario)<>"" then Call h2res.attribute_answer(1,108570,IdUsuarioPersona,Iddom,txtNroUsuario)
		'Dpto
		if trim(DptoUsuario)<>"" then Call h2res.attribute_answer(1,108585,IdUsuarioPersona,Iddom,DptoUsuario)
		'Comuna2 - ComunaPropietario
		if trim(ComunaPropietarioUsuario)<>"" then Call h2res.attribute_answer(1,108575,IdUsuarioPersona,Iddom,ComunaPropietarioUsuario)
		'RegionPropietario
		if trim(RegionPropietarioUsuario)<>"" then Call h2res.attribute_answer(1,108577,IdUsuarioPersona,Iddom,RegionPropietarioUsuario)				
		'SexoPropietario
		if trim(SexoPropietarioUsuario)<>"" then Call h2res.attribute_answer(1,108581,IdUsuarioPersona,Iddom,SexoPropietarioUsuario)					
		'EMail
		if trim(EMailUsuario)<>"" then Call h2res.attribute_answer(1,108574,IdUsuarioPersona,Iddom,EMailUsuario)
end sub



sub CreateUsuarioEmpresa()
	dim IdUsuarioEmp
	IdUsuarioEmp = salesh2.user_create(Iddom, Iddom, "1817935", "6179738")
  	If IdUsuarioEmp = "-1" then
	   	Response.Write ("Error al crear Contacto.")
  	Else
  		IdUsuarioCtaEmpresa = IdUsuarioEmp
		call h2res.attribute_answer(1, 1026, IdUsuarioEmp, Iddom,h2res.get_fechaSQL("", "", 20, 1))
		call h2res.attribute_answer(1, 1027, IdUsuarioEmp, Iddom,h2res.get_fechaSQL("", "", 20, 1))
		call h2res.attribute_answer(1, 1028, IdUsuarioEmp, Iddom,"6179738")		
		'Tipo Usuario Empresa 
		Call h2res.attribute_answer(1,108604,IdUsuarioEmp,Iddom,117571)
		'Id Contacto
		Call h2res.attribute_answer(1,108502,IdUsuarioEmp,Iddom,IdUsuarioEmp)	
		'RUTUsuarioEmp
		if trim(txtRutUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108551,IdUsuarioEmp,Iddom,txtRutUsuarioEmp)
		'Nombre Usuario
		if trim(NombreUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108566,IdUsuarioEmp,Iddom,NombreUsuarioEmp)
		'Apellido Paterno
		if trim(ApellidosUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108567,IdUsuarioEmp,Iddom,ApellidosUsuarioEmp)		
		'Apellido Materno
		if trim(ApellidoMaternoUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108568,IdUsuarioEmp,Iddom,ApellidoMaternoUsuarioEmp)
		'Direccion
		if trim(DireccionresidenciaUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108569,IdUsuarioEmp,Iddom,DireccionresidenciaUsuarioEmp)
		'Nro
		if trim(txtNroUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108570,IdUsuarioEmp,Iddom,txtNroUsuarioEmp)
		'Depto
		if trim(DptoUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108585,IdUsuarioEmp,Iddom,DptoUsuarioEmp)
		'Telefono Particuar
		if trim(txtcodtelUsuarioEmp)<>"" then
			if trim(TelefonoUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108571,IdUsuarioEmp,Iddom,txtcodtelUsuarioEmp & "-" & TelefonoUsuarioEmp)	
		else
			if trim(TelefonoUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108571,IdUsuarioEmp,Iddom,TelefonoUsuarioEmp)	
		end if
		'Telefono Comercial Usuario
		if trim(txtcodtelcomUsuarioEmp)<>"" then
			if trim(TelefonoCentralUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108572,IdUsuarioEmp,Iddom,txtcodtelcomUsuarioEmp & "-" & TelefonoCentralUsuarioEmp)	
		else
			if trim(TelefonoCentralUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108572,IdUsuarioEmp,Iddom,TelefonoCentralUsuarioEmp)	
		end if
		'Celular
		if trim(txtCodigoCelularEmp)<>"" then
			if trim(CelularUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108573,IdUsuarioEmp,Iddom,txtCodigoCelularUsuarioEmp & "-" & CelularUsuarioEmp)	
		else
			if trim(CelularUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108573,IdUsuarioEmp,Iddom,CelularUsuarioEmp)	
		end if	
		'Email
		if trim(EMailUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108574,IdUsuarioEmp,Iddom,EMailUsuarioEmp)
		'Comuna lookup
		if trim(ComunaPropietarioUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108575,IdUsuarioEmp,Iddom,ComunaPropietarioUsuarioEmp)
		'Region
		if trim(RegionPropietarioUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108577,IdUsuarioEmp,Iddom,RegionPropietarioUsuarioEmp)
		'Estado Civil
		if trim(EstadoCivilUsuarioEmp) <> ""  Then
			if trim(EstadoCivilUsuarioEmp) = "117491" Then
				Call h2res.attribute_answer(1,108579,IdUsuarioEmp,Iddom,117491)	
			End If
			if trim(EstadoCivilUsuarioEmp) = "117492" Then
				Call h2res.attribute_answer(1,108579,IdUsuarioEmp,Iddom,117492)	
			End If
		End If		
		'Sexo
		if trim(SexoPropietarioUsuarioEmp) <> ""  Then
			if trim(SexoPropietarioUsuarioEmp) = "117494" Then
				Call h2res.attribute_answer(1,108581,IdUsuarioEmp,Iddom,117494)	
			End If
			if trim(SexoPropietarioUsuarioEmp) = "117493" Then
				Call h2res.attribute_answer(1,108581,IdUsuarioEmp,Iddom,117493)	
			End If
		End If
		'F.Nacimiento Usuario Empresa
		if trim(FechaNacUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108583,IdUsuarioEmp,Iddom,FechaNacUsuarioEmp)		
	end if
end sub

sub UpdateUsuarioEmpresa(IdContacto)
			call h2res.attribute_answer(1, 1026, IdContacto, Iddom,h2res.get_fechaSQL("", "", 20, 1))
			'RUTUsuarioEmp
			if trim(txtRutUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108551,IdContacto,Iddom,txtRutUsuarioEmp)
			'Nombre Usuario
			if trim(NombreUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108566,IdContacto,Iddom,NombreUsuarioEmp)
			'Apellido Paterno
			if trim(ApellidosUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108567,IdContacto,Iddom,ApellidosUsuarioEmp)		
			'Apellido Materno
			if trim(ApellidoMaternoUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108568,IdContacto,Iddom,ApellidoMaternoUsuarioEmp)
			'Direccion
			if trim(DireccionresidenciaUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108569,IdContacto,Iddom,DireccionresidenciaUsuarioEmp)
			'Nro
			if trim(txtNroUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108570,IdContacto,Iddom,txtNroUsuarioEmp)
			'Depto
			if trim(DptoUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108585,IdContacto,Iddom,DptoUsuarioEmp)
			'Telefono Particuar
			if trim(txtcodtelUsuarioEmp)<>"" then
				if trim(TelefonoUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108571,IdContacto,Iddom,txtcodtelUsuarioEmp & "-" & TelefonoUsuarioEmp)	
			else
				if trim(TelefonoUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108571,IdContacto,Iddom,TelefonoUsuarioEmp)	
			end if
			'Telefono Comercial Usuario
			if trim(txtcodtelcomUsuarioEmp)<>"" then
				if trim(TelefonoCentralUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108572,IdContacto,Iddom,txtcodtelcomUsuarioEmp & "-" & TelefonoCentralUsuarioEmp)	
			else
				if trim(TelefonoCentralUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108572,IdContacto,Iddom,TelefonoCentralUsuarioEmp)	
			end if
			'Celular
			if trim(txtCodigoCelularEmp)<>"" then
				if trim(CelularUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108573,IdContacto,Iddom,txtCodigoCelularUsuarioEmp & "-" & CelularUsuarioEmp)	
			else
				if trim(CelularUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108573,IdContacto,Iddom,CelularUsuarioEmp)	
			end if	
			'Email
			if trim(EMailUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108574,IdContacto,Iddom,EMailUsuarioEmp)
			'Comuna lookup
			if trim(ComunaPropietarioUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108575,IdContacto,Iddom,ComunaPropietarioUsuarioEmp)
			'Region
			if trim(RegionPropietarioUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108577,IdContacto,Iddom,RegionPropietarioUsuarioEmp)
			'Estado Civil
			if trim(EstadoCivilUsuarioEmp) <> ""  Then
				if trim(EstadoCivilUsuarioEmp) = "117491" Then
					Call h2res.attribute_answer(1,108579,IdContacto,Iddom,117491)	
				End If
				if trim(EstadoCivilUsuarioEmp) = "117492" Then
					Call h2res.attribute_answer(1,108579,IdContacto,Iddom,117492)	
				End If
			End If		
			'Sexo
			if trim(SexoPropietarioUsuarioEmp) <> ""  Then
				if trim(SexoPropietarioUsuarioEmp) = "117494" Then
					Call h2res.attribute_answer(1,108581,IdContacto,Iddom,117494)	
				End If
				if trim(SexoPropietarioUsuarioEmp) = "117493" Then
					Call h2res.attribute_answer(1,108581,IdContacto,Iddom,117493)	
				End If
			End If
			'F.Nacimiento Usuario Empresa
			if trim(FechaNacUsuarioEmp)<>"" then Call h2res.attribute_answer(1,108583,IdContacto,Iddom,FechaNacUsuarioEmp)	
end sub

sub CreateCuenta()
	dim IdCta
	  IdCta = salesh2.user_create(Iddom, Iddom, "1817935", "6179738")
  	If IdCta = "-1" then
	   	Response.Write ("Error al crear Contacto.")
  	Else
  		IdCtaEmpresa = IdCta
		call h2res.attribute_answer(1, 1026, IdCta, Iddom,h2res.get_fechaSQL("", "", 20, 1))
		call h2res.attribute_answer(1, 1027, IdCta, Iddom,h2res.get_fechaSQL("", "", 20, 1))
		call h2res.attribute_answer(1, 1028, IdCta, Iddom,"6179738")		
		'Tipo Contacto
		Call h2res.attribute_answer(1,108604,IdCta,Iddom,117572)
		'Id Empresa
		'if trim(IdCtaEmpresa)<>"" then Call h2res.attribute_answer(1,108502,IdCta,Iddom,IdCtaEmpresa)	
		'Rut Empresa
		if trim(RUTEmpresa)<>"" then Call h2res.attribute_answer(1,108551,IdCta,Iddom,RUTEmpresa)			
		'Nombre Empresa
		if trim(RazonSocialEmpresa)<>"" then Call h2res.attribute_answer(1,108566,IdCta,Iddom,RazonSocialEmpresa)
		'Nombre Contacto Empresa
		if trim(ContactoClienteEmpresa)<>"" then Call h2res.attribute_answer(1,108567,IdCta,Iddom,ContactoClienteEmpresa)		
		'Direccion Contacto Empresa
		if trim(CalleEmpresa)<>"" then Call h2res.attribute_answer(1,108569,IdCta,Iddom,CalleEmpresa)		
		'Nro Contacto Empresa
		if trim(NumeroEmpresa)<>"" then Call h2res.attribute_answer(1,108570,IdCta,Iddom,NumeroEmpresa)
		'Depto Contacto Empresa
		if trim(OficinaEmpresa)<>"" then Call h2res.attribute_answer(1,108585,IdCta,Iddom,OficinaEmpresa)
		'Telefono Contacto Empresa
		if trim(codTelefonoEmpresa)<>"" then
			if trim(TelefonoEmpresa)<>"" then Call h2res.attribute_answer(1,108571,IdCta,Iddom,codTelefonoEmpresa & "-" & TelefonoEmpresa)	
		else
			if trim(TelefonoEmpresa)<>"" then Call h2res.attribute_answer(1,108571,IdCta,Iddom,TelefonoEmpresa)	
		end if	
		'Telefono Contacto Empresa 2
		if trim(codTelefono2Empresa)<>"" then
			if trim(Telefono2Empresa)<>"" then Call h2res.attribute_answer(1,108572,IdCta,Iddom,codTelefono2Empresa & "-" & Telefono2Empresa)	
		else
			if trim(Telefono2Empresa)<>"" then Call h2res.attribute_answer(1,108572,IdCta,Iddom,Telefono2Empresa)	
		end if
		'Celular Contacto Empresa
		if trim(CelularContactoEmpresa)<>"" then Call h2res.attribute_answer(1,108573,IdCta,Iddom,CelularContactoEmpresa)
		'Email Contacto Empresa
		if trim(EmailContactoEmpresa)<>"" then Call h2res.attribute_answer(1,108574,IdCta,Iddom,EmailContactoEmpresa)		
		'Comuna Contacto Empresa
		if trim(request("Comuna2Empresa"))<>"" then Call h2res.attribute_answer(1,108575,IdCta,Iddom,request("Comuna2Empresa"))
		'Region Contacto Empresa
		if trim(RegionEmpresa)<>"" then Call h2res.attribute_answer(1,108577,IdCta,Iddom,RegionEmpresa)										
	end if
end sub


sub UpdateCuenta(IdCta)
		call h2res.attribute_answer(1, 1026, IdCta, Iddom,h2res.get_fechaSQL("", "", 20, 1))		
		'Tipo Contacto
		Call h2res.attribute_answer(1,108604,IdCta,Iddom,117572)
		'Id Empresa
		'if trim(IdCtaEmpresa)<>"" then Call h2res.attribute_answer(1,108502,IdCta,Iddom,IdCtaEmpresa)	
		'Rut Empresa
		if trim(RUTEmpresa)<>"" then Call h2res.attribute_answer(1,108551,IdCta,Iddom,RUTEmpresa)			
		'Nombre Empresa
		if trim(RazonSocialEmpresa)<>"" then Call h2res.attribute_answer(1,108566,IdCta,Iddom,RazonSocialEmpresa)
		'Nombre Contacto Empresa
		if trim(ContactoClienteEmpresa)<>"" then Call h2res.attribute_answer(1,108567,IdCta,Iddom,ContactoClienteEmpresa)		
		'Direccion Contacto Empresa
		if trim(CalleEmpresa)<>"" then Call h2res.attribute_answer(1,108569,IdCta,Iddom,CalleEmpresa)		
		'Nro Contacto Empresa
		if trim(NumeroEmpresa)<>"" then Call h2res.attribute_answer(1,108570,IdCta,Iddom,NumeroEmpresa)
		'Depto Contacto Empresa
		if trim(OficinaEmpresa)<>"" then Call h2res.attribute_answer(1,108585,IdCta,Iddom,OficinaEmpresa)
		'Telefono Contacto Empresa
		if trim(codTelefonoEmpresa)<>"" then
			if trim(TelefonoEmpresa)<>"" then Call h2res.attribute_answer(1,108571,IdCta,Iddom,codTelefonoEmpresa & "-" & TelefonoEmpresa)	
		else
			if trim(TelefonoEmpresa)<>"" then Call h2res.attribute_answer(1,108571,IdCta,Iddom,TelefonoEmpresa)	
		end if	
		'Telefono Contacto Empresa 2
		if trim(codTelefono2Empresa)<>"" then
			if trim(Telefono2Empresa)<>"" then Call h2res.attribute_answer(1,108572,IdCta,Iddom,codTelefono2Empresa & "-" & Telefono2Empresa)	
		else
			if trim(Telefono2Empresa)<>"" then Call h2res.attribute_answer(1,108572,IdCta,Iddom,Telefono2Empresa)	
		end if
		'Celular Contacto Empresa
		if trim(CelularContactoEmpresa)<>"" then Call h2res.attribute_answer(1,108573,IdCta,Iddom,CelularContactoEmpresa)
		'Email Contacto Empresa
		if trim(EmailContactoEmpresa)<>"" then Call h2res.attribute_answer(1,108574,IdCta,Iddom,EmailContactoEmpresa)		
		'Comuna Contacto Empresa
		if trim(request("Comuna2Empresa"))<>"" then Call h2res.attribute_answer(1,108575,IdCta,Iddom,request("Comuna2Empresa"))
		'Region Contacto Empresa
		if trim(RegionEmpresa)<>"" then Call h2res.attribute_answer(1,108577,IdCta,Iddom,RegionEmpresa)		
end sub



function CounEvento(IdVehiculo)
	
	Dim strSelectedFields,strTempTable,strFilter,str_orderby
	Dim Horas
	Dim Rs_ent
	strSelectedFields = "count(*) as total "
	strTempTable = "entity e with(nolock) "
	strTempTable = strTempTable & "inner join module_5920740_9463 m1 with(nolock) on e.id_entity=m1.id_entity "
	strTempTable = strTempTable & "inner join member_entity_5920740 mem1 with(nolock) on m1.VinVehiculo = mem1.id_counter "
	strFilter = "type_entity>0 and mem1.id_member_entity = '"  & trim(IdVehiculo) & "' and TipodeEvento = 117531 "
	
	Horas = "0"
	Set Rs_ent =  salesh2.execute_Commandquery("select", strSelectedFields, strTempTable, strFilter, , str_orderby)
	if not(Rs_ent is nothing) then
	   If Rs_ent.state = 1 Then
	     If Not Rs_ent.EOF Then
	     	Horas = trim(Rs_ent("total"))
		     Rs_ent.close()
	     end if
	   end if
	end if     
	Set Rs_ent = nothing  	     	
	CounEvento = Horas
end function


function GetIdConcesionario(RUT)
	Dim strSelectedFields,strTempTable,strFilter,str_orderby
	Dim IDconc
	Dim Rs_ent
	
	strSelectedFields = "top 1 m1.id_entity"
	strTempTable = "entity e with(nolock) "
	strTempTable = strTempTable & "inner join module_5920740_9466 m1 with(nolock) on e.id_entity=m1.id_entity "
	strFilter = "rut='" & RUT & "' and e.type_entity>0	"
	
	IDconc = ""
	Set Rs_ent =  salesh2.execute_Commandquery("select", strSelectedFields, strTempTable, strFilter, , str_orderby)
	if not(Rs_ent is nothing) then
	   If Rs_ent.state = 1 Then
	     If Not Rs_ent.EOF Then
	     	IDconc = trim(Rs_ent("id_entity"))
		     Rs_ent.close()
	     end if
	   end if
	end if     
	Set Rs_ent = nothing  	     	
	GetIdConcesionario = IDconc
end function


sub UpdateUsuarioEmpresaCupon(IdCupon)
			
			'92034   RUT_Usuario_Carga
			if trim(txtRutUsuarioEmp)<>"" and trim(txtDVUsuarioEmp)<>"" then Call h2res.attribute_answer(1,92034,IdCupon,Iddom,txtRutUsuarioEmp & "-" & txtDVUsuarioEmp)
			
			'89974 	Nombre Usuario
			if trim(NombreUsuarioEmp)<>"" then Call h2res.attribute_answer(1,89974,IdCupon,Iddom,NombreUsuarioEmp)
			
			'91928 	Apellido Paterno Usuario
			if trim(ApellidosUsuarioEmp)<>"" then Call h2res.attribute_answer(1,91928,IdCupon,Iddom,ApellidosUsuarioEmp)

			'96812 	Apellido Materno Usuario
			if trim(ApellidoMaternoUsuarioEmp)<>"" then Call h2res.attribute_answer(1,96812,IdCupon,Iddom,ApellidoMaternoUsuarioEmp)		

			'96803 	Calle Usuario
			if trim(DireccionresidenciaUsuarioEmp)<>"" then Call h2res.attribute_answer(1,96803,IdCupon,Iddom,DireccionresidenciaUsuarioEmp)		
			
			'96804 	Numero Usuario
			if trim(txtNroUsuarioEmp)<>"" then Call h2res.attribute_answer(1,96804,IdCupon,Iddom,txtNroUsuarioEmp)
				
			'96805 	Depto/Casa/Of Usuario
			if trim(DptoUsuarioEmp)<>"" then Call h2res.attribute_answer(1,96805,IdCupon,Iddom,DptoUsuarioEmp)	
				
			'96806 	Comuna Usuario
			if trim(request("txt_ComunaPropietarioUsuarioEmp"))<>"" then Call h2res.attribute_answer(1,96806,IdCupon,Iddom,trim(request("txt_ComunaPropietarioUsuarioEmp")))	
							
			'96807 	Fono Residencia Usuario	
			if trim(txtcodtelUsuarioEmp)<>"" then
				if trim(TelefonoUsuarioEmp)<>"" then Call h2res.attribute_answer(1,96807,IdCupon,Iddom,txtcodtelUsuarioEmp & "-" & TelefonoUsuarioEmp)	
			else
				if trim(TelefonoUsuarioEmp)<>"" then Call h2res.attribute_answer(1,96807,IdCupon,Iddom,TelefonoUsuarioEmp)	
			end if	
				
			'96808 	Fono Oficina Usuario
			if trim(txtcodtelcomUsuarioEmp)<>"" then
				if trim(TelefonoCentralUsuarioEmp)<>"" then Call h2res.attribute_answer(1,96808,IdCupon,Iddom,txtcodtelcomUsuarioEmp & "-" & TelefonoCentralUsuarioEmp)	
			else
				if trim(TelefonoCentralUsuarioEmp)<>"" then Call h2res.attribute_answer(1,96808,IdCupon,Iddom,TelefonoCentralUsuarioEmp)	
			end if	

			'96809 	Celular Usuario
			if trim(txtCodigoCelularUsuarioEmp)<>"" then
				if trim(CelularUsuarioEmp)<>"" then Call h2res.attribute_answer(1,96809,IdCupon,Iddom,txtCodigoCelularUsuarioEmp & "-" & CelularUsuarioEmp)	
			else
				if trim(CelularUsuarioEmp)<>"" then Call h2res.attribute_answer(1,96809,IdCupon,Iddom,CelularUsuarioEmp)	
			end if	
			
			
			'96811 	Email Usuario
			if trim(EMail)<>"" then Call h2res.attribute_answer(1,96811,IdCupon,Iddom,EMailUsuarioEmp)	


			'91775 	Sexo Usuario
			if trim(SexoPropietarioUsuarioEmp)<>"" then Call h2res.attribute_answer(1,91775,IdCupon,Iddom,SexoPropietarioUsuarioEmp)	

			'96810 	Fecha Nacimiento Usuario
			if trim(FechaNacUsuarioEmp)<>"" then Call h2res.attribute_answer(1,96810,IdCupon,Iddom,FechaNacUsuarioEmp)	
end sub




sub UpdateUsuarioPersonaCupon(IdCupon)
			'92034  RUT_Usuario_Carga
			Call h2res.attribute_answer(1,92034,IdCupon,Iddom,txtRutUsuario)
			
			'89974 Nombre Usuario
			if trim(NombreUsuario)<>"" then Call h2res.attribute_answer(1,89974,IdCupon,Iddom,NombreUsuario)
			
			'91928 Apellido Paterno Usuario
			if trim(ApellidosUsuario)<>"" then Call h2res.attribute_answer(1,91928,IdCupon,Iddom,ApellidosUsuario)

			'96812 	Apellido Materno Usuario
			if trim(ApellidoMaternoUsuario)<>"" then Call h2res.attribute_answer(1,96812,IdCupon,Iddom,ApellidoMaternoUsuario)		
	
			'96803 Calle Usuario
			if trim(DireccionresidenciaUsuario)<>"" then Call h2res.attribute_answer(1,96803,IdCupon,Iddom,DireccionresidenciaUsuario)		
			
			'96804 	Numero Usuario
			if trim(txtNroUsuario)<>"" then Call h2res.attribute_answer(1,96804,IdCupon,Iddom,txtNroUsuario)		
				
			'96805 	Depto/Casa/Of Usuario
				if trim(DptoUsuario)<>"" then Call h2res.attribute_answer(1,96805,IdCupon,Iddom,DptoUsuario)		

			'96806 	Comuna Usuario
			if trim(request("txt_ComunaPropietarioUsuario"))<>"" then Call h2res.attribute_answer(1,96806,IdCupon,Iddom,request("txt_ComunaPropietarioUsuario"))	
							
			'96807 	Fono Residencia Usuario
			if trim(txtcodtelUsuario)<>"" then
				if trim(TelefonoUsuario)<>"" then Call h2res.attribute_answer(1,96807,IdCupon,Iddom,txtcodtelUsuario & "-" & TelefonoUsuario)	
			else
				if trim(TelefonoUsuario)<>"" then Call h2res.attribute_answer(1,96807,IdCupon,Iddom,TelefonoUsuario)	
			end if	
				
			'96808 	Fono Oficina Usuario
			if trim(txtcodtelcomUsuario)<>"" then
				if trim(TelefonoCentralUsuario)<>"" then Call h2res.attribute_answer(1,96808,IdCupon,Iddom,txtcodtelcomUsuario & "-" & TelefonoCentralUsuario)	
			else
				if trim(TelefonoCentralUsuario)<>"" then Call h2res.attribute_answer(1,96808,IdCupon,Iddom,TelefonoCentralUsuario)	
			end if	

			'96809 	Celular Usuario
			if trim(txtCodigoCelular)<>"" then
				if trim(CelularUsuario)<>"" then Call h2res.attribute_answer(1,96809,IdCupon,Iddom,txtCodigoCelularUsuario & "-" & CelularUsuario)	
			else
				if trim(CelularUsuario)<>"" then Call h2res.attribute_answer(1,96809,IdCupon,Iddom,CelularUsuario)	
			end if	

			'96811 	Email Usuario
			if trim(EMailUsuario)<>"" then Call h2res.attribute_answer(1,96811,IdCupon,Iddom,EMailUsuario)	

			'91775 	Sexo Usuario
			dim StrSexoPropietarioUsuario
			
			if trim(SexoPropietarioUsuario)="104338" then StrSexoPropietarioUsuario="M"
			if trim(SexoPropietarioUsuario)="104339" then StrSexoPropietarioUsuario="F"
			if trim(SexoPropietarioUsuario)="108854" then StrSexoPropietarioUsuario="E"
				
			if trim(StrSexoPropietarioUsuario)<>"" then Call h2res.attribute_answer(1,91775,IdCupon,Iddom,StrSexoPropietarioUsuario)	

			'96810 	Fecha Nacimiento Usuario
			if trim(FechaNacUsuario)<>"" then Call h2res.attribute_answer(1,96810,IdCupon,Iddom,FechaNacUsuario)	
end sub



h2_dbclose() 'final	
%>

<html>
<head>
<LINK REL="SHORTCUT ICON" HREF="../images/logoSk.ico">
<title>   
Cupones Garantía Fiat
</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="http://administracioncupones.ska.cl/css/IT_app.css" rel="stylesheet" type="text/css">
<link href="http://skberge.h2center.com/forms_anon/dealer_online/css/intranet.css" rel="stylesheet" type="text/css">


<script language="JavaScript" type="text/JavaScript">
<!--







function OpenPopUp(url, nom, wth, hgt) 
{
atrib = "resizable=no,menubar=no, left=165,top=70,location=no,toolbar=no,status=no,scrollbars=yes,directories=no,width="+wth+",height="+hgt;
window.open(url, nom, atrib);
}
function fncEnviar ( )
{
	f = document.form1;
	f.action = '../include/validaUsuarioLDAP.asp';
f.submit();

}

function Execformula(id){
//ExecFormulaCupon.asp
//FrameTempLoadxx

parent.scroll(0,0)

				var ObjIframe=eval("document.all.FrameTempLoadxx")
				ObjIframe.src="ExecFormulaCupon.asp?IdCupon="+id+"&IdPersonaPropietaria=<%=IdPersonaPropietaria%>&IdUsuarioPropietaria=<%=IdUsuarioPropietaria%>&IdCtaEmpresa=<%=IdCtaEmpresa%>&IdUsuarioCtaEmpresa=<%=IdUsuarioCtaEmpresa%>"
				
				
}

function goHome(){
	parent.location.href = "../../FormsSK/skberge/homeSK.aspx?accion=1&RUTCUpon=<%=rutconcesionario%>"
}

function AbrirWin(id){
<%if trim(IdTab)="1" then%>
		window.open('../../../../h2_sales/aspx/Merge_PDF2.aspx?idmerg=5922806&intExportEntityType=1817934&lngExportEntityId='+id)
<%end if%>

<%if trim(IdTab)="2" then%>
		window.open('../../../../h2_sales/aspx/Merge_PDF2.aspx?idmerg=5922807&intExportEntityType=1817934&lngExportEntityId='+id)
<%end if%>

<%if trim(IdTab)="3" then%>
		window.open('../../../../h2_sales/aspx/Merge_PDF2.aspx?idmerg=2263877&intExportEntityType=1516194&lngExportEntityId='+id)
<%end if%>
}	

function deshabilitalayertapa()
{
	if(eval(document.getElementById("LayerTapa1")))
	{
		document.getElementById("LayerTapa1").style.visibility = 'hidden';
		document.getElementById('TRViewRel_PB').style.display = 'none';
		
	}
}

setTimeout('deshabilitalayertapa()', 15000);
-->
</script>


</head>
<!--dando el foco al formulario-->
<body text="#000000" link="#000000" vlink="#000000" alink="#000000" leftmargin="0" topmargin="0" marginwidth="0" bottommargin="0" onload="javascript:Execformula('<%=IdCupon%>')"><!-- Comienzo Codigo nuevo -->
<div align="center">
<form name="form1" method="post">
	
	
 	<div id="LayerTapa1" style="visibility:show;Z-index:200;position:absolute;top:100px;left:180px">
	<table bgcolor="#ffffff" id="TRViewRel_PB" style="display:block" border=0 width="600" height="390">
				<tr>
											<td align="center"><br/><br/>
												<table>
												<tr>
													<td>	
														<img src="../../gfx/progress_bar.gif" border="0"/>
														<script type="text/javascript">
														//var bar1= createBar(200,12,'white',1,'black','#9CBEE7',40,7,3,"");
														
														</script>
													</td>
												</tr>
												<tr>
													<td align="center"><b>Guardando...</b></td>
												</tr>	
												</table>
											</td>
			</tr>
			</table>
	</div>	

	
<table width="766" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="#999999">
    <td class="linea2">&nbsp;</td>
    <td width="46" class="linea2">&nbsp;</td>
    <td width="160" class="linea2">&nbsp;</td>
  </tr>
</table>
</div>

<table width="766" height="36%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
	<td>
	
	<table width="766" height="336" border="0" cellpadding="0" cellspacing="0">
	<tr>
	    <td align=center class="texto1">
			Informacion ingresada exitosamente (<%=NumDocGen%>)<br><br>
			<br><br><a href="javascript:AbrirWin('<%=IdCupon%>')">Imprimir Cupón</a>
			<!--<br><br><br><a href="../../FormsSK/CuponesSK/evento.asp?IdCupon=<%=IdCupon%>&RUTCUpon=<%=rutconcesionario%>">Volver y Editar</a>-->
		</td>
	</tr>
	<tr>	
		<td align=center class="texto1">
			<!--<a href="javascript:goHome()">Volver</a>-->
		</td>
	</tr>
	</table>
	
	<input type="hidden" name="intCodAplicacion" value="30"> 	
  </FORM>
	</td>
</tr>
</table>
<table width="766" border="0" cellpadding="0" cellspacing="0" align="center">
<tr>
	<td class="bajada"><div align="center">Lima - Peru</div></td>
</tr>
</table>
<iframe id="FrameTempLoadxx" name="FrameTempLoadxx" frameborder="0" width="1" height="1" src="../../h2_sales/asp/nothing.htm"></iframe>

</body>
</html>
