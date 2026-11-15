{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libmodplug
{% endblock %}

{% block version %}
0.8.9.2
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/modplug-xmms/libmodplug-{{self.version().strip()}}.tar.gz
e4d9cb46da78a639d6eadb4ff3ab955f68c3099579b5310af64b37091e28957e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cxx_flags %}
{{super()}}
-Wno-register
{% endblock %}

{% block opt_flags %}
{{super()}}
-fno-fast-math
{% endblock %}
