{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/pg83/sbase/archive/refs/tags/v1.tar.gz
sha:61567de6a9f954b19f81c51b7cc216a030801224ef2b65a2593cb172ff97c2f8
{% endblock %}

{% block c_rename_symbol %}
reallocarray
{% endblock %}

{% block cpp_defines %}
{% if target.os == 'darwin' %}
_DARWIN_C_SOURCE=1
st_atim=st_atimespec
st_mtim=st_mtimespec
st_ctim=st_ctimespec
{% endif %}
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
