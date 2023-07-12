{% extends '//bin/man/db/stock/ix.sh' %}

{% block bld_libs %}
lib/shim/ix
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|"/tmp"|ix_temp_dir()|g' -i lib/tempfile.c
cat - lib/tempfile.c << EOF > _
#include "ix.h"
EOF
mv _ lib/tempfile.c
{% endblock %}
