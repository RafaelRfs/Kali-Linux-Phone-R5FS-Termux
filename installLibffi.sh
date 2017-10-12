sed '/^includesdir/ s/$(libdir).*$/$(includedir)/' \
-i  include/Makefile.in &&
sed -e '/^includedir/ s/=.*$/=@includedir@/' \
-e 's/^Cflags: -I${includedir}Cflags:/' \
-i libffi.pc.in &&
./configure --prefix=/usr --disable-static &&  make
