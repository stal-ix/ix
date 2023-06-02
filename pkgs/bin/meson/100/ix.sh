{% extends '//bin/meson/64/ix.sh' %}

{% block unpack %}
# spaces in paths
mkdir src; cd src; extract0 ${src}/1*; cd meson*
{% endblock %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/1.1.1.tar.gz
sha:1c3b9e1a3a36b51adb5de498d582fd5cbf6763fadbcf151de9f2a762e02bd2e6
{% endblock %}

{% block test %}
test -f ${out}/bin/meson
{% endblock %}
