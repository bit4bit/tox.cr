@[Include(
    "tox/tox.h",
    prefix: %w(tox_ TOX_),
    import_docstrings: "brief"
         )]
@[Include(
    "tox/toxencryptsave.h",
    prefix: %w(tox_ TOX_),
    import_docstrings: "brief"
         )]
@[Link("toxcore")]
lib LibTox
end
