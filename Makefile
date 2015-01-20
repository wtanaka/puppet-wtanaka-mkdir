# Use "puppet module" for Puppet 2.7.14 and above.
# Use "puppet-module" for previous versions.
# https://groups.google.com/forum/#!msg/puppet-users/p-wYtrW-F0I/1eSJknHteBoJ
PUPPETMODULE=puppet module
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
