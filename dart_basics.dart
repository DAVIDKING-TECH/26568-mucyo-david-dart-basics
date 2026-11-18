// Student: Mucyo David
// Reg no: 26568
const String regNo = '26568';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// B2: Count vowels
int countVowels(String text) {
  int count = 0;
  String lowerText = text.toLowerCase();

  for (int i = 0; i < lowerText.length; i++) {
    if ('aeiou'.contains(lowerText[i])) {
      count++;
    }
  }

  return count;
}

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  String fullName = 'Mucyo David';
  print('$fullName has ${countVowels(fullName)} vowels');
}
//B3:initials
String initials(String fullName) {
    String cleanedName = fullName.trim();

  if (cleanedName.isEmpty) {
    return '';
  }

  List<String> names = cleanedName.split(RegExp(r'\s+'));

  String result = '';

  for (String name in names) {
    result += '${name[0].toUpperCase()}.';
  }

  return result;
}
void main() {
  print('Reg no: $regNo | D = $d | T = $t');
  print(initials('Mucyo David'));
  print(initials(' ana uwase '));
  print(initials(' '));
}
 // C5: Draw a right-aligned triangle
void drawTriangle(int height) {
  for (int row = 1; row <= height; row++) {
    String spaces = ' ' * (height - row);
    String symbol = row % 2 == 1 ? '*' : '#';
    String symbols = symbol * row;

    print(spaces + symbols);
  }
}
void main() {
 print('Triangle with height ${d + 3}:');
  drawTriangle(d + 3);

  print('Triangle with height 0:');
  drawTriangle(0);

  print('Triangle with height -2:');
  drawTriangle(-2);
}
// D2: Calculate MoMo transaction fee
int momoFee(int amount) {
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}
String maskPhone(String phone) {
  if (phone.length != 10) {
    return 'INVALID';
  }

  String masked = '';
  int i = 0;

  while (i < phone.length - 5) {
    masked += '*';
    i++;
  }

  return phone.substring(0, 3) +
      masked +
      phone.substring(phone.length - 2);
}
void main() {
  int totalFees = 0;
  int i = 1;
  String phone = '0788123456';

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);

    totalFees += fee;

    print(
      'Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}',
    );

    i++;
  }

  print('Total fees: $totalFees RWF');
}
