# Makefile test

.PHONY: all
all: ;

# install sample check and restart DD-agent
.PHONY: install
install:
	@echo
	@echo Not deployed yet.

# setting sample and restart
.PHONY: set_sample
set_sample: sample restart
	sleep 10
	/etc/init.d/datadog-agent info

# run datadog-agent stop command
.PHONY: stop
stop:
	/etc/init.d/datadog-agent stop

# run datadog-agent start command
.PHONY: start
start:
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
.PHONY: sample
sample:
	cp conf.d/sample.yaml /etc/dd-agent/conf.d/
	cp checks.d/sample.py /etc/dd-agent/checks.d/

# Cleaning all unwanted files
.PHONY: clean
clean:
	rm -f *.pyc