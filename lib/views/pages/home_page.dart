import 'package:arrk_1/constants/constant_colors.dart';
import 'package:arrk_1/constants/constant_strings.dart';
import 'package:arrk_1/views/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  static bool isPriceValid = false;
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // facem obiecte TextEditingController unde putem introduce custum ce sa avem in campuri!!!!!
  final TextEditingController priceController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController bedroomController = TextEditingController();
  final TextEditingController bathroomController = TextEditingController();
  final TextEditingController sqmController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ConstantStrings.title),
        backgroundColor: ConstantsColors.secondary,
        titleTextStyle: const TextStyle(color: ConstantsColors.textColor, fontWeight: FontWeight.w700, fontSize: 32),
      ),
      body: Column( //pt a aduga acele widgeturi folosim children unde in [] punem o lista de widgeturi
        children: [
          TextFieldWidget(
            controller: priceController, //aici modificam sapt viitoare. dar il initializam pe linia 15
            hintText: ConstantStrings.housePriceHint,
            maxLength: 10,
            maxLines: 1,
            inputType: TextInputType.number,

          ),
          TextFieldWidget(
            controller: streetController,
            hintText: ConstantStrings.houseStreetHint,
            maxLength: 30,
            maxLines: 1,
            inputType: TextInputType.text,
          ),

          TextFieldWidget(
            controller: bedroomController,
            hintText: ConstantStrings.bedRoomsHint,
            maxLength: 1,
            maxLines: 1,
            inputType: TextInputType.number,
          ),

          TextFieldWidget(
            controller: bathroomController,
            hintText: ConstantStrings.bathRoomsHint,
            maxLength: 1,
            maxLines: 1,
            inputType: TextInputType.number,
          ),

          TextFieldWidget(
            controller: sqmController,
            hintText: ConstantStrings.sqmHint,
            maxLength: 4,
            maxLines: 1,
            inputType: TextInputType.number,
          ),

          TextFieldWidget(
              controller: imageController,
              hintText: ConstantStrings.addImageBtn,
              maxLength: 8,
              maxLines: 1),
        ],
      ),
    ); //nu uita de el! ca sa avem cum sa comunice widgeturile
  }
}