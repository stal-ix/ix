{% extends '//bin/jikes/ix.sh' %}

{% block env %}
{{super()}}
export JAVAC=${out}/bin/jikes
export ANT_OPTS="-Dbuild.compiler=jikes"
export BOOTJAVAC_OPTS="-nowarn"
{% endblock %}
