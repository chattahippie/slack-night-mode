all: clean build

build: default raw variants rawvariants

clean:
	rm -rf css
	mkdir -p css/variants css/raw/variants

default:
	sass -s compressed scss/main.scss css/black.css

variants:
	for sass in scss/themes/build-variants/*--main.scss; do \
		theme=`basename $$sass --main.scss`; \
	sass -s compressed $$sass css/variants/$$theme.css; done

raw:
	sass -s compressed scss/styles.scss css/raw/black.css

rawvariants:
	for sass in scss/themes/build-variants/*--styles.scss; do \
		theme=`basename $$sass --styles.scss`; \
	sass -s compressed $$sass css/raw/variants/$$theme.css; done
