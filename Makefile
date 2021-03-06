all: rust-jit

rust-jit: src/lib.rs src/*.rs src/jit/*.rs rust-jit-macros
	rustc --opt-level 3 $<
	touch $@

rust-jit-macros: src/macros.rs
	rustc --opt-level 3 $<
	touch $@

clean:
	rm rust-jit rust-jit-macros liblejit*

example: examples/math.rs rust-jit
	rustc -L . -o example-math $<
	./example-math
	rm example-math

