{% extends '//die/c/ya.sh' %}

{% block pkg_name %}
perforator
{% endblock %}

{% block version %}
0.0.7
{% endblock %}

{% block fetch %}
https://github.com/yandex/perforator/archive/refs/tags/v{{self.version().strip()}}.tar.gz
74e3e4f15513c825999131c39bc96a0c977b2e4d5e135b93a60b5279af9920cc
{% endblock %}

{% block bld_tool %}
bin/ya/gg
{{super()}}
{% endblock %}

{% block ya_c_flags %}
-Wno-error
{% endblock %}

{% block ya_make_targets %}
perforator/bundle
{% endblock %}
