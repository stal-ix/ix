{% extends '//die/python/bin.sh' %}

{% block bld_libs %}
lib/python
lib/py/extra
{{super()}}
{% endblock %}

{% block entry_point %}python3{% endblock %}

{% block step_unpack %}
cat << EOF > python3
import sys
import code
import runpy

if __name__ == '__main__':
    if len(sys.argv) > 1:
        for x in sys.argv[1:]:
            runpy.run_path(x)
    else:
        if sys.stdin.isatty():
            code.interact()
        else:
            exec(sys.stdin.read())
EOF
{% endblock %}
