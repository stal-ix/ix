{% extends '//bin/ya/t/ix.sh' %}

{% block fetch %}
https://github.com/yandex/perforator/archive/refs/tags/v0.0.1.tar.gz
sha:619b296a529ccc2b236b8e4dde470236f1aece67723f6caaeb85f6ec2da83471
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
