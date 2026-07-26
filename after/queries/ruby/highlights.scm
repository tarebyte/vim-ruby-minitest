; extends

; Assertions and expectations: `assert_equal 1, 2`, `refute_nil x`,
; `_(y).must_equal 3`, `x.must_be_nil`.
((call
  method: (identifier) @function.builtin)
  (#any-of? @function.builtin
    "assert"
    "assert_block"
    "assert_empty"
    "assert_equal"
    "assert_in_delta"
    "assert_in_epsilon"
    "assert_includes"
    "assert_instance_of"
    "assert_kind_of"
    "assert_match"
    "assert_mock"
    "assert_nil"
    "assert_operator"
    "assert_output"
    "assert_path_exists"
    "assert_pattern"
    "assert_predicate"
    "assert_raises"
    "assert_respond_to"
    "assert_same"
    "assert_send"
    "assert_silent"
    "assert_throws"
    "capture_io"
    "capture_subprocess_io"
    "flunk"
    "must_be"
    "must_be_close_to"
    "must_be_empty"
    "must_be_instance_of"
    "must_be_kind_of"
    "must_be_nil"
    "must_be_same_as"
    "must_be_silent"
    "must_be_within_delta"
    "must_be_within_epsilon"
    "must_equal"
    "must_include"
    "must_match"
    "must_output"
    "must_pattern_match"
    "must_raise"
    "must_respond_to"
    "must_send"
    "must_throw"
    "must_verify"
    "pass"
    "refute"
    "refute_empty"
    "refute_equal"
    "refute_in_delta"
    "refute_in_epsilon"
    "refute_includes"
    "refute_instance_of"
    "refute_kind_of"
    "refute_match"
    "refute_nil"
    "refute_operator"
    "refute_path_exists"
    "refute_pattern"
    "refute_predicate"
    "refute_respond_to"
    "refute_same"
    "skip"
    "wont_be"
    "wont_be_close_to"
    "wont_be_empty"
    "wont_be_instance_of"
    "wont_be_kind_of"
    "wont_be_nil"
    "wont_be_same_as"
    "wont_be_within_delta"
    "wont_be_within_epsilon"
    "wont_equal"
    "wont_include"
    "wont_match"
    "wont_pattern_match"
    "wont_respond_to"))

; Argument-less forms parse as bare identifiers rather than calls.  Statement
; position is required so that a local variable named `pass` is left alone.
([
  (body_statement (identifier) @function.builtin)
  (then (identifier) @function.builtin)
  (else (identifier) @function.builtin)
]
  (#any-of? @function.builtin "flunk" "pass" "skip"))

; Spec DSL. The block is required so that ordinary uses of words like
; `context` or `feature` outside a test are left alone.
((call
  method: (identifier) @function.macro
  block: (_))
  (#any-of? @function.macro
    "after"
    "background"
    "before"
    "context"
    "describe"
    "feature"
    "it"
    "let"
    "scenario"
    "setup"
    "should"
    "specify"
    "subject"
    "teardown"))

; Class-level declarations that take arguments rather than a block.
((call
  !receiver
  method: (identifier) @function.macro)
  (#eq? @function.macro "fixtures"))

; Expectation wrappers: `_(x)`, `value(x)`, `expect(x)`.
((call
  !receiver
  method: (identifier) @function.builtin)
  (#any-of? @function.builtin "_" "value" "expect"))
