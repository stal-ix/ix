{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
speexdsp
{% endblock %}

{% block version %}
1.2.1
{% endblock %}

{% block fetch %}
https://gitlab.xiph.org/xiph/speexdsp/-/archive/SpeexDSP-{{self.version().strip()}}/speexdsp-SpeexDSP-{{self.version().strip()}}.tar.bz2
b36d4f16e42b7103b7fc3e4a8f98b6bf889dd1f70f65c2365af07be82844db29
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
