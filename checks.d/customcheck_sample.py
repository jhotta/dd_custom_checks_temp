import ntplib
from checks import AgentCheck

class CustomCheck(AgentCheck):
    def check(self, instance):

        ntp_stats = ntplib.NTPClient().request(**req_args)
        ntp_ts = ntp_stats.recv_time
        service_check_msg = 'this is test message for custom check'

        status = AgentCheck.OK

        self.service_check('customcheck.myapp', status, timestamp=ntp_ts, message=service_check_msg)
        self.gauge('customcheck.myapp', 1)

