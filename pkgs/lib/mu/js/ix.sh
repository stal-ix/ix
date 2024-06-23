{% extends '//die/c/make.sh' %}

{% block version %}1.3.5{% endblock %}

{% block fetch %}
https://github.com/ccxvii/mujs/archive/refs/tags/{{self.version()}}.tar.gz
sha:78a311ae4224400774cb09ef5baa2633c26971513f8b931d3224a0eb85b13e0b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block make_flags %}
HAVE_READLINE=no
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|Version:.*|Version: {{self.version()}}|' -i ${out}/lib/pkgconfig/mujs.pc
{% endblock %}
