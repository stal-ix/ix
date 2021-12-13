{% extends '//mix/template/py.py' %}

{% block fetch %}
https://github.com/pg83/shutil/archive/cf434c92b54583865ce10c556c81ab51c3230141.zip
d877127f9e043a100188dfec48f1b8a3
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
boot/1/env/mix.sh
{% endblock %}

{% block script %}
${unzip} ${src}/*.zip && cd shutil*

setup_toolchain_env

. ./build.sh

cp() {
    ./cat $1 > $2
    ./chmod 493 $2
}

./mkdir ${out}/bin

for i in mkdir cat tr dirname echo chmod rm test; do
    cp ${i} ${out}/bin/${i}
done
{% endblock %}
