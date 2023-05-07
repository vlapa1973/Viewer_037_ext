//*****************************************************
//  Отображение на экране

void visible() {
  fill(255);
  rect(tablo[0], tablo[1], tablo[2], tablo[3] + 20);
  for (TableRow row : table.rows()) {
    if (count == select-1) {
      index = row.getInt(2);
      println(index);
    }
    fill(#F0FFFF);
    if (select == count + 1) fill(#00FF00);
    rect(tablo[0], tablo[1] + h * count, tablo[2], h);
    rect(tablo[0] + tabloW[1], tablo[1] + h * count, tabloW[2] - tabloW[1], h);
    rect(tablo[0] + tabloW[2], tablo[1] + h * count, tabloW[3] - tabloW[2], h);    
    rect(tablo[0] + tabloW[3], tablo[1] + h * count, tabloW[4] - tabloW[3], h);
    rect(tablo[0] + tabloW[4], tablo[1] + h * count, tabloW[5] - tabloW[4], h);
    rect(tablo[0] + tabloW[5], tablo[1] + h * count, tabloW[6] - tabloW[5], h);
    rect(tablo[0] + tabloW[6], tablo[1] + h * count, tabloW[7] - tabloW[6], h);
    rect(tablo[0] + tabloW[7], tablo[1] + h * count, tabloW[8] - tabloW[7], h);
    rect(tablo[0] + tabloW[8], tablo[1] + h * count, tabloW[9] - tabloW[8], h);
    rect(tablo[0] + tabloW[9], tablo[1] + h * count, tabloW[10] - tabloW[9], h);
    rect(tablo[0] + tabloW[10], tablo[1] + h * count, tabloW[11] - tabloW[10], h);
    rect(tablo[0] + tabloW[11], tablo[1] + h * count, tabloW[12] - tabloW[11], h);
    rect(tablo[0] + tabloW[12], tablo[1] + h * count, tabloW[13] - tabloW[12], h);
    rect(tablo[0] + tabloW[13], tablo[1] + h * count, tabloW[14] - tabloW[13], h);
    rect(tablo[0] + tabloW[14], tablo[1] + h * count, tabloW[15] - tabloW[14], h);
    rect(tablo[0] + tabloW[15], tablo[1] + h * count, tabloW[16] - tabloW[15], h);
    rect(tablo[0] + tabloW[16], tablo[1] + h * count, tablo[2] - tabloW[16], h);

    fill(0);
    int hCode = row.getInt(0);
    int hCode1 = row.getInt(9) * 2 + row.getInt(10) * 2 + row.getInt(12) * 2 +
      row.getInt(13) * 2 + row.getInt(14) * 2 + row.getInt(15) * 2;
    println(hCode + " - " + hCode1);
    if (hCode != hCode1) fill(#FF0000);
    textSize(11);
    textAlign(RIGHT);
    text(count + 1, tablo[1] + shift, tablo[1] + otH + h * (count));
    text(row.getString(3), tabloW[2] - shift + tablo[0], tablo[1] + otH + h * (count));    
    text(row.getString(4), tabloW[3] - shift + tablo[0], tablo[1] + otH + h * (count));
    text(printData(row.getString(6)), tabloW[4] - shift + tablo[0], tablo[1] + otH + h * (count));
    text(row.getString(7), tabloW[5] - shift + tablo[0], tablo[1] + otH + h * (count));
    text(printData(str(row.getInt(9))), tabloW[6] - shift + tablo[0], tablo[1] + otH + h * (count));
    String q = (row.getInt(10) == 0) ? "" : row.getString(10);
    text(q, tabloW[7] - shift + tablo[0], tablo[1] + otH + h * (count));
    text(printData(row.getString(12)), tabloW[8] - shift + tablo[0], tablo[1] + otH + h * (count));
    String w = (row.getInt(13) == 0) ? "" : row.getString(13);
    text(w, tabloW[9] - shift + tablo[0], tablo[1] + otH + h * (count));
    String e = (row.getInt(14) == 0) ? "" : row.getString(14);
    text(printData(e), tabloW[10] - shift + tablo[0], tablo[1] + otH + h * (count));
    String r = (row.getInt(15) == 0) ? "" : row.getString(15);
    text(printData(r), tabloW[11] - shift + tablo[0], tablo[1] + otH + h * (count));
    textAlign(LEFT);
    String g;
    if (row.getInt(17) != 0) {
      g = "[" + row.getFloat(17) / 1000 + "]  ";
    } else {
      g = "";
    }
    text(g + row.getString(5), tabloW[11] + shift + tablo[0], tablo[1] + otH + h * (count));
    textAlign(RIGHT); 

    int n1 = row.getInt(9) - row.getInt(10) - row.getInt(12) + row.getInt(13);
    text(printData(str(n1)), tabloW[13] - shift + tablo[0], tablo[1] + otH + h * (count));   
    int n = row.getInt(9) - row.getInt(12) + row.getInt(17) / 2;    
    text(printData(str(n)), tabloW[14] - shift + tablo[0], tablo[1] + otH + h * (count));    
    int chist = int(row.getInt(9) - row.getInt(12) - (row.getInt(9) - row.getInt(12)) / 100.0 *
      row.getInt(7) - row.getInt(15) + row.getInt(17) / 2);      
    text(printData(str(int(chist))), tabloW[15] - shift + tablo[0], tablo[1] + otH + h * (count));
    int sum = chist * row.getInt(6) / 1000;
    text(printData(str(sum)), tabloW[16] - shift + tablo[0], tablo[1] + otH + h * (count));
    text(row.getString(11), tabloW[17] - shift + tablo[0], tablo[1] + otH + h * (count));

    sumN1 += n1;
    sumN += n;
    sumChist += chist;
    sumArenda += row.getInt(14);
    sumDopSor += row.getInt(15);
    sumSum += sum;

    count++;

    if (row.getString(3).charAt(0) == prefixKamazy) {
      sumKamEach += row.getInt(9) - row.getInt(12) -
        int((row.getInt(9) - row.getInt(12)) / 100.0 *
        row.getInt(7)) - row.getInt(15) + row.getInt(17);
      sumKamazy += sumKamEach;
      sumKamEach = 0;
    }
  }

  fill(#FFF0F5);
  rect(tablo[0] + tabloW[0], tablo[1] - 30, tabloW[1] - tabloW[0], h + shift);
  rect(tablo[0] + tabloW[1], tablo[1] - 30, tabloW[2] - tabloW[1], h + shift);
  rect(tablo[0] + tabloW[2], tablo[1] - 30, tabloW[3] - tabloW[2], h + shift);
  rect(tablo[0] + tabloW[3], tablo[1] - 30, tabloW[4] - tabloW[3], h + shift);
  rect(tablo[0] + tabloW[4], tablo[1] - 30, tabloW[5] - tabloW[4], h + shift);
  rect(tablo[0] + tabloW[5], tablo[1] - 30, tabloW[6] - tabloW[5], h + shift);
  rect(tablo[0] + tabloW[6], tablo[1] - 30, tabloW[7] - tabloW[6], h + shift);
  rect(tablo[0] + tabloW[7], tablo[1] - 30, tabloW[8] - tabloW[7], h + shift);
  rect(tablo[0] + tabloW[8], tablo[1] - 30, tabloW[9] - tabloW[8], h + shift);
  rect(tablo[0] + tabloW[9], tablo[1] - 30, tabloW[10] - tabloW[9], h + shift);
  rect(tablo[0] + tabloW[10], tablo[1] - 30, tabloW[11] - tabloW[10], h + shift);
  rect(tablo[0] + tabloW[11], tablo[1] - 30, tabloW[12] - tabloW[11], h + shift);
  rect(tablo[0] + tabloW[12], tablo[1] - 30, tabloW[13] - tabloW[12], h + shift);
  rect(tablo[0] + tabloW[13], tablo[1] - 30, tabloW[14] - tabloW[13], h + shift);
  rect(tablo[0] + tabloW[14], tablo[1] - 30, tabloW[15] - tabloW[14], h + shift);
  rect(tablo[0] + tabloW[15], tablo[1] - 30, tabloW[16] - tabloW[15], h + shift);
  rect(tablo[0] + tabloW[16], tablo[1] - 30, tablo[2] - tabloW[16], h + shift);
  textSize(14);

  rect(tablo[0] + tabloW[8], tablo[1] + h * count, tabloW[9] - tabloW[8], h * 2);
  rect(tablo[0] + tabloW[9], tablo[1] + h * count, tabloW[10] - tabloW[9], h * 2);
  rect(tablo[0] + tabloW[10], tablo[1] + h * count, tabloW[11] - tabloW[10], h * 2);
  rect(tablo[0] + tabloW[11], tablo[1] + h * count, tabloW[12] - tabloW[11], h * 2);
  rect(tablo[0] + tabloW[12], tablo[1] + h * count, tabloW[13] - tabloW[12], h * 2);
  rect(tablo[0] + tabloW[13], tablo[1] + h * count, tabloW[14] - tabloW[13], h * 2);
  rect(tablo[0] + tabloW[14], tablo[1] + h * count, tabloW[15] - tabloW[14], h * 2);
  rect(tablo[0] + tabloW[15], tablo[1] + h * count, tabloW[16] - tabloW[15], h * 2);
  rect(tablo[0] + tabloW[16], tablo[1] + h * count, tablo[2] - tabloW[16], h * 2);

  fill(0);
  rect(tabloW[17] - 30, tablo[1] + tablo[3] - 8, 30, 20);

  fill(0);
  textSize(14);
  textAlign(LEFT);
  text("№", tabloW[0] + tablo[0] + shift + 5, tablo[1] - otH);
  text("Номер", tabloW[1] + tablo[0] + shift + 15, tablo[1] - otH);
  text("Клиент", tabloW[2] + tablo[0] + shift + 30, tablo[1] - otH);
  text("Цена", tabloW[3] + tablo[0] + shift + 5, tablo[1] - otH);
  text("%", tabloW[4] + tablo[0] + shift + 5, tablo[1] - otH);
  text("Вес 1", tabloW[5] + tablo[0] + shift + 5, tablo[1] - otH);
  text("z21", tabloW[6] + tablo[0] + shift + 10, tablo[1] - otH);
  text("Вес 2", tabloW[7] + tablo[0] + shift + 5, tablo[1] - otH);
  text("z22", tabloW[8] + tablo[0] + shift + 10, tablo[1] - otH);
  text("Камаз", tabloW[9] + tablo[0] + shift, tablo[1] - otH);
  text("ДС", tabloW[10] + tablo[0] + shift + 8, tablo[1] - otH);
  text("Объект", tabloW[11] + tablo[0] + shift + 60, tablo[1] - otH);
  text("H1", tabloW[12] + tablo[0] + shift * 3, tablo[1] - otH);
  text("Н", tabloW[13] + tablo[0] + shift * 3, tablo[1] - otH);
  text("Чистый", tabloW[14] + tablo[0] + shift + 5, tablo[1] - otH);
  text("Сумма", tabloW[15] + tablo[0] + shift + 10, tablo[1] - otH);
  text("Время 2", tabloW[16] + tablo[0] + shift + 5, tablo[1] - otH);

  textAlign(RIGHT);
  text("" + workNumber(sumKamazy / 1000.0), tabloW[9] + shift - 5, tablo[1] + h * count + 25);
  text("" + workNumber(sumArenda / 1000.0), tabloW[10] + shift - 5, tablo[1] + h * count + 25);
  text("" + workNumber(sumDopSor / 1000.0), tabloW[11] + shift - 5, tablo[1] + h * count + 25);
  textAlign(LEFT);
  float w = workNumber((sumN1 - sumChist) / float(sumN1) * 10000 / 100.0);
  float w1 = workNumber((sumN - sumChist - sumDopSor) / float(sumN) * 100); 
  text("      " + w1 + " / " + workNumber((sumN1 - sumN) / 1000.0) + " / " + w, tabloW[11] +
    shift * 2, tablo[1] + h * count + 25);
  textAlign(RIGHT);
  text("" + (sumN1) / 1000.0, tabloW[13] + shift - 5, tablo[1] + h * count + 25);
  text("" + (sumN) / 1000.0, tabloW[14] + shift - 5, tablo[1] + h * count + 25);
  text("" + int(sumChist / 1000.0 * 100) / 100.0, tabloW[15] + shift - 5, tablo[1] + h * count + 25);
  text("" + int(sumSum / 1000.0 * 100) / 100.0, tabloW[16] + shift - 5, tablo[1] + h * count + 25);
  text("" + printData(str(int(float(sumSum) / sumChist * 1000))), tabloW[17] - 10, tablo[1] + h * count + 25);

  if (select != 0) {
    fill(#F0FFF0);
    //if (selectDataEdit == 1) fill(#1E90FF);
    //rect(tablo[0] + tabloW[1], s, tabloW[0] - tabloW[1], h + shift);
    //fill(#F0FFF0);
    //if (selectDataEdit == 4) fill(#1E90FF);
    //rect(tablo[0] + tabloW[2], s, tabloW[3] - tabloW[2], h + shift);
    //fill(#F0FFF0);
    //if (selectDataEdit == 6) fill(#1E90FF);
    //rect(tablo[0] + tabloW[3], s, tabloW[4] - tabloW[3], h + shift);
    //fill(#F0FFF0);
    //if (selectDataEdit == 7) fill(#1E90FF);
    //rect(tablo[0] + tabloW[4], s, tabloW[5] - tabloW[4], h + shift);
    //fill(#F0FFF0);
    //if (selectDataEdit == 14) fill(#1E90FF);
    //rect(tablo[0] + tabloW[9], s, tabloW[10] - tabloW[9], h + shift);
    //fill(#F0FFF0);
    //if (selectDataEdit == 15) fill(#1E90FF);
    //rect(tablo[0] + tabloW[10], s, tabloW[11] - tabloW[10], h + shift);
    //fill(#F0FFF0);
    //if (selectDataEdit == 5) fill(#1E90FF);
    //rect(tablo[0] + tabloW[11], s, tabloW[12] - tabloW[11], h + shift);

    fill(#FF3030);
    rect(tablo[0] + tabloW[13], s, tabloW[16] - tabloW[13], h + shift);

    //fill(#FF0000);
    //textSize(14);

    //TableRow row = table.getRow(index-1);

    //if (selectDataEdit == 4) {
    //  text(inputData, tabloW[3] - shift + tablo[0], s + shift * 2);
    //} else {
    //  text(row.getString(4), tabloW[3] - shift + tablo[0], s + shift * 2);
    //}
    //if (selectDataEdit == 6) {
    //  text(inputData, tabloW[4] - shift + tablo[0], s + shift * 2);
    //} else {
    //  text(row.getString(6), tabloW[4] - shift + tablo[0], s + shift * 2);
    //}
    //if (selectDataEdit == 7) {
    //  text(inputData, tabloW[5] - shift + tablo[0], s + shift * 2);
    //} else {
    //  text(row.getString(7), tabloW[5] - shift + tablo[0], s + shift * 2);
    //}    
    //if (selectDataEdit == 14) {
    //  text(inputData, tabloW[10] - shift + tablo[0], s + shift * 2);
    //} else {
    //  text(row.getInt(14), tabloW[10] - shift + tablo[0], s + shift * 2);
    //}
    //if (selectDataEdit == 15) {
    //  text(inputData, tabloW[11] - shift + tablo[0], s + shift * 2);
    //} else {
    //  text(row.getInt(15), tabloW[11] - shift + tablo[0], s + shift * 2);
    //}

    //textAlign(LEFT);
    //if (selectDataEdit == 5) {
    //  text(inputData, tabloW[11] + shift + tablo[0], s + shift * 2);
    //} else {
    //  text(row.getString(5), tabloW[11] + shift + tablo[0], s + shift * 2);
    //}

    fill(255);
    text("ОТВЕС", tabloW[13] + shift * 9 + tablo[0], s + shift * 2);
  }

  millisOld = millis();
}

//*****************************************************
