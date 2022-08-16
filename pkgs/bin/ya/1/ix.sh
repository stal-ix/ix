{% extends '//bin/ya/t/ix.sh' %}

{% block bld_tool %}
{{super()}}
{% block ya_boot %}
bin/ya/0(arc_root={{arc_root}},ya_ver={{ya_ver}})
{% endblock %}
{% endblock %}

{% block stage %}stage3.sh{% endblock %}

{% block patch %}
{{super()}}
sed -e "s|python2|$(which python2)|" -i build/ymake_conf.py
sed -e "s|__python3__|$(which python3)|" -i build/ymake.core.conf
{% endblock %}
