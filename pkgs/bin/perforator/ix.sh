{% extends '//bin/ya/t/ix.sh' %}

{% block pkg_name %}
perforator
{% endblock %}

{% block version %}
0.0.1
{% endblock %}

{% block fetch %}
https://github.com/yandex/perforator/archive/refs/tags/v{{self.version().strip()}}.tar.gz
619b296a529ccc2b236b8e4dde470236f1aece67723f6caaeb85f6ec2da83471
{% endblock %}

{% block bld_tool %}
bin/ya/gg
{{super()}}
{% endblock %}

{% block ya_c_flags %}
-Wno-error
{% endblock %}

{% block ya_make_targets %}
perforator/bundle
{% endblock %}
