
// Student: Mucyo David
// Reg no: 26568
const String regNo = '26568';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// D2: Calculate MoMo transaction fee
int momoFee(int amount) {
  // by MD
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

// F1: Format money with commas
String formatRwf(int amount) {
  // by MD
  String digits = amount.abs().toString();
  String result = '';
  int i = 0;

  while (i < digits.length) {
    if (i > 0 && (digits.length - i) % 3 == 0) {
      result += ',';
    }

    result += digits[i];
    i++;
  }

  if (amount < 0) {
    result = '-$result';
  }

  return '$result RWF';
}

// F2: Validate PIN
bool isValidPin(String pin) {
  // by MD
  if (pin.length != 5 || pin == '12345') {
    return false;
  }

  int i = 0;

  while (i < pin.length) {
    if (pin.codeUnitAt(i) < 48 || pin.codeUnitAt(i) > 57) {
      return false;
    }

    i++;
  }

  if (pin[0] == pin[1] &&
      pin[1] == pin[2] &&
      pin[2] == pin[3] &&
      pin[3] == pin[4]) {
    return false;
  }

  return true;
}

// F3: Send money
int sendMoney(int balance, int amount) {
  // by MD
  int fee = momoFee(amount);

  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount - fee;

  print(
    'Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

// F4: Buy airtime
int buyAirtime(int balance, int amount) {
  // by MD
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;

  print(
    'Airtime bought: ${formatRwf(amount)}. '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

// Main function
void main() {
  // by MD
  print('Reg no: $regNo | D = $d | T = $t');

  // F2: Test PIN validation
  print('12345: ${isValidPin('12345')}');
  print('77777: ${isValidPin('77777')}');
  print('4821: ${isValidPin('4821')}');
  print('48a21: ${isValidPin('48a21')}');
  print('48218: ${isValidPin('48218')}');

  // F: Starting balance
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  // F3: Send money three times
  int sendAmount = (d + 1) * 3000;

  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);

  // F4: Buy airtime
  balance = buyAirtime(balance, 1000);

  // Test invalid and insufficient transactions
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  // Additional formatRwf tests
  print(formatRwf(0)); // Expected: 0 RWF
  print(formatRwf(999)); // Expected: 999 RWF
  print(formatRwf(1000)); // Expected: 1,000 RWF
  print(formatRwf(1250000)); // Expected: 1,250,000 RWF
  print(formatRwf(-5000)); // Expected: -5,000 RWF

  // Additional isValidPin tests
  print(isValidPin('12346')); // Expected: true
  print(isValidPin('11111')); // Expected: false
  print(isValidPin('12a45')); // Expected: false
  print(isValidPin('1234')); // Expected: false
  print(isValidPin('00001')); // Expected: true
}

