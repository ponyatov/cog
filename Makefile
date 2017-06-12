
CWD = $(CURDIR)
PREFIX = $(CWD)
PREFIXX = $(subst /,\/,${PREFIX})

XPATH = PATH=$(CWD)/bin:$(PATH)
MAKE  = $(XPATH) LANG=C make
CMAKE = $(XPATH) LANG=C cmake \
	-DCMAKE_INSTALL_PREFIX=$(PREFIX) \
	-DCPACK_PACKAGING_INSTALL_PREFIX=$(PREFIX)

#CPU_NUM = `grep processor /proc/cpuinfo|wc -l`
CPU_NUM = 4

.PHONY: all
all:
	@echo need manual build:
	@echo make packages deb cmake cogutils atomspace opencog
	
.PHONY: distclean
distclean:
	rm -rf bin share lib doc etc

######################## CORE ############################	

############ cogutils ############

.PHONY: cogutils cogutils-update
cogutils: cogutils-update
	rm -rf build ; mkdir build ; cd build ;\
	$(CMAKE) ../src/$@ && $(MAKE) -j$(CPU_NUM) && $(MAKE) install

cogutils-update: src/cogutils/README.md
	cd src/cogutils ; git pull
cogutils-clone: src/cogutils/README.md
src/cogutils/README.md:
	cd src ; git clone --depth=1 https://github.com/opencog/cogutils.git

############ atomspace ############

.PHONY: atomspace atomspace-update
atomspace: atomspace-update
	rm -rf build ; mkdir build ; cd build ;\
	$(CMAKE) ../src/$@ && $(MAKE) -j$(CPU_NUM) && $(MAKE) install

atomspace-update: src/atomspace/README.md
	cd src/atomspace ; git pull
atomspace-clone: src/atomspace/README.md
src/atomspace/README.md:
	cd src ; git clone --depth=1 git://github.com/opencog/atomspace.git

############ opencog ############

.PHONY: opencog opencog-update
opencog: opencog-update
	rm -rf build ; mkdir build ; cd build ;\
	echo $(CMAKE) ../src/$@ 
#	&&\
#	sed -i 's/\/usr\/local/$${CMAKE_INSTALL_PREFIX}/g' opencog/nlp/sentiment/cmake_install.cmake &&\
#	$(MAKE) -j$(CPU_NUM) && $(MAKE) install
#	sed -i 's/\/usr\/local/${PREFIXX}/g' share/opencog/scm/opencog.scm
#	sed -i 's/opencog\/atoms\/base/opencog\/base/g' share/opencog/scm/opencog.scm

opencog-update: src/opencog/README.md
	cd src/opencog ; git pull
opencog-clone: src/opencog/README.md
src/opencog/README.md:
	cd src ; git clone --depth=1 https://github.com/opencog/opencog.git
	
######################## VIZUALIZATION ############################	
############ glimpse ############

PHONY: glimpse external-tools external-tools-update
glimpse: external-tools-update
	ln -s external-tools/glimpse glimpse
	cd external-tools/glimpse ; npm install
external-tools-update:
	cd external-tools ; git pull 
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

######################## REQUIRED ############################	
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
cmake: $(CWD)/src/cmake-3.8.2/configure
	rm -rf build ; mkdir build ; cd build ;\
	$< --prefix=$(CWD) && $(MAKE) -j$(CPU_NUM) && $(MAKE) install

$(CWD)/src/cmake-3.8.2/configure: $(CWD)/gz/cmake-3.8.2.tar.gz
	cd src ; tar zx < $< && touch $@
$(CWD)/gz/cmake-3.8.2.tar.gz:
	mkdir -p gz tmp ; wget -c -P gz https://cmake.org/files/v3.8/cmake-3.8.2.tar.gz
