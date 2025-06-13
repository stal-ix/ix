{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libmodplug
{% endblock %}

{% block version %}
0.8.9.0
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/modplug-xmms/libmodplug-{{self.version().strip()}}.tar.gz
457ca5a6c179656d66c01505c0d95fafaead4329b9dbaa0f997d00a3508ad9de
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
