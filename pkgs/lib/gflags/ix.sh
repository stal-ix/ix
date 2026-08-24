{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
gflags
{% endblock %}

{% block version %}
2.3.1
{% endblock %}

{% block fetch %}
https://github.com/gflags/gflags/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1b5e0648d7b94021895086e65479b4eaca7935eecfffd7dd9512eb576181c53d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*bindir.*||' -i ${out}/lib/pkgconfig/gflags.pc
{% endblock %}
