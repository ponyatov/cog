
CWD = $(CURDIR)

PREFIX = $(HOME)/opencog

XPATH = PATH=$(CWD)/cmake/bin:$(PATH)
MAKE  = $(XPATH) LANG=C make
CMAKE = $(XPATH) LANG=C $(CWD)/cmake/bin/cmake -DCMAKE_INSTALL_PREFIX=$(PREFIX)

#CPU_NUM = `grep processor /proc/cpuinfo|wc -l`
CPU_NUM = 4

######################## CORE ############################	

############ cogutils ############

.PHONY: cogutils cogutils-update
cogutils: cogutils-update
	rm -rf cogutils/build ;\
	mkdir  cogutils/build ;\
	cd     cogutils/build ;\
	$(CMAKE) .. && $(MAKE) -j$(CPU_NUM) && $(MAKE) install

cogutils-update: cogutils/README.md
	cd cogutils ; git pull
#git clone --depth=1 https://github.com/opencog/cogutils.git

############ atomspace ############

.PHONY: atomspace atomspace-update
atomspace: atomspace-update
	rm -rf atomspace/build ;\
	mkdir  atomspace/build ;\
	cd     atomspace/build ;\
	$(CMAKE) .. && $(MAKE) -j$(CPU_NUM) && $(MAKE) install

atomspace-update: atomspace/README.md
	cd atomspace ; git pull
atomspace-clone: atomspace/README.md
atomspace/README.md:
	git clone --depth=1 git://github.com/opencog/atomspace.git

############ opencog ############

.PHONY: opencog opencog-update
opencog: opencog-update
	rm -rf opencog/build ;\
	mkdir  opencog/build ;\
	cd     opencog/build ;\
	$(CMAKE) .. && $(MAKE) -j$(CPU_NUM) && $(MAKE) install

opencog-update: opencog/README.md
	cd opencog ; git pull
opencog-clone: opencog/README.md
opencog/README.md:
	git clone --depth=1 https://github.com/opencog/opencog.git
	
######################## VIZUALIZATION ############################	
############ glimpse ############

PHONY: glimpse
glimpse: external-tools
	cd external-tools/glimpse ; npm install
	cd $(PREFIX) ; ln -s $(CWD)/external-tools/glimpse glimpse
external-tools:
	git clone --depth=1 https://github.com/opencog/external-tools.git

######################## OPTIONAL ############################	
############ cpprest ############

.PHONY: cpprest cpprest-update
cpprest: cpprest-update
	rm -rf cpprestsdk/Release/build ;\
	mkdir  cpprestsdk/Release/build ;\
	cd     cpprestsdk/Release/build ;\
	$(CMAKE) ..

#	cmake .. && make -j$(CPU_NUM) && sudo make install 

cpprest-update: cpprestsdk/README.md
	cd cpprestsdk ; git pull
#git clone --depth=1 https://github.com/Microsoft/cpprestsdk.git

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

############ packages ############

.PHONY: deb
deb:
	sudo apt install \
		dh-make

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
		libdb-dev \
		nodejs-legacy npm

############ cmake ############

.PHONY: cmake
cmake: cmake-3.8.2/README
	rm -rf cmake-3.8.2/build ;\
	mkdir  cmake-3.8.2/build ;\
	cd     cmake-3.8.2/build ;\
	../configure --prefix=$(CWD)/$@ && make && make install

cmake-3.8.2/README: gz/cmake-3.8.2.tar.gz
	tar zx < $< && touch $@
gz/cmake-3.8.2.tar.gz:
	mkdir -p gz tmp ; wget -c -P gz https://cmake.org/files/v3.8/cmake-3.8.2.tar.gz
	