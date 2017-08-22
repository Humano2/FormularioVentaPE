<!--#include file="../../../h2/asp/Common.asp"-->	
<!--#include file="../../../h2/asp/functions.asp"-->

<%
Dim IdCupon
Dim HorasTrans,NumValidacion
Dim NombreConcesionario
Dim VolverEditar
NumValidacion = 24
IdCupon = request("IdCupon")
HorasTrans = 0

Dim ingresomant
ingresomant = request("ingresomant")
//response.write ("ingresomant : " & ingresomant)


if trim(IdCupon)<>"" then
	HorasTrans = GetTiempoTranscurrido(IdCupon)
	
	'response.write ("HorasTrans : " & HorasTrans)
	Dim TipoPropietario
	Dim IdLocalConc,NameLocalConc
	
	Dim StrRut,StrRutSD,StrRutDV
	Dim StrRutU,StrRutSDU,StrRutDVU
	Dim IdPropietarioPersona,IdUsuarioPersona
	Dim ArrayRut,ArrayRutU
	
	Dim StrRutEmp,StrRutSDEmp,StrRutDVEmp
	Dim StrRutUEmp,StrRutSDUEmp,StrRutDVUEmp
	Dim IdPropietarioEmpresa,IdUsuarioEmpresa
	Dim ArrayRutEmp,ArrayRutUEmp


	Dim IdVehiculo,VinVehiculo
	Dim Chasis,Motor,COLOR,MODELO,PATENTE,M
	Dim Seguro,FormaPagoUsuario
	Dim Seguro2,FormaPagoUsuario2
	Dim NombreVendedor,txtnumfact
	Dim ArrayFechaFactura,FechaFactura,FechaFacturaDia,FechaFacturaMes,FechaFacturaAgno
	Dim ArrayFechaEntrega,FechaEntrega,FechaEntregaDia,FechaEntregaMes,FechaEntregaAgno
	Dim login, marca_aux, TipoUsuario



	'107956  Persona
	'107957  Empresa
	'85296  Nº Documento  
	  
	VolverEditar		= h2res.attribute_answer_get(IdCupon,96802,1516181,-1)
	'VolverEditar		= "112710"
	
	TipoPropietario = h2res.attribute_answer_get(IdCupon,89926,5920740,-1)
	IdLocalConc = h2res.attribute_answer_get(IdCupon,108593,5920740)
	if trim(IdLocalConc)<>"" then
	  NameLocalConc = h2res.attribute_answer_get(IdLocalConc,108513,5920740)
	end if
	


	if trim(TipoPropietario)="107956" then	
		Seguro					= h2res.attribute_answer_get(IdCupon,92318,1516181)
		FormaPagoUsuario= h2res.attribute_answer_get(IdCupon,92033,1516181)
	else
		Seguro2					= h2res.attribute_answer_get(IdCupon,92318,1516181)
		FormaPagoUsuario2= h2res.attribute_answer_get(IdCupon,92033,1516181)
	end if	
	
	NombreVendedor	= h2res.attribute_answer_get(IdCupon,92445,1516181)
	txtnumfact			= h2res.attribute_answer_get(IdCupon,94734,1516181)
	FechaFactura		= h2res.attribute_answer_get(IdCupon,94735,1516181)
	
	if trim(FechaFactura)<>"" then
		ArrayFechaFactura = split(FechaFactura,"/")
		FechaFacturaDia	= right("0" & ArrayFechaFactura(1),2)
		FechaFacturaMes	= right("0" & "0" & ArrayFechaFactura(0),2)
		FechaFacturaAgno= ArrayFechaFactura(2)
	end if
	
	FechaEntrega		= h2res.attribute_answer_get(IdCupon,89918,1516181)
	if trim(FechaEntrega)<>"" then
		ArrayFechaEntrega = split(FechaEntrega,"/")
		FechaEntregaDia	= right("0" & ArrayFechaEntrega(1),2)
		FechaEntregaMes	= right("0" & ArrayFechaEntrega(0),2)
		FechaEntregaAgno= ArrayFechaEntrega(2)
	end if

	'////////////Persona//////////////////////////
	IdPropietarioPersona = h2res.attribute_answer_get(IdCupon,108594,5920740)
	if trim(IdPropietarioPersona)<>"" then
		StrRut = h2res.attribute_answer_get(IdPropietarioPersona,108551,5920740)
	end if	
	if trim(StrRut)<>"" then
		ArrayRut = split(StrRut,"-")
		StrRutSD	= ArrayRut(0)
		StrRutDV	= ArrayRut(1)
	end if

	IdUsuarioPersona = h2res.attribute_answer_get(IdCupon,108638,5920740)
	if trim(IdUsuarioPersona)<>"" then
		StrRutU = h2res.attribute_answer_get(IdUsuarioPersona,108551,5920740)
	end if	
	if trim(StrRutU)<>"" then
		ArrayRutU = split(StrRutU,"-")
		StrRutSDU	= ArrayRutU(0)
		StrRutDVU	= ArrayRutU(1)
	end if
'////////////Persona//////////////////////////


	'///////////////////Empresa///////////////////////
	IdPropietarioEmpresa = h2res.attribute_answer_get(IdCupon,85082,1516181)
	if trim(IdPropietarioEmpresa)<>"" then
		StrRutEmp = h2res.attribute_answer_get(IdPropietarioEmpresa,84553,1516181)
	end if	
	if trim(StrRutEmp)<>"" then
		ArrayRutEmp = split(StrRutEmp,"-")
		StrRutSDEmp	= ArrayRutEmp(0)
		StrRutDVEmp	= ArrayRutEmp(1)
	end if

	IdUsuarioEmpresa = h2res.attribute_answer_get(IdCupon,86742,1516181)
	if trim(IdUsuarioEmpresa)<>"" then
		StrRutUEmp = h2res.attribute_answer_get(IdUsuarioEmpresa,85604,1516181)
	end if	
	if trim(StrRutUEmp)<>"" then
		ArrayRutUEmp = split(StrRutUEmp,"-")
		StrRutSDUEmp	= ArrayRutUEmp(0)
		StrRutDVUEmp	= ArrayRutUEmp(1)
	end if
	'///////////////////Empresa///////////////////////

	IdVehiculo = h2res.attribute_answer_get(IdCupon,84959,1516181)
	if trim(IdVehiculo)<>"" then
		VinVehiculo = h2res.attribute_answer_get(IdVehiculo,84945,1516181)
		Chasis  		= h2res.attribute_answer_get(IdVehiculo,84946,1516181)
  	Motor   		= h2res.attribute_answer_get(IdVehiculo,84849,1516181)
  	COLOR   		= h2res.attribute_answer_get(IdVehiculo,85535,1516181)
  	MODELO 			= h2res.attribute_answer_get(IdVehiculo,84950,1516181)
  	PATENTE 		= h2res.attribute_answer_get(IdVehiculo,85054,1516181)
  	M						=	h2res.attribute_answer_get(IdVehiculo,96283,1516181)
  	
	end if
	
	
	
	
end if

Dim codapp,IdConcesionario,RUtConc
Dim RUTCUpon
Dim AppDesc
''codapp = request.cookies("codapp")&""
codapp = request("codapp")
login = request("login")
marca_aux = request("marca")
'response.write("marca" & request("codapp"))
TipoUsuario = request("TipoUsuario")
'response.Write ("codapp=" & marca_aux)
'response.end()

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
elseif trim(codapp)="6" then
	AppDesc="NW"
elseif trim(codapp)="7" then
	AppDesc="SP"
elseif trim(codapp)="8" then
	AppDesc="TA"
elseif trim(codapp)="9" then
	AppDesc="KP"
elseif trim(codapp)="10" then
	AppDesc="PE"
elseif trim(codapp)="12" then
	AppDesc="FS"
end if

'RUTCUpon = request("RUTCUpon")
RUTCUpon = Request.Cookies("RutConceAgendamiento") & ""
        if RUTCUpon = "96984230-0" or RUTCUpon = "96676670-0" or RUTCUpon = "76832940-0" or RUTCUpon = "96364000-5" then 
      		RUTCUpon = ""
      	end if

'comentado por cacevedo 28/05/2007
'if trim(codapp)="" then
'	response.redirect("index.asp")
'	response.end
'end if

Response.Cookies("H2License") = "SKPERU"
Response.Cookies("H2Domain") = "5920740"
Response.Cookies("H2Login") = "GAA"
Response.Cookies("H2UserId") = "1228"

IdConcesionario = request.cookies("IdConcesionario")&""


if trim(IdConcesionario)<>"" then
	RUtConc = h2res.attribute_answer_get(IdConcesionario,93357,1516181)
end if

If (IdConcesionario = "") Then
	RUtConc = Request.Cookies("RutConceAgendamiento") & ""
End If


if trim(RUTCUpon)<>"" then RUtConc = RUTCUpon

'response.write("cons " & RUtConc)

NombreConcesionario = GetInfoConcesionario(RUtConc)
'response.write("Nombre " & NombreConcesionario & "<br>")

function GetInfoConcesionario(RUtConc)
	Dim strSelectedFields,strTempTable,strFilter,str_orderby
	Dim Nombre
	Dim Rs_icon
	strSelectedFields = "m1.empresa"
	strTempTable = "entity e with(nolock) inner join module_5920740_9466 m1 with(nolock) on e.id_entity=m1.id_entity"
	strFilter = "type_entity>0 and rut = '" & RUtConc & "'"
	Set Rs_icon =  salesh2.execute_Commandquery("select", strSelectedFields, strTempTable, strFilter, , str_orderby)
	if not(Rs_icon is nothing) then
	   If Rs_icon.state = 1 Then
	     If Not Rs_icon.EOF Then
	     	Nombre = Rs_icon("empresa")
	     Rs_icon.close()
	     end if
	   end if
	end if     
	Set Rs_icon = nothing  	     	
	GetInfoConcesionario = Nombre
end function


function GetTiempoTranscurrido(IdCupon)
	Dim strSelectedFields,strTempTable,strFilter,str_orderby
	Dim Horas
	Dim Rs_ent
	strSelectedFields = "DATEDIFF (hh,value_answer,GetDate()) as horas"
	strTempTable = "answers_attributes_5920740"
	strFilter = "id_entity=" & IdCupon & " and id_attribute=1027"
	Horas = "0"
	Set Rs_ent =  salesh2.execute_Commandquery("select", strSelectedFields, strTempTable, strFilter, , str_orderby)
	if not(Rs_ent is nothing) then
	   If Rs_ent.state = 1 Then
	     If Not Rs_ent.EOF Then
	     	Horas = Rs_ent("horas")
	     Rs_ent.close()
	     end if
	   end if
	end if     
	Set Rs_ent = nothing  	     	
	GetTiempoTranscurrido = Horas
end function

Dim NomVendedor

NomVendedor = GetEjecutivos()

function GetEjecutivos()
	Dim strSelectedFields,strTempTable,strFilter,str_orderby
	Dim Rs_ent
	Dim strSelect
	strSelectedFields = " m1.id_entity,m1.Nombre,m1.Apellido,m1.estado "
	strTempTable = " Entity E WITH (NOLOCK) "
	strTempTable = strTempTable & " inner join module_5920740_9470 m1 on e.id_entity=m1.id_entity   "
	strTempTable = strTempTable & " inner join member_entity_5920740 mem1 on m1.concesionario=mem1.id_counter  "
	strTempTable = strTempTable & " inner join module_5920740_9466 m2 on m2.id_entity=mem1.id_member_entity   "
	strFilter = " e.type_entity>0 "
	strFilter = strFilter & "and m1.CargoEjecutivo = 117799 "
	strFilter = strFilter & "and m1.estado = '117715' " 
	strFilter = strFilter & "and m2.rut = '" & RUTCUpon & "'  "
	str_orderby = str_orderby & "m1.nombre  "
 
	'response.write("select" & strSelectedFields & strTempTable & strFilter & str_orderby)

	strSelect = "<option value=''>SELECCIONE</option>"
	Set Rs_ent =  salesh2.execute_Commandquery("select", strSelectedFields, strTempTable, strFilter, , str_orderby)
	if not(Rs_ent is nothing) then
	   If Rs_ent.state = 1 Then
			while not Rs_ent.EOF 
				strSelect = strSelect & "<option value='" & Rs_ent("Nombre") & " " & Rs_ent("Apellido") & "'>" & Rs_ent("Nombre") & " " & Rs_ent("Apellido") & "</option>"			
				Rs_ent.movenext 					
			wend 
			Rs_ent.close()	
	   end if
	end if     
	Set Rs_ent = nothing  	
	GetEjecutivos = strSelect
end function

h2_dbclose() 'final	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Cupón de Garantía</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <link href="css/calendario.css" rel="stylesheet" type="text/css">
    <link href="css/IT_app.css" rel="stylesheet" type="text/css">
    <link href="css/estilosCupon.css" rel="stylesheet" type="text/css">
    <script language="javascript" src="../js/functions_viewentity_Update.js"></script>
    <script type="text/javascript" src="../../../js/functions_calendar.js"></script>
    <script language="javascript" src="../../../js/mark.js"></script>
    <script type="text/javascript" src="../../../js/num_java.js"></script>
	
<script>	

function CargaDatos(){
	<%if trim(VinVehiculo)<>"" then%>
	
		document.formulario.BM.disabled = true
		if(document.formulario.BMM) document.formulario.BMM.disabled = true
		
		document.formulario.NumChasis.readOnly = true
		document.formulario.txtNroMotor.readOnly = true
		document.formulario.NumChasis.className="borde1ConValor"
		document.formulario.txtNroMotor.className="borde1ConValor"

		document.formulario.NumChasis.onfocus="return false;";			
		document.formulario.txtNroMotor.onfocus="return false;";			

		document.formulario.NumChasis.onblur="return false;";			
		document.formulario.txtNroMotor.onblur="return false;";			
		
	<%end if%>	
	
<%if trim(IdCupon)<>"" then%>
	<%if trim(TipoPropietario)="107956" then%>
	   document.formulario.IdTab[0].checked=true
	   fncQuitarColor(document.formulario.IdTab[0]);
	   fncQuitarColor(document.formulario.IdTab[1])
	    fncCambiarFicha(1)
		<%if trim(StrRut)<>"" then%>
			GetValuesClientePersona('')
		    if(document.formulario.txtRut){
			    document.formulario.txtRut.className="borde1ConValor";
		    }
    				
		    if(document.formulario.txtDV){
			    document.formulario.txtDV.className="borde1ConValor";
		    }
			
		<%end if%>	
		
		<%if trim(StrRutU)<> "" then%>
				GetValuesClientePersona('Usuario')
		        if(document.formulario.txtRutUsuario){
			        document.formulario.txtRutUsuario.className="borde1ConValor";
		        }
        				
		        //if(document.formulario.txtDVUsuario){
			        //document.formulario.txtDVUsuario.className="borde1ConValor";
		        //}

		<%end if%>
	
	<%else%>
	    document.formulario.IdTab[1].checked=true
	    fncQuitarColor(document.formulario.IdTab[0]);
	    fncQuitarColor(document.formulario.IdTab[1])
		fncCambiarFicha(2)
		
		<%if trim(StrRutEmp)<>"" then%>
			GetValuesClienteEmpresa('')
		        if(document.formulario.RUTEmpresa){
			        document.formulario.RUTEmpresa.className="borde1ConValor";
		        }
        				
		        if(document.formulario.DVEmpresa){
			        document.formulario.DVEmpresa.className="borde1ConValor";
		        }
			
		<%end if%>	
		
		<%if trim(StrRutUEmp)<> "" then%>
				GetValuesClientePersona('UsuarioEmp')
		        if(document.formulario.txtRutUsuarioEmp){
			        document.formulario.txtRutUsuarioEmp.className="borde1ConValor";
		        }
        				
		        //if(document.formulario.txtDVUsuarioEmp){
			        //document.formulario.txtDVUsuarioEmp.className="borde1ConValor";
		        //}
				
		<%end if%>
	<%end if%>	
<%end if%>	
	
}

function validafechaSeparada(accion){
	//alert(accion)
	var dateStr = ""
	var objDia
	var objMes
	var objAgno
  if (accion==1){
		objDia	= document.formulario.cboDiaNac
		objMes	= document.formulario.cboMesNac
		objAgno	= document.formulario.cboAnhoNac
  }

  if (accion==2){
		objDia	= document.formulario.cboDiaNacUsuario
		objMes	= document.formulario.cboMesNacUsuario
		objAgno	= document.formulario.cboAnhoNacUsuario
  }
  
  if (accion==3){
		objDia	= document.formulario.cboDiaNacUsuarioEmp
		objMes	= document.formulario.cboMesNacUsuarioEmp
		objAgno	= document.formulario.cboAnhoNacUsuarioEmp
  }    

  if (accion==4){
		objDia	= document.formulario.cboDiaFac
		objMes	= document.formulario.cboMesFac
		objAgno	= document.formulario.cboAnhoFac
  }
  
  if (accion==5){
		objDia	= document.formulario.cboDiaEnt
		objMes	= document.formulario.cboMesEnt
		objAgno	= document.formulario.cboAnhoEnt
  }    
  
  	dateStr  = objDia.value + "/" + objMes.value + "/" + objAgno.value

  if(objDia.value!='' && objMes.value!='' && objAgno.value!=''){
		if(!isValidDateEvento(dateStr, "DD/MM/YYYY",accion))
			return false
	}else{
	
	}	
}


function isValidDateEvento(dateStr, formato,accion) {
var fec;

  if (accion==1){
		objDia	= document.formulario.cboDiaNac
		objMes	= document.formulario.cboMesNac
		objAgno	= document.formulario.cboAnhoNac
  }

  if (accion==2){
		objDia	= document.formulario.cboDiaNacUsuario
		objMes	= document.formulario.cboMesNacUsuario
		objAgno	= document.formulario.cboAnhoNacUsuario
  }
  
  if (accion==3){
		objDia	= document.formulario.cboDiaNacUsuarioEmp
		objMes	= document.formulario.cboMesNacUsuarioEmp
		objAgno	= document.formulario.cboAnhoNacUsuarioEmp
  }    

  if (accion==4){
		objDia	= document.formulario.cboDiaFac
		objMes	= document.formulario.cboMesFac
		objAgno	= document.formulario.cboAnhoFac
  }
  
  if (accion==5){
		objDia	= document.formulario.cboDiaEnt
		objMes	= document.formulario.cboMesEnt
		objAgno	= document.formulario.cboAnhoEnt
  }    

	if (dateStr == '')
		return true;
		
	if (formato == null){ 
		 var datePat = /^(\d{1,2})(\/|-)(\d{1,2})\2(\d{4})$/;
	}else if (formato.toUpperCase() == "DD/MM/YYYY" || formato.toUpperCase() == "MM/DD/YYYY"){
		var datePat = /^(\d{1,2})(\/)(\d{1,2})\2(\d{4})$/;
	}else if (formato.toUpperCase() == "DD/MM/YY" || formato.toUpperCase() == "MM/DD/YY"){
		var datePat = /^(\d{1,2})(\/)(\d{1,2})\2(\d{2})$/;
	}else if (formato.toUpperCase() == "DD-MM-YYYY" || formato.toUpperCase() == "MM-DD-YYYY"){
		var datePat = /^(\d{1,2})(\-)(\d{1,2})\2(\d{4})$/;
	}else if (formato.toUpperCase() == "DD-MM-YY" || formato.toUpperCase() == "MM-DD-YY"){
		var datePat = /^(\d{1,2})(\-)(\d{1,2})\2(\d{2})$/;
	}else{
		var datePat = /^(\d{1,2})(\/)(\d{1,2})\2(\d{4})$/;
	}

	var matchArray = dateStr.match(datePat);

	if (matchArray == null) {
		alert("La fecha no tiene formato válido (" + formato + ").")
 		objDia.value = ""
 		objMes.value = ""
 		objAgno.value = ""		
 		objDia.focus()
		return false;
	}

	fec = formato.substring(0,2)
	if (formato == null || fec.toUpperCase() == "DD"){
		month = matchArray[3];
		day = matchArray[1];
	} else{
		month = matchArray[1];
		day = matchArray[3];
	}	
	year = matchArray[4];

	if (month < 1 || month > 12) {
		alert("El mes debe estar entre 1 y 12.");
 		objMes.value = ""
 		objMes.focus()
		return false;
	}
	
	if (day < 1 || day > 31) {
		 	alert("Día debe estar entre 1 y 31.");
	 		objDia.value = ""
	 		objDia.focus()
			return false;
	}
	
	if ((month==4 || month==6 || month==9 || month==11) && day==31) {
				alert("Este mes no tiene 31 días!")
		 		objDia.value = ""
		 		objMes.value = ""
		 		objDia.focus()
				return false
	}
	
	if (month == 2) {
		var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		if (day>29 || (day==29 && !isleap)) {
				alert("Febrero " + year + " no tiene " + day + " días!");
		 		objDia.value = ""
		 		objMes.value = ""
		 		objAgno.value = ""
		 		objDia.focus()
			
			return false;
	    }
	}
	
	return true;
}


function ValidaSoloNum(Obj,Char){
	var Char2=45
	ValorActual=Obj.value
	
	if((window.event.keyCode<48 || window.event.keyCode>57) && window.event.keyCode!=Char && window.event.keyCode!=Char2){
		window.event.keyCode=0
		return
	}
}

function BuscaComunaXX(Obj,objSel){
	if(objSel.style.display=='none'){
		if(Obj.value!=""){
			Set_Value_Attribute5(Obj.value,"1","1","3","parent.execfuncComuna('"+Obj.name+"','*x*','*y*')")
		}	
	}	
}


function BuscaComunaYY(Obj,objSel,Num){
	if(objSel.style.display=='none'){
		if(Obj.value!=""){
			Set_Value_Attribute5(Obj.value,"1","1",Num,"parent.execfuncComuna('"+Obj.name+"','*x*','*y*')")
		}	
	}	
}


function BuscaComuna(Obj,Obj2){

	if(Obj.value!=""){
		Obj2.value= Obj.value
		Set_Value_Attribute5(Obj.value,"1","1","3","parent.execfuncComuna('"+Obj2.name+"','*x*','*y*')")
	}	
}

function execfuncComuna(Name,nameComuna,NameRegion){

if(Name=='txt_ComunaPropietario'){

	
	if(nameComuna=="" && NameRegion == ""){
		alert("Comuna no existe")
		document.formulario.txt_ComunaPropietario.value=""
		document.formulario.txt_ComunaPropietario.focus()
		document.formulario.ComunaPropietario.value=""
		document.formulario.RegionPropietario.value=""
	}else{
		document.formulario.RegionPropietario.value=NameRegion
		document.formulario.ComunaPropietario.value=nameComuna
		//document.formulario.txt_ComunaPropietario.value=nameComuna
	}
}	

if(Name=='txt_ComunaPropietarioUsuario'){
	if(nameComuna=="" && NameRegion == ""){
		alert("Comuna no existe")
		document.formulario.txt_ComunaPropietarioUsuario.value=""
		document.formulario.txt_ComunaPropietarioUsuario.focus()
		document.formulario.ComunaPropietarioUsuario.value=""
		document.formulario.RegionPropietarioUsuario.value=""
	}else{
		document.formulario.RegionPropietarioUsuario.value=NameRegion
		document.formulario.ComunaPropietarioUsuario.value=nameComuna
		//document.formulario.txt_ComunaPropietarioUsuario.value=nameComuna
	}
}		


if(Name=='txt_Comuna2Empresa'){
	if(nameComuna=="" && NameRegion == ""){
		alert("Comuna no existe")
		document.formulario.txt_Comuna2Empresa.value=""
		document.formulario.txt_Comuna2Empresa.focus()
		document.formulario.Comuna2Empresa.value=""
		document.formulario.RegionEmpresa.value=""
	}else{
		document.formulario.RegionEmpresa.value=NameRegion
		document.formulario.Comuna2Empresa.value=nameComuna
		//document.formulario.txt_Comuna2Empresa.value=nameComuna
	}
}		


if(Name=='txt_ComunaPropietarioUsuarioEmp'){
	if(nameComuna=="" && NameRegion == ""){
		alert("Comuna no existe")
		document.formulario.txt_ComunaPropietarioUsuarioEmp.value=""
		document.formulario.txt_ComunaPropietarioUsuarioEmp.focus()
		document.formulario.ComunaPropietarioUsuarioEmp.value=""
		document.formulario.RegionPropietarioUsuarioEmp.value=""
	}else{
		document.formulario.RegionPropietarioUsuarioEmp.value=NameRegion
		document.formulario.ComunaPropietarioUsuarioEmp.value=nameComuna
		//document.formulario.txt_ComunaPropietarioUsuarioEmp.value=nameComuna
	}
}		

}

