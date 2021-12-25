import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_starter_app/common/base_view.dart';
import 'package:flutter_starter_app/units/date_transform/task_date_service_impl.dart';
import 'package:flutter_starter_app/viewmodels/create_task_viewmodel.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:form_builder_validators/form_builder_validators.dart';


class CreateTaskView extends StatelessWidget{

  static const CREATE_TASK_TITLE ="Add Task";
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<CreateTaskViewModel>(
        onModelReady: (model) => model.onFirstLoad(),
    builder: (context, model, children) =>
        Scaffold(
       appBar:  AppBar(
           elevation: 0,
           backgroundColor: Colors.white,
           foregroundColor: Colors.black,
           centerTitle: false,
           title: Text(CREATE_TASK_TITLE, style: GoogleFonts.pacifico(
             textStyle: TextStyle(color: Colors.black, letterSpacing: .85, fontStyle: FontStyle.normal, fontSize: 28),)
           )),
       body: Padding(
         padding: const EdgeInsets.all(14.0),
         child: FormBuilder(
           key: _formKey,
           child: ListView(
             children: [
               Row(
                 children: [
                   Text("Date", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                   SizedBox(width: 20,),
                   Text(TaskDateService().formatDateNowToYearAsString(),style: TextStyle(fontSize: 18),)
                 ],
               ),
               SizedBox(height: 20,),
               FormBuilderTextField(
                 name: 'title',
                 decoration: InputDecoration(
                     border: OutlineInputBorder(
                       // width: 0.0 produces a thin "hairline" border
                       borderRadius: BorderRadius.all(Radius.circular(5.0)),
                       borderSide:  BorderSide(
                         color: Colors.black,
                       ),
                       //borderSide: const BorderSide(),
                     ),
                     labelText: 'Title'
                 ),
                 validator: FormBuilderValidators.compose([
                   FormBuilderValidators.required(context),
                 ]),
               ),
               SizedBox(height: 20,),
               FormBuilderTextField(
                 textAlign: TextAlign.start,
                 textAlignVertical: TextAlignVertical.center,
                 name: 'description',
                 maxLines: 3,
                 decoration: InputDecoration(
                     alignLabelWithHint: true,
                     border: OutlineInputBorder(
                       // width: 0.0 produces a thin "hairline" border
                       borderRadius: BorderRadius.all(Radius.circular(5.0)),
                       borderSide:  BorderSide(
                         color: Colors.black,
                       ),
                       //borderSide: const BorderSide(),
                     ),
                     labelText: 'Description'
                 ),
               ),
               SizedBox(height: 5,),
               FormBuilderDateTimePicker(
                 name: 'startTime',
                 firstDate: DateTime.now(),
                 alwaysUse24HourFormat: false,
                 format: DateFormat("hh:mm a"),

                 inputType: InputType.time,
                 decoration: InputDecoration(
                   labelText: 'Start Time',


                 ),
                 initialTime: TimeOfDay(hour: 8, minute: 0),
                 initialValue: DateTime.now(),

               ),
               SizedBox(height: 5,),
               FormBuilderDateTimePicker(
                 name: 'endDate',
                 alwaysUse24HourFormat: false,
                 format: DateFormat("hh:mm a"),
                 inputType: InputType.time,
                 decoration: InputDecoration(
                   labelText: 'End Time',


                 ),
                 initialTime: TimeOfDay(hour: 8, minute: 0),
                 initialValue: DateTime.now().add(Duration(minutes: 30)),

               ),
               SizedBox(height: 5,),
               FormBuilderColorPickerField(
                 name: 'colorPicker',
                 initialValue: Colors.red,
                 colorPickerType: ColorPickerType.blockPicker,
                 decoration: const InputDecoration(labelText: 'Color Code'),
               ),


               SizedBox(height: 20,),

               FormBuilderImagePicker(
                 name: 'attachmentPhoto',
                 decoration: const InputDecoration(labelText: 'Pick Photos'),
                 maxImages: 1,
               ),
               FormBuilderCheckbox(
                 name: 'remindMe',
                 initialValue: false,
                 title: RichText(
                   text: TextSpan(
                     children: [
                       TextSpan(
                         text: 'Set Reminder ?',
                         style: TextStyle(color: Colors.black, fontSize: 18),
                       ),

                     ],
                   ),
                 ),

               ),
               SizedBox(height: 50),
               SizedBox(
                 width:200,
                 height:50,
                 child: ElevatedButton(

                   child: const Text('Submit', style:TextStyle(fontSize: 18)),
                   style: ElevatedButton.styleFrom(
                     primary: Colors.black, // background
                     onPrimary: Colors.white, // foreground
                   ),
                   onPressed: () async{
                     if (_formKey.currentState?.saveAndValidate() == true) {

                         await model.addToTaskList(_formKey.currentState!.value);
                         Navigator.pop(context);
                     }
                   },
                 ),
               ),

             ],
           ),
         ),
       ),
     )
    );
  }

}








