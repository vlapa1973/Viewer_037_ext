//****************************************************
void mousePressed() {
  TableRow row = table.getRow(index-1);
  for (int i = 0; i < count; ++i) {      //  выбор строки
    if ((mouseX > tablo[0]) && (mouseX < tablo[0] + tablo[2]) && 
      (mouseY > tablo[1] + h * i) && (mouseY < tablo[1] + h + h * i)) {
      select = i + 1;
      reset();
    }
  }

  if ((mouseX > tabloW[0] + shift) && (mouseX < tabloW[1] + shift) && 
    (mouseY > s) && (mouseY < s + 30)) {
    selectDataEdit = 1;
    inputData = row.getString(0);
    reset();
  }

  if ((mouseX > tabloW[2] + shift) && (mouseX < tabloW[3] + shift) && 
    (mouseY > s) && (mouseY < s + 30)) {
    selectDataEdit = 4;
    inputData = row.getString(selectDataEdit);
    reset();
  }

  if ((mouseX > tabloW[3] + shift) && (mouseX < tabloW[4] + shift) && 
    (mouseY > s) && (mouseY < s + 30)) {
    selectDataEdit = 6;
    inputData = row.getString(selectDataEdit);
    reset();
  }

  if ((mouseX > tabloW[4] + shift) && (mouseX < tabloW[5] + shift) && 
    (mouseY > s) && (mouseY < s + 30)) {
    selectDataEdit = 7;
    inputData = row.getString(selectDataEdit);
    reset();
  }

  if ((mouseX > tabloW[9] + shift) && (mouseX < tabloW[10] + shift) && 
    (mouseY > s) && (mouseY < s + 30)) {
    selectDataEdit = 14;
    inputData = row.getString(selectDataEdit);
    reset();
  }

  if ((mouseX > tabloW[10] + shift) && (mouseX < tabloW[11] + shift) && 
    (mouseY > s) && (mouseY < s + 30)) {
    selectDataEdit = 15;
    inputData = row.getString(selectDataEdit);
    reset();
  }

  if ((mouseX > tabloW[11] + shift) && (mouseX < tabloW[12] + shift) && 
    (mouseY > s) && (mouseY < s + 30)) {
    selectDataEdit = 5;
    inputData = row.getString(selectDataEdit);
    reset();
  }

  if ((mouseX > tabloW[13] + shift) && (mouseX < tabloW[16] + shift) && 
    (mouseY > s) && (mouseY < s + 30)) {
    fill(#FFFF00);
    rect(tablo[0] + tabloW[13], s, tabloW[16] - tabloW[13], 27); 
    fill(0);
    text("ОТВЕС", tabloW[13] + shift * 9 + tablo[0], s + 20);
  }

  if ((mouseX > tabloW[17] - 30) && (mouseX < tabloW[17]) && 
    (mouseY > tablo[1] + tablo[3] - 8) && (mouseY < tablo[1] +
    tablo[3] + 12)) {
    fill(#836FFF);
    rect(tabloW[17] - 30, tablo[1] + tablo[3] - 8, 30, 20);
  }
}
//****************************************************
void mouseReleased() {
  if ((mouseX > tabloW[13] + shift) && (mouseX < tabloW[16] + shift) && 
    (mouseY > s) && (mouseY < s + 30)) {
    //selectDataEdit = 0;
    fill(#FF0000);
    rect(tablo[0] + tabloW[13], s, tabloW[16] - tabloW[13], 27);
    fill(255);
    text("ОТВЕС", tabloW[13] + shift * 9 + tablo[0], s + 20);
    printOtwes();
  }

  if ((mouseX > tabloW[17] - 30) && (mouseX < tabloW[17]) && 
    (mouseY > tablo[1] + tablo[3] - 8) && (mouseY < tablo[1] +
    tablo[3] + 12)) {
    fill(0);
    rect(tabloW[17] - 30, tablo[1] + tablo[3] - 8, 30, 20);
    select = 0;
    selectData = 0;
    selectDataEdit = 0;
    reset();
  }
}
