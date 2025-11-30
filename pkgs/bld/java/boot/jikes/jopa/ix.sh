{% extends '//bin/jopa/ix.sh' %}

{% block install %}
{{super()}}
mv ${out}/bin/jopa ${out}/bin/jikes
{% endblock %}

{% block env %}
{{super()}}
export JAVAC=${out}/bin/jikes
export ANT_OPTS="-Dbuild.compiler=jikes"
export BOOTJAVAC_OPTS="-nowarn"
{% endblock %}
