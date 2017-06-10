CPU_NUM = `grep processor /proc/cpuinfo|wc -l`
CPU_NUM = 4

############ cpprest ############

.PHONY: cpprest cpprest-update
cpprest: cpprest-update
	rm -rf cpprestsdk/Release/build ;\
	mkdir  cpprestsdk/Release/build ;\
	cd     cpprestsdk/Release/build ;\
	cmake .. && make -j$(CPU_NUM) && sudo make install 

cpprest-update: cpprestsdk/README.md
	cd cpprestsdk ; git pull

############ packages ############

.PHONY: packages
packages:
	sudo apt install \
		python-pip \
		git \
		build-essential \
		binutils-dev \
		ccache \
		cmake \
		cxxtest \
		rlwrap \
		guile-2.0-dev \
		libiberty-dev \
		libicu-dev \
		libbz2-dev \
		cython python-dev python-zmq python-simplejson \
		libboost-all-dev \
		libzmq3-dev \
		libtbb-dev \
		unixodbc-dev \
		libpq-dev\
		uuid-dev \
		libprotoc-dev \
		protobuf-compiler \
		libsdl-gfx1.2-dev libssl-dev \
		tcl-dev \
		tcsh \
		libfreetype6-dev \
		libatlas-base-dev \
		gfortran \
		gearman \
		libgearman-dev \
		libgsasl7 \
		libldap2-dev \
		krb5-multidev \
		wordnet wordnet-dev wordnet-sense-index \
		doxygen
