{% extends '//mix/template/make.sh' %}

{% block fetch %}
# url https://github.com/pg83/dlopen/archive/afbcfbf6f7c7fdd8215e8a694500608f7776c0bb.zip
# md5 1e1628d492290a6b89cd649554f379e6
{% endblock %}

{% block deps %}
# lib lib/cxx/mix.sh
# bld dev/build/make/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block postinstall %}
mv $out/lib/libdl.a $out/lib/libdlstub.a
{% endblock %}
