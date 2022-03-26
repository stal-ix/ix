#pragma once
#include <iostream>
#include <wayfire/nonstd/noncopyable.hpp>
#include <wayfire/config/option.hpp>
#include <wayfire/config/option-wrapper.hpp>
#include <wayfire/core.hpp>

namespace wf {
template <class Type>
class option_wrapper_t {
    struct base_t : public base_option_wrapper_t<Type> {
        base_t(const std::string& name) {
            this->load_option(name);
        }

    protected:
        std::shared_ptr<config::option_base_t> load_raw_option(const std::string& name) {
            std::cerr << name << std::endl;
            return wf::get_core().config.get_option(name);
        }
    };

public:
    using OptionType = typename base_t::OptionType;

    option_wrapper_t(const std::string& name)
        : name_(name)
    {
    }

    option_wrapper_t() {
    }

    void load_option(const std::string& name) {
        name_ = name;
    }

    operator Type() const {
        return this->value();
    }

    Type value() const {
        return this->get().value();
    }

    void set_callback(std::function<void()> callback) {
        this->get().set_callback(callback);
    }

    operator std::shared_ptr<OptionType>() const {
        return this->get();
    }

private:
    inline auto& get() const {
        if (!opt_) {
            opt_.reset(new base_t(name_));
        }

        return *opt_;
    }

private:
    mutable std::unique_ptr<base_t> opt_;
    std::string name_;
};
}
