import 'package:flutter/material.dart';

void main() => runApp(const LibreriaApp());

class LibreriaApp extends StatelessWidget {
  const LibreriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF2EBE1),
        useMaterial3: true,
      ),
      home: const CarritoScreen(),
    );
  }
}

class CarritoScreen extends StatelessWidget {
  const CarritoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const colorVino = Color(0xFF722F37);
    const colorBeige = Color(0xFFF2EBE1);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorVino,
        elevation: 0,
        // centerTitle en false mueve el contenido a la izquierda
        centerTitle: false, 
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(Icons.history_edu, color: Colors.white, size: 35),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          
          const Text(
            "TU CARRITO DE COMPRAS",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: Colors.black,
            ),
          ),
          
          const SizedBox(height: 10),
          
          Container(
            height: 2.5,
            margin: const EdgeInsets.symmetric(horizontal: 50),
            color: Colors.black,
          ),
          
          const SizedBox(height: 20),

          Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                horizontalMargin: 10,
                columnSpacing: 15,
                headingRowHeight: 45,
                headingRowColor: WidgetStateProperty.all(colorVino),
                columns: const [
                  DataColumn(label: Text('Libro', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Precio', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Cant.', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Subtotal', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                ],
                rows: [
                  _crearFila("Rayuela", 25.0, 1, "https://m.media-amazon.com/images/I/71m67Yv83vL._AC_UF1000,1000_QL80_.jpg"),
                  _crearFila("Pedro Páramo", 18.0, 2, "https://m.media-amazon.com/images/I/81A6b7L-UPL._AC_UF1000,1000_QL80_.jpg"),
                  _crearFila("El Aleph", 22.0, 1, "https://m.media-amazon.com/images/I/81v7W8N-VvL._AC_UF1000,1000_QL80_.jpg"),
                ],
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("TOTAL ESTIMADO", style: TextStyle(color: Colors.white70, fontSize: 16)),
                    SizedBox(width: 40),
                    Text("\$83.00", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorBeige,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text("SEGUIR COMPRANDO", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorVino,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text("PAGAR", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DataRow _crearFila(String titulo, double precio, int cant, String urlImagen) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Image.network(
                  urlImagen,
                  width: 35,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 35,
                    height: 50,
                    color: Colors.grey[300],
                    child: const Icon(Icons.book, size: 20),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 70,
                child: Text(
                  titulo,
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
        DataCell(Text("\$${precio.toInt()}")),
        DataCell(Text("$cant")),
        DataCell(Text("\$${(precio * cant).toInt()}", style: const TextStyle(fontWeight: FontWeight.bold))),
      ],
    );
  }
}