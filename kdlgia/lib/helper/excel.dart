import 'package:excel/excel.dart';
import 'dart:io'; // For saving the file

void createExcelFile() {
  // Create a new Excel object
  var excel = Excel.createExcel(); 

  // Create a new sheet (if you want additional sheets)
  Sheet sheetObject = excel['SheetName'];

  // Define a sample cell style
  CellStyle customStyle = CellStyle(
    backgroundColorHex: '#FF0000', // Red background color
    fontFamily: getFontFamily(FontFamily.Calibri),
  );
  customStyle.underline = Underline.Single;

  // Add data to cells with different types of values
  var cellA1 = sheetObject.cell(CellIndex.indexByString('A1'));
  cellA1.value = 'Hello'; // String
  cellA1.cellStyle = customStyle;

  var cellB2 = sheetObject.cell(CellIndex.indexByString('B2'));
  cellB2.value = 42; // Integer
  cellB2.cellStyle = customStyle;

  var cellC3 = sheetObject.cell(CellIndex.indexByString('C3'));
  cellC3.value = 3.14; // Double
  cellC3.cellStyle = customStyle;

  var cellD4 = sheetObject.cell(CellIndex.indexByString('D4'));
  cellD4.value = DateTime.now(); // DateTime
  cellD4.cellStyle = customStyle;
  cellD4.cellStyle = (cellD4.cellStyle ?? CellStyle()).copyWith(
    numberFormat: CustomDateTimeNumFormat('mm/dd/yyyy'),
  );

  // Insert some more data (optional)
  sheetObject.insertRow(1); // Inserts a new row at index 1
  sheetObject.insertColumn(1); // Inserts a new column at index 1

  // Save the file
  saveExcelFile(excel);
}

void saveExcelFile(Excel excel) {
  // Define the output file name and path
  String outputFile = '/path/to/your/directory/created_excel_file.xlsx'; 

  // Save the Excel file
  var fileBytes = excel.encode(); 
  File(outputFile)
    ..createSync(recursive: true)
    ..writeAsBytesSync(fileBytes!); // Saving the file
  print('Excel file created and saved at $outputFile');
}


