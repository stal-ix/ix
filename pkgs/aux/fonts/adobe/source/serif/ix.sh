{% extends '//die/fonts.sh' %}

{% block pkg_name %}
source-serif
{% endblock %}

{% block version %}
4.005
{% endblock %}

{% block fetch %}
https://github.com/adobe-fonts/source-serif/archive/refs/tags/{{self.version().strip()}}R.tar.gz
sha:92415a067bfa449876cd3f4a4229d18a9140588574299696da81be0e213d69df
{% endblock %}
