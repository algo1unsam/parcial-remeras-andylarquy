import empresa.*

class Pedido{
	
	var tipo
	var cantidadDeRemeras
	
	const property sucursal
	
	method esDeSucursal(sucursalParam) = sucursal == sucursalParam
	
	method precioDelPedido() = (tipo.costo() * cantidadDeRemeras) * self.descuentoAplicado() 

	
	method descuentoAplicado() = self.descuento() && self.hayConvenio()
	
	//Se ingresa un porcentaje
	method descuento(){
		
		if(self.seHacenAMano() and self.cantidadRemerasParaDescuento()){
			return 0
		}
		
		if(self.hayConvenio() and self.cantidadRemerasParaDescuento()){
			return 20
		}
		
		return 10
		
		
	}
	
	method seHacenAMano() = tipo.esBordada()
	method hayConvenio() = empresa.existeConvenioConMarca(tipo.marca())
	method cantidadRemerasParaDescuento() = cantidadDeRemeras >= sucursal.cantidadRemerasDescuentos()
	
}