function SplitFonos(){
		if(document.formulario.codTelefono2Empresa && document.formulario.TelefonoCentralEmpresa){
				if(document.formulario.TelefonoCentralEmpresa.value!=""){
					 var StrFono = document.formulario.TelefonoCentralEmpresa.value
					 StrFono = StrFono.toString(); 
					 if (StrFono.search("-") != -1){
					 		var arrayFono = StrFono.split("-")
					 		document.formulario.codTelefono2Empresa.value=arrayFono[0]
					 		document.formulario.TelefonoCentralEmpresa.value =arrayFono[1]
					 }
				}
		}
	
			if(document.formulario.codTelefonoEmpresa && document.formulario.TelefonoEmpresa){
				if(document.formulario.TelefonoEmpresa.value!=""){
					 var StrFono = document.formulario.TelefonoEmpresa.value
					 StrFono = StrFono.toString(); 
					 if (StrFono.search("-") != -1){
					 		var arrayFono = StrFono.split("-")
					 		document.formulario.codTelefonoEmpresa.value=arrayFono[0]
					 		document.formulario.TelefonoEmpresa.value =arrayFono[1]
					 }
				}
		}
	
	
		if(document.formulario.txtcodtelUsuarioEmp && document.formulario.TelefonoUsuarioEmp){
				if(document.formulario.TelefonoUsuarioEmp.value!=""){
					 var StrFono = document.formulario.TelefonoUsuarioEmp.value
					 StrFono = StrFono.toString(); 
					 if (StrFono.search("-") != -1){
					 		var arrayFono = StrFono.split("-")
					 		document.formulario.txtcodtelUsuarioEmp.value=arrayFono[0]
					 		document.formulario.TelefonoUsuarioEmp.value =arrayFono[1]
					 }
				}
		}
	
	
			if(document.formulario.txtcodtelcomUsuarioEmp && document.formulario.TelefonoCentralUsuarioEmp){
				if(document.formulario.TelefonoCentralUsuarioEmp.value!=""){
					 var StrFono = document.formulario.TelefonoCentralUsuarioEmp.value
					 StrFono = StrFono.toString(); 
					 if (StrFono.search("-") != -1){
					 		var arrayFono = StrFono.split("-")
					 		document.formulario.txtcodtelcomUsuarioEmp.value=arrayFono[0]
					 		document.formulario.TelefonoCentralUsuarioEmp.value =arrayFono[1]
					 }
				}
		}
	

		if(document.formulario.txtCodigoCelularUsuarioEmp && document.formulario.CelularUsuarioEmp){
				if(document.formulario.CelularUsuarioEmp.value!=""){
					 var StrFono = document.formulario.CelularUsuarioEmp.value
					 StrFono = StrFono.toString(); 
					 if (StrFono.search("-") != -1){
					 		var arrayFono = StrFono.split("-")
					 		document.formulario.txtCodigoCelularUsuarioEmp.value=arrayFono[0]
					 		document.formulario.CelularUsuarioEmp.value =arrayFono[1]
					 }
				}
		}	
	
	////////////////////////
		if(document.formulario.txtcodtelUsuario && document.formulario.TelefonoUsuario){
				if(document.formulario.TelefonoUsuario.value!=""){
					 var StrFono = document.formulario.TelefonoUsuario.value
					 StrFono = StrFono.toString(); 
					 if (StrFono.search("-") != -1){
					 		var arrayFono = StrFono.split("-")
					 		document.formulario.txtcodtelUsuario.value=arrayFono[0]
					 		document.formulario.TelefonoUsuario.value =arrayFono[1]
					 }
				}
		}
	
	
			if(document.formulario.txtcodtelcomUsuario && document.formulario.TelefonoCentralUsuario){
				if(document.formulario.TelefonoCentralUsuario.value!=""){
					 var StrFono = document.formulario.TelefonoCentralUsuario.value
					 StrFono = StrFono.toString(); 
					 if (StrFono.search("-") != -1){
					 		var arrayFono = StrFono.split("-")
					 		document.formulario.txtcodtelcomUsuario.value=arrayFono[0]
					 		document.formulario.TelefonoCentralUsuario.value =arrayFono[1]
					 }
				}
		}
	

		if(document.formulario.txtCodigoCelularUsuario && document.formulario.CelularUsuario){
				if(document.formulario.CelularUsuario.value!=""){
					 var StrFono = document.formulario.CelularUsuario.value
					 StrFono = StrFono.toString(); 
					 if (StrFono.search("-") != -1){
					 		var arrayFono = StrFono.split("-")
					 		document.formulario.txtCodigoCelularUsuario.value=arrayFono[0]
					 		document.formulario.CelularUsuario.value =arrayFono[1]
					 }
				}
		}	
	
	
		if(document.formulario.txtcodtel && document.formulario.Telefono){
				if(document.formulario.Telefono.value!=""){
					 var StrFono = document.formulario.Telefono.value
					 StrFono = StrFono.toString(); 
					 if (StrFono.search("-") != -1){
					 		var arrayFono = StrFono.split("-")
					 		document.formulario.txtcodtel.value=arrayFono[0]
					 		document.formulario.Telefono.value =arrayFono[1]
					 }
				}
		}


		if(document.formulario.txtcodtelcom && document.formulario.TelefonoCentral){
				if(document.formulario.TelefonoCentral.value!=""){
					 var StrFono = document.formulario.TelefonoCentral.value
					 StrFono = StrFono.toString(); 
					 if (StrFono.search("-") != -1){
					 		var arrayFono = StrFono.split("-")
					 		document.formulario.txtcodtelcom.value=arrayFono[0]
					 		document.formulario.TelefonoCentral.value =arrayFono[1]
					 }
				}
		}


		if(document.formulario.txtCodigoCelular && document.formulario.Celular){
				if(document.formulario.Celular.value!=""){
					 var StrFono = document.formulario.Celular.value
					 StrFono = StrFono.toString(); 
					 if (StrFono.search("-") != -1){
					 		var arrayFono = StrFono.split("-")
					 		document.formulario.txtCodigoCelular.value=arrayFono[0]
					 		document.formulario.Celular.value =arrayFono[1]
					 }
				}
		}
		
		if(document.formulario.txtNro && document.formulario.DIRECCION){
				if(document.formulario.DIRECCION.value!=""){
					 var StrFono = document.formulario.DIRECCION.value
					 StrFono = StrFono.toString(); 
					 if (StrFono.search("-") != -1){
					 		var arrayFono = StrFono.split("-")
					 		document.formulario.txtNro.value=arrayFono[1]
					 		document.formulario.DIRECCION.value =arrayFono[0]
					 }
				}
		}
		
		if(document.formulario.txtNroUsuario && document.formulario.DIRECCIONUsuario){
				if(document.formulario.DIRECCIONUsuario.value!=""){
					 var StrFono = document.formulario.DIRECCIONUsuario.value
					 StrFono = StrFono.toString(); 
					 if (StrFono.search("-") != -1){
					 		var arrayFono = StrFono.split("-")
					 		document.formulario.txtNroUsuario.value=arrayFono[1]
					 		document.formulario.DIRECCIONUsuario.value =arrayFono[0]
					 }
				}
		}		
		
		
		
		if(document.formulario.txtNroUsuarioEmp && document.formulario.DIRECCIONUsuarioEmp){
				if(document.formulario.DIRECCIONUsuarioEmp.value!=""){
					 var StrFono = document.formulario.DIRECCIONUsuarioEmp.value
					 StrFono = StrFono.toString(); 
					 if (StrFono.search("-") != -1){
					 		var arrayFono = StrFono.split("-")
					 		document.formulario.txtNroUsuarioEmp.value=arrayFono[1]
					 		document.formulario.DIRECCIONUsuarioEmp.value =arrayFono[0]
					 }
				}
		}		

}

			function GetValuesXML(intEntityId,NameObj){
					var AttTo   = ""
					var AttFrom = ""		
					
				//alert(NameObj)	
					
				var NameAdic=""
				if(NameObj=="ComunaPropietario"){
					var AttTo   = "108578"
					var AttFrom = "108557"			
				}

				if(NameObj=="ComunaPropietarioUsuario"){
					var AttTo   = "108578"
					var AttFrom = "108557"			
					NameAdic = "Usuario"
				}

				if(NameObj=="ComunaPropietarioUsuarioEmp"){
					var AttTo   = "108578"
					var AttFrom = "108557"							
					NameAdic = "UsuarioEmp"
				}


				if(NameObj=="Comuna2Empresa"){
					var AttTo   = "108578"
					var AttFrom = "108557"		
					NameAdic = "Empresa"
				}
								
				
				
				if(NameObj=="txt_LocalConc"){
					var AttTo   = "96113"
					var AttFrom = "96113"		
				}
				
				//alert(intEntityId)
									
					if(intEntityId!=""){
						Set_Value_Attribute4(intEntityId,AttFrom,AttTo,1,"",NameAdic)
					}	
			}




			function validateDatosConcesionario(){
				if(document.formulario.txt_LocalConc.value==''){
					alert("Ingrese Local Concesionario")
					document.formulario.txt_LocalConc.focus()
					return false
				}

				if(document.formulario.cboDiaFac.value=="" || document.formulario.cboMesFac.value=="" || document.formulario.cboAnhoFac.value==""){
					alert("Ingrese Fecha Factura")
					return false
				}				
				
				if(document.formulario.txtNombreVendedor.value==''){
					alert("Ingrese Nombre Vendedor")
					document.formulario.txtNombreVendedor.focus()
					return false
				}

				//if(document.formulario.cboDiaEnt.value=="" || document.formulario.cboMesEnt.value=="" || //document.formulario.cboAnhoEnt.value==""){
				//	alert("Ingrese Fecha Entrega")
					//return false
				//}							

					//if(!validaFechaFacEntrega())
					//{
					//	return false}
				
					
					<%if trim(codapp)<>"4" then%>
						if(document.formulario.txtnumfact.value==''){
							alert("Ingrese Número de  Factura")
							document.formulario.txtnumfact.focus()
							return false
						}
					<%end if%>
				return true
			}



			function validatePropietarioCta(){
				if(document.formulario.RUTEmpresa.value==''){
					alert("Ingrese RUC")
					document.formulario.RUTEmpresa.focus()
					return false
				}

//				if(document.formulario.DVEmpresa.value==''){
//					alert("Ingrese digito verificador")
//					document.formulario.DVEmpresa.focus()
//					return false
//				}

				if(document.formulario.NombreEmpresa.value==''){
					alert("Ingrese Razón Social")
					document.formulario.NombreEmpresa.focus()
					return false
				}
														
				if(document.formulario.DireccionEmpresa.value==''){
					alert("Ingrese Calle")
					document.formulario.DireccionEmpresa.focus()
					return false
				}

				if(document.formulario.txtnroEmpresa.value==''){
					alert("Ingrese Número")
					document.formulario.txtnroEmpresa.focus()
					return false
				}
				
				/*
				if(document.formulario.CasaPisoDptoEmpresa.value==''){
					alert("Ingrese Oficina")
					document.formulario.CasaPisoDptoEmpresa.focus()
					return false
				}*/

				if(document.formulario.Comuna2Empresa.value==''){
					alert("Ingrese Comuna")
					document.formulario.txt_Comuna2Empresa.focus()
					return false
				}



				if(document.formulario.codTelefonoEmpresa.value==''){
					alert("Ingrese C.Area Teléfono Principal")
					document.formulario.codTelefonoEmpresa.focus()
					return false
				}


				if(document.formulario.TelefonoEmpresa.value==''){
					alert("Ingrese Teléfono Principal")
					document.formulario.TelefonoEmpresa.focus()
					return false
				}


				if(document.formulario.codTelefono2Empresa.value==''){
					alert("Ingrese C.Area Teléfono Adicional")
					document.formulario.codTelefono2Empresa.focus()
					return false
				}

				if(document.formulario.TelefonoCentralEmpresa.value==''){
					alert("Ingrese Teléfono Adicional")
					document.formulario.TelefonoCentralEmpresa.focus()
					return false
				}

				if(document.formulario.APPATERNOEmpresa.value==''){
					alert("Ingrese Nombre Contacto")
					document.formulario.APPATERNOEmpresa.focus()
					return false
				}

                /*
				if(document.formulario.FonoContactoEmpresa.value==''){
					alert("Ingrese Teléfono Contacto")
					document.formulario.FonoContactoEmpresa.focus()
					return false
				}
				
				if(document.formulario.EMailEmpresa.value==''){
					alert("Ingrese E-mail de Contacto")
					document.formulario.EMailEmpresa.focus()
					return false
				}*/
				
				
				if(!emailCheck (document.formulario.EMailEmpresa)){
					return false
				}
				/*
				if(document.formulario.CelularEmpresa.value==''){
					alert("Ingrese Celular Contacto")
					document.formulario.CelularEmpresa.focus()
					return false
				}								

				if(document.formulario.CelularEmpresa.value==''){
					alert("Ingrese Celular Contacto")
					document.formulario.CelularEmpresa.focus()
					return false
				}		
				*/
				/*
				if(document.formulario.FormaPagoUsuarioEmpresa.selectedIndex==0){
					alert("Seleccione Forma Pago")
					document.formulario.FormaPagoUsuarioEmpresa.focus()
					return false
				}					

				if(document.formulario.SeguroUsuarioEmpresa.value==''){
					alert("Ingrese Seguro")
					document.formulario.SeguroUsuarioEmpresa.focus()
					return false
				}						
				*/
				

				return true
}
			
			function validaLargo(obj){
				var valor=myTrim(obj.value);
			   if(valor.length<2)	
			      return false;
			   else
			   	  return true;
			}

				function myTrim(x) {
				    return x.replace(/^\s+|\s+$/gm,'');
				}
			
			function validatePropietarioPersona(){
				if(document.formulario.txtRut.value==''){
					alert("Ingrese DNI")
					document.formulario.txtRut.focus()
					return false
				}
				
//				if(document.formulario.txtDV.value==''){
//					alert("Ingrese digito verificador")
//					document.formulario.txtDV.focus()
//					return false
//				}

				if(document.formulario.Nombre.value==''){
					alert("Ingrese Nombre")
					document.formulario.Nombre.focus()
					return false
				}
				
				if(!validaLargo(document.formulario.Nombre)){
					alert("Ingrese en Nombre mas de 2 Caracteres")
					document.formulario.Nombre.focus()
					return false
				}
	


				if(document.formulario.APPATERNO.value==''){
					alert("Ingrese Apellido Paterno")
					document.formulario.APPATERNO.focus()
					return false
				}				
				

				if(!validaLargo(document.formulario.APPATERNO)){
					alert("Ingrese en Apellido Paterno mas de 2 Caracteres")
					document.formulario.APPATERNO.focus()
					return false
				}				
				
				if(document.formulario.APMATERNO.value==''){
					alert("Ingrese Apellido Materno")
					document.formulario.APMATERNO.focus()
					return false
				}	
				
				if(!validaLargo(document.formulario.APMATERNO)){
					alert("Ingrese en Apellido Materno mas de 2 Caracteres")
					document.formulario.APMATERNO.focus()
					return false
				}													

				if(document.formulario.DIRECCION.value==''){
					alert("Ingrese Calle de Contacto")
					document.formulario.DIRECCION.focus()
					return false
				}						

				if(!validaLargo(document.formulario.DIRECCION)){
					alert("Ingrese en Calle de Contacto mas de 2 Caracteres")
					document.formulario.DIRECCION.focus()
					return false
				}	


				if(document.formulario.txtNro.value==''){
					alert("Ingrese Número")
					document.formulario.txtNro.focus()
					return false
				}						

				//if(document.formulario.Dpto.value==''){
				//	alert("Ingrese Departamento")
				//	document.formulario.Dpto.focus()
				//	return false
				//}			
				
				if(document.formulario.txt_ComunaPropietario.value==''){
					alert("Ingrese Comuna")
					document.formulario.txt_ComunaPropietario.focus()
					return false
				}						

				if(document.formulario.txtcodtel.value==''){
					alert("Ingrese C.Area Teléfono Particular")
					document.formulario.txtcodtel.focus()
					return false
				}				
				
				if(document.formulario.Telefono.value==''){
					alert("Ingrese Teléfono Particular")
					document.formulario.Telefono.focus()
					return false
				}				

				if(document.formulario.txtcodtelcom.value==''){
					alert("Ingrese C.Area Teléfono Comercial")
					document.formulario.txtcodtelcom.focus()
					return false
				}				
				
				if(document.formulario.TelefonoCentral.value==''){
					alert("Ingrese Teléfono Comercial")
					document.formulario.TelefonoCentral.focus()
					return false
				}		
				
				if(!emailCheck (document.formulario.EMail)){
					return false
				}

				if(document.formulario.EstadoCivil.selectedIndex==0){
					alert("Seleccione Estado Civil")
					document.formulario.EstadoCivil.focus()
					return false
				}	

				if(!document.formulario.SexoPropietario[0].checked && !document.formulario.SexoPropietario[1].checked){
					alert("Seleccione Sexo Propietario")
					document.formulario.SexoPropietario[0].focus()
					return false
				}	
				
				/*
				if(document.formulario.cboDiaNac.selectedIndex==0 || document.formulario.cboMesNac.selectedIndex==0 || document.formulario.cboAnhoNac.selectedIndex==0){
					alert("Seleccione Fecha Nacimiento")
					document.formulario.cboDiaNac[0].focus()
					return false
				}	
				*/				

				if(document.formulario.cboDiaNac.value=='' || document.formulario.cboMesNac.value=='' || document.formulario.cboAnhoNac.value==''){
					alert("Ingrese Fecha Nacimiento")
					document.formulario.cboDiaNac.focus()
					return false
				}						
				
//				if(parseInt(document.formulario.cboAnhoNac.value)<1911 || parseInt(document.formulario.cboAnhoNac.value)>1991){
//						alert("Fecha Nacimiento Incorrecta")
//						document.formulario.cboAnhoNac.focus()
//						return false
//				}
				/*
				if(document.formulario.FormaPagoUsuario.selectedIndex==0){
					alert("Seleccione Forma Pago")
					document.formulario.FormaPagoUsuario.focus()
					return false
				}					

				if(document.formulario.SeguroUsuario.value==''){
					alert("Ingrese Seguro")
					document.formulario.SeguroUsuario.focus()
					return false
				}						
				*/
								
				return true
			}

			function validateUsuarioPersona(){
				if(document.formulario.txtRutUsuario.value==''){
					alert("Ingrese DNI Usuario")
					document.formulario.txtRutUsuario.focus()
					return false
				}	

				if(document.formulario.NombreUsuario.value==''){
					alert("Ingrese Nombre Usuario")
					document.formulario.NombreUsuario.focus()
					return false
				}

				if(document.formulario.APPATERNOUsuario.value==''){
					alert("Ingrese Apellido Paterno Usuario")
					document.formulario.APPATERNOUsuario.focus()
					return false
				}				
				
				if(document.formulario.APMATERNOUsuario.value==''){
					alert("Ingrese Apellido Materno Usuario")
					document.formulario.APMATERNOUsuario.focus()
					return false
				}							

				if(document.formulario.DIRECCIONUsuario.value==''){
					alert("Ingrese Calle de Contacto Usuario")
					document.formulario.DIRECCIONUsuario.focus()
					return false
				}						

				if(document.formulario.txtNroUsuario.value==''){
					alert("Ingrese Número Usuario")
					document.formulario.txtNroUsuario.focus()
					return false
				}				
				
				if(document.formulario.txt_ComunaPropietarioUsuario.value==''){
					alert("Ingrese Comuna Usuario")
					document.formulario.txt_ComunaPropietarioUsuario.focus()
					return false
				}						

				if(document.formulario.txtcodtelUsuario.value==''){
					alert("Ingrese C.Area Teléfono Particular Usuario")
					document.formulario.txtcodtelUsuario.focus()
					return false
				}				
				
				if(document.formulario.TelefonoUsuario.value==''){
					alert("Ingrese Teléfono Particular Usuario")
					document.formulario.TelefonoUsuario.focus()
					return false
				}				

				if(document.formulario.txtcodtelcomUsuario.value==''){
					alert("Ingrese C.Area Teléfono Comercial Usuario")
					document.formulario.txtcodtelcomUsuario.focus()
					return false
				}				
				
				if(document.formulario.TelefonoCentralUsuario.value==''){
					alert("Ingrese Teléfono Comercial Usuario")
					document.formulario.TelefonoCentralUsuario.focus()
					return false
				}		
				
				if(!emailCheck (document.formulario.EMailUsuario)){
					return false
				}
				

				if(document.formulario.EstadoCivilUsuario.selectedIndex==0){
					alert("Seleccione Estado Civil Usuario")
					document.formulario.EstadoCivilUsuario.focus()
					return false
				}	

				if(!document.formulario.SexoPropietarioUsuario[0].checked && !document.formulario.SexoPropietarioUsuario[1].checked){
					alert("Seleccione Sexo Propietario Usuario")
					document.formulario.SexoPropietarioUsuario[0].focus()
					return false
				}	
				
				if(document.formulario.cboDiaNacUsuario.value=='' || document.formulario.cboMesNacUsuario.value==''|| document.formulario.cboAnhoNacUsuario.value==''){
					alert("Seleccione Fecha Nacimiento Usuario")
					document.formulario.cboDiaNacUsuario.focus()
					return false
				}					
				var ct = new Date();
//				if(parseInt(document.formulario.cboAnhoNacUsuario.value)<1911 || (parseInt(ct.getYear()) - parseInt(document.formulario.cboAnhoNacUsuario.value)) >=  18){
//						alert("Fecha Nacimiento Incorrecta");
//						//document.formulario.cboAnhoNacUsuario.focus();
//						return false;
//				}
								
				return true
			}



			function validateUsuarioEmpresa(){
				if(document.formulario.txtRutUsuarioEmp.value==''){
					alert("Ingrese RUC Usuario")
					document.formulario.txtRutUsuarioEmp.focus()
					return false
				}
				
//				if(document.formulario.txtDVUsuarioEmp.value==''){
//					alert("Ingrese digito verificador Usuario")
//					document.formulario.txtDVUsuarioEmp.focus()
//					return false
//				}

				if(document.formulario.NombreUsuarioEmp.value==''){
					alert("Ingrese Nombre Usuario")
					document.formulario.NombreUsuarioEmp.focus()
					return false
				}

				if(document.formulario.APPATERNOUsuarioEmp.value==''){
					alert("Ingrese Apellido Paterno Usuario")
					document.formulario.APPATERNOUsuarioEmp.focus()
					return false
				}				
				
				if(document.formulario.APMATERNOUsuarioEmp.value==''){
					alert("Ingrese Apellido Materno Usuario")
					document.formulario.APMATERNOUsuarioEmp.focus()
					return false
				}							

				if(document.formulario.DIRECCIONUsuarioEmp.value==''){
					alert("Ingrese Calle de Contacto Usuario")
					document.formulario.DIRECCIONUsuarioEmp.focus()
					return false
				}						

				if(document.formulario.txtNroUsuarioEmp.value==''){
					alert("Ingrese Número Usuario")
					document.formulario.txtNroUsuarioEmp.focus()
					return false
				}						

				/*
				if(document.formulario.CasaPisoDptoUsuarioEmp.value==''){
					alert("Ingrese Departamento Usuario")
					document.formulario.CasaPisoDptoUsuarioEmp.focus()
					return false
				}			
				*/
				
				if(document.formulario.txt_ComunaPropietarioUsuarioEmp.value==''){
					alert("Ingrese Comuna Usuario")
					document.formulario.txt_ComunaPropietarioUsuarioEmp.focus()
					return false
				}						

				if(document.formulario.txtcodtelUsuarioEmp.value==''){
					alert("Ingrese C.Area Teléfono Particular Usuario")
					document.formulario.txtcodtelUsuarioEmp.focus()
					return false
				}				
				
				if(document.formulario.TelefonoUsuarioEmp.value==''){
					alert("Ingrese Teléfono Particular Usuario")
					document.formulario.TelefonoUsuarioEmp.focus()
					return false
				}				

				if(document.formulario.txtcodtelcomUsuarioEmp.value==''){
					alert("Ingrese C.Area Teléfono Comercial Usuario")
					document.formulario.txtcodtelcomUsuarioEmp.focus()
					return false
				}				
				
				if(document.formulario.TelefonoCentralUsuarioEmp.value==''){
					alert("Ingrese Teléfono Comercial Usuario")
					document.formulario.TelefonoCentralUsuarioEmp.focus()
					return false
				}		

			
				if(!emailCheck (document.formulario.EMailUsuarioEmp)){
					return false
				}
		

				if(document.formulario.EstadoCivilUsuarioEmp.selectedIndex==0){
					alert("Seleccione Estado Civil Usuario")
					document.formulario.EstadoCivilUsuarioEmp.focus()
					return false
				}	

				if(!document.formulario.SexoPropietarioUsuarioEmp[0].checked && !document.formulario.SexoPropietarioUsuarioEmp[1].checked){
					alert("Seleccione Sexo Propietario Usuario")
					document.formulario.SexoPropietarioUsuarioEmp[0].focus() 
					return false
				}	
				
				if(document.formulario.cboDiaNacUsuarioEmp.value=='' || document.formulario.cboMesNacUsuarioEmp.value==''|| document.formulario.cboAnhoNacUsuarioEmp.value==''){
					alert("Seleccione Fecha Nacimiento Usuario")
					document.formulario.cboDiaNacUsuarioEmp.focus()
					return false
				}					

//				if(parseInt(document.formulario.cboAnhoNacUsuarioEmp.value)<1911 || parseInt(document.formulario.cboAnhoNacUsuarioEmp.value)>1991){
//						alert("Fecha Nacimiento Incorrecta")
//						document.formulario.cboAnhoNacUsuarioEmp.focus()
//						return false
//				}
								
				return true
			}		
			

    //::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    //::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


			function Save(){
							
			    if (document.formulario.ingresomant.value == "117459")   //no
			    {
				        //alert(fecha)	
				        var fecha = "<%=Date()%>";
				        //alert(fecha)	
                        // Pasamos la fecha a javascript
				        //var dtFC = new Date(fecha);	
				        var arrayfec = fecha.split('/');
				        var fff = new Date(arrayfec[0] + "/" + arrayfec[1] + "/" + arrayfec[2]);
				        var dtFC = new Date(fff);	
				        //alert(dtFC)				
				        //var dtFC = new Date();
								
				        var dtFE = new Date(document.formulario.cboMesEnt.value + "/" + document.formulario.cboDiaEnt.value + "/" + document.formulario.cboAnhoEnt.value)
				        //alert(dtFC)
				        //alert(dtFE)
				        if (dateDiff("d",dtFC,dtFE, 0, 0)>0)
				        {
					        alert("Fecha Entrega no debe superar a la actual");
					        return;
				        }	
				        if (dateDiff("d",dtFC,dtFE, 0, 0)<-2)
				        {
					        alert("Fecha Entrega no debe ser menor de 2 días a la actual");
					        return;
				        }
				
				        var dtFF = new Date(document.formulario.cboMesFac.value + "/" + document.formulario.cboDiaFac.value + "/" + document.formulario.cboAnhoFac.value)
   
				        if (dateDiff("d",dtFC,dtFF, 0, 0)>0)
				        {
					        alert("Fecha factura debe ser igual a hoy o anterior");
					        return;
				        }	
						
				        //if (dateDiff("d",dtFC,dtFF, 0, 0)<-184)  validacion anterior de 6 meses
				        if (dateDiff("d",dtFC,dtFF, 0, 0)<-3)
				        {
							//alert(dtFC)
							//alert(dtFF)
							//alert(dateDiff("d",dtFC,dtFF, 0, 0))
					        //alert("Fecha factura no debe ser menor a 6 meses");
					        alert("Fecha factura no debe ser menor a 3 dias");
					        return;
				        }
                }
      
      	        var dtFF = new Date(document.formulario.cboMesFac.value + "/" + document.formulario.cboDiaFac.value + "/" + document.formulario.cboAnhoFac.value);
				var ffac;
				ffac = document.formulario.fecfac.value;
				//alert(ffac)
				var arrayfac = ffac.split('-');
				//alert((arrayfac[1] + "/" + arrayfac[0] + "/" + arrayfac[2]))
				var fffac = new Date(arrayfac[1] + "/" + arrayfac[2] + "/" + arrayfac[0]);
				//alert(dtFF + '<' + fffac)
				
				if (dtFF < fffac){
					alert("Fecha de factura a cliente debe ser superior a la fecha de factura del Dealer")
					return;
				}
				
				var dtFE = new Date(document.formulario.cboMesEnt.value + "/" + document.formulario.cboDiaEnt.value + "/" + document.formulario.cboAnhoEnt.value);
				var ffac;
				ffac = document.formulario.fecfac.value;
				var arrayfac = ffac.split('/');
				var fffac = new Date(arrayfac[1] + "/" + arrayfac[0] + "/" + arrayfac[2]);
				if (dtFE < fffac){
					alert("Fecha de Entrega de vehículo debe ser superior a la fecha de factura del Dealer")
					return;
				}

			
				if(document.formulario.IdVehiculo.value==''){
					alert("Busque vehiculo.")
					document.formulario.NumChasis.focus()
					return
				}
				
				if(document.formulario.IdTab[0].checked){
					if(!validatePropietarioPersona()){
						return false
					}	
					if(!validateUsuarioPersona()){
						return false
					}	
					DisabledPropietarioUsuario(false);
				}			

				if(document.formulario.IdTab[1].checked){
					if(!validatePropietarioCta()){
						return false
					}	
					

					if(!validateUsuarioEmpresa()){
						return false
					}						
					
				}				
				
				if(document.formulario.IdTab[2].checked){
					if(!validatePropietarioCta()){
						return false
					}	
					

					if(!validateUsuarioEmpresa()){
						return false
					}						
					
				}				

					if(!validateDatosConcesionario()){
						return false
					}						
				
				if(document.formulario.SexoPropietario){
					document.formulario.SexoPropietario[0].value = "117494"
					document.formulario.SexoPropietario[1].value = "117493"
				}
				
				if(document.formulario.SexoPropietarioUsuario){
					document.formulario.SexoPropietarioUsuario[0].value = "117494"
					document.formulario.SexoPropietarioUsuario[1].value = "117493"
				}	

				if(document.formulario.SexoPropietarioUsuarioEmp){
					document.formulario.SexoPropietarioUsuarioEmp[0].value = "117494"
					document.formulario.SexoPropietarioUsuarioEmp[1].value = "117493"
				}	
				//alert("save")
				//return false
				//desactiva el boton INGRESAR
				document.getElementById("div_boton_ingresar").style.display="none"
								
				document.formulario.submit()
			}
			


    //::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    //::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


			function execfuncVehiculo(id,chasis,motor,NumCupon,marca,local,fecha){
					//alert("<%=ucase(trim(marca_aux))%>")
					//alert(NumCupon)
						//if(marca!=""){
								if("<%=ucase(trim(marca_aux))%>"!=marca){
									alert("Vehiculo pertenece a otra marca." + "<%=ucase(trim(marca_aux))%>" + "asd " + marca)
									//alert("<%=ucase(trim(AppDesc))%> - " + marca)
									document.formulario.VINvehiculo.value = ""			
									document.formulario.Color.value = ""			
									document.formulario.ModeloCorto.value = ""			
									document.formulario.Patente.value = ""						
									document.formulario.IdVehiculo.value = ""			
						  			document.getElementById('a1a1a1').style.display='none'
						  			document.getElementById('a2a2a2').style.display='none'						
									//document.formulario.a1a1a1.style.display='none'		
									//document.formulario.a2a2a2.style.display='none'	
									return
								}
						//}		

					if(NumCupon=="")
						NumCupon = 0 
						
					if(NumCupon>0){
						alert("Vehículo ya posee cupón. \n Informado por: " + local + " con fecha: " + fecha);
						//if (marca=="CH"){
							alert("Para solicitar anulación haga click en la pestaña de Anulacion en Dealer Online");
						//	}
						//if (marca=="SS"){
						//	alert("Para solicitar anulación haga click en la pestaña de Anulacion en Dealer Online");
						//	}
						//if (marca=="NW"){
						//	alert("Para solicitar anulación haga click en la pestaña de Anulacion en Dealer Online");
						//	}
						//if (marca=="MM"){
						//	alert("Para solicitar anulación haga click en la pestaña de Anulacion en Dealer Online");
						//	}
						//if (marca=="IT"){
						//	alert("Para solicitar anulación haga click en la pestaña de Anulacion en Dealer Online");
						//	}
						document.formulario.VINvehiculo.value = ""			
						document.formulario.Color.value = ""			
						document.formulario.ModeloCorto.value = ""			
						document.formulario.Patente.value = ""						
						document.formulario.IdVehiculo.value = ""	
						//document.formulario.a1a1a1.style.display='none'		
						//document.formulario.a2a2a2.style.display='none'		
			  			document.getElementById('a1a1a1').style.display='none'
			  			document.getElementById('a2a2a2').style.display='none'						
						return
					}else{
						document.formulario.IdVehiculo.value = id
						//document.formulario.NumChasis.value = chasis
						document.formulario.NumChasis.value = document.formulario.VINvehiculo.value
						document.formulario.txtNroMotor.value = motor
				  }	
				  
				  //var StrModelo = document.formulario.ModeloCorto.value
				  
				  //if(StrModelo.search('canter')==-1 && StrModelo.search('CANTER')==-1){
				  //		document.getElementById('a1a1a1').style.display='none'
				  //		document.getElementById('a2a2a2').style.display='none'
						//document.formulario.a1a1a1.style.display='none'		
						//document.formulario.a2a2a2.style.display='none'		

					//}else{
				  //		document.getElementById('a1a1a1').style.display='block'
				  //		document.getElementById('a2a2a2').style.display='block'
						//document.formulario.a1a1a1.style.display='block'		
						//document.formulario.a2a2a2.style.display='block'		
				//	}
			}


			function execfuncRutCta(id,rut){	
				
					if(rut!=""){
						//var arrayRut=rut.split('-')
						if(document.formulario.RUTEmpresa)	document.formulario.RUTEmpresa.value = rut
						//if(document.formulario.RUTEmpresa)	document.formulario.RUTEmpresa.value = arrayRut[0]
						//if(document.formulario.DVEmpresa)	document.formulario.DVEmpresa.value  = arrayRut[1]
					}				
					
					document.formulario.IdCtaEmpresa.value=id
					
					//SetFechaCombobox(1)
					SplitFonos()					
					DisabledEmpresaCta(false)
			}
			
			
			function execfuncRutUsuario(id,rut){	
				
					if(rut!=""){
						//var arrayRut=rut.split('-')
						if(document.formulario.txtRutUsuario)	document.formulario.txtRutUsuario.value = rut
						//if(document.formulario.txtRutUsuario)	document.formulario.txtRutUsuario.value = arrayRut[0]
						//if(document.formulario.txtDVUsuario)	document.formulario.txtDVUsuario.value  = arrayRut[1]
					}				
					
					document.formulario.IdUsuarioPropietaria.value=id
					if(id==""){
							var TemptxtRutUsuario =	document.formulario.txtRutUsuario.value
							//var TemptxtDVUsuario  =	document.formulario.txtDVUsuario.value
									
				  		    DisabledPropietarioUsuario(false)
							document.formulario.chkCopiarDatos.checked=false
							fncCopiarDatos()		
							document.formulario.IdUsuarioPropietaria.value=""		  		
							document.formulario.txtRutUsuario.value = TemptxtRutUsuario
							//document.formulario.txtDVUsuario.value  = TemptxtDVUsuario
				  }

				  SetFechaCombobox(1)
				  SplitFonos()
				  
				  if(document.formulario.txtRut.value==document.formulario.txtRutUsuario.value)	
				    {
							document.formulario.chkCopiarDatos.checked=true
							fncCopiarDatos()		
							document.formulario.IdUsuarioPropietaria.value=""		  
				  	}
				  	else
				  	{
				  		DisabledPropietarioUsuario(false)
					}
					
					<%if trim(StrRutU)<>"" then%>
					    DisabledPropietarioUsuario(false)
					<%end if%>
					
			}
				
			
			function execfuncRutUsuarioEmp(id,rut){
					if(rut!=""){
						//var arrayRut=rut.split('-')
						if(document.formulario.txtRutUsuarioEmp)	document.formulario.txtRutUsuarioEmp.value = rut
						//if(document.formulario.txtRutUsuarioEmp)	document.formulario.txtRutUsuarioEmp.value = arrayRut[0]
						//if(document.formulario.txtDVUsuarioEmp)	document.formulario.txtDVUsuarioEmp.value    = arrayRut[1]
					}				
					
					document.formulario.IdUsuarioCtaEmpresa.value=id
					SetFechaCombobox(1)
					SplitFonos()					
					DisabledEmpresaUsuario(false)
					

			}	

			function execfuncRut(id,rut){
				
					if(rut!=""){
						//var arrayRut=rut.split('-')
						if(document.formulario.txtRut)	document.formulario.txtRut.value=rut
						//if(document.formulario.txtRut)	document.formulario.txtRut.value=arrayRut[0]
						//if(document.formulario.txtDV)	document.formulario.txtDV.value		=arrayRut[1]
					}
					document.formulario.IdPersonaPropietaria.value=id
					
					SetFechaCombobox(1)
					SplitFonos()
					DisabledPropietarioPersona(false)
					
			}

			function SetFechaCombobox(accion){
					if(document.formulario.FechaNacimiento.value!=""){
						var FechaNac = document.formulario.FechaNacimiento.value.replace("/","-").replace("/","-")
						//alert(FechaNac + "  " + accion)
						var ArrayFechaNac = FechaNac.split(" ")
						FechaNac = ArrayFechaNac[0]
						var ArrayFechaNac = FechaNac.split("-")					


						if(accion==1){
							//Dia
							selFecha(document.formulario.cboDiaNac,ArrayFechaNac[0])
							//Mes
							selFecha(document.formulario.cboMesNac,ArrayFechaNac[1])
							//Año
							selFecha(document.formulario.cboAnhoNac,ArrayFechaNac[2])
							
							document.formulario.FechaNacimiento.value = ArrayFechaNac[0] + "/" + ArrayFechaNac[1] + "/" + ArrayFechaNac[2]
							
							fncQuitarColor(document.formulario.cboDiaNac)
							fncQuitarColor(document.formulario.cboMesNac)
							fncQuitarColor(document.formulario.cboAnhoNac)
							
						}

						if(accion==2){
							//Dia
							selFecha(document.formulario.cboDiaNac,ArrayFechaNac[0])
							//Mes
							selFecha(document.formulario.cboMesNac,ArrayFechaNac[1])
							//Año
							selFecha(document.formulario.cboAnhoNac,ArrayFechaNac[2])
							
							document.formulario.FechaNacimiento.value = ArrayFechaNac[0] + "/" + ArrayFechaNac[1] + "/" + ArrayFechaNac[2]
							
							fncQuitarColor(document.formulario.cboDiaNac)
							fncQuitarColor(document.formulario.cboMesNac)
							fncQuitarColor(document.formulario.cboAnhoNac)							
						}
					}
					
					
					//FechaNacimientoUsuario
					if(document.formulario.FechaNacimientoUsuario.value!=""){
						var FechaNac = document.formulario.FechaNacimientoUsuario.value.replace("/","-").replace("/","-")
						var ArrayFechaNac = FechaNac.split(" ")
						FechaNac = ArrayFechaNac[0]
						var ArrayFechaNac = FechaNac.split("-")


						if(accion==1){
							//Dia
							selFecha(document.formulario.cboDiaNacUsuario,ArrayFechaNac[0])
							//Mes
							selFecha(document.formulario.cboMesNacUsuario,ArrayFechaNac[1])
							//Año
							selFecha(document.formulario.cboAnhoNacUsuario,ArrayFechaNac[2])

							document.formulario.FechaNacimientoUsuario.value = ArrayFechaNac[0] + "/" + ArrayFechaNac[1] + "/" + ArrayFechaNac[2]

							fncQuitarColor(document.formulario.cboDiaNacUsuario)
							fncQuitarColor(document.formulario.cboMesNacUsuario)
							fncQuitarColor(document.formulario.cboAnhoNacUsuario)							
						}

						if(accion==2){
							//Dia
							selFecha(document.formulario.cboDiaNacUsuario,ArrayFechaNac[0])
							//Mes
							selFecha(document.formulario.cboMesNacUsuario,ArrayFechaNac[1])
							//Año
							selFecha(document.formulario.cboAnhoNacUsuario,ArrayFechaNac[2])
							
							document.formulario.FechaNacimientoUsuario.value = ArrayFechaNac[0] + "/" + ArrayFechaNac[1] + "/" + ArrayFechaNac[2]
							
							fncQuitarColor(document.formulario.cboDiaNacUsuario)
							fncQuitarColor(document.formulario.cboMesNacUsuario)
							fncQuitarColor(document.formulario.cboAnhoNacUsuario)							
							
						}
					}					
					

					//FechaNacimientoUsuarioEmp
					if(document.formulario.FechaNacimientoUsuarioEmp.value!=""){
						var FechaNac = document.formulario.FechaNacimientoUsuarioEmp.value.replace("/","-").replace("/","-")
						var ArrayFechaNac = FechaNac.split(" ")
						FechaNac = ArrayFechaNac[0]
						var ArrayFechaNac = FechaNac.split("-")


						if(accion==1){
							//Dia
							selFecha(document.formulario.cboDiaNacUsuarioEmp,ArrayFechaNac[0])
							//Mes
							selFecha(document.formulario.cboMesNacUsuarioEmp,ArrayFechaNac[1])
							//Año
							selFecha(document.formulario.cboAnhoNacUsuarioEmp,ArrayFechaNac[2])
							
							document.formulario.FechaNacimientoUsuarioEmp.value = ArrayFechaNac[1] + "/" + ArrayFechaNac[0] + "/" + ArrayFechaNac[2]
							
							fncQuitarColor(document.formulario.cboDiaNacUsuarioEmp)
							fncQuitarColor(document.formulario.cboMesNacUsuarioEmp)
							fncQuitarColor(document.formulario.cboAnhoNacUsuarioEmp)							
							
						}

						if(accion==2){
							//Dia
							selFecha(document.formulario.cboDiaNacUsuarioEmp,ArrayFechaNac[0])
							//Mes
							selFecha(document.formulario.cboMesNacUsuarioEmp,ArrayFechaNac[1])
							//Año
							selFecha(document.formulario.cboAnhoNacUsuarioEmp,ArrayFechaNac[2])
							
							document.formulario.FechaNacimientoUsuarioEmp.value = ArrayFechaNac[0] + "/" + ArrayFechaNac[1] + "/" + ArrayFechaNac[2]
							
							fncQuitarColor(document.formulario.cboDiaNacUsuarioEmp)
							fncQuitarColor(document.formulario.cboMesNacUsuarioEmp)
							fncQuitarColor(document.formulario.cboAnhoNacUsuarioEmp)
						}
					}										
					
					
					if(document.formulario.FechaFactura.value!=""){
							var FechaNac = document.formulario.FechaFactura.value.replace("/","-").replace("/","-")
							var ArrayFechaNac = FechaNac.split(" ")
							FechaNac = ArrayFechaNac[0]
							var ArrayFechaNac = FechaNac.split("-")
					
							//Dia
							selFecha(document.formulario.cboDiaFac,ArrayFechaNac[0])
							//Mes
							selFecha(document.formulario.cboMesFac,ArrayFechaNac[1])
							//Año
							selFecha(document.formulario.cboAnhoFac,ArrayFechaNac[2])		
							
							document.formulario.FechaFactura.value = ArrayFechaNac[0] + "/" + ArrayFechaNac[1] + "/" + ArrayFechaNac[2]
							
							fncQuitarColor(document.formulario.cboDiaFac)
							fncQuitarColor(document.formulario.cboMesFac)
							fncQuitarColor(document.formulario.cboAnhoFac)
							
							validaFechaFacEntrega()			
					}

					
					if(document.formulario.FechaEntrega.value!=""){
							var FechaNac = document.formulario.FechaEntrega.value.replace("/","-").replace("/","-")
							var ArrayFechaNac = FechaNac.split(" ")
							FechaNac = ArrayFechaNac[0]
							var ArrayFechaNac = FechaNac.split("-")
					
							//Dia
							selFecha(document.formulario.cboDiaEnt,ArrayFechaNac[0])
							//Mes
							selFecha(document.formulario.cboMesEnt,ArrayFechaNac[1])
							//Año
							selFecha(document.formulario.cboAnhoEnt,ArrayFechaNac[2])	
							
							document.formulario.FechaEntrega.value = ArrayFechaNac[0] + "/" + ArrayFechaNac[1] + "/" + ArrayFechaNac[2]
							
							fncQuitarColor(document.formulario.cboDiaEnt)
							fncQuitarColor(document.formulario.cboMesEnt)
							fncQuitarColor(document.formulario.cboAnhoEnt)							
							//validaFechaFacEntrega()				
					}
					
			}
			
			function selFecha(obj,valor){	
			if(!obj)
			    return
			
				valor = valor.toString(); 
				obj.value=valor
				/*
				if(valor=='01') valor='1'
				if(valor=='02') valor='2'
				if(valor=='03') valor='3'
				if(valor=='04') valor='4'
				if(valor=='05') valor='5'
				if(valor=='06') valor='6'
				if(valor=='07') valor='7'
				if(valor=='08') valor='8'
				if(valor=='09') valor='9'
				
				for (i=0; i < obj.length; i++){
					if(obj[i].value==valor){
						obj.selectedIndex=i
						break
					}
				}*/
			}
			
			function GetValuesVehiculo(accion){
					var NumChasis = document.formulario.NumChasis.value
					var txtNroMotor = document.formulario.txtNroMotor.value
					var marcatxt = document.formulario.Marcatxt.value
					if(document.formulario.txtCampoM){
						var txtCampoM = document.formulario.txtCampoM.value
					}else{
						var txtCampoM = ""
					}
					
					if (accion==1){
						if(NumChasis=="" && txtNroMotor=="" && txtCampoM==""){
							alert("Ingrese Nº Vin o Nº Motor para realizar la busqueda.")
							return
						}
						
						if(NumChasis!=""){
							if(NumChasis.length<7){
									alert("Ingrese mínimo 7 caracteres en campo Nº Vin.")
									return
							}		
						}

						if(txtNroMotor!=""){
							if(txtNroMotor.length<5){
									alert("Ingrese mínimo 5 caracteres en campo Nº Motor.")
									return
							}		
						}
						
					}else{
							NumChasis = ""
							txtNroMotor = ""
							if(txtCampoM==""){
								alert("Ingrese Campo M.")
								return								
							}
							
						if(txtCampoM!=""){
							if(txtCampoM.length<5){
									alert("Ingrese mínimo 5 caracteres en campo M.")
									return
							}		
						}							
							
					}
	
					//if (marcatxt == "MM"){
					//window.open("asp/Search_VehiculoMM.asp?txtCampoM="+txtCampoM+"&NumChasis="+NumChasis+"&txtNroMotor="+txtNroMotor,"Busqueda","toolbar=no,location=no,status=yes,menubar=no,scrollbars=no,resizable=no,top=250,left=350,width=350,height=250");
					//}
					//else
					//{
					window.open("asp/Search_Vehiculo.asp?txtCampoM="+txtCampoM+"&NumChasis="+NumChasis+"&txtNroMotor="+txtNroMotor+"&login=" + document.formulario.login.value,"Busqueda","toolbar=no,location=no,status=yes,menubar=no,scrollbars=no,resizable=no,top=250,left=350,width=350,height=250");
				  //}
				  //window.open("asp/Search_Vehiculo.asp?txtCampoM="+txtCampoM+"&NumChasis="+NumChasis+"&txtNroMotor="+txtNroMotor+"&login=" + document.formulario.login.value,"Busqueda","toolbar=no,location=no,status=yes,menubar=no,scrollbars=no,resizable=no,top=250,left=350,width=350,height=250");
		
			
				/*
					var AttTo   = "84959,96297,91238,88466"
					var AttFrom = "84945,85535,84950,85054"

					var NumChasis = document.formulario.NumChasis.value
					var txtNroMotor = document.formulario.txtNroMotor.value

					if(NumChasis=="" && txtNroMotor=="" && txtCampoM==""){
						alert("Ingrese Nº Chasis o Nº Motor para realizar la busqueda.")
						return
					}
					Set_Value_Attribute2(NumChasis,txtNroMotor,AttFrom,AttTo,"1","parent.execfuncVehiculo('*x*','*y*','*z*','*w*','*v*','*a*','*b*')")
				*/
			}
			
			function GetValuesVehiculoVIN(vin){			
					//document.formulario.fecfac.value = fecfac;
					//alert("HOLA")
					var AttTo   = "108547,108560,108561,108563,108565"
					var AttFrom = "108541,108559,108542,108562,108564"
					Set_Value_Attribute2("","",vin,AttFrom,AttTo,"4","parent.execfuncVehiculo('*x*','*y*','*z*','*w*','*v*','*a*','*b*')")
			}
			
			
			function Set_Value_Attribute2(valor1,valor2,valor3,attsFrom,attTo,Num,Func){
			
				//var ObjIframe=eval("document.frames['FrameTempLoad"+Num+"']");
				document.getElementById('FrameTempLoad' + Num).src="../../../h2_sales/aspx/Set_Value_Attribute2.aspx?accion=1&vin="+valor3+"&chasis="+valor1+"&motor="+valor2+"&attsFrom="+attsFrom+"&attTo="+attTo+"&Func="+Func
			//alert(ObjIframe.location.href);parent.
			}

			function Set_Value_Attribute3(rut,attsFrom,attTo,Num,Func,NameObj,Numx){
				var ObjIframe=eval("document.all.FrameTempLoad"+Num)
				ObjIframe.src="../../../h2_sales/aspx/Set_Value_Attribute2.aspx?accion=2&rut="+rut+"&attsFrom="+attsFrom+"&attTo="+attTo+"&NameObj="+NameObj+"&Func="+Func+"&Numx="+Numx
			}
			
			function Set_Value_Attribute5(namecomuna,attsFrom,attTo,Num,Func){
				var ObjIframe=eval("document.all.FrameTempLoad"+Num)
					ObjIframe.src="../../../h2_sales/aspx/Set_Value_Attribute2.aspx?accion=3&namecomuna="+namecomuna+"&attsFrom="+attsFrom+"&attTo="+attTo+"&Func="+Func
			}			

			function Set_Value_Attribute4(id,attsFrom,attTo,Num,Func,NameObj){
				var ObjIframe=eval("document.all.FrameTempLoad"+Num)
				ObjIframe.src="../../../h2_sales/aspx/Set_Value_Attribute2.aspx?accion=0&idEntity="+id+"&attsFrom="+attsFrom+"&attTo="+attTo+"&NameObj="+NameObj+"&Func="+Func
			}


			function GetValuesClienteEmpresa(NameObj){
					var AttTo   = "108566,108569,108571,108577,108572,108585,108575,108577,108567,108661,108574,108573,108570"
					var AttFrom = "108566,108569,108571,108577,108572,108585,108575,108577,108567,108661,108574,108573,108570"

				if(NameObj==""){
					if(document.formulario.RUTEmpresa.value==""){
						alert("Ingrese RUT Empresa")
						document.formulario.RUTEmpresa.focus();
						return
					}

					if(document.formulario.RUTEmpresa.value.length != 11){
						alert("RUC debe poseer 11 digitos")
						document.formulario.RUTEmpresa.focus();
						return;
					}


					//strAux = document.formulario.RUTEmpresa.value + ' - ' + document.formulario.DVEmpresa.value;
					strAux = document.formulario.RUTEmpresa.value;
					if (!checkRUTsep(strAux))
					{
						document.formulario.RUTEmpresa.focus();
						return;
					}
					
					//if (document.formulario.DVEmpresa.value!="")
					//	rut = document.formulario.RUTEmpresa.value + "-" + document.formulario.DVEmpresa.value
					//else
						rut = document.formulario.RUTEmpresa.value
						
						NameObj="Empresa"
						
				}else{
					
						if(document.formulario.txtRutUsuario.value==""){
							alert("Ingrese DNI Persona")
							document.formulario.txtRutUsuario.focus();
							return
						}
	
						//if(document.formulario.txtDVUsuario.value==""){
						//	alert("Ingrese Digito verificador Persona")
						//	document.formulario.txtDVUsuario.focus();
						//	return
						//}
	
	
						//strAux = document.formulario.txtRutUsuario.value + ' - ' + document.formulario.txtDVUsuario.value;
						strAux = document.formulario.txtRutUsuario.value;
						if (!checkRUTsep(strAux))
						{
							document.formulario.txtRutUsuario.focus();
							return;
						}
						
						
						//if (document.formulario.txtDVUsuario.value!="")
						//	rut = document.formulario.txtRutUsuario.value + "-" + document.formulario.txtDVUsuario.value
						//else
							rut = document.formulario.txtRutUsuario.value
					}


					Set_Value_Attribute3(rut,AttFrom,AttTo,"5","parent.execfuncRutCta('*x*','*y*')",NameObj,"1")
			}


			function GetValuesClientePersona(NameObj){
			//alert(NameObj)
					var AttTo   = "108566,108567,108568,108569,108570,108571,108572,108573,108574,108576,108578,108580,108582,108584,108585"
					var AttFrom = "108566,108567,108568,108569,108570,108571,108572,108573,108574,108575,108577,108579,108581,108583,108585"
				

				if(NameObj==""){
					NameFunc=""
					if(document.formulario.txtRut.value==""){
						alert("Ingrese DNI Persona")
						document.formulario.txtRut.focus();
						return
					}

					if (document.formulario.txtRut.value.length != 8)
					{
						alert("DNI requiere largo de 8 dígitos");
						document.formulario.txtRut.focus();
						return;
					}

					//strAux = document.formulario.txtRut.value + ' - ' + document.formulario.txtDV.value;
					strAux = document.formulario.txtRut.value;
					if (!checkRUTsep(strAux))
					{
						document.formulario.txtRut.focus();
						return;
					}
					
					
					//if (document.formulario.txtDV.value!="")
					//	rut = document.formulario.txtRut.value + "-" + document.formulario.txtDV.value
					//else
						rut = document.formulario.txtRut.value
					//
					}
				else{
					
						if(NameObj=="UsuarioEmp"){
							if(document.formulario.txtRutUsuarioEmp.value==""){
								alert("Ingrese DNI Persona")
								document.formulario.txtRutUsuarioEmp.focus();
								return
							}
		
							//if(document.formulario.txtDVUsuarioEmp.value==""){
							//	alert("Ingrese Digito verificador Persona")
							//	document.formulario.txtDVUsuarioEmp.focus();
							//	return
							//}
		
		
							//strAux = document.formulario.txtRutUsuarioEmp.value + ' - ' + document.formulario.txtDVUsuarioEmp.value;
							strAux = document.formulario.txtRutUsuarioEmp.value;
							//if(document.formulario.IdCupon.value==''){
								if (!checkRUTsep(strAux))
								{
									document.formulario.txtRutUsuarioEmp.focus();
									return;
								}
							//}	
							
							
							//if (document.formulario.txtDVUsuarioEmp.value!="")
							//	rut = document.formulario.txtRutUsuarioEmp.value + "-" + document.formulario.txtDVUsuarioEmp.value
							//else
								rut = document.formulario.txtRutUsuarioEmp.value
						}else{					
					
					
								if(document.formulario.txtRutUsuario.value==""){
									alert("Ingrese DNI Persona")
									document.formulario.txtRutUsuario.focus();
									return
								}
								
								if (document.formulario.txtRutUsuario.value.length != 8)
								{
									alert("DNI requiere largo de 8 dígitos");
									document.formulario.txtRutUsuario.focus();
									return;
								}
			
								//if(document.formulario.txtDVUsuario.value==""){
								//	alert("Ingrese Digito verificador Persona")
								//	document.formulario.txtDVUsuario.focus();
								//	return
								//}
			
			
								//strAux = document.formulario.txtRutUsuario.value + ' - ' + document.formulario.txtDVUsuario.value;
								strAux = document.formulario.txtRutUsuario.value;
								if (!checkRUTsep(strAux))
								{
									document.formulario.txtRutUsuario.focus();
									return;
								}
								
								
								//if (document.formulario.txtDVUsuario.value!="")
								//	rut = document.formulario.txtRutUsuario.value + "-" + document.formulario.txtDVUsuario.value
								//else
									rut = document.formulario.txtRutUsuario.value				
						}				
					}

					if(NameObj==""){
						Set_Value_Attribute3(rut,AttFrom,AttTo,"1","parent.execfuncRut('*x*','*y*')",NameObj,"0")
					}
					
					if(NameObj=="Usuario"){
						Set_Value_Attribute3(rut,AttFrom,AttTo,"2","parent.execfuncRutUsuario('*x*','*y*')",NameObj,"0")
					}

					if(NameObj=="UsuarioEmp"){
						Set_Value_Attribute3(rut,AttFrom,AttTo,"3","parent.execfuncRutUsuarioEmp('*x*','*y*')",NameObj,"0")
					}

			}
			
