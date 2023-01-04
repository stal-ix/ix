{% extends '//bin/bsdutils/unwrap/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/librarian
{% endblock %}

{% block build %}
{{super()}}
cd ${tmp}/obj
cd src
for d in $(ls -A); do (
    echo "${d}" >> progs
    cd ${d}
    llvm-ar q libfunc.a $(find . -type f -name '*.o')
    patchns libfunc.a "${d}_"
) done

cat << EOF > main.c
#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
EOF

cat progs | while read l; do
    echo "int ${l}_main(int, char**, char**);"
done >> main.c

cat << EOF >> main.c
int main(int argc, char** argv, char** envp) {
    char* hndl = basename(argv[0]);

    if (!hndl) {
        exit(1);
    }
EOF

cat progs | while read l; do
    echo "if (strcmp(hndl, \"${l}\") == 0) {return ${l}_main(argc, argv, envp);}"
done >> main.c

cat << EOF >> main.c
    fprintf(stderr, "unknown handle %s\n", hndl);
    exit(1);
}
EOF

cd ..
clang -o busybox $(find . -type f -name '*.a') src/main.c
{% endblock %}

{% block install %}
cd ${tmp}/obj
mkdir -p ${out}/bin
cp busybox ${out}/bin/bsdbox
cat src/progs | while read l; do (
    cd ${out}/bin
    ln -s bsdbox ${l}
) done
{% endblock %}
