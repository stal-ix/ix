{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
uthash
{% endblock %}

{% block version %}
2.3.0
{% endblock %}

{% block fetch %}
https://github.com/troydhanson/uthash/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:e10382ab75518bad8319eb922ad04f907cb20cccb451a3aa980c9d005e661acc
{% endblock %}

{% block install %}
cp -R src ${out}/include
{% endblock %}
