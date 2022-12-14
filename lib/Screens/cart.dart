import 'package:ejemplo3/Helpers/exportClass.dart';
import 'package:ejemplo3/Screens/Inicios.dart';

class ScreenCart extends StatefulWidget {
  @override
  _ScreenCartState createState() => _ScreenCartState();
}
  class Swipe{
  var images;
  var name;
  Swipe(this.images, this.name);
}
class _ScreenCartState extends State<ScreenCart>{

final swipe = [
  Swipe('../assets/img/ceviche.jpg', 'Ceviche'),
  Swipe('../assets/img/trago.jpg', 'Tragos'),
  Swipe('../assets/img/lomo2.jpg', 'Lomo Saltado'),
  Swipe('../assets/img/parrilla.jpg', 'Parrilla'),
  Swipe('../assets/img/ensalada.jpg', 'Ensalada')
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Pedidos"),
        elevation: 0,
      ),
      body: cartP(context) 
    );
  }
}


Widget cartP(BuildContext context) {
 return Container(
             padding: const EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: swipe.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 2
                ), 
              itemBuilder: (context, index){
               return Column(
                 children: [
                   Card(
                     margin: EdgeInsets.all(1),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget> [
                         Image.asset(swipe[index].images,width: 100,),
                         Expanded(
                           child: Container(
                             padding: EdgeInsets.all(5),
                             height: 100,
                             child: Column(
                               children: [
                                 Text(swipe[index].name),
                                 Text("15"),
                                 Row(
                                   mainAxisSize: MainAxisSize.min,
                                   children: <Widget>[
                                     Container(
                                       width: 50,
                                         height: 30,
                                         decoration: BoxDecoration(
                                           color: Colors.lightBlue,
                                           borderRadius: BorderRadius.all(Radius.circular(30))
                                         ),
                                       child:  IconButton(
                                         icon: Icon(Icons.remove, size: 13, color: Colors.white,), onPressed: () {  },
                                         ),
                                     ),
                                     
                                     Container(
                                       width: 20,
                                       child: Center(
                                         child: const Text("1"),
                                       ) 
                                       ),
                                     Container(
                                       child:  IconButton(
                                         icon: Icon(Icons.add,size: 13, color: Colors.white), onPressed: () {  },
                                         ),
                                         width: 50,
                                         height: 30,
                                         decoration: BoxDecoration(
                                           color: Colors.lightBlue,
                                           borderRadius: BorderRadius.all(Radius.circular(30))
                                         ),
                                     )
                                   ],
                                 )
                               ]
                               ),
                           ),
                         ),
                         Container(
                           height: 100,
                           width: 70,
                           child: const Center(
                             child: Text("S/10"),
                           ),

                         )
                       ],
                     ),
                   )
                 ]
                 );
              } 
              ), 
          );

}
