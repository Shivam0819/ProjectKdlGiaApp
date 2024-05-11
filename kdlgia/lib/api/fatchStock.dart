import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchItems() async {
  try {
    var response = await http.get(
      Uri.parse('https://www.kdlgia.com/api/user/stock/12869/7943e512c591000287ceb1402bc101a1/'),
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      Map<String, dynamic> resultMap = {};

      for (var row in jsonData['rows']) {
        String stockNo = row[0];
        Map<String, dynamic> dataMap = {
          'place': row[1],
          'status': row[2],
          'shape': row[3],
          'carat': row[4],
          'color': row[5],
          'clarity': row[6],
          'cut': row[7],
          'polish': row[8],
          'symmetry': row[9],
          'fluorescence': row[10],
          'measurements': row[11],
          'report': row[12],
          'reportNo': row[13],
          'rap': row[14],
          'back': row[15],
          'price': row[16],
          'colsh': row[17],
          'milky': row[18],
          'wc': row[19],
          'wt': row[20],
          'bt': row[21],
          'bc': row[22],
          'eyeClean': row[23],
          'hna': row[24],
          'ins': row[25],
          'table': row[26],
          'depth': row[27],
          'ca': row[28],
          'pa': row[29],
          'keyToSymbols': row[30],
          'culet': row[31],
          'reportDate': row[32],
          'special': row[33],
          'arrive': row[34],
          'image': row[35],
          'movie': row[36],
          'comments': row[37],
        };
        resultMap[stockNo] = dataMap;
      }
      return resultMap;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    print('Error: $error');
    throw Exception('Failed to load data');
  }
}

void main() async {
  try {
    Map<String, dynamic> diamondMap = await fetchItems();
    print(diamondMap);
  } catch (error) {
    print('Error: $error');
  }
}



// class ListToMapConverter {
//   List<Diamond> dataList;

//   ListToMapConverter(this.dataList);

//   Map<String, dynamic> convertToMap() {
//     Map<String, dynamic> resultMap = {};
//     if (dataList.isNotEmpty) {
//       List<String> keys = dataList[0].keys.toList();
//       for (var data in dataList) {
//         Map<String, dynamic> entry = {};
//         for (var key in keys) {
//           entry[key] = data[key];
//         }
//         resultMap[data['stock_no']] = entry; // Assuming 'stock_no' is the unique identifier
//       }
//     }
//     return resultMap;
//   }
// }

// void main() {
//   List<Map<String, dynamic>> dataList = [
//     {
//       "stock_no": "10189392",
//       "place": "H-K",
//       "status": "G",
//       // Other key-value pairs...
//     },
//     // Other data entries...
//   ];

//   ListToMapConverter converter = ListToMapConverter(fetchItems() as List<Diamond>);
//   Map<String, dynamic> resultMap = converter.convertToMap();

//   // Print the resulting map
//   print(resultMap);
// }



