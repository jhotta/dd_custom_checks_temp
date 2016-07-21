# Makefile test

.PHONY: all
all: ;

# install sample check and restart DD-agent
.PHONY: install
install:
	@echo
	@echo Not deployed yet.

# setting sample and restart
.PHONY: set_samples
set_samples: basic_sample http_sample restart wait_info

# setting basic and restart
.PHONY: set_basic
set_basic: basic_sample restart wait_info

# setting my_first and restart
.PHONY: set_http
set_http: http_sample restart wait_info

# setting my_first and restart
.PHONY: set_customcheck
set_customcheck: customcheck_sample restart wait_info

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

# wait and run datadog-agent info comman
.PHONY: wait_info
wait_info:
	@echo wait 15 seconds to DD-agent to stabilize then run info command.
	sleep 15
	/etc/init.d/datadog-agent info

# set basic_sample checks to /etc/dd-agent
.PHONY: basic_sample
basic_sample:
	cp conf.d/basic_sample.yaml /etc/dd-agent/conf.d/
	cp checks.d/basic_sample.py /etc/dd-agent/checks.d/

# set http_sample checks to /etc/dd-agent
.PHONY: http_sample
http_sample:
	cp conf.d/http_sample.yaml /etc/dd-agent/conf.d/
	cp checks.d/http_sample.py /etc/dd-agent/checks.d/

# set customcheck_sample checks to /etc/dd-agent
.PHONY: customcheck_sample
customcheck_sample:
	cp conf.d/customcheck_sample.yaml /etc/dd-agent/conf.d/
	cp checks.d/customcheck_sample.py /etc/dd-agent/checks.d/

# Clean and restart
.PHONY: clean_all
clean_all: clean_samples restart wait_info

# Cleaning all samples files
.PHONY: clean_samples
clean_samples: clean_pyc
	rm -f /etc/dd-agent/checks.d/*_sample.py
	rm -f /etc/dd-agent/conf.d/*_sample.yaml

# Cleaning all *pyc files
.PHONY: clean_files
clean_pyc:
	rm -f *.pyc
	rm -f /etc/dd-agent/checks.d/*.pyc
