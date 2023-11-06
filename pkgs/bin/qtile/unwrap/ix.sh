{% extends '//die/python/bin.sh' %}

{% block bld_libs %}
lib/python
bin/qtile/module/register
{% endblock %}

{% block entry_point %}qtile{% endblock %}

{% block step_unpack %}
cat << EOF > qtile
import libqtile.scripts.main as lm
lm.main()
EOF
{% endblock %}
