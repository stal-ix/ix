{% extends '//lib/python/3/12/t/ix.sh' %}

{% block pkg_name %}
python
{% endblock %}

{% block version %}
3.15.2
{% endblock %}

{% block conf_ver %}
2/72
{% endblock %}

{% block fetch %}
https://www.python.org/ftp/python/{{self.version().strip()}}/Python-{{self.version().strip()}}.tar.xz
8b5536d280142ecf6cdfe15d12a21ba1c65e300bbf7b28a8d0cdb849575797de
{% endblock %}

{% block cpp_defines %}
USE_SSL=1
USE_NDBM=1
HAVE_NDBM_H=1
SQLITE_OMIT_LOAD_EXTENSION=1
{% endblock %}

{% block c_flags %}
{{super()}}
-Wno-incompatible-function-pointer-types
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-test-modules
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/wrap/cc/plugins/dedup
{% endblock %}

{% block ensure_static_build %}
{{super()}}
sed -e 's|.*_remote_debugging.*||' \
    -e 's|^xxlimited.*||' \
    -i Modules/Setup.local
cat Modules/Setup.stdlib.in \
    | grep '_remote_debugging' \
    | sed -e 's|.*@||' \
    >> Modules/Setup.local
{% endblock %}
