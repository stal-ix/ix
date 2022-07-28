{% extends '//die/python/bin.sh' %}

{% block step_unpack %}
cat << EOF > python
{% include 'ix.py' %}
EOF
{% endblock %}

{% block bld_libs %}
lib/python
{% endblock %}

{% block entry_point %}python{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old bin/bin_ix
{% endblock %}
