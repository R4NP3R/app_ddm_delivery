import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _promotions = [
    {
      'name': 'Hambúrguer artesanal',
      'image':
          'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400',
      'oldPrice': 32.90,
      'price': 24.90,
      'discount': 24,
    },
    {
      'name': 'Pizza de mussarela',
      'image': 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400',
      'oldPrice': 45.90,
      'price': 34.90,
      'discount': 24,
    },
    {
      'name': 'Batata frita',
      'image':
          'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=400',
      'oldPrice': 18.90,
      'price': 12.90,
      'discount': 32,
    },
    {
      'name': 'Donuts variados',
      'image':
          'https://images.unsplash.com/photo-1551024506-0bccd828d307?w=400',
      'oldPrice': 20.00,
      'price': 14.90,
      'discount': 26,
    },
    {
      'name': 'Café com leite',
      'image':
          'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=400',
      'oldPrice': 12.00,
      'price': 8.90,
      'discount': 26,
    },
    {
      'name': 'Sanduíche natural',
      'image':
          'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=400',
      'oldPrice': 22.90,
      'price': 16.90,
      'discount': 26,
    },
    {
      'name': 'Panquecas',
      'image':
          'https://images.unsplash.com/photo-1528207776546-365bb710ee93?w=400',
      'oldPrice': 25.00,
      'price': 18.90,
      'discount': 24,
    },
    {
      'name': 'Salada fresca',
      'image':
          'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400',
      'oldPrice': 24.90,
      'price': 17.90,
      'discount': 28,
    },
    {
      'name': 'Bolo de chocolate',
      'image':
          'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=400',
      'oldPrice': 15.00,
      'price': 10.90,
      'discount': 27,
    },
    {
      'name': 'Milkshake',
      'image':
          'https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=400',
      'oldPrice': 19.90,
      'price': 13.90,
      'discount': 30,
    },
  ];

  final List<String> _filters = [
    'Todos',
    'Próximos',
    'Entrega rápida',
    'Melhor avaliação',
  ];

  int _selectedFilter = 0;

  final List<Map<String, dynamic>> _products = [
    {
      'restaurant': 'Restaurante Central',
      'name': 'Hambúrguer artesanal',
      'rating': '4.8',
      'time': '20-30 min',
      'price': 25.90,
      'distance': 1.2,
      'fast': true,
    },
    {
      'restaurant': 'Pizzaria do Bairro',
      'name': 'Pizza de mussarela',
      'rating': '4.9',
      'time': '30-40 min',
      'price': 39.90,
      'distance': 2.5,
      'fast': false,
    },
    {
      'restaurant': 'Lanches Express',
      'name': 'Combo de cheeseburger',
      'rating': '4.6',
      'time': '15-25 min',
      'price': 29.90,
      'distance': 0.8,
      'fast': true,
    },
    {
      'restaurant': 'Sabor Caseiro',
      'name': 'Prato feito',
      'rating': '4.7',
      'time': '25-35 min',
      'price': 22.00,
      'distance': 1.8,
      'fast': false,
    },
  ];

  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filteredProducts {
    List<Map<String, dynamic>> result = _products.where((product) {
      final query = _query.toLowerCase();

      final matchesSearch =
          product['name'].toString().toLowerCase().contains(query) ||
          product['restaurant'].toString().toLowerCase().contains(query);

      if (!matchesSearch) return false;

      switch (_selectedFilter) {
        case 1:
          return product['distance'] <= 1.5;
        case 2:
          return product['fast'] == true;
        default:
          return true;
      }
    }).toList();

    if (_selectedFilter == 3) {
      result.sort(
        (a, b) =>
            (double.parse(b['rating'])).compareTo(double.parse(a['rating'])),
      );
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 25, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EXPLORAR',
            style: TextStyle(
              fontSize: 8,
              letterSpacing: 1.2,
              color: Color(0xFF777777),
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 5),

          Text(
            'Buscar',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),

          SizedBox(height: 20),

          TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                _query = value.trim();
              });
            },
            decoration: InputDecoration(
              hintText: 'Produto, categoria ou restaurante',
              hintStyle: TextStyle(fontSize: 9, color: Color(0xFFAAAAAA)),
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Buscar', style: TextStyle(fontSize: 9)),
                    SizedBox(width: 10),
                    Container(
                      width: 1,
                      height: 20,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
              prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
              suffixIcon: _query.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        _searchController.clear();
                        setState(() {
                          _query = '';
                        });
                      },
                      icon: Icon(Icons.close, size: 16),
                    )
                  : null,
              filled: true,
              fillColor: Color(0xFFFAFAFA),
              contentPadding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFF555555)),
              ),
            ),
          ),

          const SizedBox(height: 18),

          const Text(
            'Ofertas em destaque',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          _buildPromotionCarousel(),

          SizedBox(height: 18),

          Text(
            'Filtros',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 10),

          SizedBox(
            height: 32,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _filters.length,
              itemBuilder: (context, index) {
                final selected = _selectedFilter == index;

                return Padding(
                  padding: EdgeInsets.only(right: 6),
                  child: ChoiceChip(
                    label: Text(_filters[index]),
                    selected: selected,
                    onSelected: (_) {
                      setState(() {
                        _selectedFilter = index;
                      });
                    },
                    showCheckmark: false,
                    labelStyle: TextStyle(
                      fontSize: 8,
                      color: selected ? Colors.white : Color(0xFF333333),
                      fontWeight: selected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                    backgroundColor: Colors.white,
                    selectedColor: Color(0xFF393939),
                    side: BorderSide(
                      color: selected ? Color(0xFF393939) : Color(0xFFD0D0D0),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Resultados',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                '${_filteredProducts.length} itens',
                style: TextStyle(fontSize: 9, color: Colors.grey),
              ),
            ],
          ),

          SizedBox(height: 12),

          if (_filteredProducts.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 35),
              child: Center(
                child: Column(
                  children: [
                    Icon(Icons.search_off, size: 35, color: Colors.grey),
                    SizedBox(height: 8),
                    Text(
                      'Nenhum produto encontrado',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          else
            ..._filteredProducts.map((product) => _buildProductCard(product)),
        ],
      ),
    );
  }

  Widget _buildCarouselCard({
    required String title,
    required String subtitle,
    required String label,
    required IconData icon,
    required Color background,
  }) {
    return Container(
      width: 245,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 7,
                    letterSpacing: 0.8,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  maxLines: 2,
                  style: TextStyle(fontSize: 8, color: Colors.black54),
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          Icon(icon, size: 32, color: Colors.black54),
        ],
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      height: 104,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Container(
            width: 88,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFEAEAEA),
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image_outlined, color: Colors.grey, size: 24),
                SizedBox(height: 3),
                Text(
                  'Imagem do produto',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 7, color: Colors.grey),
                ),
              ],
            ),
          ),

          SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product['restaurant'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 8, color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  product['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  '${product['rating']} ★ • ${product['time']}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 8, color: Colors.grey),
                ),
                Spacer(),
                Text(
                  'R\$ ${(product['price'] as double).toStringAsFixed(2).replaceAll('.', ',')}',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          SizedBox(width: 4),

          Align(
            alignment: Alignment.bottomRight,
            child: OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product['name']} selecionado'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 6),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                side: BorderSide(color: Colors.grey.shade500),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Text('Adicionar', style: TextStyle(fontSize: 8)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromotionCarousel() {
    return SizedBox(
      height: 205,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _promotions.length,
        itemBuilder: (context, index) {
          final product = _promotions[index];

          return Container(
            width: 145,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Foto e desconto
                SizedBox(
                  height: 105,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        product['image'],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: const Color(0xFFEAEAEA),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.fastfood_outlined,
                              size: 35,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),

                      Positioned(
                        top: 7,
                        left: 7,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF303030),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            '-${product['discount']}%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Nome e preços
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const Spacer(),

                        Text(
                          'R\$ ${(product['oldPrice'] as double).toStringAsFixed(2).replaceAll('.', ',')}',
                          style: const TextStyle(
                            fontSize: 9,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),

                        Text(
                          'R\$ ${(product['price'] as double).toStringAsFixed(2).replaceAll('.', ',')}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
