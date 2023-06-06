import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfApi {
  static Future<File> generateReportPdf() async {
    final font = await rootBundle.load("fonts/montserrat.ttf");
    final ttf = Font.ttf(font);

    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => pw.Center(
            child:
                pw.Text('text', style: TextStyle(font: ttf, fontSize: 40)))));
    pdf.save();
    return saveDocument(name: "report", pdf: pdf);
  }

  static Future<File> saveDocument(
      {required String name, required Document pdf}) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name.pdf');
    await file.writeAsBytes(await pdf.save());
    await OpenFile.open(dir.path);
    return file;
  }
}
