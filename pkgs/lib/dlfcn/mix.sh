{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/pg83/dlopen/archive/afbcfbf6f7c7fdd8215e8a694500608f7776c0bb.zip
1e1628d492290a6b89cd649554f379e6
{% endblock %}

{% block lib_deps %}
lib/c++/mix.sh
{% endblock %}

{% block std_env %}
env/std/1/mix.sh
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/lib/libdl.a ${out}/lib/libdlstub.a
{% endblock %}
