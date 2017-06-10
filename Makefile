CPU_NUM = `grep processor /proc/cpuinfo|wc -l`
CPU_NUM = 4

.PHONY: cpprest cpprest-update
cpprest: cpprest-update
	rm -rf cpprestsdk/Release/build ;\
	mkdir  cpprestsdk/Release/build ;\
	cd     cpprestsdk/Release/build ;\
	cmake .. && make -j$(CPU_NUM)

cpprest-update: cpprestsdk/README.md
	cd cpprestsdk ; git pull
