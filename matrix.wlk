object nave {
    const pasajeros = []
    method pasajeros() = pasajeros
    method cantidadDePasajeros() = self.pasajeros().size()
    method pasajeroConMayorVitalidad() = self.pasajeros().max({pasajero => pasajero.vitalidad()})
    method vitalidades() = self.pasajeros().map { p => p.vitalidad() }
    method estáEquilibradaEnVitalidad() = self.vitalidades().max() <= self.vitalidades().min() * 2
    method elElegidoEstáEnLaNave() = self.pasajeros().any({ p => p.esElElegido() })
    method chocar() { 
        self.pasajeros().forEach({ pasajero => pasajero.saltar()})
        self.pasajeros().clear()
    }
    method acelerar() { 
        self.pasajeros().forEach({ p =>
        if (not p.esElElegido()) {
            p.saltar()
        }
        })
    }
}

object neo {
    var energía = 100
    method esElElegido() = true
    method energía() = energía
    method saltar() {
        energía /= 2
    }
    method vitalidad() = self.energía() / 10
    method subirALaNave() = nave.pasajeros().add(self)
    method bajarDeLaNave() = nave.pasajeros().remove(self)
}

object morfeo {
    var vitalidad = 8
    var estáCansado = false
    method esElElegido() = false
    method saltar() {
        estáCansado = not estáCansado
        vitalidad -= 1
    }
    method vitalidad() = vitalidad.max(0)
    method subirALaNave() = nave.pasajeros().add(self)
    method bajarDeLaNave() = nave.pasajeros().remove(self)
}

object trinity {
    method esElElegido() = false
    method saltar() {}
    method vitalidad() = 0
    method subirALaNave() = nave.pasajeros().add(self)
    method bajarDeLaNave() = nave.pasajeros().remove(self)
}