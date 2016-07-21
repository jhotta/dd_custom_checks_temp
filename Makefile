# Makefile test

.PHONY: all
all: ;

# install sample check and restart DD-agent
.PHONY: install
install:
	@echo
	@echo DD-agent is restarted with the sample check.


# run datadog-agent stop command
.PHONY: stop
info:
	/etc/init.d/datadog-agent stop

# run datadog-agent start command
.PHONY: start
info:
	/etc/init.d/datadog-agent start

# run datadog-agent restart command
.PHONY: restart
restart:
	/etc/init.d/datadog-agent restart

# run datadog-agent info command
.PHONY: info
info:
	/etc/init.d/datadog-agent info

# set sample checks to /etc/dd-agent
.PHONY: set_sample
set_sample:
	cp conf.d/sample.yaml
	cp checks.d/sample.py

# Cleaning all unwanted files
.PHONY: clean
clean:
	rm -f *.pyc

