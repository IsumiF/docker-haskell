FROM ubuntu:20.04
WORKDIR /work
ENV PATH="/root/.cabal/bin:${PATH}"
RUN apt-get update && \
  apt-get install -y vim less curl libnuma-dev libgmp-dev zlib1g-dev build-essential llvm-9 && \
  curl --output cabal.tar.xz https://downloads.haskell.org/~cabal/cabal-install-3.4.0.0/cabal-install-3.4.0.0-aarch64-ubuntu-18.04.tar.xz && \
  tar xf cabal.tar.xz && \
  mv cabal /usr/local/bin && \
  rm cabal.tar.xz && \
  curl --output ghc.tar.xz https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-aarch64-deb10-linux.tar.xz && \
  tar xf ghc.tar.xz && \
  cd ghc-8.10.4 && \
  ./configure && make install && \
  cd .. && \
  rm -rf ghc-8.10.4 ghc.tar.xz && \
  update-alternatives \
    --install /usr/lib/llvm              		llvm             		    /usr/lib/llvm-9 20 \
    --slave   /usr/bin/llvm-ar           		llvm-ar          		    /usr/bin/llvm-ar-9 \
    --slave   /usr/bin/llvm-as           		llvm-as          		    /usr/bin/llvm-as-9 \
    --slave   /usr/bin/llvm-bcanalyzer   		llvm-bcanalyzer  		    /usr/bin/llvm-bcanalyzer-9 \
    --slave   /usr/bin/llvm-cat       		    llvm-cat      			    /usr/bin/llvm-cat-9  \
    --slave   /usr/bin/llvm-cfi-verify      	llvm-cfi-verify      	    /usr/bin/llvm-cfi-verify-9  \
    --slave   /usr/bin/llvm-config       		llvm-config      		    /usr/bin/llvm-config-9  \
    --slave   /usr/bin/llvm-cov          		llvm-cov         		    /usr/bin/llvm-cov-9 \
    --slave   /usr/bin/llvm-c-test          	llvm-c-test         	    /usr/bin/llvm-c-test-9 \
    --slave   /usr/bin/llvm-cvtres          	llvm-cvtres         	    /usr/bin/llvm-cvtres-9 \
    --slave   /usr/bin/llvm-cxxdump          	llvm-cxxdump         	    /usr/bin/llvm-cxxdump-9 \
    --slave   /usr/bin/llvm-cxxfilt         	llvm-cxxfilt         	    /usr/bin/llvm-cxxfilt-9 \
    --slave   /usr/bin/llvm-cxxmap          	llvm-cxxmap        		    /usr/bin/llvm-cxxmap-9 \
    --slave   /usr/bin/llvm-diff         		llvm-diff       		    /usr/bin/llvm-diff-9 \
    --slave   /usr/bin/llvm-dis          		llvm-dis         		    /usr/bin/llvm-dis-9 \
    --slave   /usr/bin/llvm-dlltool         	llvm-dlltool         	    /usr/bin/llvm-dlltool-9 \
    --slave   /usr/bin/llvm-dwarfdump    		llvm-dwarfdump   		    /usr/bin/llvm-dwarfdump-9 \
    --slave   /usr/bin/llvm-dwp          		llvm-dwp         		    /usr/bin/llvm-dwp-9 \
    --slave   /usr/bin/llvm-elfabi          	llvm-elfabi         	    /usr/bin/llvm-elfabi-9 \
    --slave   /usr/bin/llvm-exegesis          	llvm-exegesis         	    /usr/bin/llvm-exegesis-9 \
    --slave   /usr/bin/llvm-extract          	llvm-extract         	    /usr/bin/llvm-extract-9 \
    --slave   /usr/bin/llvm-lib          		llvm-lib         		    /usr/bin/llvm-lib-9 \
    --slave   /usr/bin/llvm-link         		llvm-link        		    /usr/bin/llvm-link-9 \
    --slave   /usr/bin/llvm-lto2           		llvm-lto2          		    /usr/bin/llvm-lto2-9  \
    --slave   /usr/bin/llvm-lto           		llvm-lto          		    /usr/bin/llvm-lto-9  \
    --slave   /usr/bin/llvm-mc           		llvm-mc          		    /usr/bin/llvm-mc-9 \
    --slave   /usr/bin/llvm-mca           		llvm-mca          		    /usr/bin/llvm-mca-9 \
    --slave   /usr/bin/llvm-modextract          llvm-modextract             /usr/bin/llvm-modextract-9 \
    --slave   /usr/bin/llvm-mt           		llvm-mt          		    /usr/bin/llvm-mt-9 \
    --slave   /usr/bin/llvm-nm           		llvm-nm          		    /usr/bin/llvm-nm-9 \
    --slave   /usr/bin/llvm-objcopy      		llvm-objcopy     		    /usr/bin/llvm-objcopy-9 \
    --slave   /usr/bin/llvm-objdump      		llvm-objdump     		    /usr/bin/llvm-objdump-9 \
    --slave   /usr/bin/llvm-opt-report          llvm-opt-report             /usr/bin/llvm-opt-report-9 \
    --slave   /usr/bin/llvm-pdbutil          	llvm-pdbutil          	    /usr/bin/llvm-pdbutil-9  \
    --slave   /usr/bin/llvm-PerfectShuffle      llvm-PerfectShuffle         /usr/bin/llvm-PerfectShuffle-9 \
    --slave   /usr/bin/llvm-profdata          	llvm-profdata         	    /usr/bin/llvm-profdata-9 \
    --slave   /usr/bin/llvm-ranlib      		llvm-ranlib      		    /usr/bin/llvm-ranlib-9 \
    --slave   /usr/bin/llvm-rc          		llvm-rc         		    /usr/bin/llvm-rc-9 \
    --slave   /usr/bin/llvm-readelf          	llvm-readelf        	    /usr/bin/llvm-readelf-9 \
    --slave   /usr/bin/llvm-readobj      		llvm-readobj     		    /usr/bin/llvm-readobj-9 \
    --slave   /usr/bin/llvm-rtdyld       		llvm-rtdyld      		    /usr/bin/llvm-rtdyld-9 \
    --slave   /usr/bin/llvm-size         		llvm-size        		    /usr/bin/llvm-size-9 \
    --slave   /usr/bin/llvm-split         		llvm-split        		    /usr/bin/llvm-split-9 \
    --slave   /usr/bin/llvm-stress       		llvm-stress      		    /usr/bin/llvm-stress-9 \
    --slave   /usr/bin/llvm-strings         	llvm-strings        	    /usr/bin/llvm-strings-9 \
    --slave   /usr/bin/llvm-strip         		llvm-strip        		    /usr/bin/llvm-strip-9 \
    --slave   /usr/bin/llvm-symbolizer   		llvm-symbolizer  		    /usr/bin/llvm-symbolizer-9 \
    --slave   /usr/bin/llvm-tblgen       		llvm-tblgen      		    /usr/bin/llvm-tblgen-9 \
    --slave   /usr/bin/llvm-undname       		llvm-undname      		    /usr/bin/llvm-undname-9 \
    --slave   /usr/bin/llvm-xray       		    llvm-xray      			    /usr/bin/llvm-xray-9 \
    --slave   /usr/bin/opt       		    opt      			    /usr/bin/opt-9 \
    --slave   /usr/bin/llc       		    llc      			    /usr/bin/llc-9 && \
  cabal v2-update
RUN cabal v2-install hoogle-5.0.18.1