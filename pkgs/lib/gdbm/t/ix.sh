{% extends '//die/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/gdbm/gdbm-1.19.tar.gz
md5:aeb29c6a90350a4c959cd1df38cd0a7e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block std_box %}
bld/flex
bld/bison
{{super()}}
{% endblock %}
