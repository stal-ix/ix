{% extends '//bin/quake/1/vk/novum/ix.sh' %}

{% block cpp_defines %}
{{super()}}
USE_CRT_MALLOC=1
{% endblock %}

{# https://github.com/Novum/vkQuake/issues/500 #}
{# https://github.com/Novum/vkQuake/issues/508 #}

{% block patch %}
{{super()}}

sed -e 's|static.*SpinWaitSemaphore|static inline void _Unused|' \
    -e 's|SpinWaitSemaphore|SDL_SemWait|' \
    -i Quake/tasks.c

cat << EOF > _
#pragma once
EOF

cat Quake/mem.h >> _

cat << EOF >> _
#undef TEMP_ALLOC
#define TEMP_ALLOC(type, var, size) {var = (type*)Mem_Alloc((sizeof(type) * (size)));}
#undef TEMP_FREE
#define TEMP_FREE(var) {Mem_Free(var);}
EOF

mv _ Quake/mem.h
{% endblock %}
