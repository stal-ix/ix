{% extends '//die/c/make.sh' %}

{% block fetch %}
https://downloadmirror.intel.com/783534/acpica-unix-20230628.tar.gz
sha:86876a745e3d224dcfd222ed3de465b47559e85811df2db9820ef09a9dff5cce
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}
