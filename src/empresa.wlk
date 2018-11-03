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
	
	//SUCURSALES CON TODOS LOS TALLES
	
	method cantidadSucursalesTodosLosTalles() = self.sucursalesConTodosLosTalles().count() 
	
	method sucursalesConTodosLosTalles() = self.todasLasSucursales().filter{sucursal => self.estaSucursalTieneTodosLosTalles(sucursal)}//self.todasLasSucursales().filter{sucursal => sucursal.tieneTodosLosTalles()} 
	
	method todasLasSucursales() = pedidos.map{pedido => pedido.sucursal()}.asSet()
	
	method estaSucursalTieneTodosLosTalles(sucursal) = self.pedidosDeSucursal(sucursal).all{}
	//el metodo de arriba debería poder revisar todos los pedidos y decidir si se encuentran todos los talles posibles
	//no me alcanzó el tiempo a hacerlo, pero debería hacer algo por el estilo
}
