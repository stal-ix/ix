{% extends '//bin/quake/1/vk/novum/ix.sh' %}

{# https://github.com/Novum/vkQuake/issues/500 #}
{# https://github.com/Novum/vkQuake/issues/508 #}

{% block cpp_defines %}
{{super()}}
USE_CRT_MALLOC=1
{% endblock %}

{% block patch %}
{{super()}}

sed -e 's|static.*SpinWaitSemaphore|static inline void _Unused|' \
    -e 's|SpinWaitSemaphore|SDL_SemWait|' \
    -i Quake/tasks.c

cat << EOF >> Quake/mem.h
#pragma once
#undef TEMP_ALLOC
#define TEMP_ALLOC(type, var, size) type* var = (type*)Mem_Alloc(sizeof(type) * (size));
#undef TEMP_ALLOC_ZEROED
#define TEMP_ALLOC_ZEROED TEMP_ALLOC
#undef TEMP_FREE
#define TEMP_FREE(var) {Mem_Free(var);}
EOF
{% endblock %}