function checkDV(rut) {
	largo = rut.length;
	if (largo < 2)
	{
		alert("El largo del DNI no puede ser tan corto!");
		return false; 
	}

	dv = rut.charAt(largo-1);

	if ( largo > 2 ){
		rut = rut.substring(0, largo - 1);
	}else{
		rut = rut.charAt(0);
	}
	checkTipoDV(dv);

	if (rut == null || dv == null){
		alert("Ingreso un DNI invalido!");
		return false;	
	}
	var dvr = '0'
	suma = 0
	mul  = 2
	for (i= rut.length -1 ; i >= 0; i--)
	{
		suma = suma + rut.charAt(i) * mul
		if (mul == 7)
			mul = 2
		else    
			mul++
	}
	res = suma % 11
	if (res==1){
		dvr = 'K'
	}else if (res==0){
		dvr = '0'
	}else{
		dvi = 11-res
		dvr = dvi + ""
	}
	if (dvr != dv.toUpperCase())
	{
		alert("El digito verificador no concuerda con el DNI!");
		return false 
	}
	return true 
}


function checkTipoDV(dv) {
	dv = dv + ""
	if (dv != '0' && dv != '1' && dv != '2' && dv != '3' && dv != '4' && dv != '5' && dv != '6' && dv != '7' && dv != '8' && dv != '9' && dv != 'k'  && dv != 'K')
	{
		alert("El caracter del digito verificador es invalido!");
		return false; 
	}
	return true; 
}


function fnSetearCalendario(opt)
{

    var a = 0;
	if (opt == 1)
	{
	    a = document.formulario.txtFechaDesde.value % 100;
	    document.formulario.dia.value = a;
		a = ((document.formulario.txtFechaDesde.value - a) / 100) % 100;
	    document.formulario.mes.value = a;
		a = (document.formulario.txtFechaDesde.value - document.formulario.mes.value * 100 - document.formulario.dia.value) / 10000;
		document.formulario.ano.value = a;
	}
}			
			
		
function checkRUTsep(texto)
{/*
	if(texto == ""){
		alert("El texto del DNI esta vacio!");
		return false; 
	}
	var tmpstr = "";
	for ( i=0; i < texto.length ; i++ ){
		if ( texto.charAt(i) != ' ' && texto.charAt(i) != '.' && texto.charAt(i) != '-' ){
			tmpstr = tmpstr + texto.charAt(i);
		}
	}
	texto = tmpstr;
	largo = texto.length;
	for (i=0; i < largo-1; i++)
	{	
		if(texto.charAt(i) !="0" && texto.charAt(i) != "1" && texto.charAt(i) !="2" && texto.charAt(i) != "3" && texto.charAt(i) != "4" && texto.charAt(i) !="5" && texto.charAt(i) != "6" && texto.charAt(i) != "7" && texto.charAt(i) !="8" && texto.charAt(i) != "9") 
		{
			alert("Caracteres invalidos en el DNI!");
			return false;
		}
	}
	if(texto.charAt(largo-1) !="0" && texto.charAt(largo-1) != "1" && texto.charAt(largo-1) !="2" && texto.charAt(largo-1) != "3" && texto.charAt(largo-1) != "4" && texto.charAt(largo-1) !="5" && texto.charAt(largo-1) != "6" && texto.charAt(largo-1) != "7" && texto.charAt(largo-1) !="8" && texto.charAt(largo-1) != "9" && texto.charAt(largo-1) !="k" && texto.charAt(largo-1) != "K") 
	{
		alert("Caracteres invalidos en el DNI!");
		return false; 
	}
	
	var dtexto = "";
	for (i=0; i<largo-1; i++){
		dtexto = dtexto + texto.charAt(i);
	}

	if (dtexto <= 40000 || 999999999 < dtexto)
	{
		alert("El DNI debe ser mayor que 40.000 y menor igual que 999.999.999xx!");
		return false;
	}
	
	if(!checkDV(texto)){
		return false; 
	}*/
	return true; 
}			

    function Imprimir_Cupon(id,tipo){
    //CONSULTA POR EL TIPO DE PROPIETARIO
    
    //PERSONA
    if (tipo == 107956)
        {
        window.open('../../../h2_sales/aspx/Merge_PDF2.aspx?idmerg=2154144&intExportEntityType=1516194&lngExportEntityId='+id);
        }	
          
    //EMPRESA
    if (tipo == 107957)
        {
        window.open('../../../h2_sales/aspx/Merge_PDF2.aspx?idmerg=2157391&intExportEntityType=1516194&lngExportEntityId='+id);
        }	    

    //LEASING
    if (tipo == 112904)
        {
        window.open('../../../h2_sales/aspx/Merge_PDF2.aspx?idmerg=2263877&intExportEntityType=1516194&lngExportEntityId='+id);
        }	    
    }

function AbrirWin(){
		window.open('../../../h2_sales/aspx/Merge_PDF2.aspx?idmerg=2154144&intExportEntityType=1516194&lngExportEntityId=2156684')
}

// ################# FUNCIONES PARA TEXT_COMPLETE JG #################
function buscarVendedor(Obj)
				{
					if(window.event.keyCode == 32){
						return;
					}
					var nom='';
					nom = Obj.value;
					nom = nom.toLowerCase();
					document.formulario.lookup_asigna.value ='';				
					nom = nom.replace("á","a");
					nom = nom.replace("é","e");
					nom = nom.replace("í","i");
					nom = nom.replace("ó","o");
					nom = nom.replace("ú","u");				
					document.formulario.txtNombreVendedor.value =  nom.toUpperCase();
					if (nom.length >= 5){
							Mostrar();
							var texto = ''
							if (Obj)
							{
								texto = nom.toUpperCase();
								rutconcesionario = document.formulario.rutconcesionario.value;
							}
							var idlocal
							idlocal=document.formulario.rutconcesionario.value
							
							var StrIframeVal = 'document.all.pagsEjecutivoas.src'
							StrIframe = 'document.all.pagsEjecutivoas.src="Vendedores.aspx?txt_AsignadoResolver=' + texto + '&rutconcesionario=' + rutconcesionario + '&idlocal=' + idlocal + '"'
		        	eval(StrIframe)
					}else{
						Oculta();
					}
					Obj.focus();
				}
				
function Mostrar()
				{
					MM_showHideLayers('document.layers["DDtxt_Ejecutivoas"]','document.all["DDtxt_Ejecutivoas"]','show');
					document.all.txtNombreVendedor.focus();
				}

function HideAll(NL){
			 var Alldivs,StrDiv
			 Alldivs = document.getElementsByTagName('DIV')
			 for(i=0; i<Alldivs.length;i++){
			     StrDiv = Alldivs[i].id
			     StrDiv = StrDiv.substr(0, 2)
			     if(StrDiv=='DD'&& Alldivs[i].id != NL){
			         Alldivs[i].style.visibility = "hidden"
			     }
			 }
			} 
			
			
			function  desbloquea()
				{
				
				document.formulario.Nombre.disabled=false;
				document.formulario.txtNro.disabled=false;
				document.formulario.APPATERNO.disabled=false;
				document.formulario.CasaPisoDpto.disabled=false;
				document.formulario.APMATERNO.disabled=false;
				document.formulario.txt_ComunaPropietario.disabled=false;
				document.formulario.RegionPropietario.disabled=false;
				document.formulario.EstadoCivil.disabled=false;
				document.formulario.cboDiaNac.disabled=false;
				document.formulario.cboMesNac.disabled=false;
				document.formulario.cboAnhoNac.disabled=false;
				document.formulario.SexoPropietario[0].disabled=false;
				document.formulario.SexoPropietario[1].disabled=false;
				document.formulario.FechaNacimiento.disabled=false;
				document.formulario.txtcodtel.disabled=false;
				document.formulario.Telefono.disabled=false;
				document.formulario.txtcodtelcom.disabled=false;
				document.formulario.TelefonoCentral.disabled=false;
				document.formulario.Celular.disabled=false;
				document.formulario.txtCodigoCelular.disabled=false;
				document.formulario.EMail.disabled=false;
				
				}
			
			
