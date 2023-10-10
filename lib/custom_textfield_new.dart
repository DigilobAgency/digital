import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextField extends StatefulWidget {
  String? fieldText;
  String? hintText;
  bool? isFinal;
  bool? enabled;
  List<TextInputFormatter>? inputFormatters;
  FormFieldValidator<String>? validator;
  int? limit;
  int? maxLines;
  String? icon;
  IconData? iconData;
  Function? sufixIconOnTap;
  Function? onTap;
  bool? isPassword;
  bool? isCaps;
  double? nameWidth;
  TextEditingController? controller;
  TextInputType? keyboardType;
  FocusNode? focusNode;
  FocusNode? nextFocusNode;
  ValueChanged<String>? onFieldSubmitted;
  VoidCallback? onEditingComplete;
  Color? lableColor;
  double? lableFontSize;
  double? iconSize;
  double? iconHeight;
  Widget? prefixWidget;

  CustomTextField(
      {Key? key,
      this.fieldText,
      this.hintText,
      this.isFinal,
      this.validator,
      this.enabled = true,
      this.isCaps = false,
      this.inputFormatters,
      this.icon,
      this.iconData,
      this.sufixIconOnTap,
      this.onTap,
      this.isPassword = false,
      this.limit,
      this.maxLines,
      this.nameWidth,
      this.focusNode,
      this.nextFocusNode,
      this.controller,
      this.keyboardType,
      this.onFieldSubmitted,
      this.onEditingComplete,
      this.lableColor,
      this.lableFontSize,
      this.iconHeight,
      this.iconSize,
        this.prefixWidget,
      })
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  String text = "";

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        widget.onTap!();
      },
      child: Container(
        // height: 64.0,
        // padding: const EdgeInsets.symmetric(
        //   horizontal: 10.0,
        // ),
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(10.0)),
        child: TextFormField(
          textCapitalization: widget.isCaps!
              ? TextCapitalization.sentences
              : TextCapitalization.none,
          obscureText: widget.isPassword!,
          focusNode: widget.focusNode,
          validator: widget.validator,
          enabled: widget.enabled ?? false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: Colors.black,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines ?? 1,
          onChanged: (String newVal) {
            if(newVal.startsWith(' ')){
              widget.controller!.text = '';
            }
            else if (newVal.length <= widget.limit!) {
              text = newVal;
            } else {
              widget.controller!.value = TextEditingValue(
                  text: text,
                  selection: TextSelection(
                      baseOffset: widget.limit!,
                      extentOffset: widget.limit!,
                      affinity: TextAffinity.downstream,
                      isDirectional: false),
                  composing: TextRange(start: 0, end: widget.limit!));
            }
          },
          inputFormatters: widget.inputFormatters,
          onFieldSubmitted: (_) {
            widget.isFinal!
                ? FocusScope.of(context).unfocus()
                : FocusScope.of(context).requestFocus(widget.nextFocusNode!);
          },
          onEditingComplete: () {
            widget.isFinal!
                ? FocusScope.of(context).unfocus()
                : FocusScope.of(context).requestFocus(widget.nextFocusNode!);
          },
          textInputAction:
              widget.isFinal! ? TextInputAction.done : TextInputAction.next,
          // decoration: AppStyles.decoration2(widget.fieldText!),
          style: TextStyle(
              fontSize: widget.lableFontSize ?? 18,
              color: widget.lableColor ?? Colors.black,
              fontWeight: FontWeight.normal),
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey, width: 1.2)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey, width: 1.2)
            ),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey, width: 1.2)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey, width: 1.2)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.red, width: 1.0)
            ),
            errorStyle: const TextStyle(
              color: Colors.red, // or any other color
            ),
           // hintText: widget.hintText!,
            prefix: widget.prefixWidget,
           // hintStyle: TextStyle(color: colors.blackColor.withOpacity(0.5)),
            focusColor: Colors.grey,
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 15.0, 10.0),
          )
        ),
      ),
    );
  }
}
