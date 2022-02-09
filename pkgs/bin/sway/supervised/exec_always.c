#define _POSIX_C_SOURCE 200809L
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>
#include <signal.h>
#include "sway/commands.h"
#include "sway/config.h"
#include "sway/server.h"
#include "sway/tree/container.h"
#include "sway/tree/root.h"
#include "sway/tree/workspace.h"
#include "log.h"
#include "stringop.h"

struct cmd_results *cmd_exec_validate(int argc, char **argv) {
    struct cmd_results *error = NULL;
    if ((error = checkarg(argc, argv[-1], EXPECTED_AT_LEAST, 1))) {
        return error;
    }
    if (!config->active || config->validating) {
        return cmd_results_new(CMD_DEFER, NULL);
    }
    return error;
}

struct cmd_results *cmd_exec_process(int argc, char **argv) {
    struct cmd_results *error = NULL;
    char *cmd = NULL;
    if (strcmp(argv[0], "--no-startup-id") == 0) {
        sway_log(SWAY_INFO, "exec switch '--no-startup-id' not supported, ignored.");
        --argc; ++argv;
        if ((error = checkarg(argc, argv[-1], EXPECTED_AT_LEAST, 1))) {
            return error;
        }
    }

    if (argc == 1 && (argv[0][0] == '\'' || argv[0][0] == '"')) {
        cmd = strdup(argv[0]);
        strip_quotes(cmd);
    } else {
        cmd = join_args(argv, argc);
    }

    sway_log(SWAY_DEBUG, "Executing %s", cmd);

    pid_t child;

    // https://stackoverflow.com/questions/7171722/how-can-i-handle-sigchld
    signal(SIGCHLD, SIG_IGN);

    if ((child = fork()) == 0) {
        execlp("sh", "sh", "-c", cmd, (void *)NULL);
        sway_log_errno(SWAY_ERROR, "execlp failed");
        _exit(1);
    }

    free(cmd);

    if (child > 0) {
        sway_log(SWAY_DEBUG, "Child process created with pid %d", child);
        root_record_workspace_pid(child);
    } else {
        return cmd_results_new(CMD_FAILURE, "fork() failed");
    }

    return cmd_results_new(CMD_SUCCESS, NULL);
}

struct cmd_results *cmd_exec_always(int argc, char **argv) {
    struct cmd_results *error;
    if ((error = cmd_exec_validate(argc, argv))) {
        return error;
    }
    return cmd_exec_process(argc, argv);
}
