{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/vim/vim/archive/refs/tags/v9.0.0006.tar.gz
sha:e5ece8e5b530561a5ab732c793e7e247f3c472bce57b09cead3b58f2d4f9b3f4
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build %}
cc -o xxd src/xxd/xxd.c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp xxd ${out}/bin/
{% endblock %}

{% block cpp_defines %}
__USE_FIXED_PROTOTYPES__=1
{% endblock %}

{% block patch %}
sed -e 's|extern .*||' -i src/xxd/xxd.c
{% endblock %}
