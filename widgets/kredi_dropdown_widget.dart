import 'package:dinamik_ortalama_hesapla/app_constant.dart';
import 'package:dinamik_ortalama_hesapla/data_helper.dart';
import 'package:flutter/material.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onKrediSecildi;

  const KrediDropdownWidget({required this.onKrediSecildi, Key? key})
      : super(key: key);

  @override
  State<KrediDropdownWidget> createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  double? secilenKrediDegeri = null;

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
       hint: Text("Kredi") ,
          value: secilenKrediDegeri,
          elevation: 16,
          iconEnabledColor: Sabitler.anaRenk.shade200,
          underline: Container(),
          items: DataHelper.tumDerslerinKredileri(),
          onChanged: (deger) {
            setState(() {
              secilenKrediDegeri = deger!;
              widget.onKrediSecildi(deger);
              print(deger);
            });
          }),
    );
  }
}
