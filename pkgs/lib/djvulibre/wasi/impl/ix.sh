{% extends '//lib/djvulibre/common/ix.sh' %}

{% block lib_deps %}
{% endblock %}

{% block bld_libs %}
lib/shim/pthread
lib/shim/pwd
lib/shim/setjmp
lib/c++
lib/jpeg
lib/c
{% endblock %}

{% block cxx_flags %}
{{super()}}
-fno-exceptions
{% endblock %}

{% block cpp_defines %}
DJVU_NO_EXCEPTIONS
HAVE_PTHREAD=1
{% endblock %}

{% block patch %}
cat << 'EOF' > libdjvu/GExceptionTrap.h
static inline const GException &g_exception_never(void) {
  static const GException never("never");
  return never;
}

// the cause of the trap, for the host to read back from the dead instance
inline char g_exception_cause[256];

[[noreturn]] static inline void g_exception_trap(const char *cause) {
  size_t n = 0;
  while (cause && cause[n] && n < sizeof(g_exception_cause) - 1) {
    g_exception_cause[n] = cause[n];
    n++;
  }
  g_exception_cause[n] = 0;
  __builtin_trap();
}

// G_RETHROW stands alone or takes an exception: an object traps as it is
// made, and takes the argument after
struct g_exception_rethrow {
  g_exception_rethrow(void) { g_exception_trap("rethrow"); }
  void operator()(const GException &) const {}
};

# define G_TRY         if (true)
# define G_CATCH(n)    else if (const GException &n = g_exception_never(); false) {
# define G_CATCH_ALL   else if (false) {
# define G_ENDCATCH    }
# define G_RETHROW     g_exception_rethrow()
# define G_THROW(msg)  g_exception_trap(msg)
EOF
sed -e 's|^#ifdef USE_EXCEPTION_EMULATION$|#if defined(DJVU_NO_EXCEPTIONS)\n# include "GExceptionTrap.h"\n#elif defined(USE_EXCEPTION_EMULATION)|' \
    -i libdjvu/GException.h
grep -q GExceptionTrap.h libdjvu/GException.h
sed -e 's/^  try$/  if (true)/; s/^  catch(\.\.\.)$/  else/' -i libdjvu/miniexp.cpp
grep -q "if (true)" libdjvu/miniexp.cpp
{% endblock %}
