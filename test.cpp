#include <iostream>
int main(int argc, char *argv[]) {
  int x = 0;
  if (x == 5) {
    std::cout << "5" << std::endl;
  } else {

    std::cout << "not 5" << std::endl;
  }

  for (int i = 0; i < 10; i++) {
    x = i + x * i;
  }
  return 0;
}
