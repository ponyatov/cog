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

############ cogutils ############

.PHONY: cogutils cogutils-update
cogutils: cogutils-update
	rm -rf cogutils/build ;\
	mkdir  cogutils/build ;\
	cd     cogutils/build ;\
	cmake .. && make -j$(CPU_NUM) && sudo make install

cogutils-update: cogutils/README.md
	cd cogutils ; git pull

############ atomspace ############

.PHONY: atomspace atomspace-update
atomspace: atomspace-update
	rm -rf atomspace/build ;\
	mkdir  atomspace/build ;\
	cd     atomspace/build ;\
	cmake .. && make -j$(CPU_NUM) && sudo make install

atomspace-update: atomspace/README.md
	cd atomspace ; git pull
	
############ hypertable ############

.PHONY: hypertable hypertable-update hypertable-clone
hypertable: hypertable-update
	rm -rf hypertable/build ;\
	mkdir  hypertable/build ;\
	cd     hypertable/build ;\
	cmake .. 
#	&& make -j$(CPU_NUM) && sudo make install

hypertable-update: hypertable/README.md
	cd hypertable ; git pull

hypertable-clone: hypertable/README.md
hypertable/README.md:
	git clone --depth=1 git://github.com/hypertable/hypertable.git

############ opencog ############

.PHONY: opencog opencog-update
opencog: opencog-update
	rm -rf opencog/build ;\
	mkdir  opencog/build ;\
	cd     opencog/build ;\
	cmake .. 
#	&& make -j$(CPU_NUM) && sudo make install

opencog-update: opencog/README.md
	cd opencog ; git pull

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
		doxygen \
		libdb-dev libghc-statestack-dev
