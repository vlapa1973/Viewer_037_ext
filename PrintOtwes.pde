//*****************************************************
//  Печать отвеса

void printOtwes() {
  int[] wO = {10, 73, 105, 165, 200};
  int[] hO = {10, 55, 70, 85, 100, 115, 130};
  String D = "";
  String M = "";
  String Y = "";
  String H = "";
  String N = "";
  String S = "";
  D += (day() < 10) ? "0" + day() : day();
  M += (month() < 10) ? "0" + month() : month();
  Y += (year() < 10) ? "0" + year() : year();
  H += (hour() < 10) ? "0" + hour() : hour();
  N += (minute() < 10) ? "0" + minute() : minute();
  S += (second() < 10) ? "0" + second() : second();
  String time1 = H + N + S;

  TableRow row = table.getRow(index-1);

  PGraphics pdf = createGraphics(210, 297, PDF, otwes +
    "/" + M + "/" + D + "/" + time1 + "_" + row.getString(3) + ".pdf");
  pdf.beginDraw();
  pdf.background(255);

  pdf.rect(wO[0], hO[0], wO[4]-wO[0], hO[1]-hO[0], 5, 5, 0, 0);
  pdf.rect(wO[0], hO[1], wO[4]-wO[0], hO[2]-hO[1]);
  pdf.rect(wO[0], hO[2], wO[4]-wO[0], hO[3]-hO[2]);
  pdf.rect(wO[0], hO[3], wO[4]-wO[0], hO[4]-hO[3]);
  pdf.rect(wO[0], hO[4], wO[4]-wO[0], hO[5]-hO[4]);
  pdf.rect(wO[0], hO[5], wO[4]-wO[0], hO[6]-hO[5], 0, 0, 5, 5);

  pdf.line(wO[1], hO[1], wO[1], hO[5]);
  pdf.line(wO[2], hO[1], wO[2], hO[6]);
  pdf.line(wO[3], hO[1], wO[3], hO[6]);

  pdf.rect(13, 13, 40, 30, 3);
  pdf.ellipse(40, 25, 50, 20);
  pdf.fill(0);
  pdf.textSize(4);
  String k = "";
  if (row.getInt(17) != 0) {
    k = row.getString(11).substring(0, 5) + "        [" + float(row.getString(17)) / 1000 + "]";
  } else {
    k = row.getString(11).substring(0, 5);
  }
  pdf.text(k, 17, 40);
  pdf.textSize(6);
  pdf.text(row.getString(1) + "/1" + M + int(random(101, 999)), 24, 27);          //  row.getString(2), 28, 27);

  pdf.textSize(7);
  pdf.text("Дубликат отвеса", 73, 20);
  pdf.textSize(4);
  pdf.text("ГосНомер а/м:", 80, 30);
  pdf.textAlign(RIGHT);
  pdf.textSize(8);
  pdf.text(row.getString(3), 190, 30);
  pdf.textAlign(LEFT);
  pdf.textSize(4);
  pdf.text("Сдатчик лома и отходов:", 59, 40);
  pdf.textSize(8);
  pdf.textAlign(RIGHT);
  pdf.text(row.getString(4), 190, 40);
  pdf.textAlign(LEFT);
  pdf.textSize(3);
  pdf.text("Бытовой лом, отходы частного строительства, или прочее..", 15, 50);
  pdf.textAlign(RIGHT);
  pdf.textSize(4);
  pdf.text(row.getString(5), 190, 50);

  pdf.textAlign(RIGHT);
  pdf.textSize(5);
  pdf.text("Брутто (т)", 70, 65);
  pdf.text("Тара (т)", 70, 80);
  pdf.text("Нетто (чистый вес) (т)", 70, 95);
  pdf.text("Не принято мусора (кг)", 70, 110);
  pdf.textAlign(LEFT);
  pdf.text(row.getString(16), 15, 125);
  pdf.textAlign(RIGHT);
  pdf.textSize(6);
  pdf.text(printData(str(row.getInt(9))), 102, 65);
  pdf.text(printData(row.getString(12)), 102, 80);
  //float n = row.getInt(9) - row.getInt(12) + row.getInt(17) / 2;
  int chist = int(row.getInt(9) - row.getInt(12) - (row.getInt(9) - row.getInt(12)) /
    100.0 * row.getInt(7) - row.getInt(15) + row.getInt(17) / 2);
  pdf.text(printData(str(chist)), 102, 95); 
  pdf.text(printData(row.getString(15)), 100, 110);

  pdf.textAlign(RIGHT);
  pdf.textSize(5);
  pdf.text("Цена (руб)", 162, 65);
  pdf.text("Процент засора (%)", 162, 80);
  pdf.text("Стоимость (руб)", 162, 95);
  pdf.text("Аренда КАМАЗ (руб)", 162, 110);
  pdf.text("ИТОГО к выдаче (руб)", 162, 125);
  pdf.textSize(6);
  pdf.text(printData(row.getString(6)), 197, 65);
  pdf.text(row.getString(7), 195, 80);  
  int sum = int(chist * row.getInt(6) / 1000.0);
  pdf.text(printData(str(sum)), 197, 95);  
  pdf.text(printData(row.getString(14)), 195, 110);
  pdf.text(printData(str(int(sum) - int(row.getString(14)))), 197, 125);

  pdf.dispose();
  pdf.endDraw();
}

//*****************************************************
//  работа над числом для вывода

float workNumber(float v) {
  if (int(v * 1000) % 10 >= 5) {
    v = int(v * 100 + 1) / 100.0;
  } else {
    v = int(v * 100) / 100.0;
  }
  return v;
}

//*****************************************************
