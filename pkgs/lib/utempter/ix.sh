{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libutempter
{% endblock %}

{% block version %}
1.2.3-alt1
{% endblock %}

{% block fetch %}
https://github.com/altlinux/libutempter/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:52809c75af9b0e13249521177def85787f457888cbcee5511bf96fe06e146711
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd libutempter
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_flags %}
libdir=${out}/lib
libexecdir=${out}/bin
includedir=${out}/include
mandir=${out}/man
{% endblock %}
