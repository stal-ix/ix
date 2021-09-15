{% extends '//util/base.sh' %}

{% block preconf %}
mkdir .tools && cd .tools
{% block toolconf %}
{% endblock %}
ln -s $(which dash) sh
setup_compiler
cd ..
{% endblock %}
