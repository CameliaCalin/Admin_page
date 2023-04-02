// cream variabila House care ne va ajuta sa cream toate variabilele (pret, descrierea casei etc) ca sa le stocam
class House{
  int price;
  int bedrooms;
  int bathdrooms;
  String address;
  String description;
  double squareMeters;
  List<String> imagePath; //lista de stringuri care reprezinta locatia fiecarei imagini

//urmeaza sa adaugam un constructor care atunci cand il apelam suntem obligati sa audgam o valoare pt toate variabilele de sus

 House(
     {
    required this.price,
    required this.bedrooms,
       required this.bathdrooms,
    required this.address,
    required this.description,
    required this.squareMeters,
    required this.imagePath});
}