object empresa{

	var pedidos = []
	var marcasAliadas = []
	
	method agregarMarca(marca){
		marcasAliadas.add(marca)
	}
	
	method quitarMarca(marca){
		marcasAliadas.remove(marca)
	}
	
	method agregarPedido(pedido){
		pedidos.add(pedido)
	}
	
	method quitarPedido(pedido){
		pedidos.remove(pedido)
	}
	
	method existeConvenioConMarca(marca) = marcasAliadas.contains(marca)
	
	
	method totalFacturadoEmpresa() = pedidos.sum{pedido => pedido.precioDelPedido()}
	
	method totalFacturadoSucursal(sucursal)	= self.pedidosDeSucursal(sucursal).sum{pedido => pedido.precioDelPedido()}
	
	method sucursalQueMasFacturo() = self.sucursalesVinculadas().max{sucursal => self.gananciaDeSucursal(sucursal)}
	
	method gananciaDeSucursal(sucursal) = self.pedidosDeSucursal(sucursal).sum{pedido => pedido.precioDelPedido()}
	
	method sucursalesVinculadas() = pedidos.map{pedido => pedido.sucursal()}
	
	method pedidosDeSucursal(sucursal) = pedidos.filter{pedido => pedido.esDeSucursal(sucursal)}
	
	method cuantosPedidosHaySegunColor(color) = self.pedidosColor(color).size()
	
	method pedidosColor(color) = pedidos.filter{pedido => pedido.esDeColor(color)}
	
	method pedidoMasCaro() = pedidos.max{pedido => pedido.precioDelPedido()}
	
	//method cantidadSucursalesTodosLosTalles() = 
	
	
}
