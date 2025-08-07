// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:kdlgia/search/diamondDataDetail.dart';
// import 'package:syncfusion_flutter_xlsio/xlsio.dart';
// import 'package:permission_handler/permission_handler.dart';
//   // For Android external directories

// void showSnackbar(BuildContext context, String message) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text(message),
//       duration: Duration(seconds: 3),
//       behavior: SnackBarBehavior.floating,
//       backgroundColor: Colors.green,
//     ),
//   );
// }


// Future<bool> _requestStoragePermission() async {
//   var storageStatus = await Permission.storage.status;
//   print("Storage permission status: $storageStatus");

//   if (storageStatus.isGranted) {
//     // Permission is granted
//     return true;
//   } else {
//     // Request permission
//     var result = await Permission.storage.request();
//     print("Storage permission request result: $result");
//     return false;
//   }  // For non-Android platforms, assume permissions are granted.
// }

// void createExcelFileAndSave(
//     String token, List<Diamond> diamond, BuildContext context) async {
//   // Request storage permission
//   var status = await Permission.storage.request();
//   if (status.isGranted) {
//     // Create a new Excel document.
//     final Workbook workbook = Workbook();
//     final Worksheet sheet = workbook.worksheets[0];

//     // var alpha = sheet.mergeCells;
//     // alpha.addCell(MergeCell())
//     //Adding a picture
//     var byteData = await rootBundle.load('assets/Images/58.png');
//     final Uint8List imageBytes = byteData.buffer.asUint8List();

// // Add the image to the worksheet
//     final Picture picture = sheet.pictures.addStream(1, 1, imageBytes);

// //Defining a global style with all properties.
//     Style globalStyle  = workbook.styles.add('style');
// //set back color by hexa decimal.
//     globalStyle.backColor = '#abdbe3';
// //set font name.
//     globalStyle.fontName = 'Times New Roman';
// //set font size.
//     globalStyle.fontSize = 12;
// //set font color by hexa decimal.
//     // globalStyle.fontColor = '#C67878';
// //set font italic.
//     globalStyle.italic = true;
// //set font bold.
//     globalStyle.bold = true;
// //set font underline.
//     // globalStyle.underline = true;
// //set wraper text.
//     globalStyle.wrapText = true;
// //set indent value.
//     // globalStyle.indent = 1;
// //set horizontal alignment type.
//     globalStyle.hAlign = HAlignType.center;
// //set vertical alignment type.
//     globalStyle.vAlign = VAlignType.center;
// //set text rotation.
//     // globalStyle.rotation = 90;
// //set all border line style.
//     globalStyle.borders.all.lineStyle = LineStyle.thin;
// //set border color by hexa decimal.
//     // globalStyle.borders.all.color = '#9954CC';
// //set number format.
//     globalStyle.numberFormat = '_(\$* #,##0_)';

//     Style cellGlobalStyle = workbook.styles.add('cellGlobalStyle');
// //set back color by hexa decimal.
//     // cellGlobalStyle.backColor = '#abdbe3';
// //set font name.
//     cellGlobalStyle.fontName = 'Times New Roman';
// //set font size.
//     cellGlobalStyle.fontSize = 12;
// //set font color by hexa decimal.
//     // globalStyle.fontColor = '#C67878';
// //set font italic.
//     cellGlobalStyle.italic = false;
// //set font bold.
//     cellGlobalStyle.bold = false;
// //set font underline.
//     // globalStyle.underline = true;

// //set wraper text.
//     cellGlobalStyle.wrapText = false;
// //set indent value.
//     // globalStyle.indent = 1;
// //set horizontal alignment type.
//     cellGlobalStyle.hAlign = HAlignType.center;
// //set vertical alignment type.
//     cellGlobalStyle.vAlign = VAlignType.center;
// //set text rotation.
//     // globalStyle.rotation = 90;
// //set all border line style.
//     cellGlobalStyle.borders.all.lineStyle = LineStyle.thin;
// //set border color by hexa decimal.
//     // globalStyle.borders.all.color = '#9954CC';
// //set number format.
//     // cellGlobalStyle.numberFormat = '_(\$* #,##0_)';

//     // Add some content to the Excel sheet
//     List<String> ls = [
//       "Sr.No.",
//       "Stock No.",
//       "Image",
//       "Video",
//       "Shape",
//       "Carat",
//       "Color",
//       "Clarity",
//       "Cut",
//       "Polish",
//       "Sym",
//       "Fluor",
//       "Rap Rate",
//       "Disc %",
//       "Pr/Ct (\$)",
//       "Amount (\$)",
//       "Loc",
//       "Measurement",
//       "Tab%",
//       "TD%",
//       "CR Ang",
//       "PV Ang",
//       "LAB",
//       "HA",
//       "Shade",
//       "Milky",
//       "Eye Clean",
//       "BIT",
//       "BIC",
//       "WIT",
//       "WIC",
//       "Key To Symbol"
//     ];
//     Style customStyle = workbook.styles.add('customStyle');

