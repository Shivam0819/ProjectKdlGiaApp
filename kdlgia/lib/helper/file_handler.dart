import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart';

class FileHandler {
  // Method to check permission and handle download
  Future<void> downloadExcelFile() async {
    // Check if permission is granted
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      // Request permission
      if (await Permission.storage.request().isGranted) {
        // Permission granted, proceed to download
        await saveExcelFile();
      } else {
        // Permission denied, show a message
        print("************************");
        await Permission.storage.request();
        print("Permission denied. Cannot save file.");
      }
    } else {
      // Permission already granted, proceed to download
      await saveExcelFile();
    }
  }

  Future<void> saveExcelFile() async {
    try {
      Directory? directory = await getDownloadsDirectory();
      if (directory != null) {
        String outputFile = '${directory.path}/created_excel_file.xlsx';
        var excel = Excel.createExcel();
        Sheet sheetObject = excel['Sheet1'];
        
        // Example data in the Excel file
  var cellA1 = sheetObject.cell(CellIndex.indexByString('A1'));
        cellA1.value = TextCellValue("Hello World");
        
        // Encode the Excel file and save it
        var fileBytes = excel.encode();
        File(outputFile)
          ..createSync(recursive: true)
          ..writeAsBytesSync(fileBytes!);
        
        print('Excel file created and saved at $outputFile');
      } else {
        print('Unable to get downloads directory.');
      }
    } catch (e) {
      print('Error saving file: $e');
    }
  }
}
