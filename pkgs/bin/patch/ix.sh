{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
patch
{% endblock %}

{% block version %}
2.8.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/patch/patch-{{self.version().strip()}}.tar.xz
3240c7959c5347c8ed347e3c4201c0337bf4240d5cf09d68889e58eeaba30e17
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block std_box %}
bld/bison
{{super()}}
{% endblock %}
