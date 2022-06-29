{% extends '//die/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz
sha:ac610bda97abe0d9f6b7c963255a11dcb196c25e337c61f94e4778d632f1d8fd
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block std_box %}
bld/bison
{{super()}}
{% endblock %}
