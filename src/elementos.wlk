import plagas.*

class Hogar {
	var property nivelDeMugre
	var property confortQueOfrece
	
	method esBueno() = nivelDeMugre <= confortQueOfrece/2
	method recibirAtaque(unaPlaga) {
		nivelDeMugre += unaPlaga.nivelDeDanio()
	}
}

class Huerta {
	var property capacidadDeProduccion
	var property referencia = referenciaParaHuertas //esto me permite dejar fijo Huerta en caso que cambie referenciaParaHuertas de objeto a una clase
	
	method esBueno() = capacidadDeProduccion > referencia.valor()
	method recibirAtaque(unaPlaga) {
		capacidadDeProduccion = 0.max(capacidadDeProduccion - unaPlaga.nivelDeDanio()*0.1)
		if(unaPlaga.transmiteEnfermedades()) {
			capacidadDeProduccion = 0.max(capacidadDeProduccion - 10)
		}
	}
}

object referenciaParaHuertas {
	var property valor
}

class Mascota {
	var property nivelDeSalud
	
	method esBueno() = nivelDeSalud > 250
	method recibirAtaque(unaPlaga) {
		if(unaPlaga.transmiteEnfermedades()) {
			nivelDeSalud = 0.max(nivelDeSalud - unaPlaga.nivelDeDanio())
		} 
	}  
}

