##svn co https://swig.svn.sourceforge.net/svnroot/swig/trunk SWIG
##rm SWIG/Source/Modules/r.cxx
##svn up SWIG
##cd SWIG
#rm -rf SWIG
#git clone https://github.com/swig/swig.git
#mv swig SWIG
cd SWIG
git pull
git checkout -- Source/Modules/r.cxx
patch Source/Modules/r.cxx /home/colin/Dropbox/data/my_rpatch
git diff
./autogen.sh
./configure --prefix=`pwd`
make
#make check
make install
