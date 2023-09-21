{% extends '//lib/mesa/t/nodrv/ix.sh' %}

{% block c_rename_symbol %}
{{super()}}
handle_table_remove
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|disk_cache_get_function_timestamp|disk_cache_get_function_timestamp_xxx|' \
    -e 's|disk_cache_get_function_identifier|disk_cache_get_function_identifier_xxx|' \
    -i src/util/disk_cache.h

cat << EOF >> src/util/disk_cache.h
#pragma once

static inline bool disk_cache_get_function_timestamp(void* ptr, uint32_t* timestamp) {
    timestamp = 0;
    return true;
}

static inline bool disk_cache_get_function_identifier(void* ptr, struct mesa_sha1* ctx) {
    _mesa_sha1_update(ctx, &ptr, sizeof(ptr));

    return true;
}
EOF
{% endblock %}
