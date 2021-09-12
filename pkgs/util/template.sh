{% extends '//util/base.sh' %}

{% block preconf %}
mkdir .tools && cd .tools
{% block toolconf %}
ln -s $(which dash) sh
{% endblock %}
setup_compiler
cd ..
{% endblock %}
