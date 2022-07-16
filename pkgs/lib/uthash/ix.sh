{% extends '//die/c_std.sh' %}

{% block fetch %}
https://github.com/troydhanson/uthash/archive/refs/tags/v2.3.0.tar.gz
sha:e10382ab75518bad8319eb922ad04f907cb20cccb451a3aa980c9d005e661acc
{% endblock %}

{% block install %}
cp -R src ${out}/include
{% endblock %}
