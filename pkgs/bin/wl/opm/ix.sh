{% extends '//die/c/make.sh' %}

{% block version %}
1.0.0
{% endblock %}

{% block pkg_name %}
wlopm
{% endblock %}

{% block fetch %}
https://git.sr.ht/~leon_plickat/wlopm/archive/v{{self.version().strip()}}.tar.gz
15f31bbd855131943397dded3a26003f2f5056e4c6a1a93d35ff7697b3f1e439
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block install %}
mkdir -p ${out}/share/bash-completion/completions/wlopm
{{super()}}
{% endblock %}
