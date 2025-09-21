--INFO: Org mode
return {
    "nvim-orgmode/orgmode",
    ft = { "org" },
    lazy = true,
    opts = {

        org_todo_keywords = { "TODO", "WAITING", "|", "DONE", "DELEGATED" },
        org_todo_keyword_faces = {
            WAITING = ":foreground blue :weight bold",
            DELEGATED = ":background #FFFFFF :slant italic :underline on",
            TODO = ":background red :foreground #000000 ", -- overrides builtin color for `TODO` keyword
        },
    },
}
