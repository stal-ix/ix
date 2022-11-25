{% extends '//die/std/ix.sh' %}

{% block std_box %}
  {% if 'wrap_cc' in build_flags %}
    bld/wrapcc
  {% endif %}

  {{super()}}
{% endblock %}

{% block setup_tools %}
{% if 'wrap_cc' in build_flags %}
for name in ${CC} ${CXX}; do
    cat << EOF > ${name}
#!$(which sh)
exec wrapcc "$(which ${name})" "\${@}"
EOF

    chmod +x ${name}
done
{% endif %}
{{super()}}{% endblock %}
