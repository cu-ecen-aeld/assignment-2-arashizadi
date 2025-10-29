#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void show_help(const char *prog) {
    fprintf(stdout,
        "Usage: %s <writefile> <writestr>\n"
        "\nArgs:\n"
        "  writefile: Path to a file which needs to be written to\n"
        "  writestr:  String content to be written in the given file\n"
        "\nExamples:\n"
        "%s ./src.txt hi\n"
        "This would create or overwrite the ./src.txt file with \"hi\" as its content\n",
        prog, prog
    );
}

static int validate_input(int argc, char **argv) {
    /*
        Status Reference:
         0 -> no input error detected, contunue with logic
         1 -> gracefully exit script and call show_help
        -1 -> err
    */
    if (argc == 2 && (strcmp(argv[1], "-h") == 0 || strcmp(argv[1], "--help") == 0)) {
        show_help(argv[0]);
        return 1;
    }

    if (argc != 3) {
        fprintf(stderr, "Error: Need 2 arguments, but %d were given.\n", argc - 1);
        show_help(argv[0]);
        return -1;
    }

    if (!argv[1] || !argv[2] || argv[1][0] == '\0' || argv[2][0] == '\0') {
        fprintf(stderr, "Error: Both arguments must be non-empty.\n");
        show_help(argv[0]);
        return -1;
    }

    return 0;
}

int main(int argc, char **argv) {
    int flag_status = validate_input(argc, argv);
    if (flag_status == 1) 
        return 0;
    if (flag_status < 0) 
        return 1;

    const char *writefile = argv[1];
    const char *writestr  = argv[2];

    FILE *fp = fopen(writefile, "w");
    if (!fp) {
        perror("Error opening file");
        return 1;
    }

    if (fputs(writestr, fp) == EOF) {
        perror("Error writing file");
        fclose(fp);
        return 1;
    }

    if (fclose(fp) != 0) {
        perror("Error closing file");
        return 1;
    }

    return 0;
}
