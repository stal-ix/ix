{% extends '//lib/magic/t/t/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/bzip/2
{% endblock %}

{% block build %}
cd src
{{super()}}
{% endblock %}

{% block install %}
make install-pkgconfigexecDATA
cd src
{{super()}}
{% endblock %}

{% block use_data %}
aux/magic
{% endblock %}

{% block cpp_defines %}
MAGIC=\\\"${MAGIC_DATA}\\\"
{% endblock %}
