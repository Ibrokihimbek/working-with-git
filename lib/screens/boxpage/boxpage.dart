import 'package:flutter/material.dart';

import '../../data/database/database.dart';
import '../../data/database/local_item_model.dart';

class BoxPage extends StatefulWidget {

  BoxPage({Key? key, }) : super(key: key);

  @override
  State<BoxPage> createState() => _BoxPageState();
}

class _BoxPageState extends State<BoxPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(


        ),
        child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    FutureBuilder<List<Product>>(
                        future: LocalDatabase.getList(),


                        builder:  (context, AsyncSnapshot<List<Product>> snapshot){
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return CircularProgressIndicator();
                          }

                          else if (snapshot.hasData){
                            var data = snapshot.data!;
                            return Container(
                              child: Container(
                                height: MediaQuery.of(context).size.height*0.82,
                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: data.length,
                                  itemBuilder: (context, i){
                                    return Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15),
                                            border: Border.all(width: 1, color: Colors.grey)
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 120,
                                                    width: 130,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                        image: DecorationImage(
                                                            image: NetworkImage(data[i].image_url),fit: BoxFit.cover
                                                        )

                                                    ),
                                                    // child: Image.network(data[i].imageUrl))
                                                  ),
                                                  SizedBox(width: 80,),
                                                  // Text(data[i].),
                                                  Center(
                                                    child: Text(data[i].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), ),
                                                  ),



                                                ],
                                              ),
                                            ),
                                            Container(child: Padding(
                                              padding: const EdgeInsets.only(right: 15),
                                              child: InkWell(
                                                  onTap: (() async{
                                                    await LocalDatabase.deleteTaskById(data[i].id);
                                                    setState(() {

                                                    });
                                                  }),
                                                  child: Icon(Icons.delete_forever, color: Colors.red,)),
                                            ),)
                                          ],
                                        ),

                                      ),
                                    );

                                  },
                                ),
                              ),
                            );
                          }
                          else if(snapshot.hasError){
                            return Center(child: Text("Snapshot error"),);
                          }
                          else return Center(child: Text("ERROR"));

                        }),

                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }


}
