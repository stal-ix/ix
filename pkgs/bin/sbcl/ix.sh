{% extends '//bin/sbcl/t/ix.sh' %}

{% block fetch %}
https://nav.dl.sourceforge.net/project/sbcl/sbcl/2.2.6/sbcl-2.2.6-source.tar.bz2
sha:3e23048c8fa826fb913220beb2ac3697dbc5c0cdf2e89fed8db39ed1712304a0
{% endblock %}

{% block bld_tool %}
bld/sbcl
{{super()}}
{% endblock %}

{% block boot_lisp %}
sbcl
{% endblock %}

{% block extern_symbols %}
{{super()}}
{% include 'sbcl' %}
{% endblock %}
