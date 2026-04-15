object casa {
    
    var cuenta = cuentaCorriente
    var gastosMensuales= 0
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

    method cambiarACuenta(cuentaACambiar){
        cuenta = cuentaACambiar
    }
    method gastosMensuales(_gastosMensuales){
        gastosMensuales = _gastosMensuales
    }
    method cambiarMes(){
        gastosMensuales = 0
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
        saldo= saldo + cantidad -20
    }

    method costoDeOperacion(_costoDeOperacion){
        costoDeOperacion= _costoDeOperacion
    }
    
    method extraerDinero(cantidad){
        saldo = saldo - cantidad
    }
}