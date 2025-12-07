{% extends '//bld/java/boot/jamvm/t/ix.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/jamvm/jamvm/JamVM%201.5.1/jamvm-1.5.1.tar.gz
663895bd69caf3a1fda6af5eea8263d90a5fd35ca8f4c32e2210ac410788901a
{% endblock %}

{% block bld_libs %}
{{super()}}
bld/java/boot/classpath/93/dl
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/zip
bld/java/boot/jikes
bld/java/boot/classpath/93
{% endblock %}

{% block patch %}
{{super()}}
rm lib/classes.zip
{% endblock %}
