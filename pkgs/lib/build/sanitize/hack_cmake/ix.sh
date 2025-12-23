{% extends '//die/env.sh' %}

{#
When building LLVM components with sanitizer support, the sanitizer runtime contains references
to some of the function defined by the components. Normally, this is not a problem, since we
will resolve this references down the line when linking the final binary. However, CMake refuses
to build anything if it can't succesfully link a simple binary at this point, so we have to trick
it into believing it can by ignoring some unresolved symbol errors.
#}

{% block undef %}
_Unwind_Backtrace
_Unwind_GetIP
__real___cxa_throw
__real___cxa_rethrow_primary_exception
__real__Unwind_RaiseException
stub_dlsym
{% endblock %}

{% block env %}
{% for x in self.undef() | parse_list %}
export LDFLAGS="-Wl,--defsym={{x}}=0 ${LDFLAGS}"
{% endfor %}
{% endblock %}
