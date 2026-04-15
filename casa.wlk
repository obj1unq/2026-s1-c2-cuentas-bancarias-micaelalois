object casa {
    
    var cuenta = cuentaCorriente
    var gastosMensuales= 0
    var cantidadDeViveres= 0
    var cantidadDeReparaciones = 0
    var montoPorReparacion = 0

    method montoPorReparaciones(){
        return montoPorReparaciones
    }
    method casaEstaEnOrden(){
        return (cantidadDeReparaciones == 0 && self.haySuficientesViveres())
    }
    method registrarReparacionConMonto(monto){
        montoPorReparacion = monto
        cantidadDeReparaciones = cantidadDeReparaciones +1 
    }

    method realizarReparaciones(cantidadDeReparaciones){
        gastosMensuales = montoPorReparacion * cantidadDeReparaciones 
        cantidadDeReparaciones = 0

    }
    method montoPorReparacion(_montoPorReparaciones){
        montoPorReparaciones = _montoPorReparaciones
    }
    method cantidadDeViveres(){
        return cantidadDeViveres
    }

    method cantidadDeViveres(_cantidadDeViveres){
        cantidadDeViveres = _cantidadDeViveres
    }
    method comprarViveres(porcentajeAComprar, calidad){
         self.validarViveres()
         gastosMensuales = porcentajeAComprar * calidad
    }

    method validarViveres(){
        if((cantidadDeViveres + porcentajeAComprar) >  100){
            self.error("Cantidad insficiente por costo de operación")
        }
    }

    method cantidadDeReparaciones(){
        return cantidadDeReparaciones

    }


    method cantidadDeReparaciones(_cantidadDeReparaciones){
        cantidadDeReparaciones = _cantidadDeReparaciones
    }
    method extraer(cantidad){
        cuenta.extraerDinero(cantidad) // SE METE EN LA VARIABLE DE OTRO OBJETO
        gastosMensuales= gastosMensuales + cantidad

    }
    method gastosMensuales(){
        return gastosMensuales
    }
    method depositar(cantidad){
        cuenta.depositarDinero(cantidad)
    }
    method cuenta(_cuenta){
        cuenta= _cuenta
    }

    method cambiarACuenta(_cuentaACambiar){
        cuenta = _cuentaACambiar
    }
    method gastosMensuales(_gastosMensuales){
        gastosMensuales = _gastosMensuales
    }
    method cambiarMes(){
        gastosMensuales = 0
    }
    
    method haySuficientesViveres(){
        return viveres > 40
    }
}



object cuentaCorriente{
    var saldo= 0


    method saldo(){
        return saldo
    }

    method saldo(_saldo){
        saldo = _saldo
    }

    method depositarDinero(cantidad){
        saldo= saldo + cantidad
    }

    method extraerDinero(cantidad){
        saldo = saldo - cantidad
    }

}

object cuentaConGastos{
    var saldo = 0
    var costoDeOperacion = 20

    method saldo(){
        return saldo 
    }
    

    method saldo(_saldo){
        saldo = _saldo
    }
    
    
    method depositarDinero(cantidad){
        self.validarCantidad(cantidad)
        self.depositar(cantidad)
    }
    
    method validarCantidad(cantidad){
        if(not self.puedeDepositar(cantidad)){
            self.error("Cantidad insficiente por costo de operación")
        }
    }
    method puedeDepositar(cantidad){
        return cantidad> costoDeOperacion
    }

    method depositar(cantidad){
        saldo= saldo + cantidad - costoDeOperacion
    }

    method costoDeOperacion(_costoDeOperacion){
        costoDeOperacion= _costoDeOperacion
    }
    
    method extraerDinero(cantidad){
        saldo = saldo - cantidad
    }
}

object cuentaCombinada{
    var saldo= saldoCuentaPrimaria() + saldoCuentaSecundaria()
    var cuentaPrimaria = cuentaConGastos
    var cuentaSecundaria = cuentaCorriente 
    
    method saldoCuentaPrimaria(){
        return 0.max(cuentaConGastos.saldo())
    } 

    method saldoCuentaSecundaria(){
        return 0.max(cuentaCorriente.saldo())
    } 
    
    method depositar(cantidad){
        //DEPOSITAR EN LA CUENTA PRIMARIA//
        cuentaPrimaria.depositarDinero(cantidad)
    }
    method saldo(){
        return saldo
    }


    method extraerDinero(cantidad){
          extraerSiSePuede(cantidad)
    }

    method extraerSiSePuede(cantidad){
          if (cantidad < cuentaPrimaria.saldo()){
                 cuentaPrimaria.extraerDinero(cantidad) }
        
           else { const diferencia = cantidad - cuentaPrimaria.saldo()
                  cuentaPrimaria.saldo(0)
                  cuentaSecundaria.extraerDinero(diferencia)
           }

    }
        
    }


