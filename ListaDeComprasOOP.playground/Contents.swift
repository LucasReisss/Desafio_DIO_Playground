import UIKit

enum CategoriaDeItem: String {
    case alimentos = "Alimentos"
    case vestuario = "Vestuario"
}

class ItemDeCompra {
    var nome: String
    var quantidade: Int
    var precoUnitario: Double
    var categoria: CategoriaDeItem
    
    init(nome: String, quantidade: Int, precoUnitario: Double, categoria: CategoriaDeItem) {
        self.nome = nome
        self.quantidade = quantidade
        self.precoUnitario = precoUnitario
        self.categoria = categoria
    }
    
    func calcularSubTotal() -> Double{
       return Double(quantidade) * precoUnitario
    }
    
}

class ListaDeCompras {
    var nome: String
    var itens: [ItemDeCompra]
    
    init(nome: String, itens: [ItemDeCompra]) {
        self.nome = nome
        self.itens = itens
    }
}

class ListaDeComprasDeSupermercado: ListaDeCompras {
    var local: String
    
     init(nome: String,itens: [ItemDeCompra], local: String) {
        self.local = local
        super.init(nome: nome,itens: itens)
    }
}

class ListaDeComprasDeRoupa: ListaDeCompras {
    var loja: String
    
    init(nome: String, itens: [ItemDeCompra], loja: String) {
        self.loja = loja
        super.init(nome: nome, itens: itens)
    }
}

class GerenciadorDeLista {
    var listaDeSupermercado: [ListaDeComprasDeSupermercado]?
    var listaDeRoupas: [ListaDeComprasDeRoupa]?
    
    init(listaDeSupermercado:[ListaDeComprasDeSupermercado]?, listaDeRoupas: [ListaDeComprasDeRoupa]? ) {
        self.listaDeSupermercado = listaDeSupermercado
        self.listaDeRoupas = listaDeRoupas
    }
    
    func imprimirRoupas() {
        if let listaRoupas = listaDeRoupas{
            for listaRoupa in listaRoupas {
                print("Loja: \(listaRoupa.loja)")
                print("Lista: \(listaRoupa.nome)")
                print("Quantidade: \(listaRoupa.itens.count)")
                
                print("Itens:")
                for item in listaRoupa.itens {
                    print(" Item: \(item.nome)")
                }
            }
        }
    }
    
    func imprimirQtdListaSupermercado() {
        DispatchQueue.global().sync {
            if let listaSupermercado = listaDeSupermercado {
                for supermercado in listaSupermercado {
                    print("Lista: \(supermercado.nome)")
                }
            }
        }
    }
    
    func imprimirSupermercado() {
        if let listaSupermercado = listaDeSupermercado {
            for lista in listaSupermercado {
                print("Local \(lista.local)")
                print("Lista: \(lista.nome)")
                print("Quantidade: \(lista.itens.count)")
                
                print("Itens:")
                for item in lista.itens {
                    print(" Item: \(item.nome)")
                }
            }
        }
    }
    
    
    func adicionarLista(nome: String, itens:[ItemDeCompra]){
        var lista = ListaDeCompras(nome: nome, itens: itens)
    }
}

let item1 = ItemDeCompra(nome: "Maçãs", quantidade: 4, precoUnitario: 1.50, categoria: .alimentos)

let item2 = ItemDeCompra(nome: "Bananas", quantidade: 8, precoUnitario: 1.20, categoria: .alimentos)

let itemloja1 = ItemDeCompra(nome: "Camisa", quantidade: 8, precoUnitario: 19.99, categoria: .vestuario)
let itemloja2 = ItemDeCompra(nome: "Calça", quantidade: 103, precoUnitario: 99.99, categoria: .vestuario)
let itemloja3 = ItemDeCompra(nome: "Sapato", quantidade: 60, precoUnitario: 200.00, categoria: .vestuario)

var lista = ListaDeComprasDeSupermercado(nome: "Mercadinho", itens: [item1, item2], local: "Atacadão")

var listaRoupa = ListaDeComprasDeRoupa(nome: "roupas do mês", itens: [itemloja1, itemloja2, itemloja3], loja: "Polo")
let gerenciarListas = GerenciadorDeLista(listaDeSupermercado: [lista], listaDeRoupas: [listaRoupa])




print("-----------------------------------------------------")
print("--------------------- Mercado: ----------------------")
print("-----------------------------------------------------")
gerenciarListas.imprimirSupermercado()
print("-------------")
print("Listas: ")
gerenciarListas.imprimirQtdListaSupermercado()
print("-----------------------------------------------------")
print("--------------------- Roupas: -----------------------")
print("-----------------------------------------------------")


let listaR = {
    print("Minha lista de roupas: ")
}
listaR()
gerenciarListas.imprimirRoupas()

