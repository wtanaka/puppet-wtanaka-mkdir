PUPPETMODULE=puppet-module
MODULE=wtanaka-mkdir

all: clean test $(MODULE)/metadata.json

lint:
	cd $(MODULE) && rake lint

test: lint
	cd $(MODULE) && rake spec

$(MODULE)/metadata.json: $(MODULE)/Modulefile
	$(PUPPETMODULE) build $(MODULE)

clean:
	find . -name "*~" -exec rm \{\} \;
	rm -rf $(MODULE)/pkg
