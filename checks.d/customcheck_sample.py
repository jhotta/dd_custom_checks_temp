import ntplib
from checks import AgentCheck
from utils.ntp import NTPUtil

class CustomCheck(AgentCheck):
    def check(self, instance):

        req_args = NTPUtil().args
        ntp_stats = ntplib.NTPClient().request(**req_args)
        ntp_ts = ntp_stats.recv_time
        service_check_msg = 'this is test message for custom check'
        tags = ['test-level:dev', 'env:vm']

        status = AgentCheck.OK
        # status = AgentCheck.CRITICAL

        self.service_check('customcheck.customcheck.sc1', status=status, timestamp=ntp_ts, message=service_check_msg, tags=tags)
        self.gauge('customcheck.myapp.g1', 1)

