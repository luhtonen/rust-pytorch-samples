SUBDIRS := "mnist-cli-gpu" "portable-pytorch" "stress" "translate"

rust-version:
	@echo "Rust command-line utility versions:"
	rustc --version 			#rust compiler
	cargo --version 			#rust package manager
	rustfmt --version			#rust code formatter
	rustup --version			#rust toolchain manager
	clippy-driver --version		#rust linter

install:
	python3 -m pip install --upgrade pip \
		&& pip install -r requirements.txt

format: $(SUBDIRS)

lint: $(SUBDIRS)

test: $(SUBDIRS)

clean:
	#cargo install cargo-cache
	#cargo cache -a
	#rm -rf Cargo.lock
	cargo clean

run:
	cargo run 

all: format lint test run
