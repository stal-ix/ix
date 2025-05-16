{% extends '//die/fonts.sh' %}

{% block pkg_name %}
intel-one-mono
{% endblock %}

{% block version %}
1.4.0
{% endblock %}

{% block fetch %}
https://github.com/intel/intel-one-mono/releases/download/V{{self.version().strip()}}/otf.zip
sha:74ef8ee667403c760745bc12fc5e2cb1684544194fad3d5340919c173a8227fc
{% endblock %}
