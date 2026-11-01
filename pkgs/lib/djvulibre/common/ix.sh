{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
djvu
{% endblock %}

{% block version %}
3.5.30.1
{% endblock %}

{% block git_repo %}
https://git.code.sf.net/p/djvu/djvulibre-git
{% endblock %}

{% block git_branch %}
release.{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
c5a73d327b1f5806f67035deaec4e5d09907eb9deea12e741baec5725bcb2261
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/jpeg
{% endblock %}

{% block cxx_flags %}
{{super()}}
-Wno-register
{% endblock %}

{% block configure_flags %}
--disable-xmltools
--disable-desktopfiles
{% endblock %}

{% block make_flags %}
-C libdjvu
{% endblock %}

{% block install %}
{{super()}}
cp config.h libdjvu/*.h ${out}/include/libdjvu/
{% endblock %}