function Oculta()
			{
				HideAll('DDtxt_Ejecutivo')
				MM_showHideLayers('document.layers["DDtxt_Ejecutivo"]','document.all["DDtxt_Ejecutivo"]','hide');
			}

function MostrarFormularioNuevo()
			{
				var Nuevo = document.formulario.Lookup_Asigna.value;
				if (Nuevo == '')
				{
					//document.getElementById('NuevoEmail').style.display = "block";
				}
			}	
function trim(obj) 
{ 
	var sString = obj.value;
	if (sString != '' ){
		while (sString.substr(0,1) == ' ') 
		{ 
			sString = sString.substr(1, sString.length); 
		} 
		while (sString.substr(sString.length-1, sString.length) == ' ') 
		{ 
			sString = sString.substr(0,sString.length-1); 
		} 
		return sString; 
	}
	else
	{
		return sString;
	}
}
// ################# FUNCIONES PARA TEXT_COMPLETE JG #################
	
</script>
	<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 8px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.textos_p {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	font-style: normal;
	line-height: normal;
	font-weight: normal;
	font-variant: normal;
	text-transform: none;
	color: 4c4b4b;
}
.textos_titulo {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-style: normal;
	line-height: normal;
	font-weight: normal;
	font-variant: normal;
	text-transform: none;
	color: 4c4b4b;
}

.borde1 {
    font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: #000000;
	border: 1px solid #e1e1e1;
	background-color:#f8f8a1;
}

.borde1ConValor {font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: #000000;
	border: 1px solid #c6c6c6;
	background-color:#ffffff;
}

