#include <map>
#include <set>
#include <string>
#include <vector>
#include <fstream>
#include <sstream>
#include <iostream>
#include <stdexcept>
#include <exception>
#include <filesystem>

#include <time.h>
#include <spawn.h>
#include <signal.h>
#include <unistd.h>
#include <sys/wait.h>

#include <xxhash.h>

namespace {
    static void log0(const std::string& s) {
        write(2, s.c_str(), s.length());
    }

    static void log(const std::string& s) {
        log0(s + "\n");
    }

    static inline std::string readf(const std::string& path) {
        std::ostringstream buf;
        std::ifstream input(path);

        if (!input) {
            throw std::runtime_error("can not open " + path);
        }

        buf << input.rdbuf();

        return buf.str();
    }

    static std::string currentException() {
        try {
            throw;
        } catch (const std::exception& e) {
            return e.what();
        }

        return "unknown error";
    }

    static auto shash(const std::string& s) {
        return XXH64(s.c_str(), s.length(), 0);
    }

    using ui128 = std::pair<uint64_t, uint64_t>;

    static ui128 fhash(const std::string& p) {
        return std::make_pair(shash(p), shash(readf(p)));
    }

    static auto wait_pid() {
        int status;

        return waitpid(-1, &status, WNOHANG);
    }

    struct Proc {
        int pid;

        Proc(const std::string& p) {
            char* cmd[] = {
                (char*)p.c_str(),
                0,
            };

            if (posix_spawnp(&pid, cmd[0], 0, 0, cmd, 0)) {
                throw std::runtime_error("can not spawn " + p);
            }
        }

        void terminate() {
            kill(pid, SIGTERM);
        }
    };

    using ProcID = ui128;

    struct Context {
        const std::string where;
        std::map<ProcID, std::shared_ptr<Proc>> running;
        std::map<uint32_t, ProcID> pids;

        Context(const std::string& where_)
            : where(where_)
        {
        }

        void run() {
            while (true) {
                try {
                    step();
                } catch (...) {
                    log("step error " + currentException());
                }

                sleep(1);
            }
        }

        void step() {
            std::set<ProcID> cur;

            for (const auto& entry : std::filesystem::directory_iterator(where)) {
                auto p = entry.path().string() + "/run";

                try {
                    auto md5 = fhash(p);

                    if (auto it = running.find(md5); it == running.end()) {
                        auto proc = std::make_shared<Proc>(p);

                        // assume will not throw
                        pids[proc->pid] = md5;
                        running[md5] = proc;
                    }

                    cur.insert(md5);
                } catch (...) {
                    log("skip " + p + ": " + currentException());
                }
            }

            for (auto& item : running) {
                auto md5 = item.first;
                auto proc = item.second;

                if (cur.find(md5) == cur.end()) {
                    proc->terminate();
                }
            }

            for (int pid = wait_pid(); pid  > 0; pid = wait_pid()) {
                if (auto it = pids.find(pid); it != pids.end()) {
                    running.erase(it->second);
                    pids.erase(it);
                    log("complete " + std::to_string(pid));
                } else {
                    log("unknown pid " + std::to_string(pid));
                }
            }

            if (getpid() == 1) {
                while (killStale() > 0) {
                    log("retry stale cycle");
                }
            }
        }

        unsigned int killStale() {
            unsigned int stale = 0;
            auto childs = readf("/proc/thread-self/children");

            std::stringstream ss(childs);
            std::string item;

            while (std::getline(ss, item, '\n')) {
                auto pid = std::stol(item);

                if (pids.find(pid) == pids.end()) {
                    ++stale;
                    log("stale pid " + std::to_string(pid));
                    kill(pid, SIGKILL);
                }
            }

            return stale;
        }
    };
}

int main(int argc, char** argv) {
    if (argc < 3) {
        abort();
    }

    if (!argv[2]) {
        abort();
    }

    Context(argv[2]).run();
}
