{% extends '//lib/openssl/fake/ix.sh' %}

{% block lib_deps %}
lib/md
{% endblock %}

{% block install %}
mkdir -p ${out}/include/openssl

cat << EOF > ${out}/include/openssl/sha.h
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

{{super()}}
{% endblock %}
