{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/aklomp/base64/archive/refs/tags/v0.4.0.tar.gz
sha:1fce54059c504b2604c22c20cd930444a71b3340fc81334c037da63976d92002
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/make
{% endblock %}

{% block build %}
make OBJCOPY=llvm-objcopy bin/base64
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp bin/base64 ${out}/bin/
{% endblock %}
