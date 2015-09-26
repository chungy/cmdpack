////////////////////////////////////////////////////////////////////////////////

void banner_ok(void) {
    printf(TITLE "\n"
        "  " COPYR "\n"
        "  from Command-Line Pack "
        VERSION
        "\n\n",
        (sizeof(off_t) > 4 && sizeof(off_t) > sizeof(size_t)) ? ", large file support" : ""
    );
}

void banner_error(void) {
    printf("Configuration error\n");
    exit(1);
}

static void banner(void) {
    ((sizeof(off_t) >= sizeof(size_t)) ? banner_ok : banner_error)();
    //
    // If we've displayed the banner, we'll also want to warn that this is a
    // command-line app when we exit
    //
    atexit(commandlinewarning);
}

////////////////////////////////////////////////////////////////////////////////
