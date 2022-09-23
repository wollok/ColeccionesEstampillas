class Estampilla {
	
	var valor
	var pais
	var anio
	
	method cotizacion() = valor * (2022 - anio)
	
	method nacional() = pais == "argentina"
	
	method equivale(esto) = esto == self
	
	
	method cambiarAnio(diferencia){
		anio = anio - diferencia
	}
}

class Sobre {
	
	const estampillasPegadas
	
	method cotizacion() = estampillasPegadas.max({estampilla => estampilla.cotizacion()}).cotizacion() + 10

	method equivale(esto) = estampillasPegadas.contains(esto)
	
	method cambiarAnio(diferencia){
		if(estampillasPegadas.size() > 1)
			estampillasPegadas.forEach{e=>e.cambiarAnio(diferencia+1)}
	}
}

class Hojita {
	
	var estampilla 
	var contexto = 1
	
	method cotizacion() = estampilla.cotizacion() + contexto
	
	method equivale(esto) = estampilla == esto
	
	method cambiarAnio(diferencia){}
}

class Coleccionista {
	
	
	var album = #{}
		
	method conseguir(algo){
		album.add(algo)
	}
	
	method album() = album
	
	method tenes(esto) = album.any({cosa=>cosa.equivale(esto)})
	
	method cuantasTenes() = album.size()
	
	method esImportante() = album.sum({estampilla => estampilla.cotizacion()}) > 1000
	
	
	method recibirRegalo(otroColeccionista) {
		
		album.addAll(otroColeccionista.album())
		
	}
	
	method estampillasValiosas() = album.filter({e=>e.cotizacion() > 5})
	
	
	method actualizar(anios) {
		album.forEach({e=>e.cambiarAnio(anios)})
	}	
	
	method actualizarValiosas(anios) {
		self.estampillasValiosas().forEach({e=>e.cambiarAnio(anios)})
	}	
	
	
}