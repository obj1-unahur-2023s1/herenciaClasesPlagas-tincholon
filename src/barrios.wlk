import elementos.*
import plagas.*

class Barrio {
	const property elementos = []
	
	method agregar(unElemento) {
		elementos.add(unElemento)
	}
	method quitar(unElemento) {
		elementos.remove(unElemento)
	}
	method nBuenos() = elementos.count({elemento => elemento.esBueno()}) 
	method nMalos() = elementos.size() - self.nBuenos()
	method esCopado() = self.nBuenos() > self.nMalos() 
}