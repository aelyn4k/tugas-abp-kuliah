import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const ModNetworking());
}

class ModNetworking extends StatelessWidget {
  const ModNetworking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data Product - M. Aulia Muzzaki Nugraha',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Map<String, dynamic>> data = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      final res = await http.get(
        Uri.parse('https://aii.my.id/api/product'),
      );

      if (res.statusCode == 200) {
        final decoded = jsonDecode(res.body);

        setState(() {
          data = List<Map<String, dynamic>>.from(decoded['list']);
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Gagal mengambil data. Status code: ${res.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Terjadi error: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Product - 2311102051'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: isLoading
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : errorMessage.isNotEmpty
            ? Center(
          child: Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        )
            : data.isEmpty
            ? const Center(
          child: Text(
            'Tidak ada data',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 24,
            ),
          ),
        )
            : ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 15,
                  right: 20,
                  bottom: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data[index]['name'] ?? '',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      data[index]['price'].toString(),
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}