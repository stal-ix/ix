{% extends '//die/c/autohell.sh' %}

{% block version %}
0.99-19
{% endblock %}

{% block pkg_name %}
jed
{% endblock %}

{% block fetch %}
https://www.jedsoft.org/releases/jed/jed-{{self.version().strip()}}.tar.bz2
97a339ce2fb0a446767ee550786e6914fa2e8cdbad39a402e48368cd0d6b5763
{% endblock %}

{% block bld_libs %}
lib/c
lib/slang
{% endblock %}

{% block run_data %}
aux/terminfo
{% endblock %}

{% block bld_tool %}
aux/terminfo/config
{% endblock %}

{% block setup_target_flags %}
export JED_ROOT=${out}/share/jed
{% endblock %}

{% block make_flags %}
JED_ROOT="${JED_ROOT}"
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|/bin/cp|cp|' -e 's|/bin/rm|rm|' -i ${l}
done
{% endblock %}
