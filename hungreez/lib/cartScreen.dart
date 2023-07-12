// import 'cart.dart';
// import 'package:flutter/material.dart';


// class CartScreen extends StatelessWidget {
//   final Cart cart;

//   const CartScreen({Key? key, required this.cart}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: cart.items.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final item = cart.items[index];
//                 return ListTile(
//                   title: Text(item.name),
//                   subtitle: Text('Quantity: ${item.quantity}'),
//                   trailing: Text('\$${item.totalPrice()}'),
//                   onTap: () {
//                     cart.removeItem(item);
//                   },
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Total:'),
//                 Text('\$${cart.getTotal().toStringAsFixed(2)}'),
//               ],
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               cart.clear();
//               Navigator.pop(context);
//             },
//             child: Text('Checkout'),
//           ),
//         ],
//       ),
//     );
//   }
// }
