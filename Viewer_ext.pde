//*******************************************************************
//  Zasor2 - viewer
//  2021.03.05 - 2021.09.08
//  v.  037-ext
//*******************************************************************
import processing.pdf.*;

PFont myFont;

String filePath;                      //  путь для сохранения копии файла базы
String filePath1;                     //  путь для сохранения файла базы (Ядиск)
//String put = "data/Custom/";          //  путь для сохранения файла настроек
String otwes = "OTWESY/";             //  путь для сохранения отвесов
int count = 0;
int select = 0;
int selectData = 0;
int selectDataEdit = 0;
int h = 17;
int w = 80;
int otH = 13;
int otW = 10;
int shift = 10;

boolean flagHighlight = false;
boolean flagWork = false;

int[] tablo = {10, 30, 1350, 900};
int[] tabloW = {0, 40, 135, 270, 335, 370, 435, 500, 565, 630, 690,
  745, 955, 1035, 1110, 1185, 1270, tablo[2]};

String[][] data = new String[60][20];
String inputData = "";
int numberReport;
int millisOld = 0;

int index = 0;

int sumN1 = 0;
int sumN = 0;
int sumChist = 0;
int sumArenda = 0;
int sumDopSor = 0;
int sumSum = 0;

int sumKamazy = 0;
int sumKamEach = 0;
String[] kamazy;
char prefixKamazy = '_';

int rowCount = 0;

int s = tablo[1] + tablo[3] - 11;

Table table;

//*****************************************************
void settings() {
  size(tablo[2] + 20, tablo[3] + 60);
}
void setup() {
  myFont = createFont("Arial", 12);
  textFont(myFont);

  selectInput("Select the database file", "fileSelected");
}
//*****************************************************
void draw() {
  if (flagWork) {
    if (millis() >= millisOld + 1000) {
      table = loadTable(filePath1, "header");
      if (table.getRowCount() == rowCount) {
        return;
      } else {
        rowCount = table.getRowCount();
        fill(255);
        rect(tablo[0], tablo[1], tablo[2], tablo[3]);
        reset();
      }
    }
  }
}
//****************************************************
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
    //  "Окно было закрыто или пользователь нажал на отмену."
  } else {
    println("User selected " + selection.getAbsolutePath());
    //  "Пользователь выбрал "
    filePath1 = selection.getAbsolutePath();
    
    //println("DATA: " + filePath1.lastIndexOf('/'));

    if (filePath1.lastIndexOf('/') < 0) {
      filePath = filePath1.substring(0, filePath1.lastIndexOf('\\'));
    } else {
      filePath = filePath1.substring(0, filePath1.lastIndexOf('/'));
    }
    

    flagWork = true;
  }
}
//****************************************************
void reset() {
  count = 0;
  sumN1 = 0;
  sumN = 0;
  sumChist = 0;
  sumArenda = 0;
  sumDopSor = 0;
  sumSum = 0;

  visible();
}

//****************************************************
String printData(String d) {
  String d1 = "";
  if (d.length() == 0 || d.length() == 1) {
    d1 = "";
  } else if (d.length() < 2) {
    d1 = d.substring(d.length() - 1, d.length());
  } else if (d.length() < 3) {
    d1 = d.substring(d.length() - 2, d.length());
  } else if (d.length() < 4) {
    d1 = d.substring(d.length() - 3, d.length());
  } else if (d.length() < 5) {
    d1 = d.substring(d.length() - 4, d.length() - 3) + "'" +
      d.substring(d.length() - 3, d.length());
  } else if (d.length() < 6) {
    d1 = d.substring(d.length() - 5, d.length() - 3) + "'" +
      d.substring(d.length() - 3, d.length());
  } else if (d.length() < 7) {
    d1 = d.substring(d.length() - 6, d.length() - 3) + "'" +
      d.substring(d.length() - 3, d.length());
  } else if (d.length() < 8) {
    d1 = d.substring(d.length() - 7, d.length() - 6) + "'" +
      d.substring(d.length() - 6, d.length() - 3) + "'" +
      d.substring(d.length() - 3, d.length());
  }
  return d1;
}
