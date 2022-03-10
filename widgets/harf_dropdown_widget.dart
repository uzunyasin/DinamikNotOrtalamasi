import 'package:dinamik_ortalama_hesapla/app_constant.dart';
import 'package:dinamik_ortalama_hesapla/data_helper.dart';
import 'package:flutter/material.dart';

class HarfDropdownWidget extends StatefulWidget {
  final Function onHarfSecldi;

  const HarfDropdownWidget({required this.onHarfSecldi, Key? key})
      : super(key: key);

  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  double? secilenHarfDegeri = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        hint: Text("Harf"),
          value: secilenHarfDegeri,
          elevation: 16,
          iconEnabledColor: Sabitler.anaRenk.shade200,
          underline: Container(),
          items: DataHelper.tumDerslerinHarfleri(),
          onChanged: (deger) {
            setState(() {
              secilenHarfDegeri = deger!;
              widget.onHarfSecldi(secilenHarfDegeri);
            });
          }),
    );
  }
}
