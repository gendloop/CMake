#include <iostream>

#include <MyAdd/my_add.h>

int main() {
	int ret = myAdd(1, 2);
	std::cout << "myAdd(1,2) = " << ret << std::endl;
	return 0;
}