// // Set border style
// // Set alignment, but do not modify fontColor or underline
//     customStyle.borders.all.lineStyle = LineStyle.thin;
//     customStyle.hAlign = HAlignType.center;
//     customStyle.vAlign = VAlignType.center;
//     customStyle.fontColor = "#0724e3";
//     customStyle.underline = true;

// // Adding hadding for all\\

// var pcs = diamond.length;
// double totalCarats = 0.0;
// // ls.forEach((carat) {
// //     totalCarats += double.tryParse(carat);  // Add each carat to total
// //   });
// sheet.getRangeByIndex(1, 3).setText("Pcs");
// sheet.getRangeByIndex(1, 3).cellStyle = globalStyle;
// sheet.getRangeByIndex(1, 4).setText("Carats");
// sheet.getRangeByIndex(1, 4).cellStyle = globalStyle;
// sheet.getRangeByIndex(1, 6).setText("Rap%");
// sheet.getRangeByIndex(1, 6).cellStyle = globalStyle;
// sheet.getRangeByIndex(1, 7).setText("Pr/Ct");
// sheet.getRangeByIndex(1, 7).cellStyle = globalStyle;
// sheet.getRangeByIndex(1, 8).setText("Amount(\$)");
// sheet.getRangeByIndex(1, 8).cellStyle = globalStyle;



    
// // Apply the style to a specific range (cell) without overriding the hyperlink appearance
//     for (int i = 1; i <= ls.length; i++) {
//       sheet.getRangeByIndex(5, i).setText(ls[i - 1]);
//       sheet.getRangeByIndex(5, i).cellStyle = globalStyle;
//     }
//     for (int i = 1; i <= diamond.length; i++) {
//       for (int j = 1; j <= ls.length; j++) {
//         print(i);
//         sheet.getRangeByIndex(i + 5, j).cellStyle = cellGlobalStyle;

//         switch (j) {
//           case 1:
//             sheet.getRangeByIndex(5 + i, j).setValue(i);
//             break;
//           case 2:
//             sheet.getRangeByIndex(5 + i, j).setText(diamond[i - 1].id);
//             break;

//           case 3:
//             // Check if j is 3 for image_url or movieUrl
//             String imageUrl = diamond[i - 1].imageUrl; // Default case for image
//             if (imageUrl.isNotEmpty) {
//               final Hyperlink imageHyperlink = sheet.hyperlinks.add(
//                 sheet.getRangeByIndex(5 + i, j),
//                 HyperlinkType.url,
//                 imageUrl,
//               );
//               imageHyperlink.screenTip = 'Click Me';
//               imageHyperlink.textToDisplay = 'Image';
//               sheet.getRangeByIndex(5 + i, j).cellStyle = customStyle;
//             } else {
//               sheet.getRangeByIndex(5 + i, j).setText("--");
//             }

//             break;

//           case 4:
//             String video_url = diamond[i - 1].movieUrl;
//             if (video_url.isNotEmpty) {
//               final Hyperlink videoHyperlink = sheet.hyperlinks.add(
//                 sheet.getRangeByIndex(5 + i, j),
//                 HyperlinkType.url,
//                 video_url,
//               );
//               videoHyperlink.screenTip = 'Click Me';
//               videoHyperlink.textToDisplay = 'Video';
//               sheet.getRangeByIndex(5 + i, j).cellStyle = customStyle;
//             } else {
//               sheet.getRangeByIndex(5 + i, j).setText("--");
//             }
//             break;
//           case 5:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaShape);

//             break;
//           case 6:
//             sheet
//                 .getRangeByIndex(i + 5, j)
//                 .setNumber(double.tryParse(diamond[i - 1].diaCarat));
//             break;
//           case 7:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaColor);
//             break;
//           case 8:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaClarity);
//             break;
//           case 9:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaCut);
//             break;
//           case 10:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaPolish);
//             break;
//           case 11:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaSymmetry);
//             break;
//           case 12:
//             sheet
//                 .getRangeByIndex(i + 5, j)
//                 .setText(diamond[i - 1].diaFluorescence);
//             break;
//           case 13:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].rap);

//             break;
//           case 14:
//             sheet
//                 .getRangeByIndex(i + 5, j)
//                 .setNumber(double.tryParse(diamond[i - 1].back));

