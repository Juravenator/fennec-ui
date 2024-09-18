SHELL:=/bin/bash
.DEFAULT_GOAL := build

.PHONY: build
build: build/index.html build/index.js build/index.css

build/index.html: src/html/index.html
	mkdir -p $$(dirname $@)
	npx html-minifier \
		--case-sensitive \
		--collapse-boolean-attributes \
		--collapse-inline-tag-whitespace \
		--collapse-whitespace \
		--decode-entities \
		--minify-css true \
		--minify-js true \
		--remove-attribute-quotes \
		--remove-comments \
		--remove-redundant-attributes \
		--remove-script-type-attributes \
		--remove-style-link-type-attributes \
		--sort-attributes \
		--sort-class-name \
		--use-short-doctype \
		$? > $@

build/index.js: $(shell find src/js -name '*.ts' -type f)
	mkdir -p build/js build/rollup build/babel
	npx tsc
	npx rollup --config=.config/rollup.mjs build/js/index.js --file build/rollup/index.js
	npx babel --config-file=./.config/babel.json build/rollup/index.js > build/babel/index.js
	npx uglifyjs build/babel/index.js > $@

build/index.css: $(shell find src/css -name '*.scss' -type f)
	mkdir -p $$(dirname $@) build/css
	npx sass --no-source-map src/css/main.scss build/css/index.css
	npx postcss --config=.config --no-map build/css/index.css -o $@

.PHONY: clean
clean:
	rm -rf build
