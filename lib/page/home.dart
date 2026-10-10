import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(
            'Olá, usuário',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),

          SizedBox(height: 4),

          SizedBox(
            width: 270,
            child: Text(
              'O que você deseja pedir?',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                height: 1.1,
              ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: 'Digite um produto ou restaurante',
              hintStyle: TextStyle(fontSize: 10, color: Colors.grey),
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Buscar', style: TextStyle(fontSize: 10)),
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
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: Color(0xFFF3F3F3),
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DESTAQUE',
                        style: TextStyle(fontSize: 7, color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Título da promoção',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Breve descrição da promoção.',
                        style: TextStyle(fontSize: 9, color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Text(
                          'Ver promoção',
                          style: TextStyle(fontSize: 8),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: Container(
                    height: 87,
                    decoration: BoxDecoration(
                      color: Color(0xFFE8E8E8),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_outlined,
                          color: Colors.grey,
                          size: 25,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Espaço para imagem',
                          style: TextStyle(fontSize: 8, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categorias',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Ver todas',
                  style: TextStyle(fontSize: 9, color: Colors.black),
                ),
              ),
            ],
          ),

          SizedBox(height: 5),

          SizedBox(
            height: 75,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Column(
                    children: [
                      Container(
                        width: 43,
                        height: 43,
                        decoration: BoxDecoration(
                          color: Color(0xFFEAEAEA),
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: Icon(
                          Icons.image_outlined,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Categoria ${index + 1}',
                        style: TextStyle(fontSize: 8),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Produtos em destaque',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text('Ver todos', style: TextStyle(fontSize: 9)),
              ),
            ],
          ),
          SizedBox(height: 8),
          ListView.builder(
            itemCount: 8,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                height: 104,
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(7),
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
                          Icon(
                            Icons.image_outlined,
                            size: 25,
                            color: Colors.grey,
                          ),
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
                        children: [
                          Text(
                            'Nome do restaurante',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 9, color: Colors.grey),
                          ),

                          SizedBox(height: 4),

                          Text(
                            'Nome do produto',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            'Avaliação • Tempo de entrega',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 8, color: Colors.grey),
                          ),

                          Spacer(),

                          Text(
                            'R\$ 00,00',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: OutlinedButton(
                        onPressed: () {
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8
                          ),
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
            },
          ),
        ],
      ),
    );
  }
}