.borde21 {font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: #656262;
}
.style5 {font-family: Arial, Helvetica, sans-serif; font-size: 10px; font-style: normal; line-height: normal; font-weight: normal; font-variant: normal; text-transform: none; color: #4c4b4b; }
.style6 {color: #E1E1E1}
.borde2 {font-family: Arial, Helvetica, sans-serif; font-size: 10px; color: #000000; border: 1px solid #e3e3e3;	background-color:#e3e3e3;}
.borde3 {font-family: Arial, Helvetica, sans-serif; font-size: 10px; color: #000000; border: 1px solid #FFFFFF;	background-color:#FFFFFF;}

.style7 {color: #c1c6c2}
-->
</style>
	
</head>


<body  topmargin="0" leftmargin="0" onload="javascript:DisabledPropietarioPersona(true);DisabledPropietarioUsuario(false);DisabledEmpresaUsuario(false);DisabledEmpresaCta(true);DisabledDatosConcesionario(false);CargaDatos()">
<form name="formulario" method="post" action="asp/SaveCupon.asp">
<!--<a href="javascript:AbrirWin()">Imprimir Cupón</a>-->
<input type="hidden" name="IdCupon" id="IdCupon" value="<%=IdCupon%>">
<input type="hidden" name="IdVehiculo" id="IdVehiculo" value="<%=IdVehiculo%>">
<input type="hidden" name="IdPersonaPropietaria" id="IdPersonaPropietaria" value="">
<input type="hidden" name="IdUsuarioPropietaria" id="IdUsuarioPropietaria" value="">
<input type="hidden" name="ModeloResumen" id="ModeloResumen">
<input type="hidden" name="IdCtaEmpresa" id="IdCtaEmpresa" value="">
<input type="hidden" name="IdUsuarioCtaEmpresa" id="IdUsuarioCtaEmpresa" value="">
<input type="hidden" name="type_entity" id="type_entity" value="1817935">
<input type="hidden" name="login" id="login" value="<%=login%>">
<input type="hidden" name="txtOptCal" id="txtOptCal">
<input type="hidden" name="txtFechaDesde" id="txtFechaDesde" value="">
<input type="hidden" name="NombreConcesionario" id="NombreConcesionario" value="<%=NombreConcesionario%>">
<input type="hidden" name="Ciudad" id="Ciudad">
<input type="hidden" name="RUTCUpon" id="RUTCUpon" value=<%=RUTCUpon%> >
<input type="hidden" name="Marcatxt" id="Marcatxt" value="<%=marca_aux%>" >
<input type="hidden" name="ingresomant" id="ingresomant" value="<%=ingresomant%>">


<p class="textos_titulo" align="center"><B>CUPÓN DE GARANTÍA</B></p>
<table width="654" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="650" height="66" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="e3e3e3" bgcolor="f3f2f2">
      <tr>
        <td colspan="5" align="center" valign="middle"><table width="625" height="57" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="e3e3e3">
            <tr>
              <td height="57" colspan="3" align="left" valign="middle">


				<%if trim(marca_aux)="AR" then%>
					<img src="../images_menu/logo_ar.jpg" width="93" height="54" />
					<input type="hidden" name="marcaGrupo" id="marcaGrupo" value="117478">
				<%elseif trim(marca_aux)="IT" then%>
					<img src="../images_menu/logo_it.jpg" width="93" height="54" />
					<input type="hidden" name="marcaGrupo" id="marcaGrupo" value="117474">
				<%elseif trim(marca_aux)="NW" then%>
					<img src="../images_menu/logo_chery.gif" width="93" height="54" />
					<input type="hidden" name="marcaGrupo" id="marcaGrupo" value="117475">
				<%elseif trim(marca_aux)="SP" then%>
					<img src="../images_menu/logo_mg.jpg" width="93" height="54" />
					<input type="hidden" name="marcaGrupo" id="marcaGrupo" value="117476">
				<%elseif trim(marca_aux)="KP" then%>
					<img src="../images_menu/logo_kia.jpg" width="93" height="54" />
					<input type="hidden" name="marcaGrupo" id="marcaGrupo" value="117477">
				<%elseif trim(marca_aux)="MM" then%>
					<img src="../images_menu/logo_MM.jpg" width="93" height="54" />
					<input type="hidden" name="marcaGrupo" id="marcaGrupo" value="117878">
				<%elseif trim(marca_aux)="PE" then%>
					<img src="../images_menu/logos_Peugeot.png" width="93" height="54" />
					<input type="hidden" name="marcaGrupo" id="marcaGrupo" value="117905">
				<%elseif trim(marca_aux)="FS" then%>
					<img src="../images_menu/logos_Fuso.png" width="93" height="54" />
					<input type="hidden" name="marcaGrupo" id="marcaGrupo" value="117943">

				<%end if%>&nbsp;
    
                </td>
              <td width="18" height="57" align="center" valign="middle">&nbsp;</td>
              <td width="514" height="57" align="left" valign="top"><table width="514" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="17" align="right" valign="bottom"><span class="textos_p">Puede ingresar s&oacute;lo los &uacute;ltimos d&iacute;gitos del Chasis o Motor para buscar</span></td>
                  </tr>
                  <tr>
                    <td height="12"><img src="images_form/linea_sp.gif" width="514" height="12" /></td>
                  </tr>
                  <tr>
                    <td height="28" align="left" valign="top"><table width="514" height="28" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="78" height="28" align="left" valign="middle"><span class="textos_p">Ingrese N&deg; VIN </span></td>
                          <td width="109" height="28" align="left" valign="middle"><span class="borde21">
                            <input type="text" class="borde1" id="NumChasis" name="NumChasis" size="20" maxlength="20" value="<%=Chasis%>" />
                          </span></td>
                          <td width="11" height="28" align="left" valign="middle">&nbsp;</td>
                          <td width="98" height="28" align="center" valign="middle" class="textos_p">Ingrese N&deg; Motor</td>
                          <td width="109" height="28" align="left" valign="middle"><span class="borde21">
                            <input type="text" class="borde1" id="txtNroMotor" name="txtNroMotor" size="20" maxlength="20" value="<%=Motor%>" />
                          </span></td>
                          <td width="20" height="28" align="left" valign="middle">&nbsp;</td>
                          <td width="92" height="28" align="left" valign="middle"><a href="#" onClick="GetValuesVehiculo(1)" style="cursor:pointer"><img src="images_form/buscar.gif" name="BM" id="BM" width="91" height="20" border="0" /></a></td>
                        </tr>
											<%if trim(Marca_aux)="MM" then%>
                    		<tr>
                    			<td width="98" height="28" align="left" valign="middle" class="textos_p">Ingrese COD M</td>
                          <td width="109" height="28" align="left" valign="middle"><span class="borde21">
                            <input type="text" class="borde1" name="txtCampoM" id="txtCampoM" size="20" maxlength="20" value="<%=M%>" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);"/>
                          </span></td>
                    			
                    		</tr>
                    	<%end if%>
                    </table></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  
<tr>
    <td height="5"><img src="images_form/espacio.gif" width="11" height="5"/></td>
</tr>

  <tr>
    <td><table width="650" height="44" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="e3e3e3">
      <tr>
        <td height="22" colspan="5" align="left" valign="middle" bgcolor="cfded5" class="textos_p"><table width="646" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="7" align="left" valign="middle">&nbsp;</td>
            <td width="643" align="left" valign="middle" class="textos_p">DATOS VEHICULO</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" colspan="5" align="left" valign="middle">
        
        <table width="646" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="23" valign="middle" class="textos_p">VIN</td>
            <td width="72" valign="middle"><span class="borde21">
              <input type="text" class="borde3" size="30" readonly name="VINvehiculo" id="VINvehiculo" maxlength="20" value="<%=VinVehiculo%>"/>
            </span></td>
            <td width="34" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
            <td width="51" valign="middle" class="textos_p">MODELO</td>
            <td width="72" valign="middle"><span class="borde21">
              <input type="text" class="borde3" size="50" readonly name="modelo2" id="modelo2" value="<%=MODELO%>"/>
            </span></td>
            <td width="79" align="center" valign="middle" class="textos_p"></td>
            </tr>
            
            <tr>
            
            <td width="8" valign="middle">&nbsp;</td>
            <td width="23" valign="middle" class="textos_p">COLOR</td>
            <td width="72" valign="middle"><span class="borde21">
              <input type="text" class="borde3" size="50" readonly name="color" id="color"  maxlength="25" value="<%=COLOR%>"/>
            </span></td>
            <td width="34" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
            <td width="51" valign="middle" class="textos_p">PLACA</td>
            <td width="72" valign="middle"><span class="borde21"><input type="text" name="patente" id="patente" class="borde3" value="<%=PATENTE%>" size="8" maxlength="7" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
              <b id="a1a1a1" style="display:none">MODIFICADO</b><input style="display:none" type="checkbox" name="a2a2a2" id="a2a2a2">
            </span></td>
            <td width="79" align="center" valign="middle" class="textos_p">ej. LS-1716</td>
          </tr>
        </table>
        
        </td>
      </tr>
    </table></td>
  </tr>

    <tr>
        <td height="5"><img src="images_form/espacio.gif" width="11" height="5"/></td>
    </tr>

  <tr>
    <td><table width="650" height="22" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="e3e3e3">
      <tr>
        <td height="22" colspan="5" align="left" valign="middle"><table width="640" height="22" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="8" align="left" valign="middle">&nbsp;</td>
            <td width="200" align="left" valign="middle" class="textos_p">SELECCIONE PROPIETARIO</td>
            <td width="7" align="center" valign="middle">&nbsp;</td>
            <td width="450" align="right" valign="middle">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="20" align="left" valign="middle"><label><input name="IdTab" id="IdTab" type="radio" onclick="javascript:fncCambiarFicha(1);fncQuitarColor(document.formulario.IdTab[0]);fncQuitarColor(document.formulario.IdTab[1]);fncQuitarColor(document.formulario.IdTab[2]);" value="1" class="borde1"/></label></td>
                <td width="150" align="left" valign="middle" class="textos_p" id="tabPersona">CLIENTE PERSONA </td>
								<td width="20" align="left" valign="middle"><input name="IdTab" id="IdTab" type="radio" onclick="javascript:fncCambiarFicha(2);;fncQuitarColor(document.formulario.IdTab[0]);fncQuitarColor(document.formulario.IdTab[1]);fncQuitarColor(document.formulario.IdTab[2]);" value="2" class="borde1"/></td>
                <td width="150" align="left" valign="middle" class="textos_p" id="tabEmpresa" >CLIENTE EMPRESA  </td>
								<td width="20" align="left" valign="middle"><input style="display:none;" name="IdTab" id="IdTab" type="radio" onclick="javascript:fncCambiarFicha(3);;fncQuitarColor(document.formulario.IdTab[0]);fncQuitarColor(document.formulario.IdTab[1]);fncQuitarColor(document.formulario.IdTab[2]);" value="3" class="borde1"/></td>
                <td width="150" align="left" valign="middle" class="textos_p" id="Td1" ><!--LEASING BANCO  --></td>

              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>

    
        <!--<tr name="tablePersona_ESPACE" id="tablePersona_ESPACE" style="display:none">
            <td height="5"><img src="images_form/espacio.gif" width="11" height="5"></td>
        </tr>-->
        <tr><td><table  style="display:none" name="tablePersona_ESPACE" id="tablePersona_ESPACE">
  	<tr><td height="5"><img src="images_form/espacio.gif" width="11" height="5" /></td></table></td>
        </tr>

    <!--////////////////////////////////////////////PERSONA/////////////////////////////////////////////////////-->	
    <!-- Datos Propietario -->

  <tr>
    <td valign="top">
    <table name="tablePersona" id="tablePersona" style="display:none" width="650" height="44" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="e3e3e3">
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="cfded5" class="textos_p"><table width="646" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="7" align="left" valign="middle">&nbsp;</td>
            <td width="643" align="left" valign="middle" class="textos_p">DATOS PROPIETARIO PERSONA NATURAL (Due&ntilde;o del veh&iacute;culo)</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="f1f5f2"><table width="640" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="105" valign="middle" class="textos_p">DNI</td>
            <td width="214" valign="middle"><table width="146" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="79" align="left" valign="middle">
                	<span class="borde21">
                  	<input tabindex="101" type="text" class="borde1" name="txtRut" id="txtRut" size="8" maxlength="8" value="<%=StrRutSD%>" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);"/>
                	</span>
                </td>
                <!--<td width="11" align="left" valign="middle"><span class="style6">-</span></td>-->
                <!--<td width="29" align="left" valign="middle">
                	<span class="borde21">
                		<input onchange="javascript:GetValuesClientePersona('')" type="text" name="txtDV" class="borde1" size="1" size="1" maxlength="1" value="<%=StrRutDV%>" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);"/>
                	</span>
                </td>-->
                <td width="29" align="right" valign="middle"><a href="javascript:GetValuesClientePersona('')" name="Lupa" id="Lupa"  alt="Buscar Ruc"><img src="images_form/lupa.png" width="25" height="22" border="0" /></a></td>
              </tr>
            </table></td>
            <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
            <td width="5" align="center" valign="middle">&nbsp;</td>
            <td width="125" valign="middle" class="textos_p">Direcci&oacute;n de Contacto</td>
            <td width="176" valign="middle" class="textos_p"><span class="borde21">
            <input tabindex="102" type="text" class="borde1" name="DIRECCION" id="DIRECCION" maxlength="50" value="" size="30" disabled onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);" onchange="javascript:replicaInfo(this)">
            </span></td>
            </tr>
        </table></td>
      </tr>

      <tr>
        <td height="22" align="left" valign="middle" bgcolor="f1f5f2"><table width="640" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="105" valign="middle" class="textos_p">Nombre</td>
            <td width="214" valign="middle"><span class="borde21">
              <input tabindex="103" name="Nombre" id="Nombre" size="30" maxlength="50" value="" disabled onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);" onchange="javascript:replicaInfo(this)" onkeyup="validaSoloTexto(this)" class="borde1" size="35" />
            </span></td>
            <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
            <td width="5" align="center" valign="middle">&nbsp;</td>
            <td width="125" valign="middle" class="textos_p">N&deg;</td>
            <td width="176" valign="middle" class="textos_p"><span class="borde21">
            <input tabindex="104" type="text" class="borde1" name="txtNro" id="txtNro" size="5" maxlength="5" value ="" disabled onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);" onchange="javascript:replicaInfo(this)">
            </span></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="f1f5f2"><table width="640" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="105" valign="middle" class="textos_p">Apellido Paterno</td>
            <td width="214" valign="middle"><span class="borde21">
                <input tabindex="105" type="text" id="APPATERNO" name="APPATERNO" class="borde1" size="30" maxlength="30" value="" disabled onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);" onchange="javascript:replicaInfo(this)" onkeyup="validaSoloTexto(this)">
            </span></td>
            <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
            <td width="5" align="center" valign="middle">&nbsp;</td>
            <td width="125" valign="middle" class="textos_p">Apartamento</td>
            <td width="176" valign="middle" class="textos_p"><span class="borde21">
                <input tabindex="106" type="text" class="borde1" name="CasaPisoDpto" id="CasaPisoDpto" size="5" maxlength="5" value = "" disabled onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);" onchange="javascript:replicaInfo(this)">
            </span></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="f1f5f2"><table width="640" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="105" valign="middle" class="textos_p">Apellido Materno</td>
            <td width="214" valign="middle"><span class="borde21">
                <input tabindex="107" type="text" name="APMATERNO" id="APMATERNO" class="borde1" size="30" maxlength="30" value="" disabled onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);" onchange="javascript:replicaInfo(this)" onkeyup="validaSoloTexto(this)">
            </span></td>
            <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md2.gif" width="3" height="17" /></td>
            <td width="5" align="center" valign="middle">&nbsp;</td>
            <td width="125" valign="middle" class="textos_p">Distrito</td>
            <td width="176" valign="middle" class="textos_p"><table width="96" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="65" align="left" valign="middle"><span class="borde21">
										   <DIV STYLE="position:relative"> 
											<!--<input type="text" class="cajaTextoCupon" name="ComunaPropietario" size="25" maxlength="30" value = "" disabled onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">&nbsp;-->
											<input type="hidden" name="hdn_ComunaPropietario" id="hdn_ComunaPropietario" value="">
											<input type="hidden" name="hdn_ComunaPropietario_nlookup" id="hdn_ComunaPropietario_nlookup" value="ComunaPropietario">
											<input type="hidden" name="id_type_entity_ComunaPropietario" id="id_type_entity_ComunaPropietario" value="1817045">
											<!--<input type="text" class="borde1" value="" name="txt_ComunaPropietario" id="txt_ComunaPropietario" size="25" maxlength="25" class="flbs" tabindex="1" onblur="javascript:replicaInfo(this);BuscaComunaXX(this,document.formulario.selectInput)" AUTOCOMPLETE="OFF" >-->
											<input type="text" class="borde1" value="" name="txt_ComunaPropietario" id="txt_ComunaPropietario" size="25" maxlength="25" class="flbs" tabindex="1" AUTOCOMPLETE="OFF" >
											<input type="hidden" name="ComunaPropietario" id="ComunaPropietario" value="">

                                            <SELECT id=selectInput NAME=selectInput SIZE=8 STYLE="display:none; position:absolute; top:20px; left:0px"   ONBLUR="this.style.display='none';BuscaComuna(document.formulario.selectInput,document.formulario.txt_ComunaPropietario)"  ONCHANGE="comboselect_onchange(this, this.form.txt_ComunaPropietario);" ONKEYUP="comboselect_onkeyup(event.keyCode, this, this.form.txt_ComunaPropietario)">  
                                            <!--#include file="INC_Comuna.aspx"-->	
                                            </SELECT>  
						        </DIV>	                
                                </span></td>
                <td width="4" align="left" valign="middle">&nbsp;</td>
                <td width="27" align="left" valign="middle"><a href="javascript:EntitySearchLookupobj2('ComunaPropietario','','','1817940','')"><img src="images_form/lupa.png" width="25" height="22" border="0" /></a></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="f1f5f2"><table width="640" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="105" valign="middle" class="textos_p">Estado Civil </td>
            <td width="214" valign="middle"><span class="borde21">
			    <select  tabindex="107" style="width=90" name="EstadoCivil" id="EstadoCivil" onchange="javascript:replicaInfo(this)"  disabled class="borde1">
				    <option value="">Seleccione</option>	
				    <option value="117491">Soltero</option>	
				    <option value="117492">Casado</option>
				    <option value="117613">Separado</option>	
				    <option value="117614">Viudo</option>
			    </select>
            </span></td>
            <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md2.gif" width="3" height="17" /></td>
            <td width="5" align="center" valign="middle">&nbsp;</td>
            <td width="125" valign="middle" class="textos_p">Provincia</td>
            <td width="176" valign="middle" class="textos_p"><table width="80" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="80" align="left" valign="middle"><span class="borde21">
                    <input  type="text" class="borde1" name="RegionPropietario" id="RegionPropietario" size="30" maxlength="30" value = "" readonly  onchange="javascript:replicaInfo(this)">
                  </span></td>
                  </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="f1f5f2"><table width="640" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="105" valign="middle" class="textos_p">Fecha de Nacimiento </td>
            <td width="214" valign="middle"><table width="167" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="40" align="left" valign="middle"><span class="borde21">
                    <input type="hidden" id="FechaNacimiento" name="FechaNacimiento" value="">
                    <input onchange="javascript:replicaInfo(this);validafechaSeparada(1)" type="text" id="cboDiaNac"  name="cboDiaNac" class="borde1" size="2" maxlength="2">
                  </span></td>
                  <td width="11" align="left" valign="middle"><span class="style6">-</span></td>
                  <td width="40" align="left" valign="middle"><span class="borde21">
                    <input type="text" onchange="javascript:replicaInfo(this);validafechaSeparada(1)" id="cboMesNac" name="cboMesNac" class="borde1" size="2" maxlength="2">
                  </span></td>
                  <td width="12" align="left" valign="middle"><span class="style6">-</span></td>
                  <td width="40" align="left" valign="middle"><span class="borde21">
                  <input type="text" onchange="javascript:replicaInfo(this);validafechaSeparada(1)" id="cboAnhoNac" name="cboAnhoNac" class="borde1" size="4" maxlength="4">
                  </span></td>
                  <td width="11" align="right" valign="middle">&nbsp;</td>
                  <td width="23" align="right" valign="middle">
                  <div name="fecha1" id="fecha1" style="position:absolute; visibility:hidden" ></div>
                  <a HREF="javascript:ShowCalendar('FechaNacimiento')"><img src="images_form/calendro.gif" alt="Ver Calendario" width="21" height="18" border="0" name="imagen"/></a>
                    <input type="hidden" name="date_FechaNacimiento" id="date_FechaNacimiento" value="dd/mm/yyyy">
                    <input type="hidden" name="timestamp_FechaNacimiento" id="timestamp_FechaNacimiento" value="">
                  </td>
                </tr>
            </table></td>
            <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
            <td width="5" align="center" valign="middle">&nbsp;</td>
            <td width="125" valign="middle" class="textos_p">Sexo</td>
            <td width="176" valign="middle" class="textos_p"><table width="170" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="20" align="left" valign="middle"><label>
                    <input tabindex="109" type="radio" onclick="javascript:replicaInfo(this)" name="SexoPropietario" id="SexoPropietario" value="117494">
                  </label></td>
                  <td width="65" align="left" valign="middle" class="textos_p">Masculino </td>
                  <td width="20" align="left" valign="middle"><input type="radio" onclick="javascript:replicaInfo(this)" name="SexoPropietario" id="SexoPropietario" value="117493"></td>
                  <td width="65" align="left" valign="middle" class="textos_p">Femenino </td>
                </tr>
            	</table>
            </td>
          </tr>
        </table>
       </td>
      </tr>
      
      <%if trim(marca_aux)="AR" then%>
      <tr>
	      <td height="35" align="left" valign="middle" bgcolor="f1f5f2">
	      	<table width="640" border="0" cellspacing="0" cellpadding="0">
      			<tr>
      				<td width="8" valign="middle">&nbsp;</td>
      				<td width="100" valign="middle" class="textos_p">Cantidad de Hijos</td>
            	<td width="176" valign="middle" class="textos_p">
            		<table width="300" border="0" cellspacing="0" cellpadding="0">
               		<tr>
                 		<td width="20" align="left" valign="middle">
                 			<label>
                   			<input type="radio" name="RangoHijos" id="RangoHijos" value="113312">
                 			</label>
                 		</td>
                 		<td width="65" align="left" valign="middle" class="textos_p">0 y 4 </td>
                 		<td width="20" align="left" valign="middle"><input type="radio" name="RangoHijos" id="RangoHijos" value="113313"></td>
                 		<td width="65" align="left" valign="middle" class="textos_p">4 y 12 </td>
                 		<td width="20" align="left" valign="middle"><input type="radio" name="RangoHijos" id="RangoHijos" value="113314"></td>
                 		<td width="65" align="left" valign="middle" class="textos_p">13 y 18 </td>
                 		<td width="20" align="left" valign="middle"><input type="radio" name="RangoHijos" id="RangoHijos" value="113315"></td>
                 		<td width="65" align="left" valign="middle" class="textos_p">Mayor a 18 </td>
               		</tr>
            		</table>
            	</td>
            	<td width="200" valign="middle">&nbsp;</td>
      			</tr>
      		</table>
      	</td>	
      </tr>
      
      <tr>
	      <td height="22" align="left" valign="middle" bgcolor="f1f5f2">
	      	<table width="640" border="0" cellspacing="0" cellpadding="0">
      			<tr>
      				<td width="8" valign="middle">&nbsp;</td>
      				<td width="100" valign="middle" class="textos_p">Deporte(s) que practica </td>
            	<td width="176" valign="middle" class="textos_p">
            		<table width="300" border="0" cellspacing="0" cellpadding="0">
               		<tr>
                 		<td width="20" align="left" valign="middle">
                 			<label>
                   			<input type="checkbox" name="PracticaDeportes" id="PracticaDeportes" value="113326">
                 			</label>
                 		</td>
                 		<td width="65" align="left" valign="middle" class="textos_p">Ski </td>
                 		<td width="20" align="left" valign="middle"><input type="checkbox" name="PracticaDeportes" id="PracticaDeportes" value="113329"></td>
                 		<td width="65" align="left" valign="middle" class="textos_p">F&uacute;tbol </td>
                 		<td width="20" align="left" valign="middle"><input type="checkbox" name="PracticaDeportes" id="PracticaDeportes" value="113332"></td>
                 		<td width="65" align="left" valign="middle" class="textos_p">Tennis </td>
               		</tr>
               		<tr>
                 		<td width="20" align="left" valign="middle">
                 			<label>
                   			<input type="checkbox" name="PracticaDeportes" id="PracticaDeportes" value="113327">
                 			</label>
                 		</td>
                 		<td width="65" align="left" valign="middle" class="textos_p">Rugby </td>
                 		<td width="20" align="left" valign="middle"><input type="checkbox" name="PracticaDeportes" id="PracticaDeportes" value="113330"></td>
                 		<td width="65" align="left" valign="middle" class="textos_p">Nataci&oacute;n </td>
                 		<td width="20" align="left" valign="middle"><input type="checkbox" name="PracticaDeportes" id="PracticaDeportes" value="113333"></td>
                 		<td width="65" align="left" valign="middle" class="textos_p">Gimnasio </td>
               		</tr>
               		<tr>
                 		<td width="20" align="left" valign="middle">
                 			<label>
                   			<input type="checkbox" name="PracticaDeportes" id="PracticaDeportes" value="113328">
                 			</label>
                 		</td>
                 		<td width="65" align="left" valign="middle" class="textos_p">Joggin </td>
                 		<td width="20" align="left" valign="middle"><input type="checkbox" name="PracticaDeportes" id="PracticaDeportes" value="113331"></td>
                 		<td width="65" align="left" valign="middle" class="textos_p">Golf </td>
                 		<td width="20" align="left" valign="middle"><input type="checkbox" name="PracticaDeportes" id="PracticaDeportes" value="113334"></td>
                 		<td width="65" align="left" valign="middle" class="textos_p">Otro </td>
               		</tr>
            		</table>
            	</td>
            	<td width="200" valign="middle">&nbsp;</td>
      			</tr>
      		</table>
      	</td>	
      </tr>
      
      <tr>
	      <td height="22" align="left" valign="middle" bgcolor="f1f5f2">
	      	<table width="640" border="0" cellspacing="0" cellpadding="0">
      			<tr>
      				<td width="8" valign="middle">&nbsp;</td>
      				<td width="105" valign="middle" class="textos_p">Actividad(es) en Tiempo Libre </td>
            	<td width="176" valign="middle" class="textos_p">
            		<table width="527" border="0" cellspacing="0" cellpadding="0">
               		<tr>
                 		<td width="10" align="left" valign="middle">
                 			<label>
                   			<input type="checkbox" name="TiempoLibre" id="TiempoLibre" value="113335">
                 			</label>
                 		</td>
                 		<td width="120" align="left" valign="middle" class="textos_p">Descansar </td>
                 		<td width="10" align="left" valign="middle"><input type="checkbox" name="TiempoLibre" id="TiempoLibre" value="113336"></td>
                 		<td width="150" align="left" valign="middle" class="textos_p">Ir a cine u teatro </td>
               		</tr>
               		<tr>
                 		<td width="10" align="left" valign="middle">
                 			<label>
                   			<input type="checkbox" name="TiempoLibre" id="TiempoLibre" value="113337">
                 			</label>
                 		</td>
                 		<td width="65" align="left" valign="middle" class="textos_p">Realizar deportes </td>
                 		<td width="10" align="left" valign="middle"><input type="checkbox" name="TiempoLibre" id="TiempoLibre" value="113338"></td>
                 		<td width="65" align="left" valign="middle" class="textos_p">Ir a pub o restaurant </td>
               		</tr>
               		<tr>
                 		<td width="10" align="left" valign="middle">
                 			<label>
                   			<input type="checkbox" name="TiempoLibre" id="TiempoLibre" value="113339">
                 			</label>
                 		</td>
                 		<td width="65" align="left" valign="middle" class="textos_p">Viajar </td>
                 		<td width="10" align="left" valign="middle"><input type="checkbox" name="TiempoLibre" id="TiempoLibre" value="113340"></td>
                 		<td width="65" align="left" valign="middle" class="textos_p">Ir de compras </td>
               		</tr>
               		<tr>
                 		<td width="10" align="left" valign="middle">
                 			<label>
                   			<input type="checkbox" name="TiempoLibre" id="TiempoLibre" value="113341">
                 			</label>
                 		</td>
                 		<td width="65" align="left" valign="middle" class="textos_p">Conciertos o espect&aacute;culos </td>
                 		<td width="10" align="left" valign="middle"><input type="checkbox" name="TiempoLibre" id="TiempoLibre" value="113342"></td>
                 		<td width="65" align="left" valign="middle" class="textos_p">Leer </td>
               		</tr>
               		<tr>
                 		<td width="10" align="left" valign="middle">
                 			<label>
                   			<input type="checkbox" name="TiempoLibre" id="TiempoLibre" value="113343">
                 			</label>
                 		</td>
                 		<td width="65" align="left" valign="middle" class="textos_p">Navegar en internet </td>
                 		<td width="10" align="left" valign="middle"><input type="checkbox" name="TiempoLibre" id="TiempoLibre" value="113344"></td>
                 		<td width="65" align="left" valign="middle" class="textos_p">Escuchar m&uacute;sica </td>
               		</tr>
            		</table>
            	</td>
      			</tr>
      		</table>
      	</td>	
      </tr>
    	<%end if%>

      		</table>
     		</td>
    	</tr>

      
  
  
  <!--<tr name="tablePersonaFono_ESPACE" id="tablePersonaFono_ESPACE" style="display:none">
    <td height="5"><img src="images_form/espacio.gif" width="11" height="5" /></td>
  </tr>-->
  <tr><td><table  style="display:none" name="tablePersonaFono_ESPACE" id="tablePersonaFono_ESPACE">
  	<tr><td height="5"><img src="images_form/espacio.gif" width="11" height="5" /></td></table></td>
        </tr>
  
  <tr>
    <td><table name="tablePersonaFono" id="tablePersonaFono" style="display:none" width="650" height="46" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="e3e3e3">
      
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="f1f5f2"><table width="640" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="105" valign="middle" class="textos_p">Tel&eacute;fono Particular</td>
            <td width="214" valign="middle"><table width="118" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="38" valign="middle"><span class="borde21">
                    <input tabindex="110" name="txtcodtel" class="borde1" type="text" id="txtcodtel" size="2" maxlength="2" value="" disabled onkeypress="ValidaSoloNum(this,'')" onchange="javascript:replicaInfo(this)" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                  </span></td>
                  <td width="70" align="right" valign="middle"><span class="borde21">
                    <input tabindex="111" type="text" name="Telefono" id="Telefono"  onchange="javascript:replicaInfo(this);validateSizeText(this,'Tel&eacute;fono Particular')" onkeypress="ValidaSoloNum(this,'')" class="borde1" maxlength="9" value="" size="21" disabled onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                  </span></td>
                </tr>
            </table></td>
            <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
            <td width="5" align="center" valign="middle">&nbsp;</td>
            <td width="125" valign="middle" class="textos_p">Tel&eacute;fono Comercial</td>
            <td width="176" valign="middle" class="textos_p"><table width="118" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="38" valign="middle"><span class="borde21">
                    <input tabindex="112" name="txtcodtelcom" id="txtcodtelcom" onkeypress="ValidaSoloNum(this,'')" onchange="javascript:replicaInfo(this)" class="borde1" type="text" id="txtcodtelcom" size="2" maxlength="2" value="" disabled onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                  </span></td>
                  <td width="70" align="right" valign="middle"><span class="borde21">
                    <input tabindex="113" type="text" onchange="validateSizeText(this,'Tel&eacute;fono Comercial')" name="TelefonoCentral" id="TelefonoCentral" onkeypress="ValidaSoloNum(this,'')" class="borde1" maxlength="9" value ="" size="21" disabled onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                  </span></td>
                </tr>
            </table></td>
          </tr>

        </table></td>
      </tr>
      
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="f1f5f2"><table width="640" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="105" valign="middle" class="textos_p">Celular</td>
            <td width="214" valign="middle"><span class="borde21">
                <input tabindex="114" type="text" class="borde1" onchange="javascript:replicaInfo(this)" name="txtCodigoCelular" id="txtCodigoCelular" maxlength="2" value="" size="1" disabled onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
				-<input tabindex="115" type="text" class="borde1" onchange="javascript:replicaInfo(this)" name="Celular" id="Celular" maxlength="9" value="" size="7" disabled onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">            
            </span></td>
            <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
            <td width="5" align="center" valign="middle">&nbsp;</td>
            <td width="125" valign="middle" class="textos_p">E-Mail de contacto </td>
            <td width="176" valign="middle" class="textos_p"><table width="96" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="65" align="left" valign="middle"><span class="borde21">
                    <input tabindex="116" type="text" class="borde1" onchange="javascript:replicaInfo(this)" name="EMail" id="EMail" maxlength="50" value="" size="26"  disabled onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                </span></td>
                <td width="4" align="left" valign="middle">&nbsp;</td>
                <td width="27" align="left" valign="middle"><a href="javascript:fncPonerArroba(1);"><img src="images_form/arroba_1.gif" width="19" height="22" border="0" /></a></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table>

    <!--<tr style="display:none" name="tableUsuarioPersona_ESPACE" id="tableUsuarioPersona_ESPACE">
        <td height="5"><img src="images_form/espacio.gif" width="11" height="5" /></td>
    </tr>-->
    <tr><td><table  style="display:none" name="tableUsuarioPersona_ESPACE" id="tableUsuarioPersona_ESPACE">
  	<tr><td height="5"><img src="images_form/espacio.gif" width="11" height="5" /></td></table></td>
        </tr>

  <tr>
    <td><table name="tableUsuarioPersona" id="tableUsuarioPersona" style="display:none" width="650" height="44" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="c1c6c2">
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="b6cabe" class="textos_p"><table width="458" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="300" valign="middle" class="textos_p">DATOS USUARIO (Quien utilizar&aacute; el veh&iacute;culo) </td>
            <td width="20" align="center" valign="middle">&nbsp;</td>
            <td width="110" valign="middle" class="textos_p">Copia datos propietario </td>
            <td width="20" valign="middle" class="textos_p"><input type="checkbox" name="chkCopiarDatos" id="chkCopiarDatos" value="checkbox" onClick="javascript:fncCopiarDatos();"/></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="dee4e0"><table width="640" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="8" valign="middle">&nbsp;</td>
              <td width="105" valign="middle" class="textos_p">DNI</td>
              <td width="214" valign="middle"><table width="146" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="79" align="left" valign="middle"><span class="borde21">
					<input type="text" name="txtRutUsuario" id="txtRutUsuario" size="8" maxlength="8" class="borde1" value ="<%=StrRutSDU%>" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                    </span></td>
                    <!--<td width="11" align="left" valign="middle"><span class="style2">-</span></td>
                    <td width="29" align="left" valign="middle"><span class="borde21">
                        <input type="text" onchange="javascript:GetValuesClientePersona('Usuario')" name="txtDVUsuario" class="borde1" size="1" maxlength="1" value="<%=StrRutDVU%>"  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                    </span></td>-->
                    <td width="29" align="right" valign="middle"><a href="javascript:GetValuesClientePersona('Usuario')"><img src="images_form/lupa.png" name="Lupa"  alt="Buscar Rut" width="25" height="22" border="0" /></a></td>
                  </tr>
              </table></td>
              <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md2.gif" width="3" height="17" /></td>
              <td width="5" align="center" valign="middle">&nbsp;</td>
              <td width="125" valign="middle" class="textos_p">Direcci&oacute;n de Contacto</td>
              <td width="176" valign="middle" class="textos_p"><span class="borde21">
              <input tabindex="201" type="text" class="borde1" id="DIRECCIONUsuario" name="DIRECCIONUsuario" maxlength="50" value="" size="30" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
              </span></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="dee4e0"><table width="640" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="8" valign="middle">&nbsp;</td>
              <td width="105" valign="middle" class="textos_p">Nombre</td>
              <td width="214" valign="middle"><span class="borde21">
              <input tabindex="202" type="text" id="NombreUsuario" name="NombreUsuario" class="borde1" size="30" maxlength="50" value=""  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
              </span></td>
              <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md2.gif" width="3" height="17" /></td>
              <td width="5" align="center" valign="middle">&nbsp;</td>
              <td width="125" valign="middle" class="textos_p">N&deg;</td>
              <td width="176" valign="middle" class="textos_p"><span class="borde21">
              <input tabindex="203" type="text" class="borde1" id="txtNroUsuario" name="txtNroUsuario" size="5" maxlength="5" value =""  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">&nbsp;
              </span></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="dee4e0"><table width="640" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="8" valign="middle">&nbsp;</td>
              <td width="105" valign="middle" class="textos_p">Apellido Paterno</td>
              <td width="214" valign="middle"><span class="borde21">
                <input tabindex="204" type="text" id="APPATERNOUsuario" name="APPATERNOUsuario" class="borde1" size="30" maxlength="30" value="" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
              </span></td>
              <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md2.gif" width="3" height="17" /></td>
              <td width="5" align="center" valign="middle">&nbsp;</td>
              <td width="125" valign="middle" class="textos_p">Apartamento</td>
              <td width="176" valign="middle" class="textos_p"><span class="borde21">
              <input tabindex="205" type="text" class="borde1" id="CasaPisoDptoUsuario" name="CasaPisoDptoUsuario" size="5" maxlength="5" value = ""  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">&nbsp;
              </span></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="dee4e0"><table width="640" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="8" valign="middle">&nbsp;</td>
              <td width="105" valign="middle" class="textos_p">Apellido Materno</td>
              <td width="214" valign="middle"><span class="borde21">
                <input tabindex="206" type="text" name="APMATERNOUsuario" id="APMATERNOUsuario" class="borde1" size="30" maxlength="30" value="" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
              </span></td>
              <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md2.gif" width="3" height="17" /></td>
              <td width="5" align="center" valign="middle">&nbsp;</td>
              <td width="125" valign="middle" class="textos_p">Distrito</td>
              <td width="176" valign="middle" class="textos_p"><table width="96" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="65" align="left" valign="middle"><span class="borde21">
                    <DIV STYLE="position:relative"> 
                    <!--<input type="text" class="cajaTextoCupon" name="ComunaPropietario" size="25" maxlength="30" value = "" disabled onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">&nbsp;-->
                    <input type="hidden" name="hdn_ComunaPropietarioUsuario" id="hdn_ComunaPropietarioUsuario" value="">
                    <input type="hidden" name="hdn_ComunaPropietarioUsuario_nlookup" id="hdn_ComunaPropietarioUsuario_nlookup" value="ComunaPropietarioUsuario">
                    <input type="hidden" name="id_type_entity_ComunaPropietarioUsuario" id="id_type_entity_ComunaPropietarioUsuario" value="1817045">
                    <input type="text" class="borde1" value="" id="txt_ComunaPropietarioUsuario" name="txt_ComunaPropietarioUsuario" size="25" maxlength="25" class="flbs" tabindex="1" onblur="javascript:BuscaComunaXX(this,document.formulario.selectInput2)"  AUTOCOMPLETE="OFF"> 
                    <input type="hidden" id="ComunaPropietarioUsuario" name="ComunaPropietarioUsuario" value="">
					<SELECT NAME="selectInput2" ID="selectInput2" SIZE=8 STYLE="display:none; position:absolute; top:20px; left:0px"   ONBLUR="this.style.display='none';BuscaComuna(document.formulario.selectInput2,document.formulario.txt_ComunaPropietarioUsuario)"  ONCHANGE="comboselect_onchange(this, this.form.txt_ComunaPropietarioUsuario)" ONKEYUP="comboselect_onkeyup(event.keyCode, this, this.form.txt_ComunaPropietarioUsuario)">  
					<!--#include file="INC_Comuna.aspx"-->	
			        </SELECT>  
						   </DIV>  											                    
                      
                    </span></td>
                    <td width="4" align="left" valign="middle">&nbsp;</td>
                    <td width="27" align="left" valign="middle"><a href="javascript:EntitySearchLookupobj2('ComunaPropietarioUsuario','','','1817940','')"><img src="images_form/lupa.png" width="25" height="22" border="0" /></a></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="dee4e0"><table width="640" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="8" valign="middle">&nbsp;</td>
              <td width="105" valign="middle" class="textos_p">Estado Civil</td>
              <td width="214" valign="middle"><span class="borde21">
                    <select  tabindex="207" style="width=90" id="EstadoCivilUsuario" name="EstadoCivilUsuario" class="borde1">
					<option value="">Seleccione</option>	
					  <option value="117491">Soltero</option>	
				    <option value="117492">Casado</option>
				    <option value="117613">Separado</option>	
				    <option value="117614">Viudo</option>
				 </select>                
              </span></td>
              <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md2.gif" width="3" height="17" /></td>
              <td width="5" align="center" valign="middle">&nbsp;</td>
              <td width="125" valign="middle" class="textos_p">Provincia</td>
              <td width="176" valign="middle" class="textos_p"><table width="80" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="80" align="left" valign="middle"><span class="borde21"><input type="text" class="borde1" name="RegionPropietarioUsuario" id="RegionPropietarioUsuario" size="30" maxlength="30" value = "" readonly>
                    </span></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
      
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="dee4e0"><table width="640" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="105" valign="middle" class="textos_p">Fecha de Nacimiento</td>
            <td width="214" valign="middle"><table width="167" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="40" align="left" valign="middle"><span class="borde21">
                    <input type="hidden" id="FechaNacimientoUsuario" name="FechaNacimientoUsuario" value="">
                    <input onchange="javascript:validafechaSeparada(2)" type="text" id="cboDiaNacUsuario" name="cboDiaNacUsuario" class="borde1" size="2" maxlength="2">
                  </span></td>
                  <td width="11" align="left" valign="middle"><span class="style7">-</span></td>
                  <td width="40" align="left" valign="middle"><span class="borde21">
                  <input type="text" onchange="javascript:validafechaSeparada(2)" id="cboMesNacUsuario" name="cboMesNacUsuario" class="borde1" size="2" maxlength="2">
                  </span></td>
                  <td width="12" align="left" valign="middle"><span class="style7">-</span></td>
                  <td width="40" align="left" valign="middle"><span class="borde21">
                  <input type="text" onchange="javascript:validafechaSeparada(2)" id="cboAnhoNacUsuario" name="cboAnhoNacUsuario" class="borde1" size="4" maxlength="4">
                  </span></td>
                  <td width="11" align="right" valign="middle">&nbsp;</td>
                  <td width="23" align="right" valign="middle">
                    <div name="fecha2" id="fecha2" style="position:absolute; visibility:hidden" ></div>
					<a HREF="javascript:ShowCalendar('FechaNacimientoUsuario')"><img src="images_form/calendro.gif" width="21" height="18" border="0" name="imagen"/></a>
					<input type="hidden" name="date_FechaNacimientoUsuario" id="date_FechaNacimientoUsuario" value="dd/mm/yyyy">
					<input type="hidden" name="timestamp_FechaNacimientoUsuario" id="timestamp_FechaNacimientoUsuario" value="">
					</td>
                </tr>
            </table></td>
            <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
            <td width="5" align="center" valign="middle">&nbsp;</td>
            <td width="125" valign="middle" class="textos_p">Sexo</td>
            <td width="176" valign="middle" class="textos_p"><table width="170" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="20" align="left" valign="middle"><label>
                    <input type="radio"  id="SexoPropietarioUsuario" name="SexoPropietarioUsuario" value="M">
                  </label></td>
                  <td width="65" align="left" valign="middle" class="textos_p">Masculino </td>
                  <td width="20" align="left" valign="middle"><input type="radio"  id="SexoPropietarioUsuario" name="SexoPropietarioUsuario" value="F"></td>
                  <td width="65" align="left" valign="middle" class="textos_p">Femenino </td>
                </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  
    
    <!--<tr style="display:none" name="tableUsuarioPersonaFono_ESPACE" id="tableUsuarioPersonaFono_ESPACE">
        <td height="5"><img src="images_form/espacio.gif" width="11" height="5" /></td>
    </tr>-->
    <tr><td><table  style="display:none" name="tableUsuarioPersonaFono_ESPACE" id="tableUsuarioPersonaFono_ESPACE">
  	<tr><td height="5"><img src="images_form/espacio.gif" width="11" height="5" /></td></table></td>
        </tr>
    

  <tr>
    <td><table name="tableUsuarioPersonaFono" id="tableUsuarioPersonaFono" style="display:none" width="650" height="44" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="c1c6c2">
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="dee4e0"><table width="640" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="105" valign="middle" class="textos_p">Tel&eacute;fono Particular</td>
            <td width="214" valign="middle"><table width="118" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="38" valign="middle"><span class="borde21">
                    <input  tabindex="208" id="txtcodtelUsuario" name="txtcodtelUsuario" onkeypress="ValidaSoloNum(this,'')" class="borde1" type="text" id="Text1" size="2" maxlength="2" value=""  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">      
                  </span></td>
                  <td width="70" align="right" valign="middle"><span class="borde21">
                    <input  tabindex="209" type="text" onchange="validateSizeText(this,'Tel&eacute;fono Particular')" onkeypress="ValidaSoloNum(this,'')" id="TelefonoUsuario" name="TelefonoUsuario" class="borde1" maxlength="9" value="" size="21" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                  </span></td>
                </tr>
            </table></td>
            <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
            <td width="5" align="center" valign="middle">&nbsp;</td>
            <td width="125" valign="middle" class="textos_p">Tel&eacute;fono Comercial</td>
            <td width="176" valign="middle" class="textos_p"><table width="118" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="38" valign="middle"><span class="borde21">
                    <input tabindex="210" onkeypress="ValidaSoloNum(this,'')" id="txtcodtelcomUsuario" name="txtcodtelcomUsuario" class="borde1" type="text" id="Text2" size="2" maxlength="2" value="" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                  </span></td>
                  <td width="70" align="right" valign="middle"><span class="borde21">
                  <input  tabindex="211" onkeypress="ValidaSoloNum(this,'')" onchange="validateSizeText(this,'Tel&eacute;fono Comercial')" type="text" id="TelefonoCentralUsuario" name="TelefonoCentralUsuario" class="borde1" maxlength="9" value ="" size="21" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                  </span></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="dee4e0"><table width="640" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="8" valign="middle">&nbsp;</td>
              <td width="105" valign="middle" class="textos_p">Celular</td>
              <td width="214" valign="middle"><span class="borde21">
			    <input  tabindex="212" type="text" class="borde1" id="txtCodigoCelularUsuario" name="txtCodigoCelularUsuario" maxlength="2" value="" size="1" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
			    -<input  tabindex="213" type="text" class="borde1" id="CelularUsuario" name="CelularUsuario" maxlength="9" value="" size="7" disabled onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
              </span></td>
              <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md2.gif" width="3" height="17" /></td>
              <td width="5" align="center" valign="middle">&nbsp;</td>
              <td width="125" valign="middle" class="textos_p">E-Mail de contacto </td>
              <td width="176" valign="middle" class="textos_p"><table width="96" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="65" align="left" valign="middle"><span class="borde21">
                    <input  tabindex="214" type="text" class="borde1" id="EMailUsuario"  name="EMailUsuario" maxlength="50" value="" size="26" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                    </span></td>
                    <td width="4" align="left" valign="middle">&nbsp;</td>
                    <td width="27" align="left" valign="middle"><a href="javascript:fncPonerArroba(2);"><img src="images_form/arroba_2.gif" width="19" height="22" border="0" /></a></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
    </table>
    <!--////////////////////////////////////////////PERSONA/////////////////////////////////////////////////////-->	    
    <!--////////////////////////////////////////////PERSONA/////////////////////////////////////////////////////-->	    
    <!--////////////////////////////////////////////PERSONA/////////////////////////////////////////////////////-->	    
    
	<!--////////////////////////////////////////////EMPRESA/////////////////////////////////////////////////////-->	
	<!--////////////////////////////////////////////EMPRESA/////////////////////////////////////////////////////-->	
	<!--////////////////////////////////////////////EMPRESA/////////////////////////////////////////////////////-->	
	
	<!-- datos propietario -->
	
    <table style="display:none" name="tableEmpresa_ESPACE" id="tableEmpresa_ESPACE" width="650" height="5">
    <tr>
        <td height="5"><img src="images_form/espacio.gif" width="11" height="5" /></td>
    </tr>


  <div style="display:none" name="tableLeasingBanco_ESPACE" id="tableLeasingBanco_ESPACE">
        <tr>
            <td height="5"><img src="images_form/espacio.gif" width="11" height="5" /></td>
        </tr>
  </div>
  <tr>
    <td>
        <table name="tableLeasingBanco" id="tableLeasingBanco" style="display:none" width="650" height="46" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="e3e3e3">
        <tr>
        <td height="22" align="left" valign="middle" bgcolor="cfded5" class="textos_p">
            <table width="646" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="7" align="left" valign="middle">&nbsp;</td>
              <td width="643" align="left" valign="middle" class="textos_p">DATOS LEASING BANCO</td>
            </tr>
            </table>
        </td>
      </tr>      
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="FFFFFF"><table width="640" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="105" valign="middle" class="textos_p">Entidad</td>
            <td width="214" valign="middle"><span class="borde21">
              <input type="text" class="borde1" name="EntidadLeasing" id="EntidadLeasing" class="borde1" size="35" maxlength="50" value="" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
            </span></td>
            <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
            <td width="5" align="center" valign="middle">&nbsp;</td>
            <td width="125" valign="middle" class="textos_p">Tel&eacute;fono</td>
            <td width="176" valign="middle" class="textos_p"><table width="118" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="38" valign="middle"><span class="borde21">
                    <input onkeypress="ValidaSoloNum(this,'')"  name="codTelefonoLeasing" id="codTelefonoLeasing" class="borde1" type="text" id="Text3" size="2" maxlength="2" value=""  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                  </span></td>
                  <td width="70" align="right" valign="middle"><span class="borde21">
                    <input  onkeypress="ValidaSoloNum(this,'')" onchange="validateSizeText(this,'Tel&eacute;fono Leasing')" type="text" name="TelefonoLeasing" id="TelefonoLeasing" class="borde1" maxlength="8" value="" size="21"  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                  </span></td>
                </tr>
            </table></td>
          </tr>

        </table></td>
      </tr>
      
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="f1f5f2"><table width="640" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="105" valign="middle" class="textos_p">Contacto</td>
            <td width="214" valign="middle"><span class="borde21">
              <input type="text" class="borde1" name="ContactoLeasing" id="ContactoLeasing" class="borde1" size="35" maxlength="50" value="" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
            </span></td>
            <td width="7" align="center" valign="middle"><img src=".images_form/linea_sp_md.gif" width="3" height="17" /></td>
            <td width="5" align="center" valign="middle">&nbsp;</td>
            <td width="125" valign="middle" class="textos_p">&nbsp;</td>
            <td width="176" valign="middle" class="textos_p">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      
    </table></td>
  </tr>

    </table>
	
	
	
    <table name="tableEmpresa" id="tableEmpresa" style="display:none" width="650" height="44" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="e3e3e3">
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="cfded5" class="textos_p"><table width="646" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="7" align="left" valign="middle">&nbsp;</td>
            <td width="643" align="left" valign="middle" class="textos_p">DATOS EMPRESA PROPIETARIA DEL VEHICULO</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="f1f5f2"><table width="640" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="105" valign="middle" class="textos_p">RUC</td>
            <td width="214" valign="middle"><table width="146" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="79" align="left" valign="middle"><span class="borde21">
                    <input type="text" name="RUTEmpresa" id="RUTEmpresa" size="11" maxlength="11" class="borde1" value ="<%=StrRutSDEmp%>" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                </span></td>
                <!--<td width="11" align="left" valign="middle"><span class="style6">-</span></td>
                <td width="29" align="left" valign="middle">
                	<span class="borde21">
                    <input onchange="javascript:GetValuesClienteEmpresa('')" type="text" name="DVEmpresa" class="borde1" size="1" maxlength="1" value="<%=StrRutDVEmp%>" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                	</span>
                </td>-->
                <td width="29" align="right" valign="middle"><a href="javascript:GetValuesClienteEmpresa('')" name="Lupa"  alt="Buscar Rut"><img src="images_form/lupa.png" width="25" height="22" border="0" /></a></td>
              </tr>
            </table></td>
            <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
            <td width="5" align="center" valign="middle">&nbsp;</td>
            <td width="125" valign="middle" class="textos_p">Direcci&oacute;n</td>
            <td width="176" valign="middle" class="textos_p"><span class="borde21">
            <input tabindex="301" type="text" class="borde1"   name="DireccionEmpresa" id="DireccionEmpresa" maxlength="50" value="" size="35"  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
            </span></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="f1f5f2"><table width="640" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="105" valign="middle" class="textos_p">Razón Social</td>
            <td width="214" valign="middle"><span class="borde21">
                <input tabindex="302" type="text" class="borde1" name="NombreEmpresa" id="NombreEmpresa" class="borde1" size="35" maxlength="50" value=""  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
            </span></td>
            <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
            <td width="5" align="center" valign="middle">&nbsp;</td>
            <td width="125" valign="middle" class="textos_p">N&deg;</td>
            <td width="176" valign="middle" class="textos_p"><span class="borde21">
            <input tabindex="303" type="text" class="borde1"  name="txtnroEmpresa" id="txtnroEmpresa" size="5" maxlength="5" value =""  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">&nbsp;
            </span></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="f1f5f2"><table width="640" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="105" valign="middle" class="textos_p">Nombre Contacto</td>
            <td width="214" valign="middle"><span class="borde21">
                <input tabindex="304" type="text" class="borde1"   name="APPATERNOEmpresa" id="APPATERNOEmpresa" maxlength="50" value="" size="30"  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
            </span></td>
            <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
            <td width="5" align="center" valign="middle">&nbsp;</td>
            <td width="125" valign="middle" class="textos_p">Oficina</td>
            <td width="176" valign="middle" class="textos_p"><span class="borde21">
                <input tabindex="305" type="text" class="borde1"   name="CasaPisoDptoEmpresa" is="CasaPisoDptoEmpresa" size="5" maxlength="5" value = ""  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">&nbsp;
            </span></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="f1f5f2"><table width="640" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="105" valign="middle" class="textos_p">Distrito</td>
            <td width="214" valign="middle"><span class="borde21">
              <table width="96" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="65" align="left" valign="middle"><span class="borde21">
                                            <DIV STYLE="position:relative"> 
											<!--<input type="text" class="cajaTextoCupon" name="ComunaPropietario" size="25" maxlength="30" value = "" disabled onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">&nbsp;-->
											<input type="hidden" name="hdn_Comuna2Empresa" id="hdn_Comuna2Empresa" value="">
											<input type="hidden" name="hdn_Comuna2Empresa_nlookup" id="hdn_Comuna2Empresa_nlookup" value="Comuna2Empresa">
											<input type="hidden" name="id_type_entity_Comuna2Empresa" id="id_type_entity_Comuna2Empresa" value="1817045">
											<input type="text" class="borde1" value="" name="txt_Comuna2Empresa" id="txt_Comuna2Empresa" size="25" maxlength="25" class="flbs" tabindex="1" onblur="javascript:BuscaComunaXX(this,document.formulario.selectInput3)" AUTOCOMPLETE="OFF"> 
											<input type="hidden" name="Comuna2Empresa" id="Comuna2Empresa" value="">

								        <SELECT id=selectInput3 NAME=selectInput3 SIZE=8 STYLE="display:none; position:absolute; top:20px; left:0px"   ONBLUR="this.style.display='none';BuscaComuna(document.formulario.selectInput3,document.formulario.txt_Comuna2Empresa)"  ONCHANGE="comboselect_onchange(this, this.form.txt_Comuna2Empresa);" ONKEYUP="comboselect_onkeyup(event.keyCode, this, this.form.txt_Comuna2Empresa)">  
								        <!--#include file="INC_Comuna.aspx"-->	
						                </SELECT>  
						        </DIV>	                
                                </span></td>
                <td width="4" align="left" valign="middle">&nbsp;</td>
                <td width="27" align="left" valign="middle"><a href="javascript:EntitySearchLookupobj2('Comuna2Empresa','','','1817940','')"><img src="images_form/lupa.png" width="25" height="22" border="0" /></a></td>
              </tr>
            </table>            
                
            </span></td>
            <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md2.gif" width="3" height="17" /></td>
            <td width="5" align="center" valign="middle">&nbsp;</td>
            <td width="125" valign="middle" class="textos_p">Provincia</td>
            <td width="176" valign="middle" class="textos_p"><table width="96" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="65" align="left" valign="middle"><span class="borde21">
                                </span></td>
                <td width="4" align="left" valign="middle">&nbsp;</td>
                <td width="27" align="left" valign="middle"><input type="text" class="borde1" name="RegionPropietarioEmpresa" id="RegionPropietarioEmpresa" size="30" maxlength="30" value = "" readonly></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr><td><table  style="display:none" name="tableEmpresaFono_ESPACE" id="tableEmpresaFono_ESPACE">
  	<tr><td height="5"><img src="images_form/espacio.gif" width="11" height="5" /></td></table></td>
        </tr>
        <!--<tr style="display:none" name="tableEmpresaFono_ESPACE" id="tableEmpresaFono_ESPACE">
            <td height="5"><img src="images_form/espacio.gif" width="11" height="5" /></td>
        </tr>-->
    
    <tr>
    <td valign="top"><table width="650" id="tableEmpresaFono" name="tableEmpresaFono" style="display:none" height="46" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="e3e3e3">
      
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="f1f5f2"><table width="640" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="105" valign="middle" class="textos_p">Tel&eacute;fono Principal</td>
            <td width="214" valign="middle"><table width="118" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="38" valign="middle"><span class="borde21">
                    <input  tabindex="306" onkeypress="ValidaSoloNum(this,'')"  name="codTelefonoEmpresa"  class="borde1" type="text" id="txtcodtelEmpresa" size="2" maxlength="2" value=""  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">      
                  </span></td>
                  <td width="70" align="right" valign="middle"><span class="borde21">
                    <input  tabindex="307"  onkeypress="ValidaSoloNum(this,'')" onchange="validateSizeText(this,'Tel&eacute;fono Principal')" type="text" name="TelefonoEmpresa" id="TelefonoEmpresa" class="borde1" maxlength="9" value="" size="21"  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                  </span></td>
                </tr>
            </table></td>
            <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
            <td width="5" align="center" valign="middle">&nbsp;</td>
            <td width="125" valign="middle" class="textos_p">Tel&eacute;fono Adicional</td>
            <td width="176" valign="middle" class="textos_p"><table width="118" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="38" valign="middle"><span class="borde21">
                    <input tabindex="308" onkeypress="ValidaSoloNum(this,'')"  name="codTelefono2Empresa" class="borde1" type="text" id="txtcodtelcomEmpresa" size="2" maxlength="2" value=""  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                  </span></td>
                  <td width="70" align="right" valign="middle"><span class="borde21">
                    <input  tabindex="309" onkeypress="ValidaSoloNum(this,'')" onchange="validateSizeText(this,'Tel&eacute;fono Adicional')"  type="text"   name="TelefonoCentralEmpresa" id="TelefonoCentralEmpresa" class="borde1" maxlength="9" value ="" size="21"  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                  </span></td>
                </tr>
            </table></td>
          </tr>

        </table></td>
      </tr>
      
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="f1f5f2"><table width="640" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="105" valign="middle" class="textos_p">Celular</td>
            <td width="214" valign="middle"><span class="borde21">
                <input  tabindex="310" type="text" class="borde1"   name="CelularEmpresa" id="CelularEmpresa" maxlength="15" value="" size="20"  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
            </span></td>
            <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
            <td width="5" align="center" valign="middle">&nbsp;</td>
            <td width="125" valign="middle" class="textos_p">E-Mail de contacto </td>
            <td width="176" valign="middle" class="textos_p"><table width="96" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="65" align="left" valign="middle"><span class="borde21">
                    <input  tabindex="311" type="text" class="borde1" name="EMailEmpresa" id="EMailEmpresa" maxlength="50" value="" size="30"  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                </span></td>
                <td width="4" align="left" valign="middle">&nbsp;</td>
                <td width="27" align="left" valign="middle"><a href="javascript:fncPonerArroba(4);"><img src="images_form/arroba_1.gif" width="19" height="22" border="0" /></a></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table>
    </td>
  </tr>
  
  <!--  datos usuario   Empresa-->
  
        <!--<tr style="display:none" name="tableUsuarioEmpresa_ESPACE" id="tableUsuarioEmpresa_ESPACE">
        <td height="5"><img src="images_form/espacio.gif" width="11" height="5" /></td>
        </tr>-->
        <tr><td><table  style="display:none" name="tableUsuarioEmpresa_ESPACE" id="tableUsuarioEmpresa_ESPACE">
  	<tr><td height="5"><img src="images_form/espacio.gif" width="11" height="5" /></td></table></td>
        </tr>
  
  <tr>
    <td>
    <table width="650" id="tableUsuarioEmpresa" name="tableUsuarioEmpresa" style="display:none" height="44" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="c1c6c2">
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="b6cabe" class="textos_p"><table width="458" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="300" valign="middle" class="textos_p">DATOS USUARIO / CONTACTO EN LA EMPRESA </td>
            <td width="20" align="center" valign="middle">&nbsp;</td>
            <td width="110" valign="middle" class="textos_p"></td>
            <td width="20" valign="middle" class="textos_p"></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="dee4e0"><table width="640" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="8" valign="middle">&nbsp;</td>
              <td width="105" valign="middle" class="textos_p">DNI</td>
              <td width="214" valign="middle"><table width="146" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="79" align="left" valign="middle"><span class="borde21">
                    <input type="text" name="txtRutUsuarioEmp" id="txtRutUsuarioEmp" size="15" maxlength="15" class="borde1" value ="<%=StrRutSDUEmp%>" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                    </span></td>
                   <!--<td width="11" align="left" valign="middle"><span class="style7">-</span></td>
                    <td width="29" align="left" valign="middle"><span class="borde21">
                        <input onchange="javascript:GetValuesClientePersona('UsuarioEmp')" type="text" name="txtDVUsuarioEmp" class="borde1" size="1" maxlength="1" value="<%=StrRutDVUEmp%>"  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                    </span></td>-->
                    <td width="29" align="right" valign="middle"><a href="javascript:GetValuesClientePersona('UsuarioEmp')" name="Lupa"  alt="Buscar Rut"><img src="images_form/lupa.png" name="Lupa"  alt="Buscar Rut" width="25" height="22" border="0" /></a></td>
                  </tr>
              </table></td>
              <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md2.gif" width="3" height="17" /></td>
              <td width="5" align="center" valign="middle">&nbsp;</td>
              <td width="125" valign="middle" class="textos_p">Direcci&oacute;n de Contacto</td>
              <td width="176" valign="middle" class="textos_p"><span class="borde21">
              <input  tabindex="401" type="text" class="borde1" name="DIRECCIONUsuarioEmp" id="DIRECCIONUsuarioEmp" maxlength="50" value="" size="30" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
              </span></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="dee4e0"><table width="640" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="8" valign="middle">&nbsp;</td>
              <td width="105" valign="middle" class="textos_p">Nombre</td>
              <td width="214" valign="middle"><span class="borde21">
              <input tabindex="402" type="text" name="NombreUsuarioEmp" id="NombreUsuarioEmp" class="borde1" size="30" maxlength="50" value=""  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
              </span></td>
              <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md2.gif" width="3" height="17" /></td>
              <td width="5" align="center" valign="middle">&nbsp;</td>
              <td width="125" valign="middle" class="textos_p">N&deg;</td>
              <td width="176" valign="middle" class="textos_p"><span class="borde21">
              <input tabindex="403" type="text" class="borde1" name="txtNroUsuarioEmp" id="txtNroUsuarioEmp" size="5" maxlength="5" value =""  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">&nbsp;
              </span></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="dee4e0"><table width="640" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="8" valign="middle">&nbsp;</td>
              <td width="105" valign="middle" class="textos_p">Apellido Paterno</td>
              <td width="214" valign="middle"><span class="borde21">
                <input tabindex="404" type="text" name="APPATERNOUsuarioEmp" id="APPATERNOUsuarioEmp" class="borde1" size="30" maxlength="30" value="" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
              </span></td>
              <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md2.gif" width="3" height="17" /></td>
              <td width="5" align="center" valign="middle">&nbsp;</td>
              <td width="125" valign="middle" class="textos_p">Depto.</td>
              <td width="176" valign="middle" class="textos_p"><span class="borde21">
              <input tabindex="405" type="text" class="borde1" name="CasaPisoDptoUsuarioEmp" id="CasaPisoDptoUsuarioEmp" size="5" maxlength="5" value = ""  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">&nbsp;
              </span></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="dee4e0"><table width="640" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="8" valign="middle">&nbsp;</td>
              <td width="105" valign="middle" class="textos_p">Apellido Materno</td>
              <td width="214" valign="middle"><span class="borde21">
                <input tabindex="405" type="text" name="APMATERNOUsuarioEmp" id="APMATERNOUsuarioEmp" class="borde1" size="30" maxlength="30" value="" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
              </span></td>
              <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md2.gif" width="3" height="17" /></td>
              <td width="5" align="center" valign="middle">&nbsp;</td>
              <td width="125" valign="middle" class="textos_p">Distrito</td>
              <td width="176" valign="middle" class="textos_p"><table width="96" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="65" align="left" valign="middle"><span class="borde21">
                    <DIV STYLE="position:relative"> 
                    <!--<input type="text" class="cajaTextoCupon" name="ComunaPropietario" size="25" maxlength="30" value = "" disabled onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">&nbsp;-->
                    <input type="hidden" name="hdn_ComunaPropietarioUsuarioEmp" id="hdn_ComunaPropietarioUsuarioEmp" value="">
                    <input type="hidden" name="hdn_ComunaPropietarioUsuarioEmp_nlookup" id="hdn_ComunaPropietarioUsuarioEmp_nlookup" value="ComunaPropietarioUsuarioEmp">
                    <input type="hidden" name="id_type_entity_ComunaPropietarioUsuarioEmp" id="id_type_entity_ComunaPropietarioUsuarioEmp" value="1817045">
                    <input type="text" class="borde1" value="" name="txt_ComunaPropietarioUsuarioEmp" id="txt_ComunaPropietarioUsuarioEmp" size="25" maxlength="25" class="flbs" tabindex="1" onblur="javascript:BuscaComunaXX(this,document.formulario.selectInput4)" AUTOCOMPLETE="OFF" > 
                    <input type="hidden" name="ComunaPropietarioUsuarioEmp" id="ComunaPropietarioUsuarioEmp" value="">
											                    
					<SELECT NAME=selectInput2 SIZE=8 STYLE="display:none; position:absolute; top:20px; left:0px"   ONBLUR="this.style.display='none';BuscaComuna(document.formulario.selectInput2,document.formulario.txt_ComunaPropietarioUsuario)"  ONCHANGE="comboselect_onchange(this, this.form.txt_ComunaPropietarioUsuario)" ONKEYUP="comboselect_onkeyup(event.keyCode, this, this.form.txt_ComunaPropietarioUsuario)">  
					<!--#include file="INC_Comuna.aspx"-->	
			        </SELECT>  
				   </DIV>  											                    
                      
                    </span></td>
                    <td width="4" align="left" valign="middle">&nbsp;</td>
                    <td width="27" align="left" valign="middle"><a href="javascript:EntitySearchLookupobj2('ComunaPropietarioUsuarioEmp','','','1817940','')"><img src="images_form/lupa.png" width="25" height="22" border="0" /></a></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="dee4e0"><table width="640" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="8" valign="middle">&nbsp;</td>
              <td width="105" valign="middle" class="textos_p">Estado Civil </td>
              <td width="214" valign="middle"><span class="borde21">
                        <select tabindex="406" style="width=90" name="EstadoCivilUsuarioEmp" id="EstadoCivilUsuarioEmp" class="borde1">
						    <option value="">Seleccione</option>	
							<option value="117491">Soltero</option>	
							<option value="117492">Casado</option>
						</select>                                  
              </span></td>
              <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md2.gif" width="3" height="17" /></td>
              <td width="5" align="center" valign="middle">&nbsp;</td>
              <td width="125" valign="middle" class="textos_p">Provincia</td>
              <td width="176" valign="middle" class="textos_p"><table width="80" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="80" align="left" valign="middle"><span class="borde21">
                        <input type="text" class="borde1" name="RegionPropietarioUsuarioEmp" id="RegionPropietarioUsuarioEmp" size="30" maxlength="30" value = "" >
                    </span></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
      
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="dee4e0"><table width="640" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="105" valign="middle" class="textos_p">Fecha de Nacimiento</td>
            <td width="214" valign="middle"><table width="167" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="40" align="left" valign="middle"><span class="borde21">
                   <input type="hidden" name="FechaNacimientoUsuarioEmp" id="FechaNacimientoUsuarioEmp"  value="">
                    <input onchange="javascript:validafechaSeparada(3)" type="text" id="cboDiaNacUsuarioEmp" name="cboDiaNacUsuarioEmp" class="borde1" size="2" maxlength="2">
                  </span></td>
                  <td width="11" align="left" valign="middle"><span class="style7">-</span></td>
                  <td width="40" align="left" valign="middle"><span class="borde21">
                  <input onchange="javascript:validafechaSeparada(3)" type="text" id="cboMesNacUsuarioEmp" name="cboMesNacUsuarioEmp" class="borde1" size="2" maxlength="2">
                  </span></td>
                  <td width="12" align="left" valign="middle"><span class="style7">-</span></td>
                  <td width="40" align="left" valign="middle"><span class="borde21">
                  <input onchange="javascript:validafechaSeparada(3)" type="text" id="cboAnhoNacUsuarioEmp" name="cboAnhoNacUsuarioEmp" class="borde1" size="4" maxlength="4">
                  </span></td>
                  <td width="11" align="right" valign="middle">&nbsp;</td>
                  <td width="23" align="right" valign="middle">
					<div name="fecha3" id="fecha3" style="position:absolute; visibility:hidden" ></div>
					<a HREF="javascript:ShowCalendar('FechaNacimientoUsuarioEmp')"><img src="images_form/calendro.gif" width="21" height="18" border="0" name="imagen"/></a>
					<input type="hidden" name="date_FechaNacimientoUsuarioEmp" id="date_FechaNacimientoUsuarioEmp" value="dd/mm/yyyy">
					<input type="hidden" name="timestamp_FechaNacimientoUsuarioEmp" id="timestamp_FechaNacimientoUsuarioEmp" value="">
					</td>
                </tr>
            </table></td>
            <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
            <td width="5" align="center" valign="middle">&nbsp;</td>
            <td width="125" valign="middle" class="textos_p">Sexo</td>
            <td width="176" valign="middle" class="textos_p"><table width="170" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="20" align="left" valign="middle"><label>
                    <input type="radio" name="SexoPropietarioUsuarioEmp" id="SexoPropietarioUsuarioEmp" value="117494">
                  </label></td>
                  <td width="65" align="left" valign="middle" class="textos_p">Masculino </td>
                  <td width="20" align="left" valign="middle"><input type="radio" name="SexoPropietarioUsuarioEmp" id="SexoPropietarioUsuarioEmp" value="117493"></td>
                  <td width="65" align="left" valign="middle" class="textos_p">Femenino </td>
                </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>

      <tr>
        <td height="22" align="left" valign="middle" bgcolor="dee4e0"><table width="640" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8" valign="middle">&nbsp;</td>
            <td width="105" valign="middle" class="textos_p">Tel&eacute;fono Particular</td>
            <td width="214" valign="middle"><table width="118" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="38" valign="middle"><span class="borde21">
                    <input tabindex="407" onkeypress="ValidaSoloNum(this,'')" name="txtcodtelUsuarioEmp" class="borde1" type="text" id="txtcodtelUsuarioEmp" size="2" maxlength="2" value=""  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">      
                  </span></td>
                  <td width="70" align="right" valign="middle"><span class="borde21">
                    <input tabindex="408" type="text" onkeypress="ValidaSoloNum(this,'')" onchange="validateSizeText(this,'Tel&eacute;fono Particular')" name="TelefonoUsuarioEmp" id="TelefonoUsuarioEmp" class="cajaTextoCupon" maxlength="9" value="" size="21" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                  </span></td>
                </tr>
            </table></td>
            <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
            <td width="5" align="center" valign="middle">&nbsp;</td>
            <td width="125" valign="middle" class="textos_p">Tel&eacute;fono Comercial</td>
            <td width="176" valign="middle" class="textos_p"><table width="118" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="38" valign="middle"><span class="borde21">
                    <input tabindex="409" onkeypress="ValidaSoloNum(this,'')" name="txtcodtelcomUsuarioEmp" class="cajaTextoCupon" type="text" id="txtcodtelcomUsuarioEmp" size="2" maxlength="2" value="" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                  </span></td>
                  <td width="70" align="right" valign="middle"><span class="borde21">
                  <input tabindex="410" onkeypress="ValidaSoloNum(this,'')" onchange="validateSizeText(this,'Tel&eacute;fono Comercial')" type="text" name="TelefonoCentralUsuarioEmp" id="TelefonoCentralUsuarioEmp" class="cajaTextoCupon" maxlength="9" value ="" size="21" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                  </span></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="dee4e0"><table width="640" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="8" valign="middle">&nbsp;</td>
              <td width="105" valign="middle" class="textos_p">Celular</td>
              <td width="214" valign="middle"><span class="borde21">
                <input tabindex="411" type="text" class="borde1" name="txtCodigoCelularUsuarioEmp" id="txtCodigoCelularUsuarioEmp" maxlength="2" value="" size="1" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                -<input tabindex="412" type="text" class="borde1" name="CelularUsuarioEmp" id="CelularUsuarioEmp" maxlength="9" value="" size="7" disabled onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
              </span></td>
              <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md2.gif" width="3" height="17" /></td>
              <td width="5" align="center" valign="middle">&nbsp;</td>
              <td width="125" valign="middle" class="textos_p">E-Mail de contacto </td>
              <td width="176" valign="middle" class="textos_p"><table width="96" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="65" align="left" valign="middle"><span class="borde21">
                    <input tabindex="413" type="text" class="borde1" name="EMailUsuarioEmp" id="EMailUsuarioEmp" maxlength="50" value="" size="26" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                    </span></td>
                    <td width="4" align="left" valign="middle">&nbsp;</td>
                    <td width="27" align="left" valign="middle"><a href="javascript:fncPonerArroba(3);"><img src="images_form/arroba_2.gif" width="19" height="22" border="0" /></a></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
    
    
    <div style="display:none" name="datos_concesionario_ESPACE" id="datos_concesionario_ESPACE">
    <tr>
        <td height="5"><img src="images_form/espacio.gif" width="11" height="5" /></td>
    </tr>
    </div>
     
  <tr>
    <td valign="top">
    <table width="650" name="datos_concesionario" id="datos_concesionario" style="display:none" height="112" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="e3e3e3">
      <tr>
        <td height="22" align="left" valign="middle" bgcolor="cfded5" class="textos_p"><table width="646" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="7" align="left" valign="middle">&nbsp;</td>
              <td width="643" align="left" valign="middle" class="textos_p">DATOS CONCESIONARIO </td>
            </tr>
        </table></td>
      </tr>
      
      <tr>
        <td height="22" align="left" valign="middle"><table width="640" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="8" valign="middle">&nbsp;</td>
              <td width="105" valign="middle" class="textos_p">Local</td>
              <td width="214" valign="middle">
										<input type="hidden" name="objtextactive" id="objtextactive" value="0">
										<input type="hidden" name="objactive" id="objactive" value="0">
										<input type="hidden" name="hdn_atribmodif" id="hdn_atribmodif" value="">
										<input type="hidden" name="rutconcesionario" id="rutconcesionario" value="<%=RUtConc%>">
										<input type="hidden" name="hdn_LocalConc" id="hdn_LocalConc" value="">
										<input type="hidden" name="hdn_LocalConc_nlookup" id="hdn_LocalConc_nlookup" value="LocalConc">
										<input type="hidden" name="id_type_entity_LocalConc" id="id_type_entity_LocalConc" value="1817938">
										<input type="hidden" name="LocalConc" id="LocalConc" value="<%=IdLocalConc%>">
										<INPUT tabindex="501" name="txt_LocalConc" id="txt_LocalConc" class="borde1" readonly onkeydown="busca(0,document.formulario.txt_LocalConc,window.frames['pagsLocalConc'].document.all.sel_cache,'DDtxt_LocalConc','LocalConc','1817938','','')" onblur="fncQuitarColor(this);javascript:check_id(0,document.formulario.txt_LocalConc,'LocalConc')" onchange="javascript:borrar_id_new(this,'LocalConc')" tabindex="1" size="35" value="<%=NameLocalConc%>" onFocus="fncPonerColor(this);">
										<a href="javascript:mostrar(0,document.formulario.txt_LocalConc,window.frames['pagsLocalConc'].document.all.sel_cache,'DDtxt_LocalConc','1817938','LocalConc','5920764','rutconcesionario');document.formulario.txt_LocalConc.focus();"><img src="images_form/lupa.png" width="25" height="22" border="0" /></a>
											<script>
										        	mark('12LocalConc')
											</script>
											<div id="DDtxt_LocalConc" style="Z-INDEX: 2; WIDTH: 340px; visibility:hidden ;POSITION: absolute; HEIGHT: 227px">
													<iframe name="pagsLocalConc" id="pagsLocalConc" src="../../../h2_sales/asp/nothing.htm" FRAMEBORDER="0" SCROLLING="yes" align="middle" style="visibility=show" height="100" hspace="0" vspace="0" frameborder="0" marginheight="0" marginwidth="0"></iframe>
										  </div>											
											
              
              </td>
              <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
              <td width="5" align="center" valign="middle">&nbsp;</td>
              
              <td width="125" valign="middle" class="textos_p">Fecha Factura Dealer </td>
							<td width="176" valign="middle" class="textos_p"><input class="borde1" type=text readonly name="fecfac" id="fecfac"></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="22" align="left" valign="middle">
        <table width="640" border="0" cellspacing="0" cellpadding="0">
            <tr>
            <!-- INICIO TEXT_COMPLETE JG -->
				<!--<td width="8" valign="middle">&nbsp;</td>
				<td width="105" valign="middle" class="textos_p">Nombre Vendedor </td>
				<td width="214" valign="middle"><span class="borde21">				
						<input tabindex="502" type="text" class="borde1"  id="txtNombreVendedor"  name="txtNombreVendedor" size="35" maxlength="50" value="<%=RecepEjec%>" onFocus="fncPonerColor(this);" onkeyup="buscarVendedor(this);" onBlur="fncQuitarColor(this);trim(this);">
						<input type="hidden" id="idVendedor" name="idVendedor">
						<input type="hidden" id="lookup_asigna" name="lookup_asigna">
						<div id="DDtxt_Ejecutivoas" style="Z-INDEX: 2; WIDTH: 350px; visibility:hidden ;POSITION: absolute; HEIGHT: 227px">
							<iframe name="pagsEjecutivoas" src="" FRAMEBORDER="0" SCROLLING="no" align="middle" style="visibility=show" width="300" hspace="0" vspace="0"  marginheight="0" marginwidth="0"></iframe>
						</div>
				</span></td>-->
            <!-- FIN TEXT_COMPLETE JG -->

