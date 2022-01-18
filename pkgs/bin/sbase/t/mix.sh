{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/pg83/sbase/archive/2c2a7f54ab55a022a617e510b6e00c3e2736fabd.zip
003346537cccb2b6444516b3fc1c027f
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
