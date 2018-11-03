import empresa.*

class Pedido{
	
	var tipo
	var cantidadDeRemeras
	
	const property sucursal
	
	method esDeSucursal(sucursalParam) = sucursal == sucursalParam
	method esDeColor(color) = tipo.esDeColor(color)
	
	method precioDelPedido() = (tipo.costo() * cantidadDeRemeras) - self.descuentoAplicado() 

	
	method descuentoAplicado() = (tipo.costo() * cantidadDeRemeras) * (self.descuento()/100)
	
	//Se ingresa un porcentaje, en el metodo de arriba (linea 16) lo "transfomo" para poder aplicarlo en la linea 13
	method descuento(){
		
		if(self.seHacenAMano()){
			return 0
		}
		
		if(self.hayConvenio() and self.cantidadRemerasParaDescuento()){
			return 20
		}
		
		return 10
		
		
	}
	
	method seHacenAMano() = tipo.esBordada()
	method hayConvenio() = empresa.existeConvenioConMarca(tipo.marca())
	method cantidadRemerasParaDescuento() = cantidadDeRemeras >= sucursal.cantidadRemerasDescuento()
	
}