<!-- INICIO TEXT_COMPLETE JG      -->
				<td width="8" valign="middle">&nbsp;</td>
				<td width="105" valign="middle" class="textos_p">Nombre Vendedor </td>
				<td width="214" valign="middle"><span class="borde21">
					<select style="width=150" name="txtNombreVendedor" id="txtNombreVendedor" class="borde1">
							<%=NomVendedor %>
					</select>
				</span></td>
			<!--   FIN TEXT_COMPLETE JG      -->

			  
              <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
              <td width="5" align="center" valign="middle">&nbsp;</td>
              <td width="125" valign="middle" class="textos_p">Fecha Entrega </td>
              <td width="176" valign="middle" class="textos_p"><table width="167" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="40" align="left" valign="middle"><span class="borde21">
					<input type="hidden"  name="txtDiaEntrega" id="txtDiaEntrega" size="2" maxlength="2" value="" >
					<input tabindex="503" value="<%=FechaEntregaDia%>" onchange="javascript:validafechaSeparada(5)" type="text" name="cboDiaEnt" id="cboDiaEnt" class="borde1" size="2" maxlength="2"  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);" readonly="readonly">&nbsp;
                  </span></td>
                  <td width="11" align="left" valign="middle"><span class="style6">-</span></td>
                  <td width="40" align="left" valign="middle"><span class="borde21">
                    <input tabindex="504" value="<%=FechaEntregaMes%>" onchange="javascript:validafechaSeparada(5)" type="text" name="cboMesEnt" id="cboMesEnt" class="borde1" size="2" maxlength="2"  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);" readonly="readonly">&nbsp;
                  </span></td>
                  <td width="12" align="left" valign="middle"><span class="style6">-</span></td>
                  <td width="40" align="left" valign="middle"><span class="borde21">
                    <input tabindex="505" value="<%=FechaEntregaAgno%>" onchange="javascript:validafechaSeparada(5);validaFechaFacEntrega()" type="text" name="cboAnhoEnt" id="cboAnhoEnt" id="borde1" size="4" maxlength="4"  onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);" readonly="readonly">
                  </span></td>
                  <td width="11" align="right" valign="middle">&nbsp;</td>
                  <td width="23" align="right" valign="middle">
                    <div name="fecha4" id="fecha4" style="position:absolute; visibility:hidden" ></div>
					<a HREF="javascript:ShowCalendar('FechaEntrega')"><img src="images_form/calendro.gif" width="21" height="18" border="0" name="imagen"/></a>
					<input type="hidden" name="date_FechaEntrega" id="date_FechaEntrega" value="dd/mm/yyyy">
					<input type="hidden" name="timestamp_FechaEntrega" id="timestamp_FechaEntrega" value="">
					<input type="hidden" name="FechaEntrega" id="FechaEntrega" value="">
                  </td>
                </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
      
      <tr>
        <td height="22" align="left" valign="middle">
            <table width="640" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="8" valign="middle">&nbsp;</td>
              <td width="105" valign="middle" class="textos_p">N&uacute;mero de Factura </td>
              <td width="214" valign="middle"><span class="borde21">
                <input tabindex="506" name="txtnumfact" class="borde1" type="text" id="txtnumfact" maxlength="9" value="<%=txtnumfact%>" size="35" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
              </span></td>
              <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
              <td width="5" align="center" valign="middle">&nbsp;</td>
              <td width="125" valign="middle" class="textos_p">Fecha Factura</td>
              <td width="176" valign="middle" class="textos_p"><table width="167" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="40" align="left" valign="middle"><span class="borde21">
                    <input type="hidden" name="txtDiaFactura" id="txtDiaFactura" size="2" maxlength="2" value="" >
                    <input tabindex="506" onchange="javascript:validafechaSeparada(4)"  value="<%=FechaFacturaDia%>" type="text" name="cboDiaFac" id="cboDiaFac" class="borde1" size="2" maxlength="2" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);" readonly="readonly">&nbsp;
                  </span></td>
                  <td width="11" align="left" valign="middle"><span class="style6">-</span></td>
                  <td width="40" align="left" valign="middle"><span class="borde21">
                    <input tabindex="507" onchange="javascript:validafechaSeparada(4)" value="<%=FechaFacturaMes%>" type="text" name="cboMesFac" id="cboMesFac" class="borde1" size="2" maxlength="2" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);" readonly="readonly">&nbsp;
                  </span></td>
                  <td width="12" align="left" valign="middle"><span class="style6">-</span></td>
                  <td width="40" align="left" valign="middle"><span class="borde21">
                    <input tabindex="508"  value="<%=FechaFacturaAgno%>" onchange="javascript:validafechaSeparada(4);validaFechaFacEntrega()" type="text" name="cboAnhoFac" id="cboAnhoFac" id="borde1" size="4" maxlength="4" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);" readonly="readonly">
                  </span></td>
                  <td width="11" align="right" valign="middle">&nbsp;</td>
                  <td width="23" align="right" valign="middle">
                    <div name="fecha5" id="fecha5" style="position:absolute; visibility:hidden" ></div>
				    <a HREF="javascript:ShowCalendar('FechaFactura')"><img src="images_form/calendro.gif" width="21" height="18" border="0" name="imagen"/></a>
				    <input type="hidden" name="FechaFactura" id="FechaFactura" value="">
				    <input type="hidden" name="date_FechaFactura" id="date_FechaFactura" value="dd/mm/yyyy">
				    <input type="hidden" name="timestamp_FechaFactura" id="timestamp_FechaFactura" value="">
                    </td>
                </tr>
              </table></td>
            </tr>
        </table>  
        </td>
        </tr>
        <!--
		<tr>
			<td height="22" align="left" valign="middle">				
                    <table width="640" name="forma_pago_usuario" id="forma_pago_usuario" style="display:none" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="8" valign="middle">&nbsp;</td>
                        <td width="105" valign="middle" class="textos_p">Forma de Pago </td>
                        <td width="214" valign="middle">							
				            <select style="width=90" name="FormaPagoUsuario" class="cboLista">
					            <option value=""></option>
					            <%if trim(FormaPagoUsuario)="EFECTIVO" then%>
						            <option value="EFECTIVO" selected>EFECTIVO</option>
					            <%else%>
						            <option value="EFECTIVO">EFECTIVO</option>
					            <%end if%>
            					
					            <%if trim(FormaPagoUsuario)="CHEQUE" then%>
						            <option value="CHEQUE" selected>CHEQUE</option>
					            <%else%>
						            <option value="CHEQUE">CHEQUE</option>
					            <%end if%>
					            <%if trim(FormaPagoUsuario)="CRÉDITO" then%>
						            <option value="CRÉDITO" selected>CRÉDITO</option>
					            <%else%>
						            <option value="CRÉDITO">CRÉDITO</option>
					            <%end if%>													

					            <%if trim(FormaPagoUsuario)="LEASING" then%>
						            <option value="LEASING" selected>LEASING</option>
					            <%else%>
						            <option value="LEASING">LEASING</option>
					            <%end if%>															
				            </select>							
                        </td>
                        <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
                        <td width="5" align="center" valign="middle">&nbsp;</td>
                        <td width="125" valign="middle" class="textos_p">Seguro</td>
                        <td width="176" valign="middle" class="textos_p"><span class="borde21">                        
							<input type="text" class="borde1" name="SeguroUsuario" size="30" maxlength="50" value="<%=Seguro%>" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                        </span></td>
                      </tr>
                    </table>
        
        
                    <table width="640" name="forma_pago_empresa" id="forma_pago_empresa" style="display:none" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="8" valign="middle">&nbsp;</td>
                        <td width="105" valign="middle" class="textos_p">Forma de Pago</td>
                        <td width="214" valign="middle">							
				            <select style="width=90" name="FormaPagoUsuarioEmpresa" class="cboLista">
					            <option value=""></option>
					            <%if trim(FormaPagoUsuario2)="EFECTIVO" then%>
						            <option value="EFECTIVO" selected>EFECTIVO</option>
					            <%else%>
						            <option value="EFECTIVO">EFECTIVO</option>
					            <%end if%>
            					
					            <%if trim(FormaPagoUsuario2)="CHEQUE" then%>
						            <option value="CHEQUE" selected>CHEQUE</option>
					            <%else%>
						            <option value="CHEQUE">CHEQUE</option>
					            <%end if%>
					            <%if trim(FormaPagoUsuario2)="CRÉDITO" then%>
						            <option value="CRÉDITO" selected>CRÉDITO</option>
					            <%else%>
						            <option value="CRÉDITO">CRÉDITO</option>
					            <%end if%>													

					            <%if trim(FormaPagoUsuario2)="LEASING" then%>
						            <option value="LEASING" selected>LEASING</option>
					            <%else%>
						            <option value="LEASING">LEASING</option>
					            <%end if%>															
				            </select>							
                        </td>
                        <td width="7" align="center" valign="middle"><img src="images_form/linea_sp_md.gif" width="3" height="17" /></td>
                        <td width="5" align="center" valign="middle">&nbsp;</td>
                        <td width="125" valign="middle" class="textos_p">Seguro</td>
                        <td width="176" valign="middle" class="textos_p">
						<span class="borde21">
                        
							<input type="text" class="borde1" name="SeguroUsuarioEmpresa" size="30" maxlength="50" value="<%=Seguro%>" onFocus="fncPonerColor(this);" onBlur="fncQuitarColor(this);trim(this);">
                        
						</span>
						
						</td>
                      </tr>
                    </table>
        </td>
      </tr>
		-->
    </table>                             
    </td>
  </tr>

    <div style="display:none" id="div_boton_ingresar_ESPACE">
        <tr>
            <td height="5"><img src="images_form/espacio.gif" width="11" height="5" /></td>
        </tr>
    </div>
  
  <tr>
    <td height="22">
    <table name="div_boton_ingresar" id="div_boton_ingresar" style="display:none" width="650" height="22" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="e3e3e3" background="images_form/dg_inf.gif">
      <tr>
        <td colspan="5" align="center" valign="middle"><a href="#" onclick="javascript:Save();"><img src="images_form/boton_ingresar.gif" width="59" height="20" border="0"  /></a>
        &nbsp;&nbsp;<%if trim(idCupon) <> "" then %><a href="#" onclick="javascript:Imprimir_Cupon('<%=idCupon%>','<%=TipoPropietario%>');"><img src="images_form/boton_imprimir.gif" width="59" height="20" border="0"  /><%end if%></a>
        </td>
      </tr>
    </table></td>
  </tr>