//             break;
//           case 15:
//             var num = double.tryParse(diamond[i - 1].rap)! +
//                 (double.tryParse(diamond[i - 1].rap)! / 100) *
//                     double.tryParse(diamond[i - 1].back)!;
//             sheet.getRangeByIndex(i + 5, j).setNumber(num);
//             break;
//           case 16:
//             double numericValue = double.parse(diamond[i - 1].dollar1.replaceAll(RegExp(r'[^0-9.]'), ''));
//             sheet.getRangeByIndex(i + 5, j).setNumber(numericValue);
//             break;
//           case 17:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaPlace);
//             break;

//           case 18:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaDiameter);
//             break;
//           case 19:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaTable);
//             break;
//           case 20:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaDepth);
//             break;
//           case 21:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaPa);
//             break;
//           case 22:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaCa);
//             break;

//           case 23:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaReport);
//             break;

//           case 24:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaHna);
//             break;
//           case 25:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaColsh);
//             break;
//           case 26:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaMilky);
//             break;
//           case 27:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaEyeClean);
//             break;
//           case 28:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaBt);
//             break;
//           case 29:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaBc);
//             break;
//           case 30:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaWt);
//             break;
//           case 31:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].diaWc);
//             break;
//           case 32:
//             sheet.getRangeByIndex(i + 5, j).setText(diamond[i - 1].dia_kts);
//             break;

//           default:
//             sheet.getRangeByIndex(i + 5, j).setText("");
//         }
//       }
//     }

//     // 
// sheet.getRangeByIndex(2, 3).setText(pcs.toString());
// sheet.getRangeByIndex(2, 3).cellStyle = cellGlobalStyle;
// sheet.getRangeByIndex(2, 4).setFormula('=SUM(F6:F${pcs + 5})');
// sheet.getRangeByIndex(2, 4).cellStyle = cellGlobalStyle;
// sheet.getRangeByIndex(2, 6).setFormula("=AVERAGE(N6:N${pcs + 5})");
// sheet.getRangeByIndex(2, 6).cellStyle = cellGlobalStyle;
// sheet.getRangeByIndex(2, 7).setFormula("=H2/D2");
// sheet.getRangeByIndex(2, 7).cellStyle = cellGlobalStyle;
// sheet.getRangeByIndex(2, 8).setFormula('=SUM(P6:P${pcs + 5})');
// sheet.getRangeByIndex(2, 8).cellStyle = cellGlobalStyle;

//     // print(byte.);

//     // Save the document to a list of bytes.
//     final List<int> bytes = workbook.saveAsStream();
//     workbook.dispose();

//     // Get the Downloads directory path
// if (await _requestStoragePermission()) {
//     try {
//       // Ask the user to pick a directory
//       String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

//       if (selectedDirectory == null) {
//         // User canceled the operation
//         print("No directory selected");
//         showSnackbar(context, "Directory selection canceled.");
//         return;
//       }

//       // Generate a unique filename with date and time
//       String fileName =
//           "kdl_gia_data_${DateTime.now().day}_${DateTime.now().month}_${DateTime.now().year}_"
//           "${DateTime.now().hour}_${DateTime.now().minute}_${DateTime.now().second}.xlsx";

//       // Construct the full path
//       String filePath = "$selectedDirectory/$fileName";

//       // Create the file and write bytes
//       File file = File(filePath);
//       await file.writeAsBytes(bytes, flush: true);
//       print('Excel file saved at: $filePath');

//       // Show success snackbar
//       showSnackbar(context , "Excel file downloaded successfully.");
//     } catch (e) {
//       print("Error: $e");
//       showSnackbar(context, "Failed to save the Excel file.");
//     }
//   } else {
//     print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++Test");
//     try {
//       // Ask the user to pick a directory
//       String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

//       if (selectedDirectory == null) {
//         // User canceled the operation
//         print("No directory selected");
//         showSnackbar(context, "Directory selection canceled.");
//         return;
//       }

//       // Generate a unique filename with date and time
//       String fileName =
//           "kdl_gia_data_${DateTime.now().day}_${DateTime.now().month}_${DateTime.now().year}_"
//           "${DateTime.now().hour}_${DateTime.now().minute}_${DateTime.now().second}.xlsx";

//       // Construct the full path
//       String filePath = "$selectedDirectory/$fileName";

//       // Create the file and write bytes
//       File file = File(filePath);
//       await file.writeAsBytes(bytes, flush: true);

//       print('Excel file saved at: $filePath');

//       // Show success snackbar
//       showSnackbar(context, "Excel file downloaded successfully.");
//     } catch (e) {
//       print("Error: $e");
//       showSnackbar(context, "Failed to save the Excel file.");
//     }
//     showSnackbar(context, "Storage permission denied.");
//   }
// }
//     }