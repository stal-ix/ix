#include <stop_token>

namespace std {

  bool stop_source::request_stop() noexcept {
    bool expected = false;
    bool res = m_stop_state->stop_requested.compare_exchange_strong(expected, true);
    return res;
  }

  stop_token stop_source::get_token() const noexcept {
    return stop_token (m_stop_state);
  }

  bool stop_source::stop_requested() const noexcept {
    return m_stop_state->stop_requested;
  }

  bool stop_source::stop_possible() const noexcept {
    return true;
  }

  stop_source::stop_source(nostopstate_t) noexcept
    : m_stop_state(new stl_pollyfill::_Stop_state())
  {
    m_stop_state->stop_requested = false;
  }

  stop_source::stop_source()
    : m_stop_state(new stl_pollyfill::_Stop_state())
  {
  }
  stop_source::stop_source(stop_source&& other) noexcept {
    m_stop_state = other.m_stop_state;
  }

  stop_source::stop_source(const stop_source& other) noexcept {
    m_stop_state = other.m_stop_state;
  }

  stop_source::~stop_source() = default;

  stop_source &stop_source::operator=(stop_source && other) noexcept {
    m_stop_state = other.m_stop_state;

    return *this;
  }

  stop_source &stop_source::operator=(const stop_source & other) noexcept {
    m_stop_state = other.m_stop_state;
    return *this;
  }

  void stop_source::swap(stop_source & other) noexcept {
    // m_stop_state->swap(other.m_stop_state.get());
  }

  bool operator==(const stop_source & lhs, const stop_source & rhs) noexcept {
    return false;
  }

  void swap(stop_source& a, stop_source& b) noexcept {
    return a.swap(b);
  }

  bool stop_token::stop_requested() const noexcept {
    return stop_state->_stop_requested();
  }

  bool stop_token::stop_possible() const noexcept {
    return true;
  }

  void stop_token::swap(stop_token& other) noexcept {
    stop_state->swap(*other.stop_state.get());
  }

  stop_token::stop_token() noexcept = default;
  stop_token::~stop_token() = default;

  stop_token &stop_token::operator=(stop_token && other) noexcept {
    stop_state = other.stop_state;
    return *this;
  }

  stop_token &stop_token::operator=(const stop_token & other) noexcept {
    stop_state = other.stop_state;
    return *this;
  }

  stop_token::stop_token(stop_token && other) noexcept
  : stop_state(other.stop_state) {}
  stop_token::stop_token(const stop_token & other) noexcept
  : stop_state(other.stop_state) {}

}
