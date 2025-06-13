{% extends '//lib/placebo/6/ix.sh' %}

{% block pkg_name %}
libplacebo
{% endblock %}

{% block version %}
7.351.0
{% endblock %}

{% block fetch %}
https://code.videolan.org/videolan/libplacebo/-/archive/v{{self.version().strip()}}/libplacebo-v{{self.version().strip()}}.tar.bz2
d68159280842a7f0482dcea44a440f4c9a8e9403b82eccf185e46394dfc77e6a
{% endblock %}
