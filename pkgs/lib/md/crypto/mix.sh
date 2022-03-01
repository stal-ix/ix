{% extends '//lib/md/mix.sh' %}

{% block install %}
{{super()}}

mkdir -p ${out}/include/openssl; cat << EOF > ${out}/include/openssl/sha.h
#include <sha2.h>

typedef SHA2_CTX SHA256_CTX;

#define SHA256_Init SHA256Init

#define SHA256_Update(x, y, z) SHA256Update(x, (const unsigned char*)y, z)
#define SHA256_Final(a, b) (SHA256Final(a, b), 1)

#define SHA256_End SHA256End
#define SHA256_File SHA256File
#define SHA256_FileChunk SHA256FileChunk
#define SHA256_Data SHA256Data

#define SHA256(a, b, c) SHA256_Data(a, b, (char*)c)
EOF

mkdir -p ${out}/lib/pkgconfig; cat << EOF > ${out}/lib/pkgconfig/openssl.pc
prefix=${out}
exec_prefix=\${prefix}
libdir=\${exec_prefix}/lib
includedir=\${prefix}/include

Name: openssl
Description: wrapper for libmd C library.
Version: 1.1.1
Libs: -L\${libdir}
Cflags: -I\${includedir}
EOF
{% endblock %}
