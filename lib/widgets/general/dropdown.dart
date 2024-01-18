import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/model/enum/enums.dart';
import 'package:flutter/material.dart';

class SizeDropDown extends StatefulWidget {
  final String hintText;
  SizeDropDown({required this.hintText});

  @override
  State<SizeDropDown> createState() => _SizeDropDownState();
}

class _SizeDropDownState extends State<SizeDropDown> {
  size? productsize;
  color? productcolor;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        filled: true,
        fillColor: greyScaffoldbf,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.4),
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            borderRadius: BorderRadius.circular(12),
            isDense: true,
            dropdownColor: greyScaffoldbf,
            focusColor: Colors.white,
            alignment: AlignmentDirectional.topStart,
            hint: Text(
              widget.hintText,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            items: widget.hintText=="Color"?
            color.values
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e.name,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ))
                .toList()
                :size.values
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e.name,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ))
                .toList(),
          
            value: widget.hintText=="Color"?productcolor:productsize,
            onChanged: ((value) {
              setState(() {
                if(widget.hintText=="Color"){
                  productcolor = value as color?;
                }
                else{
                  productsize = value as size?;
                }
              });
            })),
      ),
    );
  }
}