</table>
<p>&nbsp;</p>


	<input type="hidden" name="dia" id="dia" size="2" class="texto">
	<input type="hidden" name="mes" id="mes" size="2" class="texto">
	<input type="hidden" name="ano" id="ano" size="4" class="texto">	
	<input type="hidden" name="Local" id="Local" value="<%=IdLocalConc%>">	
	<input type="hidden" name="txt_Local" id="txt_Local" value="">	
	
	
	<iframe id="FrameTempLoad" name="FrameTempLoad" frameborder="0" width="0" height="0" src="../../../h2_sales/asp/nothing.htm"></iframe>
	<iframe id="FrameTempLoad1" name="FrameTempLoad1" frameborder="0" width="0" height="0" src="../../../h2_sales/asp/nothing.htm"></iframe>
	<iframe id="FrameTempLoad2" name="FrameTempLoad2" frameborder="0" width="0" height="0" src="../../../h2_sales/asp/nothing.htm"></iframe>
	<iframe id="FrameTempLoad3" name="FrameTempLoad3" frameborder="0" width="0" height="0" src="../../../h2_sales/asp/nothing.htm"></iframe>
	<iframe id="FrameTempLoad4" name="FrameTempLoad4" frameborder="1" width="0" height="0" src="../../../h2_sales/asp/nothing.htm"></iframe>
	<iframe id="FrameTempLoad5" name="FrameTempLoad5" frameborder="0" width="0" height="0" src="../../../h2_sales/asp/nothing.htm"></iframe>
	
	
<INPUT NAME="date1xx" id="date1xx" type="hidden">
<INPUT NAME="ObjdateActive" id="ObjdateActive" type="hidden">
<div name="popCal" id="popCal" style="visibility:hidden; z-index:999; position:absolute; left:-500px; top:0px;">
<iframe width="170" height="175" name="Calendar" id="Calendar" src="../../../h2_sales/asp/Calendar.htm" scrolling="no" frameborder="0"></iframe>
</div>

</form>
</body>
</html>
<script>

function validaSoloTexto(obj){
  var patron = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]*$/;
  var cadena = obj.value;
  var Nuevacadena = "";
   var caracter =""
   for (var i = 0; i < cadena.length; i++) {
   	  caracter =cadena.substring(i, i + 1)
   	  if(!caracter.search(patron)){
   	  	Nuevacadena=Nuevacadena + caracter;
   	  }
   }  
   obj.value = Nuevacadena;
   replicaInfo(obj)
}

function enviar()
{
		document.formulario.sw.value=1;
		formulario.submit();
}

function fncMensajeAlert()
{
	
}

	function fncPonerColor(Obj)
	{
		Obj.className = "cajaTextoCuponColor";
		return;
	}

	function fncQuitarColor(Obj)
	{

		if (Obj.value!="")
			Obj.className = "borde1ConValor";
		else
			Obj.className = "borde1";
				
			//Obj.className = "cajaTextoCupon";
		return
	}
	
	
	function fncCambiarFicha(accion){

		//document.formulario.IdTab.value=accion
		
		if (accion==1)
		{
            //--------------------------- CLIENTE PERSONA ----------------------------------//
			document.getElementById("tableUsuarioEmpresa").style.display="block"
			document.getElementById("tableEmpresaFono").style.display="block"
			document.getElementById("tablePersona").style.display="block"
			document.getElementById("tablePersonaFono").style.display="block"
			document.getElementById("tableUsuarioPersona").style.display="block"
			document.getElementById("tableUsuarioPersonaFono").style.display="block"
			            
            //--------------------------- ESPACE CLIENTE PERSONA ----------------------------//
            document.getElementById("tablePersona_ESPACE").style.display="block";       
            document.getElementById("tablePersonaFono_ESPACE").style.display="block";
            document.getElementById("tableUsuarioPersona_ESPACE").style.display="block";
            document.getElementById("tableUsuarioPersonaFono_ESPACE").style.display="block";
            document.getElementById("tableEmpresaFono_ESPACE").style.display="block";
            document.getElementById("tableUsuarioEmpresa_ESPACE").style.display="block";
            
            //--------------------------- EMPRESA ----------------------------------//
            document.getElementById("tableEmpresa").style.display="none";
            document.getElementById("tableEmpresaFono").style.display="none";
            document.getElementById("tableUsuarioEmpresa").style.display="none";
            //document.getElementById("tableUsuarioEmpresa_Fono").style.display="none";
            
            //--------------------------- ESPACE EMPRESA-----------------------------//
            document.getElementById("tableEmpresa_ESPACE").style.display="none";
            document.getElementById("tableEmpresaFono_ESPACE").style.display="none";
            document.getElementById("tableUsuarioEmpresa_ESPACE").style.display="none";
            
            //--------------------------- OTROS ------------------------------------//
			document.getElementById("datos_concesionario_ESPACE").style.display="block";
			document.getElementById("datos_concesionario").style.display="block";
			//document.getElementById("forma_pago_empresa").style.display="none"
			//document.getElementById("forma_pago_usuario").style.display="block"
			
			document.getElementById("tableLeasingBanco_ESPACE").style.display="none";
			document.getElementById("tableLeasingBanco").style.display="none";
			
			document.getElementById("div_boton_ingresar_ESPACE").style.display="block";
			document.getElementById("div_boton_ingresar").style.display="block";

            //---------------------------------------------------------------------------//
			
		}
				
		if (accion==2)
		    {
            //--------------------------- CLIENTE PERSONA ----------------------------------//
			document.getElementById("tableUsuarioEmpresa").style.display="none";
			document.getElementById("tableEmpresaFono").style.display="none";
			document.getElementById("tablePersona").style.display="none";
			document.getElementById("tablePersonaFono").style.display="none";
			document.getElementById("tableUsuarioPersona").style.display="none";
			document.getElementById("tableUsuarioPersonaFono").style.display="none";
            
            //--------------------------- ESPACE CLIENTE PERSONA ----------------------------//
            
            document.getElementById("tablePersona_ESPACE").style.display="none";     
            document.getElementById("tablePersonaFono_ESPACE").style.display="none";
            document.getElementById("tableUsuarioPersona_ESPACE").style.display="none";
            document.getElementById("tableUsuarioPersonaFono_ESPACE").style.display="none";
            document.getElementById("tableEmpresaFono_ESPACE").style.display="none";
            document.getElementById("tableUsuarioEmpresa_ESPACE").style.display="none";
            
            //--------------------------- EMPRESA ----------------------------------//
            document.getElementById("tableEmpresa").style.display="block";
            document.getElementById("tableEmpresaFono").style.display="block";
            document.getElementById("tableUsuarioEmpresa").style.display="block";
            //document.getElementById("tableUsuarioEmpresa_Fono").style.display="block";
            
            //--------------------------- ESPACE EMPRESA-----------------------------//
            document.getElementById("tableEmpresa_ESPACE").style.display="block";
            document.getElementById("tableEmpresaFono_ESPACE").style.display="block";
            document.getElementById("tableUsuarioEmpresa_ESPACE").style.display="block";
            
            //--------------------------- OTROS ------------------------------------//
  			document.getElementById("datos_concesionario_ESPACE").style.display="block";
			document.getElementById("datos_concesionario").style.display="block";
			//document.getElementById("forma_pago_empresa").style.display="block"
			//document.getElementById("forma_pago_usuario").style.display="none"
			
			//--------------------------- LEASING ------------------------------------//
			document.getElementById("tableLeasingBanco_ESPACE").style.display="none";
			document.getElementById("tableLeasingBanco").style.display="none";
			
			document.getElementById("div_boton_ingresar_ESPACE").style.display="block";
			document.getElementById("div_boton_ingresar").style.display="block";
		}
		
		

		
		if (accion==3)
		    {
            //--------------------------- CLIENTE PERSONA ----------------------------------//
			document.getElementById("tableUsuarioEmpresa").style.display="none";
			document.getElementById("tableEmpresaFono").style.display="none";
			document.getElementById("tablePersona").style.display="none";
			document.getElementById("tablePersonaFono").style.display="none";
			document.getElementById("tableUsuarioPersona").style.display="none";
			document.getElementById("tableUsuarioPersonaFono").style.display="none";
            
            //--------------------------- ESPACE CLIENTE PERSONA ----------------------------//
            document.getElementById("tablePersona_ESPACE").style.display="none";           
            document.getElementById("tablePersonaFono_ESPACE").style.display="none";
            document.getElementById("tableUsuarioPersona_ESPACE").style.display="none";
            document.getElementById("tableUsuarioPersonaFono_ESPACE").style.display="none";
            document.getElementById("tableEmpresaFono_ESPACE").style.display="none";
            document.getElementById("tableUsuarioEmpresa_ESPACE").style.display="none";
            
            //--------------------------- EMPRESA ----------------------------------//
            document.getElementById("tableEmpresa").style.display="block";
            document.getElementById("tableEmpresaFono").style.display="block";
            document.getElementById("tableUsuarioEmpresa").style.display="block";
            //document.getElementById("tableUsuarioEmpresa_Fono").style.display="block";
            
            //--------------------------- ESPACE EMPRESA-----------------------------//
            document.getElementById("tableEmpresa_ESPACE").style.display="block";
            document.getElementById("tableEmpresaFono_ESPACE").style.display="block";
            document.getElementById("tableUsuarioEmpresa_ESPACE").style.display="block";
            
            //--------------------------- OTROS ------------------------------------//
  			document.getElementById("datos_concesionario_ESPACE").style.display="block";
			document.getElementById("datos_concesionario").style.display="block";
			//document.getElementById("forma_pago_empresa").style.display="block"
			//document.getElementById("forma_pago_usuario").style.display="none"
			
			//--------------------------- LEASING ------------------------------------//
			document.getElementById("tableLeasingBanco_ESPACE").style.display="block";
			document.getElementById("tableLeasingBanco").style.display="block";
			
			document.getElementById("div_boton_ingresar_ESPACE").style.display="block";
			document.getElementById("div_boton_ingresar").style.display="block";
		}
	
	}
	
	
function fncPonerArroba(intTipo)
{

	intTieneArroba = 0
	if (intTipo == 1)
	{
		intLargo = document.formulario.EMail.value.length;
		//alert(intLargo);
		for (i=0;i<intLargo;i++)
		{
			if (document.formulario.EMail.value.charAt(i) == "@")
			{
				intTieneArroba = 1;
				break;
			}
		}
		if (intTieneArroba == 0)
		{
			document.formulario.EMail.value = document.formulario.EMail.value+"@";
		}
		//document.formulario.EMail.focus();
	}
	if (intTipo == 2)
	{
		intLargo = document.formulario.EMailUsuario.value.length;
		//alert(intLargo);
		for (i=0;i<intLargo;i++)
		{
			if (document.formulario.EMailUsuario.value.charAt(i) == "@")
			{
				intTieneArroba = 1;
				break;
			}
		}
		if (intTieneArroba == 0)
		{
			document.formulario.EMailUsuario.value = document.formulario.EMailUsuario.value+"@";
		}
		//document.formulario.txtEmailUsuario.focus();
	}
	
	if (intTipo == 3)
	{
		intLargo = document.formulario.EMailUsuarioEmp.value.length;
		//alert(intLargo);
		for (i=0;i<intLargo;i++)
		{
			if (document.formulario.EMailUsuarioEmp.value.charAt(i) == "@")
			{
				intTieneArroba = 1;
				break;
			}
		}
		if (intTieneArroba == 0)
		{
			document.formulario.EMailUsuarioEmp.value = document.formulario.EMailUsuarioEmp.value+"@";
		}
		//document.formulario.txtEmailUsuario.focus();
	}	
	
	if (intTipo == 4)
	{
		intLargo = document.formulario.EMailEmpresa.value.length;
		//alert(intLargo);
		for (i=0;i<intLargo;i++)
		{
			if (document.formulario.EMailEmpresa.value.charAt(i) == "@")
			{
				intTieneArroba = 1;
				break;
			}
		}
		if (intTieneArroba == 0)
		{
			document.formulario.EMailEmpresa.value = document.formulario.EMailEmpresa.value+"@";
		}
		//document.formulario.txtEmailUsuario.focus();
	}		
	
	
}

function fncCopiarDatos(){
	if(document.formulario.chkCopiarDatos.checked){
			if(document.formulario.txtRut && document.formulario.txtRutUsuario){
				document.formulario.txtRutUsuario.disabled = true
				document.formulario.txtRutUsuario.value = document.formulario.txtRut.value
				fncQuitarColor(document.formulario.txtRutUsuario)
			}	
		
//			if(document.formulario.txtDV && document.formulario.txtDVUsuario){
//				//document.formulario.txtDVUsuario.disabled = true
//				document.formulario.txtDVUsuario.value = document.formulario.txtDV.value
//				fncQuitarColor(document.formulario.txtDVUsuario)
//			}	
		
			if(document.formulario.Nombre && document.formulario.NombreUsuario){
				document.formulario.NombreUsuario.disabled = true
				document.formulario.NombreUsuario.value = document.formulario.Nombre.value
				fncQuitarColor(document.formulario.NombreUsuario)
			}	
		
			if(document.formulario.APPATERNO && document.formulario.APPATERNOUsuario){
				document.formulario.APPATERNOUsuario.disabled = true
				document.formulario.APPATERNOUsuario.value = document.formulario.APPATERNO.value
				fncQuitarColor(document.formulario.APPATERNOUsuario)
			}		
			
			if(document.formulario.APMATERNO && document.formulario.APMATERNOUsuario){
				document.formulario.APMATERNOUsuario.disabled = true
				document.formulario.APMATERNOUsuario.value = document.formulario.APMATERNO.value
				fncQuitarColor(document.formulario.APMATERNOUsuario)
			}		
			
			if(document.formulario.DIRECCION && document.formulario.DIRECCIONUsuario){
				document.formulario.DIRECCIONUsuario.disabled = true
				document.formulario.DIRECCIONUsuario.value = document.formulario.DIRECCION.value
				fncQuitarColor(document.formulario.DIRECCIONUsuario)
			}		
		
			if(document.formulario.txtNro && document.formulario.txtNroUsuario){
				document.formulario.txtNroUsuario.disabled = true
				document.formulario.txtNroUsuario.value = document.formulario.txtNro.value
				fncQuitarColor(document.formulario.txtNroUsuario)
			}		
		
			if(document.formulario.CasaPisoDpto && document.formulario.CasaPisoDptoUsuario){
				document.formulario.CasaPisoDptoUsuario.disabled = true
				document.formulario.CasaPisoDptoUsuario.value = document.formulario.CasaPisoDpto.value
				fncQuitarColor(document.formulario.CasaPisoDptoUsuario)
			}	
			
			if(document.formulario.RegionPropietario && document.formulario.RegionPropietarioUsuario){
				document.formulario.RegionPropietarioUsuario.disabled = true
				document.formulario.RegionPropietarioUsuario.value = document.formulario.RegionPropietario.value
				fncQuitarColor(document.formulario.RegionPropietarioUsuario)
			}	
			
			if(document.formulario.txt_ComunaPropietario && document.formulario.txt_ComunaPropietarioUsuario){
				document.formulario.txt_ComunaPropietarioUsuario.disabled = true
				document.formulario.txt_ComunaPropietarioUsuario.value = document.formulario.txt_ComunaPropietario.value
				fncQuitarColor(document.formulario.txt_ComunaPropietarioUsuario)
			}	
		
			if(document.formulario.ComunaPropietario && document.formulario.ComunaPropietarioUsuario){
				document.formulario.ComunaPropietarioUsuario.disabled = true
				document.formulario.ComunaPropietarioUsuario.value = document.formulario.ComunaPropietario.value
				fncQuitarColor(document.formulario.ComunaPropietarioUsuario)
			}	
		
			if(document.formulario.txtcodtel && document.formulario.txtcodtelUsuario){
				document.formulario.txtcodtelUsuario.disabled = true
				document.formulario.txtcodtelUsuario.value = document.formulario.txtcodtel.value
				fncQuitarColor(document.formulario.txtcodtelUsuario)
			}	
		
			if(document.formulario.Telefono && document.formulario.TelefonoUsuario){
				document.formulario.TelefonoUsuario.disabled = true
				document.formulario.TelefonoUsuario.value = document.formulario.Telefono.value
				fncQuitarColor(document.formulario.TelefonoUsuario)
			}	
		
			if(document.formulario.txtcodtelcom && document.formulario.txtcodtelcomUsuario){
				document.formulario.txtcodtelcomUsuario.disabled = true
				document.formulario.txtcodtelcomUsuario.value = document.formulario.txtcodtelcom.value
				fncQuitarColor(document.formulario.txtcodtelcomUsuario)
			}	
		
			if(document.formulario.TelefonoCentral && document.formulario.TelefonoCentralUsuario){
				document.formulario.TelefonoCentralUsuario.disabled = true
				document.formulario.TelefonoCentralUsuario.value = document.formulario.TelefonoCentral.value
				fncQuitarColor(document.formulario.TelefonoCentralUsuario)
			}	
		
		
			if(document.formulario.txtCodigoCelular && document.formulario.txtCodigoCelularUsuario){
				document.formulario.txtCodigoCelularUsuario.disabled = true
				document.formulario.txtCodigoCelularUsuario.value = document.formulario.txtCodigoCelular.value
				fncQuitarColor(document.formulario.txtCodigoCelularUsuario)
			}	
		
		
			if(document.formulario.Celular && document.formulario.CelularUsuario){
				document.formulario.CelularUsuario.disabled = true
				document.formulario.CelularUsuario.value = document.formulario.Celular.value
				fncQuitarColor(document.formulario.CelularUsuario)
			}	
		
			if(document.formulario.EMail && document.formulario.EMailUsuario){
				document.formulario.EMailUsuario.disabled = true
				document.formulario.EMailUsuario.value = document.formulario.EMail.value
				fncQuitarColor(document.formulario.EMailUsuario)
			}	
		
			if(document.formulario.EstadoCivil && document.formulario.EstadoCivilUsuario){
				document.formulario.EstadoCivilUsuario.disabled = true
				document.formulario.EstadoCivilUsuario.value = document.formulario.EstadoCivil.value
				fncQuitarColor(document.formulario.EstadoCivilUsuario)
			}	
		
			if(document.formulario.SexoPropietario && document.formulario.SexoPropietarioUsuario){
				document.formulario.SexoPropietarioUsuario[0].disabled = true
				document.formulario.SexoPropietarioUsuario[1].disabled = true
				if(document.formulario.SexoPropietario[0].checked)	document.formulario.SexoPropietarioUsuario[0].checked=true
				if(document.formulario.SexoPropietario[1].checked)	document.formulario.SexoPropietarioUsuario[1].checked=true
				//fncQuitarColor(document.formulario.CasaPisoDptoUsuario)
				//fncQuitarColor(document.formulario.CasaPisoDptoUsuario)
			}	
		
			if(document.formulario.FechaNacimiento && document.formulario.FechaNacimientoUsuario){
				document.formulario.FechaNacimientoUsuario.disabled = true
				document.formulario.FechaNacimientoUsuario.value = document.formulario.FechaNacimiento.value
				fncQuitarColor(document.formulario.FechaNacimientoUsuario)
			}	
		
			if(document.formulario.cboDiaNac && document.formulario.cboDiaNacUsuario){
				document.formulario.cboDiaNacUsuario.disabled = true
				document.formulario.cboDiaNacUsuario.value = document.formulario.cboDiaNac.value
				fncQuitarColor(document.formulario.cboDiaNacUsuario)
			}	
		
			if(document.formulario.cboMesNac && document.formulario.cboMesNacUsuario){
				document.formulario.cboMesNacUsuario.disabled = true
				document.formulario.cboMesNacUsuario.value = document.formulario.cboMesNac.value
				fncQuitarColor(document.formulario.cboMesNacUsuario)
			}	
		
			if(document.formulario.cboAnhoNac && document.formulario.cboAnhoNacUsuario){
				document.formulario.cboAnhoNacUsuario.disabled = true
				document.formulario.cboAnhoNacUsuario.value = document.formulario.cboAnhoNac.value
				fncQuitarColor(document.formulario.cboAnhoNacUsuario)
			}	
	}else{

			if(document.formulario.txtRutUsuario){
				document.formulario.txtRutUsuario.disabled = false
				document.formulario.txtRutUsuario.value = ""
				fncQuitarColor(document.formulario.txtRutUsuario)
			}	
		
//			if(document.formulario.txtDVUsuario){
//				//document.formulario.txtDVUsuario.disabled = false
//				document.formulario.txtDVUsuario.value = ""
//				fncQuitarColor(document.formulario.txtDVUsuario)
//			}	

			if(document.formulario.NombreUsuario){
				document.formulario.NombreUsuario.disabled = false
				document.formulario.NombreUsuario.value = ""
				fncQuitarColor(document.formulario.NombreUsuario)
			}	
		
			if(document.formulario.APPATERNOUsuario){
				document.formulario.APPATERNOUsuario.disabled = false
				document.formulario.APPATERNOUsuario.value = ""
				fncQuitarColor(document.formulario.APPATERNOUsuario)
			}		
			
			if(document.formulario.APMATERNOUsuario){
				document.formulario.APMATERNOUsuario.disabled = false
				document.formulario.APMATERNOUsuario.value = ""
				fncQuitarColor(document.formulario.APMATERNOUsuario)
			}		
			
			if(document.formulario.DIRECCIONUsuario){
				document.formulario.DIRECCIONUsuario.disabled = false
				document.formulario.DIRECCIONUsuario.value = ""
				fncQuitarColor(document.formulario.DIRECCIONUsuario)
			}		
		
			if(document.formulario.txtNroUsuario){
				document.formulario.txtNroUsuario.disabled = false
				document.formulario.txtNroUsuario.value = ""
				fncQuitarColor(document.formulario.txtNroUsuario)
			}		
		
			if(document.formulario.CasaPisoDptoUsuario){
				document.formulario.CasaPisoDptoUsuario.disabled = false
				document.formulario.CasaPisoDptoUsuario.value = ""
				fncQuitarColor(document.formulario.CasaPisoDptoUsuario)
			}	
			
			if(document.formulario.RegionPropietarioUsuario){
				document.formulario.RegionPropietarioUsuario.disabled = false
				document.formulario.RegionPropietarioUsuario.value = ""
				fncQuitarColor(document.formulario.RegionPropietarioUsuario)
			}	
			
			if(document.formulario.txt_ComunaPropietarioUsuario){
				document.formulario.txt_ComunaPropietarioUsuario.disabled = false
				document.formulario.txt_ComunaPropietarioUsuario.value = ""
				fncQuitarColor(document.formulario.txt_ComunaPropietarioUsuario)
			}	
		
			if(document.formulario.ComunaPropietarioUsuario){
				document.formulario.ComunaPropietarioUsuario.disabled = false
				document.formulario.ComunaPropietarioUsuario.value = ""
				fncQuitarColor(document.formulario.ComunaPropietarioUsuario)
			}	
		
			if(document.formulario.txtcodtelUsuario){
				document.formulario.txtcodtelUsuario.disabled = false
				document.formulario.txtcodtelUsuario.value = ""
				fncQuitarColor(document.formulario.txtcodtelUsuario)
			}	
		
			if(document.formulario.TelefonoUsuario){
				document.formulario.TelefonoUsuario.disabled = false
				document.formulario.TelefonoUsuario.value = ""
				fncQuitarColor(document.formulario.TelefonoUsuario)
			}	
		
			if(document.formulario.txtcodtelcomUsuario){
				document.formulario.txtcodtelcomUsuario.disabled = false
				document.formulario.txtcodtelcomUsuario.value = ""
				fncQuitarColor(document.formulario.txtcodtelcomUsuario)
			}	
		
			if(document.formulario.TelefonoCentralUsuario){
				document.formulario.TelefonoCentralUsuario.disabled = false
				document.formulario.TelefonoCentralUsuario.value = ""
				fncQuitarColor(document.formulario.TelefonoCentralUsuario)
			}	
		
		
			if(document.formulario.txtCodigoCelularUsuario){
				document.formulario.txtCodigoCelularUsuario.disabled = false
				document.formulario.txtCodigoCelularUsuario.value = ""
				fncQuitarColor(document.formulario.txtCodigoCelularUsuario)
			}	
		
			if(document.formulario.CelularUsuario){
				document.formulario.CelularUsuario.disabled = false
				document.formulario.CelularUsuario.value = ""
				fncQuitarColor(document.formulario.CelularUsuario)
			}	
		
			if(document.formulario.EMailUsuario){
				document.formulario.EMailUsuario.disabled = false
				document.formulario.EMailUsuario.value = ""
				fncQuitarColor(document.formulario.EMailUsuario)
			}	
		
			if(document.formulario.EstadoCivilUsuario){
				document.formulario.EstadoCivilUsuario.disabled = false
				document.formulario.EstadoCivilUsuario.value = ""
				fncQuitarColor(document.formulario.EstadoCivilUsuario)
			}	
		
			if(document.formulario.SexoPropietarioUsuario){
				document.formulario.SexoPropietarioUsuario[0].disabled = false
				document.formulario.SexoPropietarioUsuario[1].disabled = false
				document.formulario.SexoPropietarioUsuario[0].checked=false
				document.formulario.SexoPropietarioUsuario[1].checked=false
				//fncQuitarColor(document.formulario.CasaPisoDptoUsuario)
				//fncQuitarColor(document.formulario.CasaPisoDptoUsuario)
			}	
		
			if(document.formulario.FechaNacimientoUsuario){
				document.formulario.FechaNacimientoUsuario.disabled = false
				document.formulario.FechaNacimientoUsuario.value=""
				fncQuitarColor(document.formulario.FechaNacimientoUsuario)
			}	
		
			if(document.formulario.cboDiaNacUsuario){
				document.formulario.cboDiaNacUsuario.disabled = false
				document.formulario.cboDiaNacUsuario.selectIndex=0
				fncQuitarColor(document.formulario.cboDiaNacUsuario)
			}	
		
			if(document.formulario.cboMesNacUsuario){
				document.formulario.cboMesNacUsuario.disabled = false
				document.formulario.cboMesNacUsuario.selectIndex=0
				fncQuitarColor(document.formulario.cboMesNacUsuario)
			}	
		
			if(document.formulario.cboAnhoNacUsuario){
				document.formulario.cboAnhoNacUsuario.disabled = false
				document.formulario.cboAnhoNacUsuario.selectIndex=0
				fncQuitarColor(document.formulario.cboAnhoNacUsuario)
			}			
			
	}
}


