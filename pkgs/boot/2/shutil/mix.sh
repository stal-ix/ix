{% extends '//mix/template/py.py' %}

{% block fetch %}
https://github.com/pg83/shutil/archive/5870f53565d44157759c8a37f936914af1b7f26a.zip
sha:27937450d8e4dafbfd2575070a71e274034f6ada245fdc0ee830891032a90edb
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
boot/1/env
{% endblock %}

{% block script %}
extract0 ${src}/*.zip && cd shutil*

export PATH="${PWD}:${PATH}"

setup_compiler
setup_ar

. build.sh

cp() (
    cat ${1} > ${2}; chmod ${2}
)

mkdir ${out}/bin

for i in mkdir cat tr dirname echo chmod rm test; do
    cp ${i} ${out}/bin/${i}
done
{% endblock %}
