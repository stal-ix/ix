{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/pg83/shutil/archive/refs/tags/v1.tar.gz
sha:67825e48717c64c2d46d785cfcf46c997b6636cfc5693e34f4d1598aa5ea974a
{% endblock %}

{% block bld_libs %}
bld/boot/0/ind
{% endblock %}

{% block bld_deps %}
bld/boot/1/env
{% endblock %}

{% block unpack %}
mkdir src
cd src
extract0 ${src}/*.gz
cd shutil*
{% endblock %}

{% block setup_compiler %}
source_env "${IX_T_DIR}"
setup_tc_here
{% endblock %}

{% block build %}
. ./build.sh

cat << EOF > mv.c
#include <stdio.h>

int main(int argc, char** argv) {
    if (argc > 2) {
        rename(argv[1], argv[2]);
    }

    return 0;
}
EOF

cc -o mv mv.c

cat << EOF > uname.c
#include <stdio.h>

int main() {
    printf("{{target.cmake_system_name}}\n");
    return 0;
}
EOF

cc -o uname uname.c
{% endblock %}

{% block install %}
export PATH=${PWD}:${PATH}

cp() (
    cat ${1} > ${2}
    chmod ${2}
)

mkdir ${out}/bin

for i in mkdir cat tr dirname echo chmod rm test mv uname; do
    cp ${i} ${out}/bin/${i}
done
{% endblock %}

{% block script_exec %}
["/usr/bin/env", "PATH={{ix_boot_path}}", "/bin/sh", "-s"]
{% endblock %}