function DisabledPropietarioPersona(Valor){
/*
			if(document.formulario.txtRut){
				document.formulario.txtRut.disabled = Valor
				fncQuitarColor(document.formulario.txtRut)
			}	
		
			if(document.formulario.txtDV){
				document.formulario.txtDV.disabled = Valor
				fncQuitarColor(document.formulario.txtDV)
			}	
*/		
			if(document.formulario.Nombre){
				document.formulario.Nombre.disabled = Valor
				fncQuitarColor(document.formulario.Nombre)
			}	
		
			if(document.formulario.APPATERNO){
				document.formulario.APPATERNO.disabled = Valor
				fncQuitarColor(document.formulario.APPATERNO)
			}		
			
			if(document.formulario.APMATERNO){
				document.formulario.APMATERNO.disabled = Valor
				fncQuitarColor(document.formulario.APMATERNO)
			}		
			
			if(document.formulario.DIRECCION){
				document.formulario.DIRECCION.disabled = Valor
				fncQuitarColor(document.formulario.DIRECCION)
			}		
		
			if(document.formulario.txtNro){
				document.formulario.txtNro.disabled = Valor
				fncQuitarColor(document.formulario.txtNro)
			}		
		
			if(document.formulario.CasaPisoDpto){
				document.formulario.CasaPisoDpto.disabled = Valor
				fncQuitarColor(document.formulario.CasaPisoDpto)
			}	
			
			if(document.formulario.RegionPropietario){
				document.formulario.RegionPropietario.disabled = Valor
				fncQuitarColor(document.formulario.RegionPropietario)
			}	
			
			if(document.formulario.txt_ComunaPropietario){
				document.formulario.txt_ComunaPropietario.disabled = Valor
				fncQuitarColor(document.formulario.txt_ComunaPropietario)
			}	
		
			if(document.formulario.ComunaPropietario){
				document.formulario.ComunaPropietario.disabled = Valor
				fncQuitarColor(document.formulario.ComunaPropietario)
			}	
		
			if(document.formulario.txtcodtel){
				document.formulario.txtcodtel.disabled = Valor
				fncQuitarColor(document.formulario.txtcodtel)
			}	
		
			if(document.formulario.Telefono){
				document.formulario.Telefono.disabled = Valor
				fncQuitarColor(document.formulario.Telefono)
			}	
		
			if(document.formulario.txtcodtelcom){
				document.formulario.txtcodtelcom.disabled = Valor
				fncQuitarColor(document.formulario.txtcodtelcom)
			}	
		
			if(document.formulario.TelefonoCentral){
				document.formulario.TelefonoCentral.disabled = Valor
				fncQuitarColor(document.formulario.TelefonoCentral)
			}	
		
		
			if(document.formulario.txtCodigoCelular){
				document.formulario.txtCodigoCelular.disabled = Valor
				fncQuitarColor(document.formulario.txtCodigoCelular)
			}	
		
			if(document.formulario.Celular){
				document.formulario.Celular.disabled = Valor
				fncQuitarColor(document.formulario.Celular)
			}	
		
			if(document.formulario.EMail){
				document.formulario.EMail.disabled = Valor
				fncQuitarColor(document.formulario.EMail)
			}	
		
			if(document.formulario.EstadoCivil){
				document.formulario.EstadoCivil.disabled = Valor
				fncQuitarColor(document.formulario.EstadoCivil)
			}	
		
			if(document.formulario.SexoPropietario){
				document.formulario.SexoPropietario[0].disabled = Valor
				document.formulario.SexoPropietario[1].disabled = Valor
			}	
		
			if(document.formulario.FechaNacimiento){
				document.formulario.FechaNacimiento.disabled = Valor
				fncQuitarColor(document.formulario.FechaNacimiento)
			}	
		
			if(document.formulario.cboDiaNac){
				document.formulario.cboDiaNac.disabled = Valor
				fncQuitarColor(document.formulario.cboDiaNac)
			}	
		
			if(document.formulario.cboMesNac){
				document.formulario.cboMesNac.disabled = Valor
				fncQuitarColor(document.formulario.cboMesNac)
			}	
		
			if(document.formulario.cboAnhoNac){
				document.formulario.cboAnhoNac.disabled = Valor
				fncQuitarColor(document.formulario.cboAnhoNac)
			}	

			if(document.formulario.boton1){
				document.formulario.boton1.disabled = Valor
				fncQuitarColor(document.formulario.boton1)
			}				
			
			
}



function DisabledPropietarioUsuario(Valor){

			if(document.formulario.txtRutUsuario){
				document.formulario.txtRutUsuario.disabled = Valor
				fncQuitarColor(document.formulario.txtRutUsuario)
			}
			
			if(document.formulario.NombreUsuario){
				document.formulario.NombreUsuario.disabled = Valor
				fncQuitarColor(document.formulario.NombreUsuario)
			}	
		
			if(document.formulario.APPATERNOUsuario){
				document.formulario.APPATERNOUsuario.disabled = Valor
				fncQuitarColor(document.formulario.APPATERNOUsuario)
			}		
			
			if(document.formulario.APMATERNOUsuario){
				document.formulario.APMATERNOUsuario.disabled = Valor
				fncQuitarColor(document.formulario.APMATERNOUsuario)
			}		
			
			if(document.formulario.DIRECCIONUsuario){
				document.formulario.DIRECCIONUsuario.disabled = Valor
				fncQuitarColor(document.formulario.DIRECCIONUsuario)
			}		
		
			if(document.formulario.txtNroUsuario){
				document.formulario.txtNroUsuario.disabled = Valor
				fncQuitarColor(document.formulario.txtNroUsuario)
			}		
		
			if(document.formulario.CasaPisoDptoUsuario){
				document.formulario.CasaPisoDptoUsuario.disabled = Valor
				fncQuitarColor(document.formulario.CasaPisoDptoUsuario)
			}	
			
			if(document.formulario.txt_ComunaPropietarioUsuario){
				document.formulario.txt_ComunaPropietarioUsuario.disabled = Valor
				fncQuitarColor(document.formulario.txt_ComunaPropietarioUsuario)
			}	
		
			if(document.formulario.ComunaPropietarioUsuario){
				document.formulario.ComunaPropietarioUsuario.disabled = Valor
				fncQuitarColor(document.formulario.ComunaPropietarioUsuario)
			}	
		
			if(document.formulario.RegionPropietarioUsuario){
				document.formulario.RegionPropietarioUsuario.disabled = Valor
				fncQuitarColor(document.formulario.RegionPropietarioUsuario)
			}	

			if(document.formulario.txtcodtelUsuario){
				document.formulario.txtcodtelUsuario.disabled = Valor
				fncQuitarColor(document.formulario.txtcodtelUsuario)
			}	
		
			if(document.formulario.TelefonoUsuario){
				document.formulario.TelefonoUsuario.disabled = Valor
				fncQuitarColor(document.formulario.TelefonoUsuario)
			}	
		
			if(document.formulario.txtcodtelcomUsuario){
				document.formulario.txtcodtelcomUsuario.disabled = Valor
				fncQuitarColor(document.formulario.txtcodtelcomUsuario)
			}	
		
			if(document.formulario.TelefonoCentralUsuario){
				document.formulario.TelefonoCentralUsuario.disabled = Valor
				fncQuitarColor(document.formulario.TelefonoCentralUsuario)
			}	
		
		
			if(document.formulario.txtCodigoCelularUsuario){
				document.formulario.txtCodigoCelularUsuario.disabled = Valor
				fncQuitarColor(document.formulario.txtCodigoCelularUsuario)
			}	
		
		
			if(document.formulario.CelularUsuario){
				document.formulario.CelularUsuario.disabled = Valor
				fncQuitarColor(document.formulario.CelularUsuario)
			}	
		
			if(document.formulario.EMailUsuario){
				document.formulario.EMailUsuario.disabled = Valor
				fncQuitarColor(document.formulario.EMailUsuario)
			}	
		
			if(document.formulario.EstadoCivilUsuario){
				document.formulario.EstadoCivilUsuario.disabled = Valor
				fncQuitarColor(document.formulario.EstadoCivilUsuario)
			}	
		
			if(document.formulario.SexoPropietarioUsuario){
				document.formulario.SexoPropietarioUsuario[0].disabled = Valor
				document.formulario.SexoPropietarioUsuario[1].disabled = Valor
			}	
		
			if(document.formulario.FechaNacimientoUsuario){
				document.formulario.FechaNacimientoUsuario.disabled = Valor
			}	
		
			if(document.formulario.cboDiaNacUsuario){
				document.formulario.cboDiaNacUsuario.disabled = Valor
				fncQuitarColor(document.formulario.cboDiaNacUsuario)
			}	
		
			if(document.formulario.cboMesNacUsuario){
				document.formulario.cboMesNacUsuario.disabled = Valor
				fncQuitarColor(document.formulario.cboMesNacUsuario)
			}	
		
			if(document.formulario.cboAnhoNacUsuario){
				document.formulario.cboAnhoNacUsuario.disabled = Valor
				fncQuitarColor(document.formulario.cboAnhoNacUsuario)
			}
			
			
			if(document.formulario.boton2){
				document.formulario.boton2.disabled = Valor
				fncQuitarColor(document.formulario.boton2)
			}				
					
}



function DisabledEmpresaUsuario(Valor){

			if(document.formulario.txtRutUsuarioEmp){
				document.formulario.txtRutUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.txtRutUsuarioEmp)
			}			
			

			if(document.formulario.NombreUsuarioEmp){
				document.formulario.NombreUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.NombreUsuarioEmp)
			}	
		
			if(document.formulario.APPATERNOUsuarioEmp){
				document.formulario.APPATERNOUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.APPATERNOUsuarioEmp)
			}		
			
			if(document.formulario.APMATERNOUsuarioEmp){
				document.formulario.APMATERNOUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.APMATERNOUsuarioEmp)
			}		
			
			if(document.formulario.DIRECCIONUsuarioEmp){
				document.formulario.DIRECCIONUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.DIRECCIONUsuarioEmp)
			}		
		
			if(document.formulario.txtNroUsuarioEmp){
				document.formulario.txtNroUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.txtNroUsuarioEmp)
			}		
		
	
			if(document.formulario.CasaPisoDptoUsuarioEmp){
				document.formulario.CasaPisoDptoUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.CasaPisoDptoUsuarioEmp)
			}	
			
			if(document.formulario.RegionPropietarioUsuarioEmp){
				document.formulario.RegionPropietarioUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.RegionPropietarioUsuarioEmp)
			}	
			
			if(document.formulario.txt_ComunaPropietarioUsuarioEmp){
				document.formulario.txt_ComunaPropietarioUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.txt_ComunaPropietarioUsuarioEmp)
			}	
		
			if(document.formulario.ComunaPropietarioUsuarioEmp){
				document.formulario.ComunaPropietarioUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.ComunaPropietarioUsuarioEmp)
			}	
		
			if(document.formulario.txtcodtelUsuarioEmp){
				document.formulario.txtcodtelUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.txtcodtelUsuarioEmp)
			}	
		
			if(document.formulario.TelefonoUsuarioEmp){
				document.formulario.TelefonoUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.TelefonoUsuarioEmp)
			}	
		
			if(document.formulario.txtcodtelcomUsuarioEmp){
				document.formulario.txtcodtelcomUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.txtcodtelcomUsuarioEmp)
			}	
		
			if(document.formulario.TelefonoCentralUsuarioEmp){
				document.formulario.TelefonoCentralUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.TelefonoCentralUsuarioEmp)
			}	
		
		
			if(document.formulario.txtCodigoCelularUsuarioEmp){
				document.formulario.txtCodigoCelularUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.txtCodigoCelularUsuarioEmp)
			}	
		
		
			if(document.formulario.CelularUsuarioEmp){
				document.formulario.CelularUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.CelularUsuarioEmp)
			}	
		
			if(document.formulario.EMailUsuarioEmp){
				document.formulario.EMailUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.EMailUsuarioEmp)
			}	
		
			if(document.formulario.EstadoCivilUsuarioEmp){
				document.formulario.EstadoCivilUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.EstadoCivilUsuarioEmp)
			}	
		
			if(document.formulario.SexoPropietarioUsuarioEmp){
				document.formulario.SexoPropietarioUsuarioEmp[0].disabled = Valor
				document.formulario.SexoPropietarioUsuarioEmp[1].disabled = Valor
				fncQuitarColor(document.formulario.SexoPropietarioUsuarioEmp[0])
				fncQuitarColor(document.formulario.SexoPropietarioUsuarioEmp[1])
			}	
		
			if(document.formulario.FechaNacimientoUsuarioEmp){
				document.formulario.FechaNacimientoUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.FechaNacimientoUsuarioEmp)
			}	
		
			if(document.formulario.cboDiaNacUsuarioEmp){
				document.formulario.cboDiaNacUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.cboDiaNacUsuarioEmp)
			}	
		
			if(document.formulario.cboMesNacUsuarioEmp){
				document.formulario.cboMesNacUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.cboMesNacUsuarioEmp)
			}	
		
			if(document.formulario.cboAnhoNacUsuarioEmp){
				document.formulario.cboAnhoNacUsuarioEmp.disabled = Valor
				fncQuitarColor(document.formulario.cboAnhoNacUsuarioEmp)
			}	
			
			if(document.formulario.boton4){
				document.formulario.boton4.disabled = Valor
				fncQuitarColor(document.formulario.boton4)
			}				
						
}

function replicaInfo(obj){
	if(document.formulario.chkCopiarDatos.checked){
		fncCopiarDatos()
	}
}	


function DisabledDatosConcesionario(Valor){

			if(document.formulario.txt_LocalConc){
				document.formulario.txt_LocalConc.disabled = Valor
				fncQuitarColor(document.formulario.txt_LocalConc)
			}	

			if(document.formulario.txtNombreVendedor){
				document.formulario.txtNombreVendedor.disabled = Valor
				fncQuitarColor(document.formulario.txtNombreVendedor)
			}	

			if(document.formulario.cboDiaEnt){
				document.formulario.cboDiaEnt.disabled = Valor
				fncQuitarColor(document.formulario.cboDiaEnt)
			}	

			if(document.formulario.cboMesEnt){
				document.formulario.cboMesEnt.disabled = Valor
				fncQuitarColor(document.formulario.cboMesEnt)
			}	

			if(document.formulario.cboAnhoEnt){
				document.formulario.cboAnhoEnt.disabled = Valor
				fncQuitarColor(document.formulario.cboAnhoEnt)
			}	

			if(document.formulario.txtnumfact){
				document.formulario.txtnumfact.disabled = Valor
				fncQuitarColor(document.formulario.txtnumfact)
			}	

			if(document.formulario.cboDiaFac){
				document.formulario.cboDiaFac.disabled = Valor
				fncQuitarColor(document.formulario.cboDiaFac)
			}	

			if(document.formulario.cboMesFac){
				document.formulario.cboMesFac.disabled = Valor
				fncQuitarColor(document.formulario.cboMesFac)
			}	

			if(document.formulario.cboAnhoFac){
				document.formulario.cboAnhoFac.disabled = Valor
				fncQuitarColor(document.formulario.cboAnhoFac)
			}	
			
			/*
			if(document.formulario.FormaPagoUsuario){
				document.formulario.FormaPagoUsuario.disabled = Valor
				fncQuitarColor(document.formulario.FormaPagoUsuario)
			}	

			if(document.formulario.SeguroUsuario){
				document.formulario.SeguroUsuario.disabled = Valor
				fncQuitarColor(document.formulario.SeguroUsuario)
			}	
			*/
}




function DisabledEmpresaCta(Valor){
/*
			if(document.formulario.RUTEmpresa){
				document.formulario.RUTEmpresa.disabled = Valor
				fncQuitarColor(document.formulario.RUTEmpresa)
			}	

			if(document.formulario.DVEmpresa){
				document.formulario.DVEmpresa.disabled = Valor
				fncQuitarColor(document.formulario.DVEmpresa)
			}	

*/
			if(document.formulario.NombreEmpresa){
				document.formulario.NombreEmpresa.disabled = Valor
				fncQuitarColor(document.formulario.NombreEmpresa)
			}	

			if(document.formulario.DireccionEmpresa){
				document.formulario.DireccionEmpresa.disabled = Valor
				fncQuitarColor(document.formulario.DireccionEmpresa)
			}	

			if(document.formulario.txtnroEmpresa){
				document.formulario.txtnroEmpresa.disabled = Valor
				fncQuitarColor(document.formulario.txtnroEmpresa)
			}	
														
			if(document.formulario.CasaPisoDptoEmpresa){
				document.formulario.CasaPisoDptoEmpresa.disabled = Valor
				fncQuitarColor(document.formulario.CasaPisoDptoEmpresa)
			}	

			if(document.formulario.txt_Comuna2Empresa){
				document.formulario.txt_Comuna2Empresa.disabled = Valor
				fncQuitarColor(document.formulario.txt_Comuna2Empresa)
			}	

			if(document.formulario.RegionEmpresa){
				document.formulario.RegionEmpresa.disabled = Valor
				fncQuitarColor(document.formulario.RegionEmpresa)
			}	


			if(document.formulario.APPATERNOEmpresa){
				document.formulario.APPATERNOEmpresa.disabled = Valor
				fncQuitarColor(document.formulario.APPATERNOEmpresa)
			}	

			if(document.formulario.FonoContactoEmpresa){
				document.formulario.FonoContactoEmpresa.disabled = Valor
				fncQuitarColor(document.formulario.FonoContactoEmpresa)
			}	


			if(document.formulario.EMailEmpresa){
				document.formulario.EMailEmpresa.disabled = Valor
				fncQuitarColor(document.formulario.EMailEmpresa)
			}	

			if(document.formulario.CelularEmpresa){
				document.formulario.CelularEmpresa.disabled = Valor
				fncQuitarColor(document.formulario.CelularEmpresa)
			}	
				

			if(document.formulario.codTelefonoEmpresa){
				document.formulario.codTelefonoEmpresa.disabled = Valor
				fncQuitarColor(document.formulario.codTelefonoEmpresa)
			}	

			if(document.formulario.TelefonoEmpresa){
				document.formulario.TelefonoEmpresa.disabled = Valor
				fncQuitarColor(document.formulario.TelefonoEmpresa)
			}	

			if(document.formulario.codTelefono2Empresa){
				document.formulario.codTelefono2Empresa.disabled = Valor
				fncQuitarColor(document.formulario.codTelefono2Empresa)
			}	

			if(document.formulario.TelefonoCentralEmpresa){
				document.formulario.TelefonoCentralEmpresa.disabled = Valor
				fncQuitarColor(document.formulario.TelefonoCentralEmpresa)
			}	

			if(document.formulario.boton3){
				document.formulario.boton3.disabled = Valor
				fncQuitarColor(document.formulario.boton3)
			}				
						
}


function emailCheck (obj){
var emailStr=obj.value
var emailPat=/^(.+)@(.+)$/
var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]"
var validChars="\[^\\s" + specialChars + "\]"
var quotedUser="(\"[^\"]*\")"
var ipDomainPat=/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/
var atom=validChars + '+'
var word="(" + atom + "|" + quotedUser + ")"
var userPat=new RegExp("^" + word + "(\\." + word + ")*$")
var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$")
var matchArray=emailStr.match(emailPat)

	if (emailStr==''){
		return true;
		}
	
	if (matchArray==null) {
		
		alert("Dirección Email está incorrecta. Verifique que este bien escrita.")
		obj.value='';
		obj.focus();
		return false;
	}
	var user=matchArray[1]
	var domain=matchArray[2]
	
	if (user.match(userPat)==null) {
	    alert("Username no valido.")
	    obj.value = '';
	    obj.focus();
	    return false;
	}
	
	var IPArray=domain.match(ipDomainPat)
	if (IPArray!=null) {
		  for (var i=1;i<=4;i++) {
		    if (IPArray[i]>255) {
		        alert("Dirección IP no Valida!")
		        obj.value='';
		        obj.focus();
			return false;
		    }
	    }
	    return true;
	}
	var domainArray=domain.match(domainPat)
	if (domainArray==null) {
		alert("El dominio indicado no existe.")
		obj.value = '';
		obj.focus();
	    	return false;
	}
	var atomPat=new RegExp(atom,"g")
	var domArr=domain.match(atomPat)
	var len=domArr.length
	if (domArr[domArr.length-1].length<2 || 
	    domArr[domArr.length-1].length>3) {
	
	   alert("La dirección debe finalizar con 3 letras (ej: com, net, org, gov, mil) o 2 letras (ej: cl, de, br, ar)")
	   obj.value = '';
	   obj.focus();
	   return false
	}
	if (len<2) {
	   var errStr="Dirección incompleta"
	   alert(errStr)
	   obj.value = '';
	   obj.focus();
	   return false
	   
	}
	return true;
}



function validateSizeText(obj,msg){
var xx = obj.value
		if(xx.length > 9){
			alert("El " + msg + " debe tener maximo 9 digitos")
			obj.value=""
			obj.focus()
			return false
		}
}
</script>



<SCRIPT>                                                                                 
<!--                                                                                     
                                                                                         
function combotext_onkeydown(e,oText,oSelect){                                           
                                                                                         
  keyCode = e.keyCode;                                                                   
                                                                                         
  if (keyCode == 40 || keyCode == 38) {                                                  
    oSelect.style.display = 'block';                                                     
    oSelect.focus();                                                                     
    comboselect_onchange(oSelect, oText);                                                
  }                                                                                      
  else if (keyCode == 13) {                                                              
    e.cancelBubble = true;                                                               
    if (e.returnValue) e.returnValue = false;                                            
    if (e.stopPropagation) e.stopPropagation();                                          
    comboselect_onchange(oSelect, oText);                                                
    oSelect.style.display='none';                                                        
    oText.focus();   
    BuscaComuna(oSelect,oText)
	   
    return false;                                                                        
  }                                                                                      
  else if(keyCode == 9) return true;                                                     
  else { //alert(keyCode);                                                               
                                                                                         
    oSelect.style.display = 'block';                                                     
                                                                                         
    var c = String.fromCharCode(keyCode);                                                
    c = c.toUpperCase();                                                                 
    toFind = oText.value.toUpperCase() + c;                                              
                                                                                         
    //alert(oSelect.options.length)                                                      
    for (i=0; i < oSelect.options.length; i++){                                          
       //nextOptionText = oSelect.options.text.toUpperCase();                            
       var nextOptionText = ""                                                           
       nextOptionText = oSelect.options[i].text;    
                                                                                         
       if(!nextOptionText)                                                               
				nextOptionText=""                                                                   
        nextOptionText = nextOptionText.toUpperCase();                                   
                                                                                         
        if(toFind == nextOptionText){                                                    
            oSelect.selectedIndex = i;                                                   
            break;                                                                       
        }                                                                                
                                                                                         
        if(i < oSelect.options.length-1){                                                
           lookAheadOptionText = oSelect.options[i+1].text.toUpperCase() ;               
                                                                                         
           if(toFind.search('Ñ')==-1){                                                   
								toFind = toFind.replace('Ñ','N')                                                 
								nextOptionText = nextOptionText.replace('Ñ','N')                                 
								lookAheadOptionText = lookAheadOptionText.replace('Ñ','N')                       
								toFind = toFind.replace('Ñ','N')                                                 
								nextOptionText = nextOptionText.replace('Ñ','N')                                 
								lookAheadOptionText = lookAheadOptionText.replace('Ñ','N')                       
           }                                                                             
                       
         if( (lookAheadOptionText.search(toFind)!=-1)){ 
			      	oSelect.selectedIndex = i+1;
						  break;  
         }		
           /*                                                                           
           if( (toFind > nextOptionText) && (toFind < lookAheadOptionText) ){            
              oSelect.selectedIndex = i+1;                                               
              break;                                                                     
           }    
           */                                                                         
         }                                                                               
         else {                                                                          
           if(toFind > nextOptionText){                                                  
               oSelect.selectedIndex = oSelect.options.length-1; // stick it at the end  
               break;                                                                    
           }                                                                             
       }                                                                                 
    }                                                                                    
  }                                                                                      
}                                                                                        
                                                                                        
                                                                                         
function comboselect_onchange(oSelect,oText) {                                           
  if(oSelect.selectedIndex != -1)                                                        
    oText.value = oSelect.options[oSelect.selectedIndex].text;                           
}                                                                                        
                                                                                         
function comboselect_onkeyup(keyCode,oSelect,oText){                                     
  if (keyCode == 13) {                                                                   
    comboselect_onchange(oSelect, oText);                                                
    oSelect.style.display='none';                                                        
    oText.focus();                                                                       
  }                                                                                      
}                                                                                        
                                       
                                       
                                       
function validarRangoFecha(dayFF,monthFF,yearFF,dayFE,monthFE,yearFE)
{
   
    Condicion = 0;
  if (dayFF=="" || monthFF=="" || yearFF=="")
  {
      Condicion = 4;
  }
  
  
  cambioFechaFacturaBack = monthFF + "/" + dayFF + "/" + yearFF;
  cambioFechaFacturaGo = monthFF + "/" + dayFF + "/" + yearFF;
  cambioFechaEntrega = monthFE + "/" + dayFE + "/" + yearFE;
  
  // Fecha Actual
  fechaActual = new Date();
  fechaActual.setHours(0,0,0,0);
   //Fecha Factura Back
  fechaFacturaBack = new Date(cambioFechaFacturaBack);
  // Fecha Factura Go
  fechaFacturaGo = new Date(cambioFechaFacturaGo);
  // Fecha Entrega
  fechaEntrega = new Date(cambioFechaEntrega);
  
  // Fecha Actual -1 mes 
  limiteFechaFacturaBack = dateAdd("m", -1, fechaActual);
   // Fecha Actual +1 mes 
  limiteFechaFacturaGo = dateAdd("m", 1, fechaActual);   
  
  var DiasDiferencia = 21 
     
  if(<%=trim(codapp)%>=='5')
  {
	 DiasDiferencia = 15 
  }
  

  
  //Condicion Fecha Factura < Fecha Entrega
  diffFechas = dateDiff("d",fechaFacturaBack,fechaEntrega, 0, 0);
  if (diffFechas < -21)  
      {
        Condicion = 2;
      }
  
  // Factura //////////////////////////////////////////////////////////////////
  // diferencia en dias (fecha actual - fecha factura) 
  diffFechaFacturaBack = dateDiff("d",fechaFacturaBack,fechaActual, 0, 0);
  // diferencia en dias (fecha limite factura - fecha factura) 
  diffFechaFacturaLimBack = dateDiff("d",limiteFechaFacturaBack, fechaActual, 0, 0);
  // alert("diff 1:"+diffFechaFacturaBack + " Dif2:"+diffFechaFacturaLimBack);
  if (diffFechaFacturaBack > diffFechaFacturaLimBack)
  {
       Condicion = -1;
  }
  // Factura Back //////////////////////////////////////////////////////////////////
  
  
  
  // Factura Go  //////////////////////////////////////////////////////////////////
  if(Condicion == 0)
  {
  
      // diferencia en dias (fecha actual - fecha factura) 
      diffFechaFacturaGo = dateDiff("d",fechaActual,fechaFacturaGo,0, 0);
      // diferencia en dias (fecha limite factura - fecha factura) 
      diffFechaFacturaLimGo = dateDiff("d",fechaActual, limiteFechaFacturaGo,0, 0);
      
      //alert("diff 1:"+diffFechaFacturaGo + " Dif2:"+diffFechaFacturaLimGo);
    
      if (diffFechaFacturaGo > diffFechaFacturaLimGo)
      {
         Condicion = 1;
      }
  }  
  // Factura Go  //////////////////////////////////////////////////////////////////
  
  // Diferencia en dias ////////////////////////////////////////////////////  
  diffWeek = dateDiff("d",fechaFacturaBack,fechaEntrega, 0, 0);
  if(Math.abs(diffWeek)>Math.abs(DiasDiferencia) && Condicion ==0)
   {Condicion = 3;}
     
   return (Condicion);
}                                        
 
 
                       
function validaFechaFacEntrega(){
		objDiaFF	= document.formulario.cboDiaFac
		objMesFF	= document.formulario.cboMesFac
		objAgnoFF	= document.formulario.cboAnhoFac

		objDiaFE	= document.formulario.cboDiaEnt
		objMesFE	= document.formulario.cboMesEnt
		objAgnoFE	= document.formulario.cboAnhoEnt
		
		var retorno
		retorno = 0
				
		<%
		'Cambio solicitado por Rcastro 21/08/2007
		if trim(TipoUsuario) = "112779" then%>
		    //Validacion solo para tipo_usuario: MARCA
		    return true
	    <%end if%>
	    
		retorno = validarRangoFecha(objDiaFF.value,objMesFF.value,objAgnoFF.value,objDiaFE.value,objMesFE.value,objAgnoFE.value)
		
//		if(retorno==-1){
//			alert("Fecha Facturación menor a 1 mes")
//			objDiaFF.value=""
//			objMesFF.value=""
//			objAgnoFF.value=""
//			objDiaFF.focus()
//			return false
//		}
//
//		if(retorno==1){
//			alert("Fecha Facturación mayor a 1 mes")
//			objDiaFF.value=""
//			objMesFF.value=""
//			objAgnoFF.value=""
//			objDiaFF.focus()
//			return false
//		}
//
//		if(retorno==2){
//			alert("Fecha Facturacion mayor a Fecha Entrega")
//			objDiaFF.value=""
//			objMesFF.value=""
//			objAgnoFF.value=""
//			objDiaFF.focus()
//			return false
//		}
//
//		if(retorno==3){
//		    if(<%=trim(codapp)%>=='"5"')
//			{	
//				alert("Fecha Entrega mayor a 2 semanas")
//			}
//			else
//			{	
//				alert("Fecha Entrega mayor a 3 semanas")
//			}
//			objDiaFE.value=""
//			objMesFE.value=""
//			objAgnoFE.value=""
//			objDiaFE.focus()
//			return false
//		}
//
//		if(retorno==4){
//			alert("Fecha Facturacion incompleta")
//			objDiaFF.value=""
//			objMesFF.value=""
//			objAgnoFF.value=""
//			objDiaFF.focus()
//			return false
//		}
//	    return true
} 
                       
// -->                                                                                   
</SCRIPT>                      
