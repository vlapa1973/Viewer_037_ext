//*****************************************************
//  Работа с клавиатурой

void keyReleased() {
  if (key > 31 && key < 127 || key > 1039 && key < 1104) {  // ввод данных
    if (selectDataEdit != 0) {
      if (inputData.length() < 30) {
        inputData += key;
      }
    }
    reset();
  }

  if (key == 8) {      //  backspase
    if (inputData.length() >= 1) {
      inputData = inputData.substring(0, inputData.length() - 1);
    }
    reset();
  }

  if (key == 127) {    //  стереть все
    inputData = "";
    reset();
  }

  if (key == 13 || key == 10) {      //  enter или return

    int hCode = table.getInt(index-1, 0);
    int hCode1 = table.getInt(index-1, 9) * 2 + table.getInt(index-1, 10) * 2 +
      table.getInt(index-1, 12) * 2 + table.getInt(index-1, 13) * 2 +
      table.getInt(index-1, 14) * 2 + table.getInt(index-1, 15) * 2;
    table.setInt(index-1, 0, hCode);

    if (selectDataEdit == 1) {
      table.setInt(index-1, selectDataEdit - 1, int(inputData.trim()));
    } else if (selectDataEdit == 14 || selectDataEdit == 15) {
      table.setInt(index-1, selectDataEdit, int(inputData.trim()));
    } else {
      table.setString(index-1, selectDataEdit, inputData.trim());
    }

    if (hCode == hCode1) {
      hCode1 = table.getInt(index-1, 9) * 2 + table.getInt(index-1, 10) * 2 +
        table.getInt(index-1, 12) * 2 + table.getInt(index-1, 13) * 2 +
        table.getInt(index-1, 14) * 2 + table.getInt(index-1, 15) * 2;
      table.setInt(index-1, 0, hCode1);
    }

    //saveTable(table, filePath1 + "base.csv");
    //saveTable(table, filePath + "base.csv");

    selectDataEdit = 0;
    reset();
    inputData = "";
  }

  key = 0;
}
