import elementos.*

class Plaga {
	var property poblacion
	
	method transmiteEnfermedades() = poblacion >= 10	
	method atacar(unElemento) {
		unElemento.recibirAtaque(self) //primero esto porque la poblacion aumenta el danio y sino atacan con mas danio del que tienen
		poblacion *= 1.1
	}
}

class Cucarachas inherits Plaga {
	var property pesoPromedio
	
	method nivelDeDanio() = poblacion/2
	override method transmiteEnfermedades() = pesoPromedio >= 10 and super() //super funciona con el mismo nombre
	override method atacar(unElemento) {
		super(unElemento)
		pesoPromedio += 2
	}
}

class Pulgas inherits Plaga {
	
	method nivelDeDanio() = poblacion*2
}

class Garrapatas inherits Pulgas {
	override method atacar(unElemento) {
		unElemento.recibirAtaque(self)
		poblacion *= 1.2
	}
}

class Mosquitos inherits Plaga {
	
	method nivelDeDanio() = poblacion
	override method transmiteEnfermedades() = super() and poblacion % 3 == 0
}