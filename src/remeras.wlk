class Remera{
	
	const talle
	//Agrego un color que no sea nulo para que pueda contestar al mensaje  method pedidosColor(color) en empresa.wlk
	const color = ""
	
	//porBonus
	var property precioUno = 80
	var property precioDos = 100
	
	method esBordada() = false
	
	method esDeColor(colorParam) = color == colorParam
	
	method costoBase(){
		
		if((talle >= 32) && (talle <= 40)){
			
			return precioUno
			
		}else{
			
			return precioDos
			
		}
	
	
	}
	
}

class RemeraLisa inherits Remera{
	
	//Por las dudas dejo esta aclaración, pregunté durante el parcial y entendí que el color solo "afecta" el precio de las remeras lisas
		
		
	method costo() = self.costoFinal()
	
	
	method costoFinal(){
		
		if( (color == "blanco") || (color == "negro") || (color == "gris") ){
			
			return (self.costoBase() + 40)
			
		}else{
			
			return ((self.costoBase() + 40)*1.10)
			
		}
		
	}
	
} 
	
	
	

class RemeraBordada inherits Remera{
	
	const coloresBordado = []
	
	method costo() = self.costoBase() + self.costoBordado()
	
	
	method costoBordado() = (20 + (coloresBordado.size() * 10))
	
	override method esBordada() = true
	
	
}



class RemeraSublimada inherits Remera{
	
	const alto
	const ancho
	const marca = null
	
	method costo() = self.costoBase() + self.costoSublimado() + self.derechosDeAutor()
	
	
	method costoSublimado() = self.superficieSublimado() * 0.5
		
	
	method superficieSublimado() = (alto * ancho)
	
	method derechosDeAutor(){
		
		if (marca == null){
			
			return 0
			
		}else{
			
			return marca.derechosDeAutor()
			
		}
		
	}
	
}
