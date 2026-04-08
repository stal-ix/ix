{% extends '//die/c/make.sh' %}

{% block pkg_name %}
figlet
{% endblock %}

{% block version %}
2.2.5
{% endblock %}

{% block fetch %}
https://github.com/cmatsuoka/figlet/archive/refs/tags/{{self.version().strip()}}.tar.gz
4d366c4a618ecdd6fdb81cde90edc54dbff9764efb635b3be47a929473f13930
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cpp_defines %}
__END_DECLS=
__BEGIN_DECLS=
{% endblock %}
